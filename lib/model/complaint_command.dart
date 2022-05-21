class ComplaintCommand {
  String? content;
  bool isShow;

  ComplaintCommand({this.content, this.isShow = false});

  toJson() => {'content': content, 'isShow': isShow};
}
