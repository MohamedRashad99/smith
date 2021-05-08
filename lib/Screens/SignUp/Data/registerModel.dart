class RegisterModel {
  String msg;
  Data data;

  RegisterModel({this.msg, this.data});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String phone;
  String name;
  String googleToken;
  String type;
  String apiToken;
  String updatedAt;
  String createdAt;
  int id;

  Data(
      {this.phone,
        this.name,
        this.googleToken,
        this.type,
        this.apiToken,
        this.updatedAt,
        this.createdAt,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    name = json['name'];
    googleToken = json['google_token'];
    type = json['type'];
    apiToken = json['api_token'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['name'] = this.name;
    data['google_token'] = this.googleToken;
    data['type'] = this.type;
    data['api_token'] = this.apiToken;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
