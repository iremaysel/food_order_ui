// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:equatable/equatable.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final DataConnectionChecker dataConnectionChecker;
  StreamSubscription<DataConnectionStatus>? listener;
  InternetBloc({
    required this.dataConnectionChecker,
  }) : super(InternetLoading()) {
    listener = dataConnectionChecker.onStatusChange.listen((connectivity) {
      if (connectivity == DataConnectionStatus.connected) {
        print("El dispositivo tiene internet ahora");
        emit(InternetConnected());
      }
      if (connectivity == DataConnectionStatus.disconnected) {
        print("El dispositivo no tiene internet ahora");
        emit(InternetDisconnected());
      }
    });
  }

  @override
  Future<void> close() {
    listener!.cancel();
    return super.close();
  }
}
