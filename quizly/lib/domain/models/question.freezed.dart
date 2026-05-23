// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Question _$QuestionFromJson(Map<String, dynamic> json) {
return _Question.fromJson(json);
}

/// @nodoc
mixin _$Question {

 String get id => throw _privateConstructorUsedError; int get index => throw _privateConstructorUsedError;@JsonKey(fromJson: _typeFromJson, toJson: _typeToJson) QuestionType get type => throw _privateConstructorUsedError; String get text => throw _privateConstructorUsedError; List<String> get options => throw _privateConstructorUsedError; int get correctIndex => throw _privateConstructorUsedError; String? get explanation => throw _privateConstructorUsedError;






/// Serializes this Question to a JSON map.
Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
/// Create a copy of Question
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
$QuestionCopyWith<Question> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $QuestionCopyWith<$Res>  {
  factory $QuestionCopyWith(Question value, $Res Function(Question) then) = _$QuestionCopyWithImpl<$Res, Question>;
@useResult
$Res call({
 String id, int index,@JsonKey(fromJson: _typeFromJson, toJson: _typeToJson) QuestionType type, String text, List<String> options, int correctIndex, String? explanation
});



}

/// @nodoc
class _$QuestionCopyWithImpl<$Res,$Val extends Question> implements $QuestionCopyWith<$Res> {
  _$QuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

/// Create a copy of Question
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? index = null,Object? type = null,Object? text = null,Object? options = null,Object? correctIndex = null,Object? explanation = freezed,}) {
  return _then(_value.copyWith(
id: null == id ? _value.id : id // ignore: cast_nullable_to_non_nullable
as String,index: null == index ? _value.index : index // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _value.type : type // ignore: cast_nullable_to_non_nullable
as QuestionType,text: null == text ? _value.text : text // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _value.options : options // ignore: cast_nullable_to_non_nullable
as List<String>,correctIndex: null == correctIndex ? _value.correctIndex : correctIndex // ignore: cast_nullable_to_non_nullable
as int,explanation: freezed == explanation ? _value.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String?,
  )as $Val);
}

}


/// @nodoc
abstract class _$$QuestionImplCopyWith<$Res> implements $QuestionCopyWith<$Res> {
  factory _$$QuestionImplCopyWith(_$QuestionImpl value, $Res Function(_$QuestionImpl) then) = __$$QuestionImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 String id, int index,@JsonKey(fromJson: _typeFromJson, toJson: _typeToJson) QuestionType type, String text, List<String> options, int correctIndex, String? explanation
});



}

/// @nodoc
class __$$QuestionImplCopyWithImpl<$Res> extends _$QuestionCopyWithImpl<$Res, _$QuestionImpl> implements _$$QuestionImplCopyWith<$Res> {
  __$$QuestionImplCopyWithImpl(_$QuestionImpl _value, $Res Function(_$QuestionImpl) _then)
      : super(_value, _then);


/// Create a copy of Question
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? index = null,Object? type = null,Object? text = null,Object? options = null,Object? correctIndex = null,Object? explanation = freezed,}) {
  return _then(_$QuestionImpl(
id: null == id ? _value.id : id // ignore: cast_nullable_to_non_nullable
as String,index: null == index ? _value.index : index // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _value.type : type // ignore: cast_nullable_to_non_nullable
as QuestionType,text: null == text ? _value.text : text // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _value._options : options // ignore: cast_nullable_to_non_nullable
as List<String>,correctIndex: null == correctIndex ? _value.correctIndex : correctIndex // ignore: cast_nullable_to_non_nullable
as int,explanation: freezed == explanation ? _value.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$QuestionImpl  implements _Question {
  const _$QuestionImpl({required this.id, required this.index, @JsonKey(fromJson: _typeFromJson, toJson: _typeToJson) required this.type, required this.text, required final  List<String> options, required this.correctIndex, this.explanation}): _options = options;

  factory _$QuestionImpl.fromJson(Map<String, dynamic> json) => _$$QuestionImplFromJson(json);

@override final  String id;
@override final  int index;
@override@JsonKey(fromJson: _typeFromJson, toJson: _typeToJson) final  QuestionType type;
@override final  String text;
 final  List<String> _options;
@override List<String> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}

@override final  int correctIndex;
@override final  String? explanation;

@override
String toString() {
  return 'Question(id: $id, index: $index, type: $type, text: $text, options: $options, correctIndex: $correctIndex, explanation: $explanation)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$QuestionImpl&&(identical(other.id, id) || other.id == id)&&(identical(other.index, index) || other.index == index)&&(identical(other.type, type) || other.type == type)&&(identical(other.text, text) || other.text == text)&&const DeepCollectionEquality().equals(other._options, _options)&&(identical(other.correctIndex, correctIndex) || other.correctIndex == correctIndex)&&(identical(other.explanation, explanation) || other.explanation == explanation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,index,type,text,const DeepCollectionEquality().hash(_options),correctIndex,explanation);

/// Create a copy of Question
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@override
@pragma('vm:prefer-inline')
_$$QuestionImplCopyWith<_$QuestionImpl> get copyWith => __$$QuestionImplCopyWithImpl<_$QuestionImpl>(this, _$identity);







@override
Map<String, dynamic> toJson() {
  return _$$QuestionImplToJson(this, );
}
}


abstract class _Question implements Question {
  const factory _Question({required final  String id, required final  int index, @JsonKey(fromJson: _typeFromJson, toJson: _typeToJson) required final  QuestionType type, required final  String text, required final  List<String> options, required final  int correctIndex, final  String? explanation}) = _$QuestionImpl;
  

  factory _Question.fromJson(Map<String, dynamic> json) = _$QuestionImpl.fromJson;

@override String get id;@override int get index;@override@JsonKey(fromJson: _typeFromJson, toJson: _typeToJson) QuestionType get type;@override String get text;@override List<String> get options;@override int get correctIndex;@override String? get explanation;
/// Create a copy of Question
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
_$$QuestionImplCopyWith<_$QuestionImpl> get copyWith => throw _privateConstructorUsedError;

}
