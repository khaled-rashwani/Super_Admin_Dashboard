class XAdminProductModel {
  int? status;
  List<Products>? products;

  XAdminProductModel({this.status, this.products});

  XAdminProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? id;
  int? adminId;
  int? categoryId;
  String? companyName;
  String? categoryName;
  String? name;
  int? price;
  String? description;
  int? discountPercentage;
  int? approved;
  int? productQuantity;
  int? sellCount;
  List<ProductImages>? productImages;

  Products(
      {this.id,
        this.adminId,
        this.categoryId,
        this.companyName,
        this.categoryName,
        this.name,
        this.price,
        this.description,
        this.discountPercentage,
        this.approved,
        this.productQuantity,
        this.sellCount,
        this.productImages});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adminId = json['admin_id'];
    categoryId = json['category_id'];
    companyName = json['company_name'];
    categoryName = json['category_name'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    discountPercentage = json['discount_percentage'];
    approved = json['approved'];
    productQuantity = json['product_quantity'];
    sellCount = json['sell_count'];
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
    data['company_name'] = this.companyName;
    data['category_name'] = this.categoryName;
    data['name'] = this.name;
    data['price'] = this.price;
    data['description'] = this.description;
    data['discount_percentage'] = this.discountPercentage;
    data['approved'] = this.approved;
    data['product_quantity'] = this.productQuantity;
    data['sell_count'] = this.sellCount;
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
