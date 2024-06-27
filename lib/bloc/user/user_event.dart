import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {}

class UserGetEvent extends UserEvent {
  @override
  List<Object?> get props => [];
}

class UserUpdateEvent extends UserEvent {
  final String name;
  final String phone;

  UserUpdateEvent({
    required this.name,
    required this.phone,
  });

  @override
  List<Object?> get props => [];
}
