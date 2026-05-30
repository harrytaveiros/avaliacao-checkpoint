String formatCurrency(double value) {
  // Substituímos o pacote 'intl' por uma formatação nativa simples
  // para evitar erros caso o pacote não tenha sido instalado.
  return 'R\$ ${value.toStringAsFixed(2).replaceAll('.', ',')}';
}