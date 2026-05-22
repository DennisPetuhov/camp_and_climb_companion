import 'package:equatable/equatable.dart';

/// What the UI can render.
sealed class OverpassState extends Equatable {
  const OverpassState();

  @override
  List<Object?> get props => [];
}

final class OverpassInitial extends OverpassState {
  const OverpassInitial();
}

final class OverpassLoading extends OverpassState {
  const OverpassLoading();
}

final class OverpassLoadSuccess extends OverpassState {
  const OverpassLoadSuccess({
    required this.jsonCharCount,
    required this.elementCount,
  });

  final int jsonCharCount;
  final int elementCount;

  @override
  List<Object?> get props => [jsonCharCount, elementCount];
}

final class OverpassLoadFailure extends OverpassState {
  const OverpassLoadFailure({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}