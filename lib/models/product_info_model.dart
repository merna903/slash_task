class ProductInfo {
  Data? data;
  late String message;
  late int statusCode;

  ProductInfo.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    statusCode = json['statusCode'];
  }
}

class Data {
  int? id;
  String? name;
  String? description;
  int? productRating;
  Count? count;
  List<Variations>? variations;
  List<AvaiableProperties>? avaiableProperties;
  String? brandName;
  String? brandImage;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    productRating = json['product_rating'];
    count = json['_count'] != null ? Count.fromJson(json['_count']) : null;
    if (json['variations'] != null) {
      variations = <Variations>[];
      json['variations'].forEach((v) {
        variations!.add(Variations.fromJson(v));
      });
    }
    if (json['avaiableProperties'] != null) {
      avaiableProperties = <AvaiableProperties>[];
      json['avaiableProperties'].forEach((v) {
        avaiableProperties!.add(AvaiableProperties.fromJson(v));
      });
    }
    brandName = json['brandName'];
    brandImage = json['brandImage'];
  }
}

class Count {
  int? productVariations;

  Count.fromJson(Map<String, dynamic> json) {
    productVariations = json['ProductVariations'];
  }
}

class Variations {
  int? id;
  int? price;
  int? quantity;
  bool? inStock;
  List<ProductVarientImages>? productVarientImages;
  List<ProductPropertiesValues>? productPropertiesValues;
  bool? isDefault;

  Variations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    quantity = json['quantity'];
    inStock = json['inStock'];
    if (json['ProductVarientImages'] != null) {
      productVarientImages = <ProductVarientImages>[];
      json['ProductVarientImages'].forEach((v) {
        productVarientImages!.add(ProductVarientImages.fromJson(v));
      });
    }
    if (json['productPropertiesValues'] != null) {
      productPropertiesValues = <ProductPropertiesValues>[];
      json['productPropertiesValues'].forEach((v) {
        productPropertiesValues!.add(ProductPropertiesValues.fromJson(v));
      });
    }
  }
}

class ProductVarientImages {
  int? id;
  String? imagePath;

  ProductVarientImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imagePath = json['image_path'];
  }
}

class ProductPropertiesValues {
  String? value;
  String? property;

  ProductPropertiesValues.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    property = json['property'];
  }
}

class AvaiableProperties {
  String? property;
  List<Values>? values;

  AvaiableProperties.fromJson(Map<String, dynamic> json) {
    property = json['property'];
    if (json['values'] != null) {
      values = <Values>[];
      json['values'].forEach((v) {
        values!.add(Values.fromJson(v));
        if (values!.length > 1) {
          if (values!.last.value == values![values!.length - 2].value) {
            values!.removeLast();
          }
        }
      });
    }
  }
}

class Values {
  String? value;
  int? id;

  Values.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    id = json['id'];
  }
}
