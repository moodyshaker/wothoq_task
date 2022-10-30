class ProductModel {
  int? id;
  String? name;
  String? desc;
  int? regularPrice;
  int? salePrice;
  bool? onSale;
  int? stock;
  bool? isFavourite;
  int? rate;
  int? numUsersRate;
  List<Images>? images;
  List<Reviews>? reviews;
  List<ProductDetails>? productDetails;
  Store? store;

  ProductModel(
      {this.id,
        this.name,
        this.desc,
        this.regularPrice,
        this.salePrice,
        this.onSale,
        this.stock,
        this.isFavourite,
        this.rate,
        this.numUsersRate,
        this.images,
        this.reviews,
        this.productDetails,
        this.store});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    desc = json['desc'];
    regularPrice = json['regular_price'];
    salePrice = json['sale_price'];
    onSale = json['on_sale'];
    stock = json['stock'];
    isFavourite = json['is_favourite'];
    rate = json['rate'];
    numUsersRate = json['num_users_rate'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(new Reviews.fromJson(v));
      });
    }
    if (json['product_details'] != null) {
      productDetails = <ProductDetails>[];
      json['product_details'].forEach((v) {
        productDetails!.add(new ProductDetails.fromJson(v));
      });
    }
    store = json['store'] != null ? new Store.fromJson(json['store']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['desc'] = this.desc;
    data['regular_price'] = this.regularPrice;
    data['sale_price'] = this.salePrice;
    data['on_sale'] = this.onSale;
    data['stock'] = this.stock;
    data['is_favourite'] = this.isFavourite;
    data['rate'] = this.rate;
    data['num_users_rate'] = this.numUsersRate;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    if (this.productDetails != null) {
      data['product_details'] =
          this.productDetails!.map((v) => v.toJson()).toList();
    }
    if (this.store != null) {
      data['store'] = this.store!.toJson();
    }
    return data;
  }
}

class Images {
  int? id;
  String? img;

  Images({this.id, this.img});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['img'] = this.img;
    return data;
  }
}

class Reviews {
  String? userName;
  String? review;
  int? rate;
  String? createdAt;

  Reviews({this.userName, this.review, this.rate, this.createdAt});

  Reviews.fromJson(Map<String, dynamic> json) {
    userName = json['user_name'];
    review = json['review'];
    rate = json['rate'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_name'] = this.userName;
    data['review'] = this.review;
    data['rate'] = this.rate;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class ProductDetails {
  int? id;
  String? value;
  String? nameAr;
  String? nameEn;

  ProductDetails({this.id, this.value, this.nameAr, this.nameEn});

  ProductDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['value'] = this.value;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    return data;
  }
}

class Store {
  int? id;
  String? name;
  String? logo;
  String? fullAddress;

  Store({this.id, this.name, this.logo, this.fullAddress});

  Store.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    fullAddress = json['full_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['logo'] = this.logo;
    data['full_address'] = this.fullAddress;
    return data;
  }
}