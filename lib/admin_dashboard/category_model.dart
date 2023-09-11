class AdminCategory {
  int? status;
  List<Data>? data;

  AdminCategory({this.status, this.data});

  AdminCategory.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? image;
  int? iLft;
  int? iRgt;
  Null? parentId;
  String? createdAt;
  String? updatedAt;
  List<Products>? products;
  List<Children>? children;

  Data(
      {this.id,
        this.name,
        this.image,
        this.iLft,
        this.iRgt,
        this.parentId,
        this.createdAt,
        this.updatedAt,
        this.products,
        this.children});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    iLft = json['_lft'];
    iRgt = json['_rgt'];
    parentId = json['parent_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    if (json['children'] != null) {
      children = <Children>[];
      json['children'].forEach((v) {
        children!.add(new Children.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['_lft'] = this.iLft;
    data['_rgt'] = this.iRgt;
    data['parent_id'] = this.parentId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    if (this.children != null) {
      data['children'] = this.children!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? id;
  int? adminId;
  int? categoryId;
  String? name;
  int? price;
  String? description;
  int? haveDiscount;
  int? approved;
  int? productQuantity;
  String? createdAt;
  String? updatedAt;

  Products(
      {this.id,
        this.adminId,
        this.categoryId,
        this.name,
        this.price,
        this.description,
        this.haveDiscount,
        this.approved,
        this.productQuantity,
        this.createdAt,
        this.updatedAt});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adminId = json['admin_id'];
    categoryId = json['category_id'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    haveDiscount = json['have_discount'];
    approved = json['approved'];
    productQuantity = json['product_quantity'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['admin_id'] = this.adminId;
    data['category_id'] = this.categoryId;
    data['name'] = this.name;
    data['price'] = this.price;
    data['description'] = this.description;
    data['have_discount'] = this.haveDiscount;
    data['approved'] = this.approved;
    data['product_quantity'] = this.productQuantity;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Children {
  int? id;
  String? name;
  String? image;
  int? iLft;
  int? iRgt;
  int? parentId;
  String? createdAt;
  String? updatedAt;
  List<Products>? products;
  List<Children>? children;

  Children(
      {this.id,
        this.name,
        this.image,
        this.iLft,
        this.iRgt,
        this.parentId,
        this.createdAt,
        this.updatedAt,
        this.products,
        this.children});

  Children.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    iLft = json['_lft'];
    iRgt = json['_rgt'];
    parentId = json['parent_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    // if (json['children'] != null) {
    //   children = <Null>[];
    //   json['children'].forEach((v) {
    //     children!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['_lft'] = this.iLft;
    data['_rgt'] = this.iRgt;
    data['parent_id'] = this.parentId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}
