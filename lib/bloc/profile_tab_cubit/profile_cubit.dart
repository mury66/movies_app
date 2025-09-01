import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'profile_states.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit()
    : super(
        ProfileInitial(
          name: "Ahmed Atef",
          phone: "0100000000",
          avatar: "assets/images/avatar1.png",
        ),
      ) {
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString("name") ?? "Ahmed Atef";
    final phone = prefs.getString("phone") ?? "0100000000";
    final avatar = prefs.getString("avatar") ?? "assets/images/avatar1.png";

    emit(ProfileInitial(name: name, phone: phone, avatar: avatar));
  }

  Future<void> updateProfile(String name, String phone, String avatar) async {
    emit(
      ProfileLoading(
        name: state.name,
        phone: state.phone,
        avatar: state.avatar,
      ),
    );

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("name", name);
      await prefs.setString("phone", phone);
      await prefs.setString("avatar", avatar);

      await Future.delayed(const Duration(milliseconds: 500));

      emit(ProfileUpdated(name: name, phone: phone, avatar: avatar));
    } catch (e) {
      emit(
        ProfileError(
          e.toString(),
          name: state.name,
          phone: state.phone,
          avatar: state.avatar,
        ),
      );
    }
  }

  Future<void> logout() async {
    emit(
      ProfileLoading(
        name: state.name,
        phone: state.phone,
        avatar: state.avatar,
      ),
    );

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool("isLoggedIn", false);

      await Future.delayed(const Duration(milliseconds: 500));

      emit(ProfileLoggedOut());
    } catch (e) {
      emit(
        ProfileError(
          e.toString(),
          name: state.name,
          phone: state.phone,
          avatar: state.avatar,
        ),
      );
    }
  }

  Future<void> deleteAccount() async {
    emit(
      ProfileLoading(
        name: state.name,
        phone: state.phone,
        avatar: state.avatar,
      ),
    );

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();

      await Future.delayed(const Duration(milliseconds: 500));

      emit(ProfileDeleted());
    } catch (e) {
      emit(
        ProfileError(
          e.toString(),
          name: state.name,
          phone: state.phone,
          avatar: state.avatar,
        ),
      );
    }
  }
}
