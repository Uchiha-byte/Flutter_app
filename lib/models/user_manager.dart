import 'user_model.dart';

class UserManager {
  static final UserManager _instance = UserManager._internal();
  factory UserManager() => _instance;
  UserManager._internal();

  UserModel? currentUser;

  void setUser(UserModel user) {
    currentUser = user;
  }

  void clearUser() {
    currentUser = null;
  }
} 