import 'package:equatable/equatable.dart';

sealed class OpenBetaState extends Equatable {
  const OpenBetaState();

  @override
  List<Object?> get props => [];
}

final class OpenBetaInitial extends OpenBetaState {
  const OpenBetaInitial();
}

final class OpenBetaLoading extends OpenBetaState {
  const OpenBetaLoading();
}

final class OpenBetaLoadSuccess extends OpenBetaState {
  const OpenBetaLoadSuccess({
    required this.jsonCharCount,
    required this.areaCount,
  });

  final int jsonCharCount;
  final int areaCount;

  @override
  List<Object?> get props => [jsonCharCount, areaCount];
}

final class OpenBetaLoadFailure extends OpenBetaState {
  const OpenBetaLoadFailure({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
