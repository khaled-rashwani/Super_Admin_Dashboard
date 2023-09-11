class ColorsModel {
  int? status;
  List<Colors>? colors;

  ColorsModel({this.status, this.colors});

  ColorsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['colors'] != null) {
      colors = <Colors>[];
      json['colors'].forEach((v) {
        colors!.add(new Colors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.colors != null) {
      data['colors'] = this.colors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Colors {
  int? id;
  String? color;
  String? hex;

  Colors({this.id, this.color, this.hex});

  Colors.fromJson(Map<String, dynamic> json) {
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


class SizesModel {
  int? status;
  List<Sizes>? sizes;

  SizesModel({this.status, this.sizes});

  SizesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['sizes'] != null) {
      sizes = <Sizes>[];
      json['sizes'].forEach((v) {
        sizes!.add(new Sizes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.sizes != null) {
      data['sizes'] = this.sizes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sizes {
  int? id;
  String? size;
  int? typeId;

  Sizes({this.id, this.size, this.typeId});

  Sizes.fromJson(Map<String, dynamic> json) {
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

