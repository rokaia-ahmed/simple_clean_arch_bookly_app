import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class BlocObserverService extends BlocObserver{
  @override
  void onCreate(BlocBase bloc) {
    log('onCreate -- ${bloc.runtimeType}');
    super.onCreate(bloc);
  }
@override
  void onChange(BlocBase bloc, Change change) {
  log(change.toString());
    super.onChange(bloc, change);
  }
  @override
  void onClose(BlocBase bloc) {
    log('onClose -- ${bloc.runtimeType}');
    super.onClose(bloc);
  }
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('BLOC ERROR ${error.toString()}');
    super.onError(bloc, error, stackTrace);
  }
}