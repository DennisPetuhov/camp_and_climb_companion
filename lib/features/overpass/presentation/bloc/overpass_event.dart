import 'package:equatable/equatable.dart';

sealed class OverpassEvent extends Equatable {
  const OverpassEvent();

  @override
  List<Object> get props => [];
}

final class OverpassLoadRequested extends OverpassEvent {
  const OverpassLoadRequested();
}
