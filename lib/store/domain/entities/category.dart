// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String id;
  final String nameEn;
  final String nameAr;
  final String image;
  final String parentId;
  const Category({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.image,
    required this.parentId,
  });

  @override
  List<Object?> get props => [id, nameEn, nameAr, image, parentId];
}
