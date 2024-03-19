import 'package:bercerita_app/states/nav_states/nav_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavNotifier extends StateNotifier<NavState> {
  NavNotifier() : super(const NavState());

  void onIndexChanged(int index) {
    state = state.copyWith(index: index);
  }
}

final navProvider = StateNotifierProvider.autoDispose<NavNotifier, NavState>(
  (ref) => NavNotifier(),
);
