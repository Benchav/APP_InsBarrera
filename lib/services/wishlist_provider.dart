import 'package:flutter/foundation.dart';
import '../models/wishlist_item.dart';

class WishlistProvider with ChangeNotifier {
  final List<WishlistItem> _wishlist = [];

  List<WishlistItem> get wishlist => _wishlist;

  void addToWishlist(WishlistItem item) {
    _wishlist.add(item);
    notifyListeners();
  }

  void removeFromWishlist(int index) {
    _wishlist.removeAt(index);
    notifyListeners();
  }

  bool isInWishlist(String title) {
    return _wishlist.any((item) => item.title == title);
  }
}