
class ProfileResponseModel {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final ProfileInfo? profileInfo;

  ProfileResponseModel({
     this.id,
     this.firstName,
     this.lastName,
     this.email,
     this.profileInfo,
  });

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) {
    return ProfileResponseModel(
      id: json['id'] ?? 0,
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      email: json['email'] ?? '',
      profileInfo: ProfileInfo.fromJson(json['profileInfo']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'profileInfo': profileInfo!.toJson(),
    };
  }


}

class ProfileInfo {
  final String? gender;
  final String? dateOfBirth;
  final String? phoneNumber;
  final String? image;

  ProfileInfo({
     this.gender,
    this.dateOfBirth,
    this.phoneNumber,
     this.image,
  });

  factory ProfileInfo.fromJson(Map<String, dynamic> json) {
    return ProfileInfo(
      gender: json['gender'],
      dateOfBirth: json['date_of_birth'],
      phoneNumber: json['phone_number'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'gender': gender,
      'date_of_birth': dateOfBirth,
      'phone_number': phoneNumber,
      'image': image,
    };
  }
}
