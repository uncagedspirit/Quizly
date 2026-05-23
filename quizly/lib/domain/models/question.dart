import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/question_type.dart';

part 'question.freezed.dart';
part 'question.g.dart';

@Freezed()
class Question with _$Question {
  const factory Question({
    required String id,
    required int index,
    @JsonKey(fromJson: _typeFromJson, toJson: _typeToJson)
    required QuestionType type,
    required String text,
    required List<String> options,
    required int correctIndex,
    String? explanation,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}

String _typeToJson(QuestionType type) => type.name;
QuestionType _typeFromJson(String type) => QuestionType.values.byName(type);
