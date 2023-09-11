class AdminsCountModel {
  int? totalOfAdminsIs;

  AdminsCountModel({this.totalOfAdminsIs});

  AdminsCountModel.fromJson(Map<String, dynamic> json) {
    totalOfAdminsIs = json['Total of Admins is: '];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Total of Admins is: '] = this.totalOfAdminsIs;
    return data;
  }
}

class UsersCountModel {
  int? totalOfUsersIs;

  UsersCountModel({this.totalOfUsersIs});

  UsersCountModel.fromJson(Map<String, dynamic> json) {
    totalOfUsersIs = json['Total of Users is: '];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Total of Users is: '] = this.totalOfUsersIs;
    return data;
  }
}


class OrderCountModel {
  int? totalOfOrdersIs;

  OrderCountModel({this.totalOfOrdersIs});

  OrderCountModel.fromJson(Map<String, dynamic> json) {
    totalOfOrdersIs = json['Total of Orders is: '];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Total of Orders is: '] = this.totalOfOrdersIs;
    return data;
  }
}


// class BestSellingModel {
//   int? status;
//   List<Data>? data;
//
//   BestSellingModel({this.status, this.data});
//
//   BestSellingModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
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
//     data['status'] = this.status;
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
//   int? categoryId;
//   String? name;
//   int? price;
//   String? description;
//   int? discountPercentage;
//   int? approved;
//   int? productQuantity;
//   int? sellCount;
//
//   Data(
//       {this.id,
//         this.adminId,
//         this.categoryId,
//         this.name,
//         this.price,
//         this.description,
//         this.discountPercentage,
//         this.approved,
//         this.productQuantity,
//         this.sellCount});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     adminId = json['admin_id'];
//     categoryId = json['category_id'];
//     name = json['name'];
//     price = json['price'];
//     description = json['description'];
//     discountPercentage = json['discount_percentage'];
//     approved = json['approved'];
//     productQuantity = json['product_quantity'];
//     sellCount = json['sell_count'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['admin_id'] = this.adminId;
//     data['category_id'] = this.categoryId;
//     data['name'] = this.name;
//     data['price'] = this.price;
//     data['description'] = this.description;
//     data['discount_percentage'] = this.discountPercentage;
//     data['approved'] = this.approved;
//     data['product_quantity'] = this.productQuantity;
//     data['sell_count'] = this.sellCount;
//     return data;
//   }
// }


class BestSellingModel {
  int? status;
  List<Data>? data;

  BestSellingModel({this.status, this.data});

  BestSellingModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? adminId;
  int? categoryId;
  String? name;
  int? price;
  String? description;
  int? discountPercentage;
  int? approved;
  int? productQuantity;
  int? sellCount;
  String? createdAt;
  String? updatedAt;
  Admin? admin;
  List<ProductImages>? productImages;

  Data(
      {this.id,
        this.adminId,
        this.categoryId,
        this.name,
        this.price,
        this.description,
        this.discountPercentage,
        this.approved,
        this.productQuantity,
        this.sellCount,
        this.createdAt,
        this.updatedAt,
        this.admin,
        this.productImages});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adminId = json['admin_id'];
    categoryId = json['category_id'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    discountPercentage = json['discount_percentage'];
    approved = json['approved'];
    productQuantity = json['product_quantity'];
    sellCount = json['sell_count'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    admin = json['admin'] != null ? new Admin.fromJson(json['admin']) : null;
    if (json['product_images'] != null) {
      productImages = <ProductImages>[];
      json['product_images'].forEach((v) {
        productImages!.add(new ProductImages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['admin_id'] = this.adminId;
    data['category_id'] = this.categoryId;
    data['name'] = this.name;
    data['price'] = this.price;
    data['description'] = this.description;
    data['discount_percentage'] = this.discountPercentage;
    data['approved'] = this.approved;
    data['product_quantity'] = this.productQuantity;
    data['sell_count'] = this.sellCount;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.admin != null) {
      data['admin'] = this.admin!.toJson();
    }
    if (this.productImages != null) {
      data['product_images'] =
          this.productImages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Admin {
  int? id;
  String? companyName;
  String? email;
  String? password;
  String? logo;
  String? description;
  String? phoneNumber;
  int? wallet;
  double? percentage;
  int? state;

  Admin(
      {this.id,
        this.companyName,
        this.email,
        this.password,
        this.logo,
        this.description,
        this.phoneNumber,
        this.wallet,
        this.percentage,
        this.state});

  Admin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyName = json['company_name'];
    email = json['email'];
    password = json['password'];
    logo = json['logo'];
    description = json['description'];
    phoneNumber = json['phone_number'];
    wallet = json['wallet'];
    percentage = json['percentage'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['company_name'] = this.companyName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['logo'] = this.logo;
    data['description'] = this.description;
    data['phone_number'] = this.phoneNumber;
    data['wallet'] = this.wallet;
    data['percentage'] = this.percentage;
    data['state'] = this.state;
    return data;
  }
}

class ProductImages {
  int? id;
  int? productId;
  String? productImage;

  ProductImages({this.id, this.productId, this.productImage});

  ProductImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    productImage = json['product_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['product_image'] = this.productImage;
    return data;
  }
}




