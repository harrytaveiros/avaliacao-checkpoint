import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'formatters.dart';

class PaymentScreen extends StatefulWidget {
  final double totalAmount;

  const PaymentScreen({
    super.key,
    required this.totalAmount,
  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String _paymentMethod = 'credit_card'; // Pode ser 'credit_card' ou 'pix'

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagamento'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Caixa de Resumo do Valor
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total a pagar:', style: TextStyle(fontSize: 18)),
                  Text(
                    formatCurrency(widget.totalAmount),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF780BF7),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Forma de Pagamento',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.orbitron().fontFamily,
              ),
            ),
            const SizedBox(height: 16),
            // Botões de Seleção de Pagamento
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('Cartão', style: TextStyle(fontWeight: FontWeight.bold)),
                    value: 'credit_card',
                    groupValue: _paymentMethod,
                    onChanged: (value) {
                      setState(() {
                        _paymentMethod = value!;
                      });
                    },
                    activeColor: const Color(0xFF780BF7),
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('PIX', style: TextStyle(fontWeight: FontWeight.bold)),
                    value: 'pix',
                    groupValue: _paymentMethod,
                    onChanged: (value) {
                      setState(() {
                        _paymentMethod = value!;
                      });
                    },
                    activeColor: const Color(0xFF780BF7),
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            
            // Formulários Dinâmicos baseados na seleção
            if (_paymentMethod == 'credit_card') ...[
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Número do Cartão',
                  prefixIcon: const Icon(Icons.credit_card),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        labelText: 'Validade (MM/AA)',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'CVV',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextField(
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  labelText: 'Nome do Titular (como no cartão)',
                  prefixIcon: const Icon(Icons.person_outline),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ] else ...[
              // Interface do PIX
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  children: [
                    const Icon(Icons.qr_code_2, size: 120, color: Colors.black87),
                    const SizedBox(height: 16),
                    const Text(
                      'Escaneie o QR Code acima para finalizar a sua compra de forma instantânea!',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    ),
                    const SizedBox(height: 16),
                    OutlinedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Código PIX Copiado!'), backgroundColor: Colors.green));
                      },
                      icon: const Icon(Icons.copy, color: Color(0xFF780BF7)),
                      label: const Text('PIX Copia e Cola', style: TextStyle(color: Color(0xFF780BF7))),
                    ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Exibe o diálogo de sucesso
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Pagamento Aprovado! 🎉', style: TextStyle(fontWeight: FontWeight.bold)),
                    content: const Text('Seu pedido foi processado com sucesso. Obrigado por comprar na UseDev!'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          // Fecha o alerta e volta para a tela inicial
                          Navigator.popUntil(context, (route) => route.isFirst);
                        },
                        child: const Text('Voltar ao Início', style: TextStyle(color: Color(0xFF780BF7))),
                      ),
                    ],
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF780BF7),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Text(
                'Confirmar Pagamento',
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}