import 'package:cv_app/data/models/fliter/filter_model.dart';
import 'package:equatable/equatable.dart';

abstract class AllCvEvent extends Equatable {}

class AllCvCallEvent extends AllCvEvent {
  @override
  List<Object?> get props => [];
}

class AllCvReturnEvent extends AllCvEvent {
  @override
  List<Object?> get props => [];
}

class AllCvFilterEvent extends AllCvEvent {
  final FilterModel filterModel;

  AllCvFilterEvent({required this.filterModel});

  @override
  List<Object?> get props => [filterModel];
}
