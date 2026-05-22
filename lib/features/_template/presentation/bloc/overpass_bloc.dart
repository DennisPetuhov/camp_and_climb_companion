import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repositories/overpass_repository_impl.dart';
import '../../domain/repositories/overpass_repository.dart';
import 'overpass_event.dart';
import 'overpass_state.dart';

class OverpassBloc extends Bloc<OverpassEvent, OverpassState> {
  OverpassBloc({OverpassRepository? repository})
      : _repository = repository ?? OverPassRepositoryImpl(),
        super(const OverpassInitial()) {
    on<OverpassLoadRequested>(_onLoadRequested);
  }

  final OverpassRepository _repository;

  Future<void> _onLoadRequested(OverpassLoadRequested event,
      Emitter<OverpassState> emit) async {
    emit(const OverpassLoading());
    try {
      final response = await _repository.fetchTbilisiDrinkingWater();
      final jsonString = const JsonEncoder.withIndent(' ').convert(
          response.toJson());
      final jsonCharCount = jsonString.length;
      final elementCount = response.elements.length;

      emit(OverpassLoadSuccess(
        jsonCharCount: jsonCharCount,
        elementCount: elementCount,
      ));
    } catch (e) {
      emit(OverpassLoadFailure(message: e.toString()));
    }
  }
}