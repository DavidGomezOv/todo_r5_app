import 'package:json_annotation/json_annotation.dart';

part 'todo_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TodoModel {
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'state')
  final String? state;
  @JsonKey(name: 'creation_date')
  final String? creationDate;

  TodoModel(
    this.title,
    this.description,
    this.state,
    this.creationDate,
  );

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);

  Map<String, dynamic> toJson() => _$TodoModelToJson(this);
}
