abstract class ProfileState {
  final String name;
  final String phone;
  final String avatar;

  ProfileState({required this.name, required this.phone, required this.avatar});
}

class ProfileInitial extends ProfileState {
  ProfileInitial({
    required super.name,
    required super.phone,
    required super.avatar,
  });
}

class ProfileLoading extends ProfileState {
  ProfileLoading({
    required super.name,
    required super.phone,
    required super.avatar,
  });
}

class ProfileUpdated extends ProfileState {
  ProfileUpdated({
    required super.name,
    required super.phone,
    required super.avatar,
  });
}

class ProfileDeleted extends ProfileState {
  ProfileDeleted() : super(name: "", phone: "", avatar: "");
}

class ProfileLoggedOut extends ProfileState {
  ProfileLoggedOut() : super(name: "", phone: "", avatar: "");
}

class ProfileError extends ProfileState {
  final String message;
  ProfileError(
    this.message, {
    required super.name,
    required super.phone,
    required super.avatar,
  });
}
