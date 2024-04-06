// To parse this JSON data, do
//
//     final singleBook = singleBookFromJson(jsonString);

import 'dart:convert';

SingleBook singleBookFromJson(String str) => SingleBook.fromJson(json.decode(str));

String singleBookToJson(SingleBook data) => json.encode(data.toJson());

class SingleBook {
  String error;
  String title;
  String subtitle;
  String authors;
  String publisher;
  String language;
  String isbn10;
  String isbn13;
  String pages;
  String year;
  String rating;
  String desc;
  String price;
  String image;
  String url;
  Pdf pdf;

  SingleBook({
    required this.error,
    required this.title,
    required this.subtitle,
    required this.authors,
    required this.publisher,
    required this.language,
    required this.isbn10,
    required this.isbn13,
    required this.pages,
    required this.year,
    required this.rating,
    required this.desc,
    required this.price,
    required this.image,
    required this.url,
    required this.pdf,
  });

  factory SingleBook.fromJson(Map<String, dynamic> json) => SingleBook(
    error: json["error"],
    title: json["title"],
    subtitle: json["subtitle"],
    authors: json["authors"],
    publisher: json["publisher"],
    language: json["language"],
    isbn10: json["isbn10"],
    isbn13: json["isbn13"],
    pages: json["pages"],
    year: json["year"],
    rating: json["rating"],
    desc: json["desc"],
    price: json["price"],
    image: json["image"],
    url: json["url"],
    pdf: Pdf.fromJson(json["pdf"]),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "title": title,
    "subtitle": subtitle,
    "authors": authors,
    "publisher": publisher,
    "language": language,
    "isbn10": isbn10,
    "isbn13": isbn13,
    "pages": pages,
    "year": year,
    "rating": rating,
    "desc": desc,
    "price": price,
    "image": image,
    "url": url,
    "pdf": pdf.toJson(),
  };
}

class Pdf {
  String chapter1;
  String chapter4;

  Pdf({
    required this.chapter1,
    required this.chapter4,
  });

  factory Pdf.fromJson(Map<String, dynamic> json) => Pdf(
    chapter1: json["Chapter 1"],
    chapter4: json["Chapter 4"],
  );

  Map<String, dynamic> toJson() => {
    "Chapter 1": chapter1,
    "Chapter 4": chapter4,
  };
}
