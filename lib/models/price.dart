class Price {
  final priceAshgabat;
  final priceOther;
  Price(this.priceAshgabat, this.priceOther);

  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(json["price_ashgabat"], json["price_other"]);
  }
}
