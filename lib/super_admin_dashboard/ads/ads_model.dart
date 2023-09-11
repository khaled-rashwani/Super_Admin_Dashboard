// class AdsModel {
//   List<Data>? data;
//
//   AdsModel({this.data});
//
//   AdsModel.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(new Data.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Data {
//   int? id;
//   int? adminId;
//   String? image;
//   String? createdAt;
//   String? updatedAt;
//   Admin? admin;
//
//   Data(
//       {this.id,
//         this.adminId,
//         this.image,
//         this.createdAt,
//         this.updatedAt,
//         this.admin});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     adminId = json['admin_id'];
//     image = json['image'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     admin = json['admin'] != null ? new Admin.fromJson(json['admin']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['admin_id'] = this.adminId;
//     data['image'] = this.image;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     if (this.admin != null) {
//       data['admin'] = this.admin!.toJson();
//     }
//     return data;
//   }
// }
//
// class Admin {
//   int? id;
//   String? companyName;
//   String? email;
//   String? logo;
//   String? description;
//   String? phoneNumber;
//   int? wallet;
//   int? state;
//   Null? createdAt;
//   Null? updatedAt;
//
//   Admin(
//       {this.id,
//         this.companyName,
//         this.email,
//         this.logo,
//         this.description,
//         this.phoneNumber,
//         this.wallet,
//         this.state,
//         this.createdAt,
//         this.updatedAt});
//
//   Admin.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     companyName = json['company_name'];
//     email = json['email'];
//     logo = json['logo'];
//     description = json['description'];
//     phoneNumber = json['phone_number'];
//     wallet = json['wallet'];
//     state = json['state'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['company_name'] = this.companyName;
//     data['email'] = this.email;
//     data['logo'] = this.logo;
//     data['description'] = this.description;
//     data['phone_number'] = this.phoneNumber;
//     data['wallet'] = this.wallet;
//     data['state'] = this.state;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }