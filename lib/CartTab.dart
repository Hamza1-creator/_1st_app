import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> cartItems = [
      {"name": "Product 1", "price": "\$25", "quantity": 1},
      {"name": "Product 2", "price": "\$40", "quantity": 2},
      {"name": "Product 3", "price": "\$15", "quantity": 3},
      {"name": "Product 4", "price": "\$60", "quantity": 1},
      {"name": "Product 5", "price": "\$30", "quantity": 2},
    ];

    return Scaffold(
      body: ListView.builder(
        itemCount: cartItems.length, 
        itemBuilder: (context, index) {
          final item = cartItems[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blueAccent,
                child: Text(
                  item['quantity'].toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              title: Text(item['name']), 
              subtitle: Text("Price: ${item['price']}"),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("${item['name']} removed from cart")),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
