import 'package:camp_and_climb_companion/features/_template/presentation/bloc/overpass_bloc.dart';
import 'package:camp_and_climb_companion/features/_template/presentation/bloc/overpass_event.dart';
import 'package:camp_and_climb_companion/features/_template/presentation/bloc/overpass_state.dart';
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
    super.initState(); // always first
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
    return Scaffold(
      appBar: AppBar(title: const Text('Overpass JSON size')),
      body: Padding(
        padding: const EdgeInsetsDirectional.all(16),
        child: BlocConsumer<OverpassBloc, OverpassState>(
          listener: (context, state) {
            if (state is OverpassLoadSuccess) {
              _controller.text =
                  '${state.jsonCharCount} symbols\n'
                  '${state.elementCount} fountains';
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
                  decoration: const InputDecoration(
                    labelText: 'JSON character count',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: state is OverpassLoading
                      ? null
                      : () => context.read<OverpassBloc>().add(
                          const OverpassLoadRequested(),
                        ),
                  child: const Text('Load from Overpass'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
