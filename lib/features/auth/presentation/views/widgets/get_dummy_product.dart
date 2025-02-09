import 'package:e_commerce_app/core/entities/product_entity.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
    name: 'Dummy Product',
    price: 10,
    code: '1234',
    description: 'A dummy product',
    imageUrl: null,
    isFeatured: true,
    isOrganic: true,
    expirationInMonths: 6,
    calories: 100,
    unitAmount: 1,
    reviews: [],
  );
}

List<ProductEntity> getDummyProducts() =>
    List.generate(10, (index) => getDummyProduct());
