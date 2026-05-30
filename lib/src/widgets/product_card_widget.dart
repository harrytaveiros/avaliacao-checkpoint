import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/product_model.dart';
import '../screens/product_detail_screen.dart';
import '../screens/formatters.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({
    required this.product,
    super.key,
  });

  // Recebe o objeto Product completo, em vez de dados primitivos separados.
  final Product product;

  @override
  Widget build(BuildContext context) {
    // Usamos Material e InkWell para garantir que toda a área é clicável e dar um feedback visual
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailScreen(product: product),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
                BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 10,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                    color: Colors.grey[200],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: product.imageUrl.startsWith('http')
                        ? Image.network(product.imageUrl, fit: BoxFit.contain)
                        : Image.asset(product.imageUrl, fit: BoxFit.contain),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                child: Text(
                  product.name,
                  style: GoogleFonts.orbitron(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  // Formata o preço para exibição.
                  formatCurrency(product.price),
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}