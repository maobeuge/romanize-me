import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:romanizer/services/navigation/screen_model.dart';
import 'navigation_model.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  late NavigationClass _navigation;

  NavigationBloc() : super(NavigationInitial()) {
    on<LoadNavigation>(
      (event, emit) {
        final int index = event.index;
        emit(NavigationLoaded(
            index: index, screens: NavigationClass.screenList));
      },
    );

    on<ChangeIndex>((event, emit) {
      if (state is NavigationLoaded) {
        final state = this.state as NavigationLoaded;
        emit(NavigationLoaded(
          index: event.newIndex,
          screens: List.from(state.screens),
        ));
      }
    });
  }
}
