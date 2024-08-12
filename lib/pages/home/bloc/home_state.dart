class HomeState {
  int page;

  // dynamic courseItem;

  HomeState({this.page = 0});

  HomeState copyWith({int? page}) {
    return HomeState(
      page: page ?? this.page,
      // courseItem: item ?? this.courseItem,
    );
  }
}
