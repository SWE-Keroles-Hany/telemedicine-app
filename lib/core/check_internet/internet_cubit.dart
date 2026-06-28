import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:telemedicine/core/check_internet/internet_states.dart';

class InternetCubit extends Cubit<InternetStates> {
  InternetCubit() : super(IntailInternetState());

  StreamSubscription<InternetConnectionStatus>? subscription;
  final _checker = InternetConnectionChecker.instance;

  void checkInternet() async {
    final hasInternet = await _checker.hasConnection;
    if (hasInternet) {
      emit(ConnectedInternetState());
    } else {
      emit(NotConnectedInternetState());
    }

    subscription = _checker.onStatusChange.listen((status) {
      if (status == InternetConnectionStatus.connected) {
        emit(ConnectedInternetState());
      } else {
        emit(NotConnectedInternetState());
      }
    });
  }

  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
}
