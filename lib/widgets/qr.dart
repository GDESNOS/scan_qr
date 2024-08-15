import 'package:hive/hive.dart';

part 'qr.g.dart';

@HiveType(typeId: 1)
class Qr {
  @HiveField(0)
  late int id;

  @HiveField(1)
  late String categorie;

  @HiveField(2)
  late String Type;

  @HiveField(3)
  late String description;

  @HiveField(4)
  late DateTime dates;

  Qr({
    required this.id,
    required this.categorie,
    required this.Type,
    required this.description,
    required this.dates,
  });


}
