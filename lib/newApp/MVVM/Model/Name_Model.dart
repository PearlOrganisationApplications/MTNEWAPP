class Name {
  int? id;
  String? token;
  String? success;

  Name({this.id, this.token, this.success});

  Name.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    token = json['token'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['token'] = this.token;
    data['success'] = this.success;
    return data;
  }
}