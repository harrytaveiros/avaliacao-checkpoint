import '../models/product_model.dart';

class ProductService {
  List<Product> getProdutos() {
    return [
      Product(name: "Camiseta Capy", price: 28.00, imageUrl: "assets/Imagem_produto_Capy.png", description: "A camiseta perfeita para os amantes de capivaras e código. Feita com 100% algodão sustentável."),
      Product(name: "Mousepad", price: 18.00, imageUrl: "assets/Card_Produto_Mousepad.png", description: "Deslize seu mouse com precisão e estilo. Superfície otimizada para todos os tipos de sensores."),
      Product(name: "Caneca Bug", price: 28.00, imageUrl: "assets/Card_Produto_Caneca_Bug.png", description: "Não é um bug, é uma feature! A caneca ideal para seu café e para longas sessões de debugging."),
      Product(name: "Boné 404", price: 25.00, imageUrl: "assets/Card_Produto_Bone_404.png", description: "Estilo não encontrado? Achou! Boné ajustável com um design minimalista e bem-humorado."),
      Product(name: "Camiseta", price: 35.00, imageUrl: "assets/Card_Produto_Camiseta.png", description: "Uma camiseta estilosa para representar sua paixão por desenvolvimento."),
      Product(name: "Abridor", price: 12.00, imageUrl: "assets/Card_Produto_Abridor.png", description: "Abra suas garrafas com um toque de nerdice. Item essencial para o happy hour."),
      Product(name: "Copo", price: 15.00, imageUrl: "assets/Card_Produto_Copo.png", description: "Um copo com design exclusivo para te acompanhar no dia a dia."),
      Product(name: "Quadro", price: 45.00, imageUrl: "assets/Card_Produto_Quadro.png", description: "Decore seu ambiente de trabalho ou casa com este quadro inspirador."),
    ];
  }
}