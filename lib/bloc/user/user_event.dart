import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {}

class UserCallEvent extends UserEvent {
  @override
  List<Object?> get props => [];
}
