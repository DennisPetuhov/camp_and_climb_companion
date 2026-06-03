import 'package:camp_and_climb_companion/features/openbeta/domain/repositories/openbeta_repository.dart';
import 'package:camp_and_climb_companion/features/openbeta/presentation/bloc/openbeta_bloc.dart';
import 'package:camp_and_climb_companion/features/openbeta/presentation/ui/openbeta_page.dart';
import 'package:camp_and_climb_companion/features/overpass/domain/repositories/overpass_repository.dart';
import 'package:camp_and_climb_companion/features/overpass/presentation/bloc/overpass_bloc.dart';
import 'package:camp_and_climb_companion/features/overpass/presentation/ui/overpass_page.dart';
import 'package:camp_and_climb_companion/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DebugHomePage extends StatelessWidget {
  const DebugHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.templateDebugHomeTitle)),
      body: ListView(
        children: [
          ListTile(
            title: Text(l10n.templateDebugOverpassTile),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (routeContext) => BlocProvider(
                  create: (_) => OverpassBloc(
                    repository: context.read<OverpassRepository>(),
                  ),
                  child: const OverpassPage(),
                ),
              ),
            ),
          ),
          ListTile(
            title: Text(l10n.templateDebugOpenBetaTile),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (routeContext) => BlocProvider(
                  create: (_) => OpenBetaBloc(
                    repository: context.read<OpenBetaRepository>(),
                  ),
                  child: const OpenBetaPage(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
