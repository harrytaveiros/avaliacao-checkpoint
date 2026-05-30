import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Imports relativos (do projeto)
import '../models/product_model.dart';
import '../services/product_service.dart';
import '../widgets/hero_section_widget.dart';
import '../widgets/product_card_widget.dart';
import '../widgets/subscription_section_widget.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/footer_widget.dart';
import '../widgets/custom_drawer_widget.dart';
import 'cart_screen.dart';
import 'login_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  final ProductService _productService = ProductService();
  late List<Product> _products;

  @override
  void initState() {
    super.initState();
    _products = _productService.getProdutos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawerWidget(),
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu, size: 40),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          },
        ),
        title: Image.asset('assets/logo_usedev.png', height: 40),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline, size: 40),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen())),
          ),
          const SizedBox(width: 10),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, size: 40),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CartScreen())),
          ),
          const SizedBox(width: 25),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SearchBarWidget(),
            const HeroSectionWidget(),
            const SizedBox(height: 20),
            Text(
              'Promos Especiais',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.orbitron().fontFamily,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  final product = _products[index];
                  // Passando o objeto Product inteiro para o widget do card.
                  return ProductCardWidget(product: product);
                },
              ),
            ),
            const SizedBox(height: 20),
            const SubscriptionSectionWidget(),
            const FooterWidget(),
          ],
        ),
      ),
    );
  }
}