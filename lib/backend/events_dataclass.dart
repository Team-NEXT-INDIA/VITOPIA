class VEvents {
  late int? id;
  late String title;
  late String? subtitle;
  late String? description;
  late String? image;
  late String? avatar;
  late String? btnLink;
  late String? startTime;
  late String? endTime;
  late String? venue;
  late String? day;
  late String? duration;

  VEvents(
      {required this.id,
      required this.title,
      required this.subtitle,
      required this.description,
      required this.image,
      required this.avatar,
      required this.btnLink,
      required this.startTime,
      required this.endTime,
      required this.venue,
      required this.day,
      required this.duration});

  VEvents.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subtitle = json['subtitle'];
    description = json['description'];
    image = json['image'];
    avatar = json['avatar'];
    btnLink = json['btn_link'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    venue = json['venue'];
    day = json['day'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['description'] = this.description;
    data['image'] = this.image;
    data['avatar'] = this.avatar;
    data['btn_link'] = this.btnLink;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['venue'] = this.venue;
    data['day'] = this.day;
    data['duration'] = this.duration;
    return data;
  }
}
