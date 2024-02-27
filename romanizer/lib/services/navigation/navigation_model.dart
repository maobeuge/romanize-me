import 'package:equatable/equatable.dart';
import 'package:romanizer/screens/landing_page.dart';
import 'package:romanizer/screens/loading_page.dart';
import 'package:romanizer/screens/search_page.dart';
import 'package:romanizer/services/navigation/screen_model.dart';

enum NavigationIndex { landingPage, searchPage, loadingPage }

class NavigationClass extends Equatable {
  final int index;

  const NavigationClass({required this.index});

  @override
  List<Object?> get props => [index];

  static List<ScreenModel> screenList = [
    ScreenModel(
        index: NavigationIndex.landingPage.index,
        label: NavigationIndex.landingPage.name,
        screenContent: const LandingPage()),
    ScreenModel(
        index: NavigationIndex.searchPage.index,
        label: NavigationIndex.searchPage.name,
        screenContent: const SearchPage()),
    ScreenModel(
        index: NavigationIndex.loadingPage.index,
        label: NavigationIndex.loadingPage.name,
        screenContent: const LoadingPage()),
  ];
}
