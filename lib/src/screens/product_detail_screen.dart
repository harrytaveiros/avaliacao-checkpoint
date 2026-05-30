import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:usedev_uninassau/src/models/product_model.dart';
import 'formatters.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({
    required this.product,
    super.key,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 300,
                child: product.imageUrl.startsWith('http')
                    ? Image.network(product.imageUrl, fit: BoxFit.contain)
                    : Image.asset(product.imageUrl, fit: BoxFit.contain),
              ),
              const SizedBox(height: 16),
              Text(
                formatCurrency(product.price),
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                product.description,
                style: GoogleFonts.poppins(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // Lógica para adicionar ao carrinho
                },
                child: const Text('Adicionar ao carrinho'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}