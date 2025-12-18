import 'package:equatable/equatable.dart';
import '../../domain/entities/preference_entity.dart';

abstract class PreferenceState extends Equatable {
  const PreferenceState();

  @override
  List<Object?> get props => [];
}

class PreferenceInitial extends PreferenceState {}

class PreferenceLoading extends PreferenceState {}

class PreferenceLoaded extends PreferenceState {
  final List<PreferenceEntity> items;

  const PreferenceLoaded(this.items);

  @override
  List<Object?> get props => [items];
}

class PreferenceDetailLoaded extends PreferenceState {
  final PreferenceEntity item;

  const PreferenceDetailLoaded(this.item);

  @override
  List<Object?> get props => [item];
}

class PreferenceError extends PreferenceState {
  final String message;

  const PreferenceError(this.message);

  @override
  List<Object?> get props => [message];
}
