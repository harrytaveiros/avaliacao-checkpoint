import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartItemWidget extends StatefulWidget {
  final String imageUrl;
  final String productName;
  final String price;

  const CartItemWidget({
    super.key,
    required this.imageUrl,
    required this.productName,
    required this.price,
  });

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  int _quantity = 1;
  String? _selectedSize = 'M'; // Tamanho padrão
  final List<String> _sizes = ['P', 'M', 'G', 'GG'];

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            // Imagem
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(widget.imageUrl),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(width: 16),
            // Informações e Controles
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.productName,
                    style: GoogleFonts.orbitron(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.price,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Controles de Tamanho e Quantidade
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildSizeSelector(),
                      _buildQuantitySelector(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuantitySelector() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          IconButton(icon: const Icon(Icons.remove, size: 16), onPressed: _decrementQuantity, constraints: const BoxConstraints(), padding: const EdgeInsets.symmetric(horizontal: 8)),
          Text('$_quantity', style: const TextStyle(fontWeight: FontWeight.bold)),
          IconButton(icon: const Icon(Icons.add, size: 16), onPressed: _incrementQuantity, constraints: const BoxConstraints(), padding: const EdgeInsets.symmetric(horizontal: 8)),
        ],
      ),
    );
  }

  Widget _buildSizeSelector() {
    return Row(
      children: _sizes.map((size) {
        final isSelected = _selectedSize == size;
        return GestureDetector(
          onTap: () => setState(() => _selectedSize = size),
          child: Container(
            margin: const EdgeInsets.only(right: 8),
            width: 30,
            height: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF780BF7) : Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              size,
              style: TextStyle(color: isSelected ? Colors.white : Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        );
      }).toList(),
    );
  }
}