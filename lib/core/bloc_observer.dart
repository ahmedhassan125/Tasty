import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class CrashlyticsBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    FirebaseCrashlytics.instance.log('Change in ${bloc.runtimeType}: ${change.currentState.runtimeType} -> ${change.nextState.runtimeType}');
  }
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    FirebaseCrashlytics.instance.recordError(
      error,
      stackTrace,
      reason: 'Fatal error in ${bloc.runtimeType}',
    );

    super.onError(bloc, error, stackTrace);
  }
}