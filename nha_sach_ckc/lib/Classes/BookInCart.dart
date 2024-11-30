class BookInCart{
  String id;
  int quantity;
  bool status;
  String title;
  double price;
  String image;

  BookInCart({
    required this.id,
    this.quantity=1,
    this.status=true,
    this.title="",
    this.price=0.0,
    this.image="",
  });
}
