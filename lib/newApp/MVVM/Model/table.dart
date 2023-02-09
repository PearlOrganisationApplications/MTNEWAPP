class Easy {
  bool? message;
  bool? status;
  Task? task;

  Easy({this.message, this.status, this.task, required token});

  Easy.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    task = json['task'] != null ? new Task.fromJson(json['task']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.task != null) {
      data['task'] = this.task!.toJson();
    }
    return data;
  }
}

class Task {
  int? userId;
  String? eat;
  String? activity;
  String? sleep;
  String? you;
  String? updatedAt;
  String? createdAt;
  int? id;

  Task(
      {this.userId,
        this.eat,
        this.activity,
        this.sleep,
        this.you,
        this.updatedAt,
        this.createdAt,
        this.id});

  Task.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    eat = json['eat'];
    activity = json['activity'];
    sleep = json['sleep'];
    you = json['you'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['eat'] = this.eat;
    data['activity'] = this.activity;
    data['sleep'] = this.sleep;
    data['you'] = this.you;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}