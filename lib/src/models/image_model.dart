class ImageModel {
  int id;
  String url;
  String title;

  // Constructor
  ImageModel(this.id, this.url, this.title);

  // Named Constructor
  //* Using a named constructor allowing you to initialize an ImageModel with the entire JSON map(object), or your own custom parameters by using the default constructor
  ImageModel.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    url = parsedJson['url'];
    title = parsedJson['title'];
  }

  //* Below is the same as above
  // ImageModel.fromJson(Map<String, dynamic> parsedJson)
  //     : id = parsedJson['id'],
  //       url = parsedJson['url'],
  //       title = parsedJson['title'];
}
