import 'package:equatable/equatable.dart';

// Everything the UI can ask the BLoC to do.
sealed class OverpassEvent extends Equatable {
  const OverpassEvent();

  @override
  List<Object> get props => [];
}
// User opened screen or tapped "Load".
final class OverpassLoadRequested extends OverpassEvent {
  const OverpassLoadRequested();
}