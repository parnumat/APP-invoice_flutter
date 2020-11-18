import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:invoice/models/invoice_tools.dart';
import 'package:meta/meta.dart';

part 'invoice_tools_event.dart';
part 'invoice_tools_state.dart';

class InvoiceToolsBloc extends Bloc<InvoiceToolsEvent, InvoiceToolsState> {
  InvoiceToolsBloc() : super(InvoiceToolsInitial());
  // InvoiceToolsBloc() : super(null);
  @override
  Stream<InvoiceToolsState> mapEventToState(
    InvoiceToolsEvent event,
  ) async* {
    if (event is GetInvoiceTools) {
      List<InvoiceTools> invoiceToolsMap = invoiceToolsFromJson(invoiceTools);
      // yield invoiceToolsMap;
      yield* _getInvoiceToolsToState(event);
    } else {
      yield null;
    }
  }

  Stream<InvoiceToolsState> _getInvoiceToolsToState(
      GetInvoiceTools event) async* {
    // var invoiceToolsEvent = (state as LoadedInvoiceToolsState).invoiceToolsMap;
    List<InvoiceTools> invoiceToolsMap = invoiceToolsFromJson(invoiceTools);
    yield LoadedInvoiceToolsState(invoiceToolsMap);
  }
}
