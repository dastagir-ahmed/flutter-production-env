class JobModel {
  final String title;
  final String description;

  JobModel({required this.title, required this.description});

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      title: json['title'],
      description: json['description'],
    );
  }
}