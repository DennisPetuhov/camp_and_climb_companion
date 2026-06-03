import 'package:camp_and_climb_companion/features/openbeta/domain/repositories/openbeta_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'openbeta_event.dart';
import 'openbeta_state.dart';

class OpenBetaBloc extends Bloc<OpenBetaEvent, OpenBetaState> {
  OpenBetaBloc({required OpenBetaRepository repository})
      : _repository = repository,
        super(const OpenBetaInitial()) {
    on<OpenBetaLoadRequested>(_onLoadRequested);
  }

  final OpenBetaRepository _repository;

  Future<void> _onLoadRequested(
    OpenBetaLoadRequested event,
    Emitter<OpenBetaState> emit,
  ) async {
    emit(const OpenBetaLoading());
    try {
      final stats = await _repository.fetchRoshkaRegionStats();
      emit(
        OpenBetaLoadSuccess(
          jsonCharCount: stats.jsonCharCount,
          areaCount: stats.areaCount,
        ),
      );
    } catch (e) {
      emit(OpenBetaLoadFailure(message: e.toString()));
    }
  }
}
