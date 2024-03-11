class Home {
  late int statusCode;
  late String message;
  List<Products>? data;

  Home.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Products>[];
      json['data'].forEach((v) {
        data!.add(Products.fromJson(v));
      });
    }
  }
}

class Products {
  late int id;
  late String name;
  Brands? brands;
  List<ProductVariations>? productVariations;

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    brands = json['Brands'] != null ? Brands.fromJson(json['Brands']) : null;
    if (json['ProductVariations'] != null) {
      productVariations = <ProductVariations>[];
      json['ProductVariations'].forEach((v) {
        productVariations!.add(ProductVariations.fromJson(v));
      });
    }
  }
}

class Brands {
  int? id;
  String? brandName;
  String? brandLogoImagePath;

  Brands.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brandName = json['brand_name'];
    brandLogoImagePath = json['brand_logo_image_path'];
  }
}

class ProductVariations {
  int? id;
  int? productId;
  int? price;
  late bool isDefault;
  List<ProductVarientImages>? productVarientImages;

  ProductVariations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    price = json['price'];
    isDefault = json['is_default'];
    if (json['ProductVarientImages'] != null) {
      productVarientImages = <ProductVarientImages>[];
      json['ProductVarientImages'].forEach((v) {
        productVarientImages!.add(ProductVarientImages.fromJson(v));
      });
    }
  }
}

class ProductVarientImages {
  int? id;
  String? imagePath;
  int? productVarientId;

  ProductVarientImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imagePath = json['image_path'];
    productVarientId = json['product_varient_id'];
  }
}
