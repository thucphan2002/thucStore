class Phone {
  int id;
  String title;
  String body;
  String images;
  String price;

  Phone(
      {required this.id,
      required this.title,
      required this.body,
      required this.images,
      required this.price});

  factory Phone.fromJson(Map<String, dynamic> json) {
    return Phone(
      images: json['images'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
      price: json['price'],
    );
  }
}
