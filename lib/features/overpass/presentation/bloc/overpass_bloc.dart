import 'dart:convert';

import 'package:camp_and_climb_companion/features/overpass/domain/repositories/overpass_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'overpass_event.dart';
import 'overpass_state.dart';

class OverpassBloc extends Bloc<OverpassEvent, OverpassState> {
  OverpassBloc({required OverpassRepository repository})
      : _repository = repository,
        super(const OverpassInitial()) {
    on<OverpassLoadRequested>(_onLoadRequested);
  }

  final OverpassRepository _repository;

  Future<void> _onLoadRequested(
    OverpassLoadRequested event,
    Emitter<OverpassState> emit,
  ) async {
    emit(const OverpassLoading());
    try {
      final response = await _repository.fetchTbilisiDrinkingWater();
      final jsonString =
          const JsonEncoder.withIndent(' ').convert(response.toJson());
      emit(
        OverpassLoadSuccess(
          jsonCharCount: jsonString.length,
          elementCount: response.elements.length,
        ),
      );
    } catch (e) {
      emit(OverpassLoadFailure(message: e.toString()));
    }
  }
}
