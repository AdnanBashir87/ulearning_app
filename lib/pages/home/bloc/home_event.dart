abstract class HomeEvent {
  const HomeEvent();
}

class PageIndicatorDots extends HomeEvent {
  final int pageIndex;

  PageIndicatorDots(this.pageIndex);
}

// class CourseItems extends HomeEvent {
//   dynamic courseItem;
//
//   CourseItems(this.courseItem);
// }
