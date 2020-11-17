import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:invoice/models/invoice_tools.dart';
import 'package:meta/meta.dart';

part 'invoice_tools_event.dart';
part 'invoice_tools_state.dart';

List<InvoiceTools> invoiceToolsMap = invoiceToolsFromJson(invoiceTools);

class InvoiceToolsBloc extends Bloc<InvoiceToolsEvent, InvoiceToolsState> {
  InvoiceToolsBloc() : super(InvoiceToolsInitial());

  @override
  Stream<InvoiceToolsState> mapEventToState(
    InvoiceToolsEvent event,
  ) async* {
    if (event is GetInvoiceTools) {
      print(state);
      yield state;
    }
  }

  Stream<InvoiceToolsState> _getInvoiceTool(InvoiceToolsEvent event) async* {
    yield state;
  }
}
