class MatchResponse {
  List<AnnonceData>? data;
  String? message;

  MatchResponse({this.data, this.message});

  MatchResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <AnnonceData>[];
      json['data'].forEach((v) {
        data?.add(new AnnonceData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data?.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class AnnonceData {
  int? id;
  String? adId;
  String? userId;
  String? ticketNumber;
  String? travelCompany;
  String? departure;
  String? destination;
  String? departureDate;
  String? arrivalDate;
  int? space;
  List<String>? categoriesAccepted;
  String? createdAt;
  String? updatedAt;

  AnnonceData(
      {this.id,
        this.adId,
        this.userId,
        this.ticketNumber,
        this.travelCompany,
        this.departure,
        this.destination,
        this.departureDate,
        this.arrivalDate,
        this.space,
        this.categoriesAccepted,
        this.createdAt,
        this.updatedAt});

  AnnonceData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adId = json['ad_id'];
    userId = json['user_id'];
    ticketNumber = json['ticket_number'];
    travelCompany = json['travel_company'];
    departure = json['departure'];
    destination = json['destination'];
    departureDate = json['departure_date'];
    arrivalDate = json['arrival_date'];
    space = json['space'];
    categoriesAccepted = json['categories_accepted'].cast<String>();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ad_id'] = this.adId;
    data['user_id'] = this.userId;
    data['ticket_number'] = this.ticketNumber;
    data['travel_company'] = this.travelCompany;
    data['departure'] = this.departure;
    data['destination'] = this.destination;
    data['departure_date'] = this.departureDate;
    data['arrival_date'] = this.arrivalDate;
    data['space'] = this.space;
    data['categories_accepted'] = this.categoriesAccepted;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}