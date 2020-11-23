import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dataform_event.dart';
part 'dataform_state.dart';

class DataformBloc extends Bloc<DataformEvent, DataformState> {
  DataformBloc() : super(DataformInitial());

  @override
  Stream<DataformState> mapEventToState(
    DataformEvent event,
  ) async* {
    if (event is FromInvoice) {
      yield* _saveDataFrom(event.txt);
    }
  }

  Stream<DataformState> _saveDataFrom(String event) async* {
    yield null;
  }
}
