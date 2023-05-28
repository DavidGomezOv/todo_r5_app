// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoModel _$TodoModelFromJson(Map<String, dynamic> json) => TodoModel(
      json['id'] as String?,
      json['title'] as String?,
      json['description'] as String?,
      json['completed'] as bool?,
      TodoModel._fromJson(json['creation_date'] as Timestamp),
    )..isSelected = json['isSelected'] as bool;

Map<String, dynamic> _$TodoModelToJson(TodoModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'completed': instance.completed,
      'creation_date': TodoModel._toJson(instance.creationDate),
      'isSelected': instance.isSelected,
    };
