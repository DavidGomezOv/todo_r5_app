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
    )
      ..translatedTitle = json['translated_title'] as String?
      ..translatedDescription = json['translated_description'] as String?
      ..isSelected = json['isSelected'] as bool;

Map<String, dynamic> _$TodoModelToJson(TodoModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'translated_title': instance.translatedTitle,
      'description': instance.description,
      'translated_description': instance.translatedDescription,
      'completed': instance.completed,
      'creation_date': TodoModel._toJson(instance.creationDate),
      'isSelected': instance.isSelected,
    };
