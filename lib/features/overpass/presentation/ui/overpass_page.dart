import 'package:camp_and_climb_companion/features/overpass/presentation/bloc/overpass_bloc.dart';
import 'package:camp_and_climb_companion/features/overpass/presentation/bloc/overpass_event.dart';
import 'package:camp_and_climb_companion/features/overpass/presentation/bloc/overpass_state.dart';
import 'package:camp_and_climb_companion/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OverpassPage extends StatefulWidget {
  const OverpassPage({super.key});

  @override
  State<OverpassPage> createState() => _OverpassPageState();
}

class _OverpassPageState extends State<OverpassPage> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<OverpassBloc>().add(const OverpassLoadRequested());
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.overpassPageTitle)),
      body: Padding(
        padding: const EdgeInsetsDirectional.all(16),
        child: BlocConsumer<OverpassBloc, OverpassState>(
          listener: (context, state) {
            if (state is OverpassLoadSuccess) {
              _controller.text =
                  '${l10n.overpassResultSymbols(state.jsonCharCount)}\n'
                  '${l10n.overpassResultFountains(state.elementCount)}';
            }
            if (state is OverpassLoadFailure) {
              _controller.text = state.message;
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (state is OverpassLoading)
                  const Center(child: CircularProgressIndicator()),
                TextField(
                  controller: _controller,
                  readOnly: true,
                  maxLines: 4,
                  decoration: InputDecoration(
                    labelText: l10n.overpassJsonCountLabel,
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: state is OverpassLoading
                      ? null
                      : () => context.read<OverpassBloc>().add(
                            const OverpassLoadRequested(),
                          ),
                  child: Text(l10n.overpassLoadButton),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}