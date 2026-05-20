// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Question _$QuestionFromJson(Map<String, dynamic> json) => _Question(
      id: json['id'] as String,
      index: (json['index'] as num).toInt(),
      type: _typeFromJson(json['type'] as String),
      text: json['text'] as String,
      options:
          (json['options'] as List<dynamic>).map((e) => e as String).toList(),
      correctIndex: (json['correct_index'] as num).toInt(),
      explanation: json['explanation'] as String?,
    );

Map<String, dynamic> _$QuestionToJson(_Question instance) => <String, dynamic>{
      'id': instance.id,
      'index': instance.index,
      'type': _typeToJson(instance.type),
      'text': instance.text,
      'options': instance.options,
      'correct_index': instance.correctIndex,
      'explanation': instance.explanation,
    };
