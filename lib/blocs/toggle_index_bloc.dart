import 'package:flutter_bloc/flutter_bloc.dart';

import 'index_toggled.dart';

/// this bloc can be generic to toggle any widget state
class ToggleIndexBloc extends Cubit<IndexToggled> {
  ToggleIndexBloc(IndexToggled initialState) : super(initialState);

  /// update price range card
  Future toggleState(int index, bool isSelected) async {
    try {
      /// once the card price range is calculated will return the price from the state itself
      emit(IndexToggled(index: index, isSelected: !isSelected));
    } catch (_) {}
  }
}
