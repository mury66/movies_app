import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_states.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileLoading(name: "", phone: "", avatar: "")) {
    loadUserData();
  }

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  Future<void> loadUserData() async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        emit(ProfileLoggedOut());
        return;
      }

      final snapshot = await _firestore.collection("users").doc(user.uid).get();

      if (snapshot.exists) {
        final data = snapshot.data()!;
        emit(
          ProfileInitial(
            name: data["name"] ?? "",
            phone: data["phone"] ?? "",
            avatar: data["avatar"] ?? "assets/images/avatar1.png",
          ),
        );
      } else {
        emit(
          ProfileError("No user data found", name: "", phone: "", avatar: ""),
        );
      }
    } catch (e) {
      emit(ProfileError(e.toString(), name: "", phone: "", avatar: ""));
    }
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
      final user = _auth.currentUser;
      if (user == null) return;

      await _firestore.collection("users").doc(user.uid).update({
        "name": name,
        "phone": phone,
        "avatar": avatar,
      });

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
    await _auth.signOut();
    emit(ProfileLoggedOut());
  }

  Future<void> deleteAccount() async {
    try {
      final user = _auth.currentUser;
      if (user == null) return;

      await _firestore.collection("users").doc(user.uid).delete();
      await user.delete();

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
