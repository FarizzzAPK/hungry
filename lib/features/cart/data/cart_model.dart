class CartModel {
  final int id;
  final int qty;
  final double spicy;
  final List<int> toppings;
  final List<int> options;

  CartModel({required this.id, required this.qty, required this.spicy, required this.toppings, required this.options});

  Map<String,dynamic> toJson() =>{
  "product_id": id,
  "quantity"  : qty,
  "spicy"     : spicy,
  "toppings"  : toppings,
  "side_options": options
  };
}


class CartRequestModel{
  final List<CartModel> items;

  CartRequestModel({required this.items});

  Map<String,dynamic> toJson()=>{
    "items" : items.map((e) => e.toJson()).toList(),
  };
}