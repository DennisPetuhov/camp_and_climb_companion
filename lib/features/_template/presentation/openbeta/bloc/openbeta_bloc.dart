import 'package:camp_and_climb_companion/features/_template/domain/repositories/openbeta_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'openbeta_event.dart';
import 'openbeta_state.dart';

class OpenBetaBloc extends Bloc<OpenBetaEvent, OpenBetaState> {
  OpenBetaBloc({required OpenBetaRepository repository})
    : _repository = repository,
      super(const OpenBetaInitial()) {
    on<OpenBetaLoadRoshkaRegionRequested>(_onLoadRoshka);
  }

  final OpenBetaRepository _repository;

  Future<void> _onLoadRoshka(
    OpenBetaLoadRoshkaRegionRequested event,
    Emitter<OpenBetaState> emit,
  ) async {
    emit(const OpenBetaLoading());
    try {
      final areas = await _repository.fetchRoshkaRegion();
      emit(OpenBetaLoadSuccess(areas: areas));
    } catch (e) {
      emit(OpenBetaLoadFailure(message: e.toString()));
    }
  }
}