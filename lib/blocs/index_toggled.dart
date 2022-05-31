import 'package:equatable/equatable.dart';

class IndexToggled extends Equatable {
  final int index;
  final bool isSelected;

  const IndexToggled({required this.index, required this.isSelected});

  @override
  List<Object> get props => [index, isSelected];
}
