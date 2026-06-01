import 'package:camp_and_climb_companion/core/config/env_loader.dart';
import 'package:camp_and_climb_companion/core/network/client/overpass_client.dart';
import 'package:camp_and_climb_companion/core/network/config/network_config.dart';
import 'package:camp_and_climb_companion/features/_template/data/repositories/overpass_repository_impl.dart';
import 'package:camp_and_climb_companion/features/_template/presentation/overpass/bloc/overpass_bloc.dart';
import 'package:camp_and_climb_companion/features/_template/presentation/overpass/ui/overpass_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:camp_and_climb_companion/l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadEnv();
  final networkConfig = NetworkConfig.fromEnv();
  runApp(MyApp(networkConfig: networkConfig));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.networkConfig});

  final NetworkConfig networkConfig;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: BlocProvider(
        create: (_) => OverpassBloc(
          repository: OverPassRepositoryImpl(
            client: OverpassClient(config: networkConfig),
          ),
        ),
        child: const OverpassPage(),
      ),
    );
  }
}