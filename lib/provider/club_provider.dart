import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'shared_utility_provider.dart';

final clubIndexProvider = StateNotifierProvider<ClubIndexNotifier, int>((ref) {
  return ClubIndexNotifier(ref: ref);
});

class ClubIndexNotifier extends StateNotifier<int> {
  ClubIndexNotifier({required this.ref}) : super(0) {
    state = ref.watch(sharedUtilityProvider).loadClubIndex();
  }
  Ref ref;

  void changeIndex(int index) {
    ref.watch(sharedUtilityProvider).setClubIndex(
          index: index,
        );
    state = ref.watch(sharedUtilityProvider).loadClubIndex();
  }
}
