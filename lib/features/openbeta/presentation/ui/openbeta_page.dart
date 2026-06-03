import 'package:camp_and_climb_companion/features/openbeta/presentation/bloc/openbeta_bloc.dart';
import 'package:camp_and_climb_companion/features/openbeta/presentation/bloc/openbeta_event.dart';
import 'package:camp_and_climb_companion/features/openbeta/presentation/bloc/openbeta_state.dart';
import 'package:camp_and_climb_companion/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OpenBetaPage extends StatefulWidget {
  const OpenBetaPage({super.key});

  @override
  State<OpenBetaPage> createState() => _OpenBetaPageState();
}

class _OpenBetaPageState extends State<OpenBetaPage> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<OpenBetaBloc>().add(const OpenBetaLoadRequested());
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
      appBar: AppBar(title: Text(l10n.openBetaPageTitle)),
      body: Padding(
        padding: const EdgeInsetsDirectional.all(16),
        child: BlocConsumer<OpenBetaBloc, OpenBetaState>(
          listener: (context, state) {
            if (state is OpenBetaLoadSuccess) {
              _controller.text =
                  '${l10n.openBetaResultSymbols(state.jsonCharCount)}\n'
                  '${l10n.openBetaResultAreas(state.areaCount)}';
            }
            if (state is OpenBetaLoadFailure) {
              _controller.text = state.message;
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (state is OpenBetaLoading)
                  const Center(child: CircularProgressIndicator()),
                TextField(
                  controller: _controller,
                  readOnly: true,
                  maxLines: 4,
                  decoration: InputDecoration(
                    labelText: l10n.openBetaJsonCountLabel,
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: state is OpenBetaLoading
                      ? null
                      : () => context.read<OpenBetaBloc>().add(
                            const OpenBetaLoadRequested(),
                          ),
                  child: Text(l10n.openBetaLoadButton),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
