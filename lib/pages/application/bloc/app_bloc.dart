import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_event.dart';
import 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState()) {
    on<TriggerAppEvent>(_onTriggerAppEvent);
  }

  void _onTriggerAppEvent(TriggerAppEvent event, Emitter<AppState> ask) {
    ask(AppState(index: event.index));
  }
}
