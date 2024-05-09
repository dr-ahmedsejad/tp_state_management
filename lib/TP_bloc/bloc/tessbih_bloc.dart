import 'package:bloc/bloc.dart';
import 'tessbih_events.dart';
import 'tessbih_states.dart';

class TessbihBloc extends Bloc<TessbihEvent, TessbihState> {
  TessbihBloc() : super(TessbihCounters(0, 0, 0, 0)) {
    on<IncrementSubhanAllah>((event, emit) {
      emit(TessbihCounters(state.subhanAllahCount + 1, state.alhamdulillahCount, state.laIlahaIlaAllahCount, state.allahuAkbarCount));
    });

    on<IncrementAlhamdulillah>((event, emit) {
      emit(TessbihCounters(state.subhanAllahCount, state.alhamdulillahCount+1, state.laIlahaIlaAllahCount, state.allahuAkbarCount));
    });

    on<IncrementLaIlahaIlaAllah>((event, emit) {
      emit(TessbihCounters(state.subhanAllahCount, state.alhamdulillahCount, state.laIlahaIlaAllahCount+1, state.allahuAkbarCount));
    });

    on<IncrementAllahuAkbar>((event, emit) {
      emit(TessbihCounters(state.subhanAllahCount, state.alhamdulillahCount, state.laIlahaIlaAllahCount, state.allahuAkbarCount+1));
    });
    on<ResetTasbeeh>((event, emit) {
      emit(TessbihCounters(0, 0, 0, 0));
    });
  }
}
