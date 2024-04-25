class FeaturedBook {
  final String title;
  final String image;

  FeaturedBook({
    required this.title,
    required this.image,
  });
}

List<FeaturedBook> featuredBooks = [
  FeaturedBook(
    title: "Website Development",
    image: "assets/images/home/computer_icon.png",
  ),
  FeaturedBook(
    title: "Mobile Development",
    image: "assets/images/home/mobile_icon.png",
  ),
  FeaturedBook(
    title: "Clean Code",
    image: "assets/images/home/computer_icon.png",
  ),
  FeaturedBook(
    title: "Refactoring",
    image: "assets/images/home/mobile_icon.png",
  ),
  FeaturedBook(
    title: "Design Patterns",
    image: "assets/images/home/computer_icon.png",
  ),
  FeaturedBook(
    title: "Database",
    image: "assets/images/home/mobile_icon.png",
  ),
  FeaturedBook(
    title: "Java",
    image: "assets/images/home/computer_icon.png",
  ),
  FeaturedBook(
    title: "Python",
    image: "assets/images/home/mobile_icon.png",
  ),
];
