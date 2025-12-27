class ReOrderModel {
  final int? code;
  final String? message;
  final OrdersDetails? data;

  ReOrderModel({this.code, this.message, this.data});

  factory ReOrderModel.fromJson(Map<String, dynamic> json) {
    return ReOrderModel(
      code: json['code'],
      message: json['message'],
      data: json['data'] != null ? OrdersDetails.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'message': message,
      'data': data?.toJson(),
    };
  }
}

class OrdersDetails {
  final int? id;
  final String? status;
  final String? totalPrice;
  final String? createdAt;
  final List<OrdersDetailsItems>? items;

  OrdersDetails({this.id, this.status, this.totalPrice, this.createdAt, this.items});

  factory OrdersDetails.fromJson(Map<String, dynamic> json) {
    return OrdersDetails(
      id: json['id'],
      status: json['status'],
      totalPrice: json['total_price'],
      createdAt: json['created_at'],
      items: json['items'] != null
          ? List<OrdersDetailsItems>.from(json['items'].map((x) => OrdersDetailsItems.fromJson(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status,
      'total_price': totalPrice,
      'created_at': createdAt,
      'items': items?.map((x) => x.toJson()).toList(),
    };
  }
}

class OrdersDetailsItems {
  final int? productId;
  final String? name;
  final String? image;
  final int? quantity;
  final String? price;
  final dynamic spicy;
  final List<Extra>? toppings;
  final List<Extra>? sideOptions;

  OrdersDetailsItems({
    this.productId,
    this.name,
    this.image,
    this.quantity,
    this.price,
    this.spicy,
    this.toppings,
    this.sideOptions,
  });

  factory OrdersDetailsItems.fromJson(Map<String, dynamic> json) {
    return OrdersDetailsItems(
      productId: json['product_id'],
      name: json['name'],
      image: json['image'],
      quantity: json['quantity'],
      price: json['price'],
      spicy: json['spicy'],
      toppings: json['toppings'] != null
          ? List<Extra>.from(json['toppings'].map((x) => Extra.fromJson(x)))
          : [],
      sideOptions: json['side_options'] != null
          ? List<Extra>.from(json['side_options'].map((x) => Extra.fromJson(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'name': name,
      'image': image,
      'quantity': quantity,
      'price': price,
      'spicy': spicy,
      'toppings': toppings?.map((x) => x.toJson()).toList(),
      'side_options': sideOptions?.map((x) => x.toJson()).toList(),
    };
  }
}

class Extra {
  final int? id;
  final String? name;
  final String? image;

  Extra({this.id, this.name, this.image});

  factory Extra.fromJson(Map<String, dynamic> json) {
    return Extra(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }
}
