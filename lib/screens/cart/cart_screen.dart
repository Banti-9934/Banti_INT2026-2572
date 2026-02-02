import 'package:flutter/material.dart';
import '../../services/cart_service.dart';
import 'widgets/cart_item_tile.dart';
import 'widgets/cart_bottom_bar.dart';
import 'widgets/empty_cart_view.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final cart = CartService(); // 🔥 singleton instance

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Cart")),
      body: cart.items.isEmpty
          ? const EmptyCartView()
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: cart.items.length,
              itemBuilder: (context, index) => CartItemTile(
                course: cart.items[index],
                onDelete: () {
                  setState(() {
                    cart.removeFromCart(cart.items[index].id);
                  });
                },
              ),
            ),
      bottomNavigationBar: cart.items.isEmpty
          ? null
          : CartBottomBar(totalPrice: cart.totalPrice),
    );
  }
}
