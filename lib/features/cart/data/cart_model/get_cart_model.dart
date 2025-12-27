class GetCartModel {
  int? code;
  String? message;
  Data? data;

  GetCartModel({this.code, this.message, this.data});

  GetCartModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map['code'] = code;
    map['message'] = message;
    if (data != null) {
      map['data'] = data!.toJson();
    }
    return map;
  }
}

class Data {
  int? id;
  String? totalPrice;
  List<Items>? items;

  Data({this.id, this.totalPrice, this.items});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    totalPrice = json['total_price'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map['id'] = id;
    map['total_price'] = totalPrice;
    if (items != null) {
      map['items'] = items!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Items {
  int? itemId;
  int? productId;
  String? name;
  String? image;
  int? quantity;
  String? price;
  double? spicy;
  List<Toppings>? toppings;
  List<SideOptions>? sideOptions;
  double get priceDouble => double.tryParse(price ?? "0.0") ?? 0.0;


  Items({
    this.itemId,
    this.productId,
    this.name,
    this.image,
    this.quantity,
    this.price,
    this.spicy,
    this.toppings,
    this.sideOptions,
  });

  Items.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    productId = json['product_id'];
    name = json['name'];
    image = json['image'];
    quantity = json['quantity'];
    price = json['price'];

    /// 🔥 spicy يتعامل مع أي نوع (string / int / double)
    if (json['spicy'] != null) {
      spicy = double.tryParse(json['spicy'].toString()) ?? 0.0;
    }

    if (json['toppings'] != null) {
      toppings = <Toppings>[];
      json['toppings'].forEach((v) {
        toppings!.add(Toppings.fromJson(v));
      });
    }

    if (json['side_options'] != null) {
      sideOptions = <SideOptions>[];
      json['side_options'].forEach((v) {
        sideOptions!.add(SideOptions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map['item_id'] = itemId;
    map['product_id'] = productId;
    map['name'] = name;
    map['image'] = image;
    map['quantity'] = quantity;
    map['price'] = price;
    map['spicy'] = spicy;

    if (toppings != null) {
      map['toppings'] = toppings!.map((v) => v.toJson()).toList();
    }

    if (sideOptions != null) {
      map['side_options'] = sideOptions!.map((v) => v.toJson()).toList();
    }

    return map;
  }
}

class Toppings {
  int? id;
  String? name;
  String? image;

  Toppings({this.id, this.name, this.image});

  Toppings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    return map;
  }
}

class SideOptions {
  int? id;
  String? name;
  String? image;

  SideOptions({this.id, this.name, this.image});

  SideOptions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    return map;
  }
}
