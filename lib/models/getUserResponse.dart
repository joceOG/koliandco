class GetUserResponse {
  UserData? userdata;

  GetUserResponse({this.userdata});

  GetUserResponse.fromJson(Map<String, dynamic> json) {
    userdata = json['data'] != null ? new UserData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userdata != null) {
      data['data'] = this.userdata?.toJson();
    }
    return data;
  }
}

class UserData {
  int? id;
  String? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  int? whatsapp;
  int? verified;
  Null? idFront;
  Null? idBack;
  Null? passport;
  Null? dir;
  int? terms;
  Null? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  UserData(
      {this.id,
        this.userId,
        this.firstName,
        this.lastName,
        this.email,
        this.phone,
        this.whatsapp,
        this.verified,
        this.idFront,
        this.idBack,
        this.passport,
        this.dir,
        this.terms,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    whatsapp = json['whatsapp'];
    verified = json['verified'];
    idFront = json['id_front'];
    idBack = json['id_back'];
    passport = json['passport'];
    dir = json['dir'];
    terms = json['terms'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['whatsapp'] = this.whatsapp;
    data['verified'] = this.verified;
    data['id_front'] = this.idFront;
    data['id_back'] = this.idBack;
    data['passport'] = this.passport;
    data['dir'] = this.dir;
    data['terms'] = this.terms;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}






