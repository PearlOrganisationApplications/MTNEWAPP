class ViweTeble {
  bool? message;
  bool? status;
  List<Task>? task;

  ViweTeble({this.message, this.status, this.task, required token});

  ViweTeble.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['task'] != null) {
      task = <Task>[];
      json['task'].forEach((v) {
        task!.add(new Task.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.task != null) {
      data['task'] = this.task!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Task {
  int? id;
  int? userId;
  String? eat;
  String? activity;
  String? sleep;
  String? you;
  String? createdAt;
  String? updatedAt;
  String? day;

  Task(
      {this.id,
      this.userId,
      this.eat,
      this.activity,
      this.sleep,
      this.you,
      this.createdAt,
      this.updatedAt,
      this.day});

  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    eat = json['eat'];
    activity = json['activity'];
    sleep = json['sleep'];
    you = json['you'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    day = json['day'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['eat'] = this.eat;
    data['activity'] = this.activity;
    data['sleep'] = this.sleep;
    data['you'] = this.you;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['day'] = this.day;
    return data;
  }
}
