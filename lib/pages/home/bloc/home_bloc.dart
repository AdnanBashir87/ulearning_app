import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<PageIndicatorDots>(_onPageIndicatorDots);
    // on<CourseItems>(_onCourseItems);
  }

  void _onPageIndicatorDots(PageIndicatorDots event, Emitter<HomeState> emit) {
    emit(state.copyWith(page: event.pageIndex));
  }

// void _onCourseItems(CourseItems event, Emitter<HomeState> emit) {
//   emit(state.copyWith(item: event.courseItem));
// }
}
