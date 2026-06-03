import 'package:camp_and_climb_companion/core/config/env_loader.dart';
import 'package:camp_and_climb_companion/core/network/config/network_config.dart';
import 'package:camp_and_climb_companion/core/network/openbeta/client/openbeta_client.dart';
import 'package:camp_and_climb_companion/core/network/overpass/client/overpass_client.dart';
import 'package:camp_and_climb_companion/features/debug/presentation/ui/debug_home_page.dart';
import 'package:camp_and_climb_companion/features/openbeta/data/repositories/openbeta_repository_impl.dart';
import 'package:camp_and_climb_companion/features/openbeta/domain/repositories/openbeta_repository.dart';
import 'package:camp_and_climb_companion/features/overpass/data/repositories/overpass_repository_impl.dart';
import 'package:camp_and_climb_companion/features/overpass/domain/repositories/overpass_repository.dart';
import 'package:camp_and_climb_companion/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<OverpassRepository>(
          create: (_) => OverpassRepositoryImpl(
            client: OverpassClient(config: networkConfig),
          ),
        ),
        RepositoryProvider<OpenBetaRepository>(
          create: (_) => OpenBetaRepositoryImpl(
            client: OpenBetaClient(config: networkConfig),
          ),
        ),
      ],
      child: MaterialApp(
        onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const DebugHomePage(),
      ),
    );
  }
}
