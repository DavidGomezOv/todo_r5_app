import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'todo_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TodoModel {
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'translated_title')
  String? translatedTitle;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'translated_description')
  String? translatedDescription;
  @JsonKey(name: 'completed')
  bool? completed;
  @JsonKey(name: 'creation_date', fromJson: _fromJson, toJson: _toJson)
  final DateTime? creationDate;
  bool isSelected = false;

  TodoModel(
    this.id,
    this.title,
    this.description,
    this.completed,
    this.creationDate,
  );

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);

  Map<String, dynamic> toJson() => _$TodoModelToJson(this);

  static DateTime? _fromJson(Timestamp data) => data.toDate();

  static Timestamp _toJson(DateTime? time) => Timestamp.fromDate(time!);
}
