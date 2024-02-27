part of 'navigation_bloc.dart';

class NavigationState extends Equatable {
  const NavigationState();

  @override
  List<Object> get props => [];
}

class NavigationInitial extends NavigationState {}

class NavigationLoaded extends NavigationState {
  final int index;
  final List<ScreenModel> screens;

  const NavigationLoaded({required this.index, required this.screens});

  @override
  List<Object> get props => [index, screens];
}
