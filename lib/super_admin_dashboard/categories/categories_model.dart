class SuperCategoriesModel {
  int? _status;
  List<Data>? _data;

  SuperCategoriesModel({int? status, List<Data>? data}) {
    if (status != null) {
      this._status = status;
    }
    if (data != null) {
      this._data = data;
    }
  }

  int? get status => _status;
  set status(int? status) => _status = status;
  List<Data>? get data => _data;
  set data(List<Data>? data) => _data = data;

  SuperCategoriesModel.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    if (json['data'] != null) {
      _data = <Data>[];
      json['data'].forEach((v) {
        _data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    if (this._data != null) {
      data['data'] = this._data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? _id;
  String? _name;
  String? _image;
  int? _iLft;
  int? _iRgt;
  Null? _parentId;
  String? _createdAt;
  String? _updatedAt;
  List<Products>? _products;
  List<Children>? _children;

  Data(
      {int? id,
        String? name,
        String? image,
        int? iLft,
        int? iRgt,
        Null? parentId,
        String? createdAt,
        String? updatedAt,
        List<Products>? products,
        List<Children>? children}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (image != null) {
      this._image = image;
    }
    if (iLft != null) {
      this._iLft = iLft;
    }
    if (iRgt != null) {
      this._iRgt = iRgt;
    }
    if (parentId != null) {
      this._parentId = parentId;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
    if (products != null) {
      this._products = products;
    }
    if (children != null) {
      this._children = children;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get image => _image;
  set image(String? image) => _image = image;
  int? get iLft => _iLft;
  set iLft(int? iLft) => _iLft = iLft;
  int? get iRgt => _iRgt;
  set iRgt(int? iRgt) => _iRgt = iRgt;
  Null? get parentId => _parentId;
  set parentId(Null? parentId) => _parentId = parentId;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  List<Products>? get products => _products;
  set products(List<Products>? products) => _products = products;
  List<Children>? get children => _children;
  set children(List<Children>? children) => _children = children;

  Data.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _iLft = json['_lft'];
    _iRgt = json['_rgt'];
    _parentId = json['parent_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    if (json['products'] != null) {
      _products = <Products>[];
      json['products'].forEach((v) {
        _products!.add(new Products.fromJson(v));
      });
    }
    if (json['children'] != null) {
      _children = <Children>[];
      json['children'].forEach((v) {
        _children!.add(new Children.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['image'] = this._image;
    data['_lft'] = this._iLft;
    data['_rgt'] = this._iRgt;
    data['parent_id'] = this._parentId;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    if (this._products != null) {
      data['products'] = this._products!.map((v) => v.toJson()).toList();
    }
    if (this._children != null) {
      data['children'] = this._children!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? _id;
  int? _adminId;
  int? _categoryId;
  String? _name;
  int? _price;
  String? _description;
  int? _haveDiscount;
  int? _approved;
  int? _productQuantity;
  String? _createdAt;
  String? _updatedAt;
  Admin? _admin;
  List<ProductImages>? _productImages;
  List<Null>? _productTags;
  List<ProductVariants>? _productVariants;

  Products(
      {int? id,
        int? adminId,
        int? categoryId,
        String? name,
        int? price,
        String? description,
        int? haveDiscount,
        int? approved,
        int? productQuantity,
        String? createdAt,
        String? updatedAt,
        Admin? admin,
        List<ProductImages>? productImages,
        List<Null>? productTags,
        List<ProductVariants>? productVariants}) {
    if (id != null) {
      this._id = id;
    }
    if (adminId != null) {
      this._adminId = adminId;
    }
    if (categoryId != null) {
      this._categoryId = categoryId;
    }
    if (name != null) {
      this._name = name;
    }
    if (price != null) {
      this._price = price;
    }
    if (description != null) {
      this._description = description;
    }
    if (haveDiscount != null) {
      this._haveDiscount = haveDiscount;
    }
    if (approved != null) {
      this._approved = approved;
    }
    if (productQuantity != null) {
      this._productQuantity = productQuantity;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
    if (admin != null) {
      this._admin = admin;
    }
    if (productImages != null) {
      this._productImages = productImages;
    }
    if (productTags != null) {
      this._productTags = productTags;
    }
    if (productVariants != null) {
      this._productVariants = productVariants;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  int? get adminId => _adminId;
  set adminId(int? adminId) => _adminId = adminId;
  int? get categoryId => _categoryId;
  set categoryId(int? categoryId) => _categoryId = categoryId;
  String? get name => _name;
  set name(String? name) => _name = name;
  int? get price => _price;
  set price(int? price) => _price = price;
  String? get description => _description;
  set description(String? description) => _description = description;
  int? get haveDiscount => _haveDiscount;
  set haveDiscount(int? haveDiscount) => _haveDiscount = haveDiscount;
  int? get approved => _approved;
  set approved(int? approved) => _approved = approved;
  int? get productQuantity => _productQuantity;
  set productQuantity(int? productQuantity) =>
      _productQuantity = productQuantity;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  Admin? get admin => _admin;
  set admin(Admin? admin) => _admin = admin;
  List<ProductImages>? get productImages => _productImages;
  set productImages(List<ProductImages>? productImages) =>
      _productImages = productImages;
  List<Null>? get productTags => _productTags;
  set productTags(List<Null>? productTags) => _productTags = productTags;
  List<ProductVariants>? get productVariants => _productVariants;
  set productVariants(List<ProductVariants>? productVariants) =>
      _productVariants = productVariants;

  Products.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _adminId = json['admin_id'];
    _categoryId = json['category_id'];
    _name = json['name'];
    _price = json['price'];
    _description = json['description'];
    _haveDiscount = json['have_discount'];
    _approved = json['approved'];
    _productQuantity = json['product_quantity'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _admin = json['admin'] != null ? new Admin.fromJson(json['admin']) : null;
    if (json['product_images'] != null) {
      _productImages = <ProductImages>[];
      json['product_images'].forEach((v) {
        _productImages!.add(new ProductImages.fromJson(v));
      });
    }
    if (json['product_variants'] != null) {
      _productVariants = <ProductVariants>[];
      json['product_variants'].forEach((v) {
        _productVariants!.add(new ProductVariants.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['admin_id'] = this._adminId;
    data['category_id'] = this._categoryId;
    data['name'] = this._name;
    data['price'] = this._price;
    data['description'] = this._description;
    data['have_discount'] = this._haveDiscount;
    data['approved'] = this._approved;
    data['product_quantity'] = this._productQuantity;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    if (this._admin != null) {
      data['admin'] = this._admin!.toJson();
    }
    if (this._productImages != null) {
      data['product_images'] =
          this._productImages!.map((v) => v.toJson()).toList();
    }

    if (this._productVariants != null) {
      data['product_variants'] =
          this._productVariants!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Admin {
  int? _id;
  String? _companyName;
  String? _email;
  String? _logo;
  String? _description;
  String? _phoneNumber;
  int? _wallet;
  int? _state;
  Null? _createdAt;
  Null? _updatedAt;

  Admin(
      {int? id,
        String? companyName,
        String? email,
        String? logo,
        String? description,
        String? phoneNumber,
        int? wallet,
        int? state,
        Null? createdAt,
        Null? updatedAt}) {
    if (id != null) {
      this._id = id;
    }
    if (companyName != null) {
      this._companyName = companyName;
    }
    if (email != null) {
      this._email = email;
    }
    if (logo != null) {
      this._logo = logo;
    }
    if (description != null) {
      this._description = description;
    }
    if (phoneNumber != null) {
      this._phoneNumber = phoneNumber;
    }
    if (wallet != null) {
      this._wallet = wallet;
    }
    if (state != null) {
      this._state = state;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get companyName => _companyName;
  set companyName(String? companyName) => _companyName = companyName;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get logo => _logo;
  set logo(String? logo) => _logo = logo;
  String? get description => _description;
  set description(String? description) => _description = description;
  String? get phoneNumber => _phoneNumber;
  set phoneNumber(String? phoneNumber) => _phoneNumber = phoneNumber;
  int? get wallet => _wallet;
  set wallet(int? wallet) => _wallet = wallet;
  int? get state => _state;
  set state(int? state) => _state = state;
  Null? get createdAt => _createdAt;
  set createdAt(Null? createdAt) => _createdAt = createdAt;
  Null? get updatedAt => _updatedAt;
  set updatedAt(Null? updatedAt) => _updatedAt = updatedAt;

  Admin.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _companyName = json['company_name'];
    _email = json['email'];
    _logo = json['logo'];
    _description = json['description'];
    _phoneNumber = json['phone_number'];
    _wallet = json['wallet'];
    _state = json['state'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['company_name'] = this._companyName;
    data['email'] = this._email;
    data['logo'] = this._logo;
    data['description'] = this._description;
    data['phone_number'] = this._phoneNumber;
    data['wallet'] = this._wallet;
    data['state'] = this._state;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}

class ProductImages {
  int? _id;
  int? _productId;
  String? _productImage;
  Null? _createdAt;
  Null? _updatedAt;

  ProductImages(
      {int? id,
        int? productId,
        String? productImage,
        Null? createdAt,
        Null? updatedAt}) {
    if (id != null) {
      this._id = id;
    }
    if (productId != null) {
      this._productId = productId;
    }
    if (productImage != null) {
      this._productImage = productImage;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  int? get productId => _productId;
  set productId(int? productId) => _productId = productId;
  String? get productImage => _productImage;
  set productImage(String? productImage) => _productImage = productImage;
  Null? get createdAt => _createdAt;
  set createdAt(Null? createdAt) => _createdAt = createdAt;
  Null? get updatedAt => _updatedAt;
  set updatedAt(Null? updatedAt) => _updatedAt = updatedAt;

  ProductImages.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _productId = json['product_id'];
    _productImage = json['product_image'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['product_id'] = this._productId;
    data['product_image'] = this._productImage;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}

class ProductVariants {
  int? _id;
  int? _productId;
  int? _colorId;
  int? _sizeId;
  int? _variantQuantity;

  ProductVariants(
      {int? id,
        int? productId,
        int? colorId,
        int? sizeId,
        int? variantQuantity}) {
    if (id != null) {
      this._id = id;
    }
    if (productId != null) {
      this._productId = productId;
    }
    if (colorId != null) {
      this._colorId = colorId;
    }
    if (sizeId != null) {
      this._sizeId = sizeId;
    }
    if (variantQuantity != null) {
      this._variantQuantity = variantQuantity;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  int? get productId => _productId;
  set productId(int? productId) => _productId = productId;
  int? get colorId => _colorId;
  set colorId(int? colorId) => _colorId = colorId;
  int? get sizeId => _sizeId;
  set sizeId(int? sizeId) => _sizeId = sizeId;
  int? get variantQuantity => _variantQuantity;
  set variantQuantity(int? variantQuantity) =>
      _variantQuantity = variantQuantity;

  ProductVariants.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _productId = json['product_id'];
    _colorId = json['color_id'];
    _sizeId = json['size_id'];
    _variantQuantity = json['variant_quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['product_id'] = this._productId;
    data['color_id'] = this._colorId;
    data['size_id'] = this._sizeId;
    data['variant_quantity'] = this._variantQuantity;
    return data;
  }
}

class Children {
  int? _id;
  String? _name;
  String? _image;
  int? _iLft;
  int? _iRgt;
  int? _parentId;
  String? _createdAt;
  String? _updatedAt;
  List<Null>? _products;
  List<Null>? _children;

  Children(
      {int? id,
        String? name,
        String? image,
        int? iLft,
        int? iRgt,
        int? parentId,
        String? createdAt,
        String? updatedAt,
        List<Null>? products,
        List<Null>? children}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (image != null) {
      this._image = image;
    }
    if (iLft != null) {
      this._iLft = iLft;
    }
    if (iRgt != null) {
      this._iRgt = iRgt;
    }
    if (parentId != null) {
      this._parentId = parentId;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
    if (products != null) {
      this._products = products;
    }
    if (children != null) {
      this._children = children;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get image => _image;
  set image(String? image) => _image = image;
  int? get iLft => _iLft;
  set iLft(int? iLft) => _iLft = iLft;
  int? get iRgt => _iRgt;
  set iRgt(int? iRgt) => _iRgt = iRgt;
  int? get parentId => _parentId;
  set parentId(int? parentId) => _parentId = parentId;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  List<Null>? get products => _products;
  set products(List<Null>? products) => _products = products;
  List<Null>? get children => _children;
  set children(List<Null>? children) => _children = children;

  Children.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _iLft = json['_lft'];
    _iRgt = json['_rgt'];
    _parentId = json['parent_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['image'] = this._image;
    data['_lft'] = this._iLft;
    data['_rgt'] = this._iRgt;
    data['parent_id'] = this._parentId;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}
