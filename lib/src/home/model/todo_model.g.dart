// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoModel _$TodoModelFromJson(Map<String, dynamic> json) => TodoModel(
      json['title'] as String?,
      json['description'] as String?,
      json['state'] as String?,
      json['creation_date'] as String?,
    );

Map<String, dynamic> _$TodoModelToJson(TodoModel instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'state': instance.state,
      'creation_date': instance.creationDate,
    };
