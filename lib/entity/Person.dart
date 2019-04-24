import 'package:json_annotation/json_annotation.dart';

part 'Person.g.dart';

@JsonSerializable()
class Person {

  final String name;
  final String email;

  final Person mother;

  final List<Person> friends;

  Person(this.name,this.email,this.mother,this.friends);

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
  Map<String, dynamic> toJson() => _$PersonToJson(this);
}
