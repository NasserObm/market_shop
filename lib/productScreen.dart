// ignore_for_file: file_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:market_shop/cartScreen.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CartScrreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Image.asset(
                    "assets/banana1.jpg",
                    height: 200,
                  ),
                  const SizedBox(height: 10),
                  CarouselSlider(
                    items: [
                      Image.asset("assets/banana1.jpg"),
                      Image.asset("assets/banana1.jpg"),
                      Image.network("assets/banana1.jpg"),
                    ],
                    options: CarouselOptions(
                      height: 80,
                      enableInfiniteScroll: true,
                      viewportFraction: 0.3,
                      enlargeCenterPage: true,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    "Recommended",
                    style: TextStyle(color: Colors.green),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.orange[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    "Fruit",
                    style: TextStyle(color: Colors.orange),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              "Fresh Banana",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 5),
            const Text(
              "250G",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 10),

            // Product Description
            const Text(
              "Bananas are a popular tropical fruit rich in vitamins, particularly Vitamin B6 and Vitamin C. They are known for their high potassium content, which promotes heart health and muscle function.",
              style: TextStyle(color: Colors.black87, fontSize: 14),
            ),
            const SizedBox(height: 20),

            // Price and Add to Cart
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "\$4.00",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.green,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.remove_circle_outline,
                          color: Colors.grey),
                    ),
                    const Text(
                      "2",
                      style: TextStyle(fontSize: 18),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add_circle, color: Colors.green),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Add to Cart Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(16),
                ),
                onPressed: () {},
                child: const Text(
                  "Add Items to Cart",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
