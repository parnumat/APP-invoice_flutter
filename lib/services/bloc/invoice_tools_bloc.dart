import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:invoice/models/invoice_tools.dart';
import 'package:invoice/services/dummy/dummy.dart';
import 'package:meta/meta.dart';

part 'invoice_tools_event.dart';
part 'invoice_tools_state.dart';

class InvoiceToolsBloc extends Bloc<InvoiceToolsEvent, InvoiceToolsState> {
  InvoiceToolsBloc() : super(InvoiceToolsInitial());
  // InvoiceToolsBloc() : super(null);
  @override
  Stream<InvoiceToolsState> mapEventToState(InvoiceToolsEvent event) async* {
    if (event is GetInvoiceTools) {
      yield* _getInvoiceToolsToState(event);
    } else {
      yield null;
    }
    // if (event is FromInvoice) {
    // yield* _saveDataFrom(event.txt);
    // }
    // switch (event){
    //   case FromInvoice:{
    //     yield null;
    //     break;
    // }
  }

  Stream<InvoiceToolsState> _getInvoiceToolsToState(
      GetInvoiceTools event) async* {
    List<InvoiceTools> invoiceToolsMap =
        invoiceToolsFromJson(Dummy.invoiceTools);
    yield LoadedInvoiceToolsState(invoiceToolsMap);
  }
}
