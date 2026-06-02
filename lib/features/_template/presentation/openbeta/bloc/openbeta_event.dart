import 'package:equatable/equatable.dart';

sealed class OpenBetaEvent extends Equatable {
  const OpenBetaEvent();

  @override
  List<Object?> get props => [];
}

final class OpenBetaLoadRoshkaRegionRequested extends OpenBetaEvent {
  const OpenBetaLoadRoshkaRegionRequested();
}
