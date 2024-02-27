part of 'navigation_bloc.dart';

class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class LoadNavigation extends NavigationEvent {
  final int index;

  const LoadNavigation({required this.index});
}

class ChangeIndex extends NavigationEvent {
  final int newIndex;

  const ChangeIndex({required this.newIndex});
}
