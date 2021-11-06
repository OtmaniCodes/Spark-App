 

class OngoingOfferModel {
  final String? name;
  final String? location;
  final String? description;
  final bool? isUsed;
  final double? price;

  OngoingOfferModel(
      {this.name, this.location, this.description, this.isUsed, this.price});

  factory OngoingOfferModel.fromJson(Map json) {
    return OngoingOfferModel(
      name: json["name"],
      location: json["location"],
      description: json["description"],
      isUsed: json["isUsed"],
      price: json["price"] 
    );
  }
}
