import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items={};
  Map<String, CartItem> get items {
    return {..._items};
  }

  void addItem(
    String productId,
    String price,
    String title,
  ) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (c) => CartItem(
          id: c.id,
          title: c.title,
          price: c.price,
          quantity: c.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
                id: DateTime.now().toString(),
                title: title,
                price: double.parse(price),
                quantity: 1,
              ));
    }
    notifyListeners();
  }
  double get totalAmount{
    var total = 0.0;
    _items.forEach((key,cartItem){
      total+=cartItem.price * cartItem.quantity;
    });
    return total;
  }
  int get itemCount {
    return _items.length;
  }
  void removeItem(String productId){
    _items.remove(productId);
    notifyListeners();
  }

  void clear(){
    _items={};
    notifyListeners();
  }
}
