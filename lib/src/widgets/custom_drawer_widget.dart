import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/cart_screen.dart';
import '../screens/login_screen.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFF0A0F1A), // Mesmo fundo escuro do rodapé
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo_usedev.png',
                  height: 40,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.code, color: Colors.white, size: 40),
                ),
                const SizedBox(height: 16),
                Text(
                  'Menu de Navegação',
                  style: TextStyle(
                    color: const Color(0xFF8FFF24), // Verde neon
                    fontFamily: GoogleFonts.orbitron().fontFamily,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Início'),
            onTap: () {
              Navigator.pop(context); // Fecha o drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart_outlined),
            title: const Text('Meu Carrinho'),
            onTap: () {
              Navigator.pop(context); // Fecha o menu antes de navegar
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text('Minha Conta'),
            onTap: () {
              Navigator.pop(context); // Fecha o menu antes de navegar
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('Sobre a UseDev'),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}