import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'control_ui_event.dart';
part 'control_ui_state.dart';

class ControlUiBloc extends Bloc<ControlUiEvent, ControlUiState> {
  ControlUiBloc() : super(ControlUiInitial());

  @override
  Stream<ControlUiState> mapEventToState(
    ControlUiEvent event,
  ) async* {}
}
