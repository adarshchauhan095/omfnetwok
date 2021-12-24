import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

/// A controller for [ProductsView] to update the UI.
class ProductsController extends GetxController {
  ProductsController(this.productsPresenter);
  final ProductsPresenter productsPresenter;
}
