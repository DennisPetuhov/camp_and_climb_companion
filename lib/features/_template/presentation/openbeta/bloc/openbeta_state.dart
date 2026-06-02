import 'package:equatable/equatable.dart';

import '../../../domain/entities/climbing_area.dart';

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
  const OpenBetaLoadSuccess({required this.areas});

  final List<ClimbingArea> areas;

  @override
  List<Object?> get props => [areas];
}

final class OpenBetaLoadFailure extends OpenBetaState {
  const OpenBetaLoadFailure({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
