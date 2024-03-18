import 'package:floor/floor.dart';

@Entity(tableName: "Person")
class Person {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String name;
  final int pointer;

  Person({
    this.id,
    required this.name,
    this.pointer = 0,
  });

  Person copyWith({
    String? name,
    int? pointer,
  }) {
    return Person(
      id: id,
      name: name ?? this.name,
      pointer: pointer ?? this.pointer,
    );
  }

  @override
  String toString() {
    return 'Person{id: $id, name: $name, pointer: $pointer}';
  }
}
