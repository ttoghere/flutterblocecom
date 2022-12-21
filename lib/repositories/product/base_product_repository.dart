import 'package:flutterblocecom/model/product.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProducts();
}
