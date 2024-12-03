// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartScrreen extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems = [
    {
      "name": "Fresh Banana",
      "category": "Fruit",
      "price": 4.0,
      "weight": "250 G"
    },
    {
      "name": "Red Apples",
      "category": "Fruit",
      "price": 6.0,
      "weight": "250 G"
    },
    {"name": "Avocado", "category": "Fruit", "price": 9.0, "weight": "250 G"},
    {
      "name": "Carrots",
      "category": "Vegetables",
      "price": 5.0,
      "weight": "250 G"
    },
  ];

  CartScrreen({super.key});

  @override
  Widget build(BuildContext context) {
    double subtotal = cartItems.fold(0, (sum, item) => sum + item['price']);
    double discount = 4.0;
    double total = subtotal - discount;

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Slidable(
                  key: ValueKey(item['name']),
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          // Action de suppression
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("${item['name']} supprimé"),
                          ));
                        },
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Supprimer',
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      // ignore: sort_child_properties_last
                      child: Text(item['name'][0]),
                      backgroundColor: Colors.green[100],
                    ),
                    title: Text(item['name']),
                    subtitle: Text("${item['category']} - ${item['weight']}"),
                    trailing: Text("\$${item['price'].toStringAsFixed(2)}"),
                  ),
                );
              },
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Subtotal", style: TextStyle(fontSize: 16)),
                    Text("\$${subtotal.toStringAsFixed(2)}"),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Delivery Fee", style: TextStyle(fontSize: 16)),
                    Text("Free"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Discount", style: TextStyle(fontSize: 16)),
                    Text("-\$${discount.toStringAsFixed(2)}"),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Total",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("\$${total.toStringAsFixed(2)}",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    // Action de validation
                  },
                  child: Text("Checkout For \$${total.toStringAsFixed(2)}"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
