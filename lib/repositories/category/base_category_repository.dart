import 'package:flutterblocecom/model/models_shelf.dart';

abstract class BaseCategoryRepository {
  Stream<List<Category>> getAllCategories();
}
