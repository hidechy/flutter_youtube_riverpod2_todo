import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../common/helpers/db_helper.dart';
import '../common/models/user.dart';

final userProvider = StateNotifierProvider<UserState, List<User>>((ref) {
  return UserState();
});

class UserState extends StateNotifier<List<User>> {
  UserState() : super([]);

  ///
  Future<void> refresh() async {
    final data = await DBHelper.getUsers();

    state = data.map(User.fromJson).toList();
  }

// ///
// Future<void> logout(int id) async {
//   await DBHelper.logout(id);
//   refresh();
//   defaultEntry(state);
// }
//
//

// ///
// defaultEntry(List<User> users) {
//   if (users.isNotEmpty) {
//     var entrypoint = const TodoScreen();
//   } else {
//     var entrypoint = const TodoScreen();
//   }
//
//   return entrypoint;
// }
//
//
//
}
