class DataApi {
  int id;
  String title;
  String thumbnail;
  String description;
  String location;
  String locationUrl;
  String category;
  bool status;
  int views;
  List gallery;
  String createdAt;

  DataApi.fromJsonMap(Map map) :
        id = map['id'],
        title = map['title'], thumbnail = map['thumbnail'], description = map['description'], location = map['location'], locationUrl = map['loacation_url'],
        category = map['category'], status = map['status'], views = map['views'],
        gallery = map['gallery']['gallery_detail'], createdAt = map['created_at'];
}