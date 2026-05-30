import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Fundo Principal (Azul-marinho muito escuro)
        Container(
          color: const Color(0xFF0A0F1A), // Quase preto
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Cabeçalho Centralizado
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/logo_usedev.png',
                      height: 40,
                      errorBuilder: (context, error, stackTrace) => const SizedBox(
                        height: 40,
                        width: 120,
                        child: Placeholder(), // Fallback caso a imagem não carregue
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Hora de abraçar seu lado geek!',
                      style: TextStyle(
                        color: const Color(0xFF8FFF24), // Verde neon brilhante
                        fontFamily: GoogleFonts.orbitron().fontFamily,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Divider curto
                    Container(
                      height: 3,
                      width: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xFF8FFF24),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 48),

              // Seções de Texto
              _buildTextSection(
                title: 'Funcionamento',
                items: [
                  'Segunda a Sexta - 8h às 18h',
                  'sac@usedev.com.br',
                  '0800 541 320'
                ],
              ),
              const SizedBox(height: 24),
              
              _buildTextSection(
                title: 'Institucional',
                items: [
                  'Sobre nós',
                  'Contato',
                  'Política de Privacidade',
                  'LGPD - Lei de proteção de dados'
                ],
              ),
              const SizedBox(height: 24),
              
              _buildTextSection(
                title: 'Informações',
                items: [
                  'Entregas',
                  'Garantia',
                  'Trocas e devoluções'
                ],
              ),
              const SizedBox(height: 40),

              // Formas de Pagamento
              const Text(
                'Formas de Pagamento',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _buildPaymentPlaceholder('Visa', 'assets/ico-cartao-visa.png'),
                  _buildPaymentPlaceholder('Master', 'assets/ico-cartao-master.png'),
                  _buildPaymentPlaceholder('Elo', 'assets/ico-cartao-elo.png'),
                  _buildPaymentPlaceholder('Diners', 'assets/ico-cartao-diners.png'),
                  _buildPaymentPlaceholder('Pix', 'assets/ico-pix.png'),
                ],
              ),
              const SizedBox(height: 40),

              // Redes Sociais
              const Text(
                'Siga nossas redes:',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  _buildSocialIcon('assets/Whatsapp.png'), // Representando WhatsApp
                  const SizedBox(width: 16),
                  _buildSocialIcon('assets/Instagram.png'), // Representando Instagram
                  const SizedBox(width: 16),
                  _buildSocialIcon('assets/Tiktok.png'), // Representando TikTok
                ],
              ),
            ],
          ),
        ),

        // Barra Inferior (Créditos)
        Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          child: Text(
            'Desenvolvido por Alura. Projeto fictício sem fins comerciais.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 12,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
          ),
        ),
      ],
    );
  }

  // Métodos privados para construção de componentes repetitivos (Clean Code)
  Widget _buildTextSection({required String title, required List<String> items}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 12),
        ...items.map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                item,
                style: TextStyle(color: Colors.grey[300], fontSize: 14),
              ),
            )),
      ],
    );
  }

  Widget _buildPaymentPlaceholder(String label, String imagePath) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imagePath,
            height: 14,
            width: 14,
            errorBuilder: (context, error, stackTrace) => const Icon(Icons.image, size: 14),
          ),
          const SizedBox(width: 4),
          Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black87)),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(String imagePath) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFFFF55DF), width: 2), // Borda rosa neon (Vazada)
      ),
      child: Image.asset(
        imagePath,
        height: 24,
        width: 24,
        errorBuilder: (context, error, stackTrace) => const Icon(Icons.image, size: 24, color: Color(0xFFFF55DF)),
      ),
    );
  }
}