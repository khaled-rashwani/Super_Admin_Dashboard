class UsersModel {
  List<Data>? data;

  UsersModel({this.data});

  UsersModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? userName;
  String? email;
  Null? emailVerifiedAt;
  String? address;
  String? phoneNumber;
  String? profileImgUrl;

  Data(
      {this.id,
        this.userName,
        this.email,
        this.emailVerifiedAt,
        this.address,
        this.phoneNumber,
        this.profileImgUrl});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['user_name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    address = json['address'];
    phoneNumber = json['phone_number'];
    profileImgUrl = json['profile_img_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_name'] = this.userName;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['address'] = this.address;
    data['phone_number'] = this.phoneNumber;
    data['profile_img_url'] = this.profileImgUrl;
    return data;
  }
}
