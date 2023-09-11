class OrderModel {
  int? status;
  List<Data>? data;

  OrderModel({this.status, this.data});

  OrderModel.fromJson(Map<String, dynamic> json) {
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
  int? userId;
  dynamic? totalPrice;
  int? state;
  String? createdAt;
  String? updatedAt;
  User? user;
  List<OrderItems>? orderItems;

  Data(
      {this.id,
        this.userId,
        this.totalPrice,
        this.state,
        this.createdAt,
        this.updatedAt,
        this.user,
        this.orderItems});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    totalPrice = json['Total_Price'];
    state = json['state'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['order_items'] != null) {
      orderItems = <OrderItems>[];
      json['order_items'].forEach((v) {
        orderItems!.add(new OrderItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['Total_Price'] = this.totalPrice;
    data['state'] = this.state;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.orderItems != null) {
      data['order_items'] = this.orderItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int? id;
  String? userName;
  String? email;
  Null? emailVerifiedAt;
  String? address;
  String? phoneNumber;
  String? profileImgUrl;

  User(
      {this.id,
        this.userName,
        this.email,
        this.emailVerifiedAt,
        this.address,
        this.phoneNumber,
        this.profileImgUrl});

  User.fromJson(Map<String, dynamic> json) {
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

class OrderItems {
  int? id;
  int? orderId;
  int? variantId;
  int? quantity;
  dynamic price;
  String? createdAt;
  String? updatedAt;
  Variant? variant;

  OrderItems(
      {this.id,
        this.orderId,
        this.variantId,
        this.quantity,
        this.price,
        this.createdAt,
        this.updatedAt,
        this.variant});

  OrderItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    variantId = json['variant_id'];
    quantity = json['quantity'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    variant =
    json['variant'] != null ? new Variant.fromJson(json['variant']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['variant_id'] = this.variantId;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.variant != null) {
      data['variant'] = this.variant!.toJson();
    }
    return data;
  }
}

class Variant {
  int? id;
  int? productId;
  int? colorId;
  int? sizeId;
  int? variantQuantity;
  Product? product;
  Color? color;
  Size? size;

  Variant(
      {this.id,
        this.productId,
        this.colorId,
        this.sizeId,
        this.variantQuantity,
        this.product,
        this.color,
        this.size});

  Variant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    colorId = json['color_id'];
    sizeId = json['size_id'];
    variantQuantity = json['variant_quantity'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
    color = json['color'] != null ? new Color.fromJson(json['color']) : null;
    size = json['size'] != null ? new Size.fromJson(json['size']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['color_id'] = this.colorId;
    data['size_id'] = this.sizeId;
    data['variant_quantity'] = this.variantQuantity;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    if (this.color != null) {
      data['color'] = this.color!.toJson();
    }
    if (this.size != null) {
      data['size'] = this.size!.toJson();
    }
    return data;
  }
}

class Product {
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
  List<ProductImages>? productImages;

  Product(
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
        this.productImages});

  Product.fromJson(Map<String, dynamic> json) {
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
    if (this.productImages != null) {
      data['product_images'] =
          this.productImages!.map((v) => v.toJson()).toList();
    }
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

class Color {
  int? id;
  String? color;
  String? hex;

  Color({this.id, this.color, this.hex});

  Color.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    color = json['color'];
    hex = json['hex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['color'] = this.color;
    data['hex'] = this.hex;
    return data;
  }
}

class Size {
  int? id;
  String? size;
  int? typeId;

  Size({this.id, this.size, this.typeId});

  Size.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    size = json['size'];
    typeId = json['type_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['size'] = this.size;
    data['type_id'] = this.typeId;
    return data;
  }
}
