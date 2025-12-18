import 'package:equatable/equatable.dart';

import '../../domain/domain.dart';

abstract class ApiItemsState extends Equatable {
  const ApiItemsState();

  @override
  List<Object?> get props => [];
}

class ApiItemsInitial extends ApiItemsState {}

class ApiItemsLoading extends ApiItemsState {}

class ApiItemsLoaded extends ApiItemsState {
  final List<CharacterEntity> characters;

  const ApiItemsLoaded(this.characters);

  @override
  List<Object?> get props => [characters];
}

class ApiItemsError extends ApiItemsState {
  final String message;

  const ApiItemsError(this.message);

  @override
  List<Object?> get props => [message];
}
