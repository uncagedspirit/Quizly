// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Quiz {
  String get id;
  String get code;
  String get creatorId;
  String get creatorName;
  String get title;
  String? get description;
  String? get categoryEmoji;
  String? get category;
  int get questionCount;
  QuizSettings get settings;
  QuizStats get stats;
  @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)
  QuizStatus get status;
  DateTime get createdAt;
  DateTime get updatedAt;

  /// Create a copy of Quiz
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QuizCopyWith<Quiz> get copyWith =>
      _$QuizCopyWithImpl<Quiz>(this as Quiz, _$identity);

  /// Serializes this Quiz to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Quiz &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.creatorId, creatorId) ||
                other.creatorId == creatorId) &&
            (identical(other.creatorName, creatorName) ||
                other.creatorName == creatorName) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.categoryEmoji, categoryEmoji) ||
                other.categoryEmoji == categoryEmoji) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.questionCount, questionCount) ||
                other.questionCount == questionCount) &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            (identical(other.stats, stats) || other.stats == stats) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      code,
      creatorId,
      creatorName,
      title,
      description,
      categoryEmoji,
      category,
      questionCount,
      settings,
      stats,
      status,
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'Quiz(id: $id, code: $code, creatorId: $creatorId, creatorName: $creatorName, title: $title, description: $description, categoryEmoji: $categoryEmoji, category: $category, questionCount: $questionCount, settings: $settings, stats: $stats, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $QuizCopyWith<$Res> {
  factory $QuizCopyWith(Quiz value, $Res Function(Quiz) _then) =
      _$QuizCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String code,
      String creatorId,
      String creatorName,
      String title,
      String? description,
      String? categoryEmoji,
      String? category,
      int questionCount,
      QuizSettings settings,
      QuizStats stats,
      @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)
      QuizStatus status,
      DateTime createdAt,
      DateTime updatedAt});

  $QuizSettingsCopyWith<$Res> get settings;
  $QuizStatsCopyWith<$Res> get stats;
}

/// @nodoc
class _$QuizCopyWithImpl<$Res> implements $QuizCopyWith<$Res> {
  _$QuizCopyWithImpl(this._self, this._then);

  final Quiz _self;
  final $Res Function(Quiz) _then;

  /// Create a copy of Quiz
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? creatorId = null,
    Object? creatorName = null,
    Object? title = null,
    Object? description = freezed,
    Object? categoryEmoji = freezed,
    Object? category = freezed,
    Object? questionCount = null,
    Object? settings = null,
    Object? stats = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      creatorId: null == creatorId
          ? _self.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      creatorName: null == creatorName
          ? _self.creatorName
          : creatorName // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryEmoji: freezed == categoryEmoji
          ? _self.categoryEmoji
          : categoryEmoji // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      questionCount: null == questionCount
          ? _self.questionCount
          : questionCount // ignore: cast_nullable_to_non_nullable
              as int,
      settings: null == settings
          ? _self.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as QuizSettings,
      stats: null == stats
          ? _self.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as QuizStats,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as QuizStatus,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of Quiz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuizSettingsCopyWith<$Res> get settings {
    return $QuizSettingsCopyWith<$Res>(_self.settings, (value) {
      return _then(_self.copyWith(settings: value));
    });
  }

  /// Create a copy of Quiz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuizStatsCopyWith<$Res> get stats {
    return $QuizStatsCopyWith<$Res>(_self.stats, (value) {
      return _then(_self.copyWith(stats: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _Quiz implements Quiz {
  const _Quiz(
      {required this.id,
      required this.code,
      required this.creatorId,
      required this.creatorName,
      required this.title,
      this.description,
      this.categoryEmoji,
      this.category,
      required this.questionCount,
      required this.settings,
      required this.stats,
      @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)
      required this.status,
      required this.createdAt,
      required this.updatedAt});
  factory _Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);

  @override
  final String id;
  @override
  final String code;
  @override
  final String creatorId;
  @override
  final String creatorName;
  @override
  final String title;
  @override
  final String? description;
  @override
  final String? categoryEmoji;
  @override
  final String? category;
  @override
  final int questionCount;
  @override
  final QuizSettings settings;
  @override
  final QuizStats stats;
  @override
  @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)
  final QuizStatus status;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  /// Create a copy of Quiz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QuizCopyWith<_Quiz> get copyWith =>
      __$QuizCopyWithImpl<_Quiz>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$QuizToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Quiz &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.creatorId, creatorId) ||
                other.creatorId == creatorId) &&
            (identical(other.creatorName, creatorName) ||
                other.creatorName == creatorName) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.categoryEmoji, categoryEmoji) ||
                other.categoryEmoji == categoryEmoji) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.questionCount, questionCount) ||
                other.questionCount == questionCount) &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            (identical(other.stats, stats) || other.stats == stats) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      code,
      creatorId,
      creatorName,
      title,
      description,
      categoryEmoji,
      category,
      questionCount,
      settings,
      stats,
      status,
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'Quiz(id: $id, code: $code, creatorId: $creatorId, creatorName: $creatorName, title: $title, description: $description, categoryEmoji: $categoryEmoji, category: $category, questionCount: $questionCount, settings: $settings, stats: $stats, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$QuizCopyWith<$Res> implements $QuizCopyWith<$Res> {
  factory _$QuizCopyWith(_Quiz value, $Res Function(_Quiz) _then) =
      __$QuizCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String code,
      String creatorId,
      String creatorName,
      String title,
      String? description,
      String? categoryEmoji,
      String? category,
      int questionCount,
      QuizSettings settings,
      QuizStats stats,
      @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)
      QuizStatus status,
      DateTime createdAt,
      DateTime updatedAt});

  @override
  $QuizSettingsCopyWith<$Res> get settings;
  @override
  $QuizStatsCopyWith<$Res> get stats;
}

/// @nodoc
class __$QuizCopyWithImpl<$Res> implements _$QuizCopyWith<$Res> {
  __$QuizCopyWithImpl(this._self, this._then);

  final _Quiz _self;
  final $Res Function(_Quiz) _then;

  /// Create a copy of Quiz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? creatorId = null,
    Object? creatorName = null,
    Object? title = null,
    Object? description = freezed,
    Object? categoryEmoji = freezed,
    Object? category = freezed,
    Object? questionCount = null,
    Object? settings = null,
    Object? stats = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_Quiz(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      creatorId: null == creatorId
          ? _self.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      creatorName: null == creatorName
          ? _self.creatorName
          : creatorName // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryEmoji: freezed == categoryEmoji
          ? _self.categoryEmoji
          : categoryEmoji // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      questionCount: null == questionCount
          ? _self.questionCount
          : questionCount // ignore: cast_nullable_to_non_nullable
              as int,
      settings: null == settings
          ? _self.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as QuizSettings,
      stats: null == stats
          ? _self.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as QuizStats,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as QuizStatus,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of Quiz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuizSettingsCopyWith<$Res> get settings {
    return $QuizSettingsCopyWith<$Res>(_self.settings, (value) {
      return _then(_self.copyWith(settings: value));
    });
  }

  /// Create a copy of Quiz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuizStatsCopyWith<$Res> get stats {
    return $QuizStatsCopyWith<$Res>(_self.stats, (value) {
      return _then(_self.copyWith(stats: value));
    });
  }
}

/// @nodoc
mixin _$QuizSettings {
  bool get allowAnonymous;
  int? get perQuestionTimerSec;
  @TimestampConverter()
  DateTime? get deadlineAt;
  @JsonKey(fromJson: _revealFromJson, toJson: _revealToJson)
  RevealMode get revealMode;

  /// Create a copy of QuizSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QuizSettingsCopyWith<QuizSettings> get copyWith =>
      _$QuizSettingsCopyWithImpl<QuizSettings>(
          this as QuizSettings, _$identity);

  /// Serializes this QuizSettings to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QuizSettings &&
            (identical(other.allowAnonymous, allowAnonymous) ||
                other.allowAnonymous == allowAnonymous) &&
            (identical(other.perQuestionTimerSec, perQuestionTimerSec) ||
                other.perQuestionTimerSec == perQuestionTimerSec) &&
            (identical(other.deadlineAt, deadlineAt) ||
                other.deadlineAt == deadlineAt) &&
            (identical(other.revealMode, revealMode) ||
                other.revealMode == revealMode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, allowAnonymous, perQuestionTimerSec, deadlineAt, revealMode);

  @override
  String toString() {
    return 'QuizSettings(allowAnonymous: $allowAnonymous, perQuestionTimerSec: $perQuestionTimerSec, deadlineAt: $deadlineAt, revealMode: $revealMode)';
  }
}

/// @nodoc
abstract mixin class $QuizSettingsCopyWith<$Res> {
  factory $QuizSettingsCopyWith(
          QuizSettings value, $Res Function(QuizSettings) _then) =
      _$QuizSettingsCopyWithImpl;
  @useResult
  $Res call(
      {bool allowAnonymous,
      int? perQuestionTimerSec,
      @TimestampConverter() DateTime? deadlineAt,
      @JsonKey(fromJson: _revealFromJson, toJson: _revealToJson)
      RevealMode revealMode});
}

/// @nodoc
class _$QuizSettingsCopyWithImpl<$Res> implements $QuizSettingsCopyWith<$Res> {
  _$QuizSettingsCopyWithImpl(this._self, this._then);

  final QuizSettings _self;
  final $Res Function(QuizSettings) _then;

  /// Create a copy of QuizSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allowAnonymous = null,
    Object? perQuestionTimerSec = freezed,
    Object? deadlineAt = freezed,
    Object? revealMode = null,
  }) {
    return _then(_self.copyWith(
      allowAnonymous: null == allowAnonymous
          ? _self.allowAnonymous
          : allowAnonymous // ignore: cast_nullable_to_non_nullable
              as bool,
      perQuestionTimerSec: freezed == perQuestionTimerSec
          ? _self.perQuestionTimerSec
          : perQuestionTimerSec // ignore: cast_nullable_to_non_nullable
              as int?,
      deadlineAt: freezed == deadlineAt
          ? _self.deadlineAt
          : deadlineAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      revealMode: null == revealMode
          ? _self.revealMode
          : revealMode // ignore: cast_nullable_to_non_nullable
              as RevealMode,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _QuizSettings implements QuizSettings {
  const _QuizSettings(
      {this.allowAnonymous = false,
      this.perQuestionTimerSec,
      @TimestampConverter() this.deadlineAt,
      @JsonKey(fromJson: _revealFromJson, toJson: _revealToJson)
      this.revealMode = RevealMode.atEnd});
  factory _QuizSettings.fromJson(Map<String, dynamic> json) =>
      _$QuizSettingsFromJson(json);

  @override
  @JsonKey()
  final bool allowAnonymous;
  @override
  final int? perQuestionTimerSec;
  @override
  @TimestampConverter()
  final DateTime? deadlineAt;
  @override
  @JsonKey(fromJson: _revealFromJson, toJson: _revealToJson)
  final RevealMode revealMode;

  /// Create a copy of QuizSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QuizSettingsCopyWith<_QuizSettings> get copyWith =>
      __$QuizSettingsCopyWithImpl<_QuizSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$QuizSettingsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuizSettings &&
            (identical(other.allowAnonymous, allowAnonymous) ||
                other.allowAnonymous == allowAnonymous) &&
            (identical(other.perQuestionTimerSec, perQuestionTimerSec) ||
                other.perQuestionTimerSec == perQuestionTimerSec) &&
            (identical(other.deadlineAt, deadlineAt) ||
                other.deadlineAt == deadlineAt) &&
            (identical(other.revealMode, revealMode) ||
                other.revealMode == revealMode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, allowAnonymous, perQuestionTimerSec, deadlineAt, revealMode);

  @override
  String toString() {
    return 'QuizSettings(allowAnonymous: $allowAnonymous, perQuestionTimerSec: $perQuestionTimerSec, deadlineAt: $deadlineAt, revealMode: $revealMode)';
  }
}

/// @nodoc
abstract mixin class _$QuizSettingsCopyWith<$Res>
    implements $QuizSettingsCopyWith<$Res> {
  factory _$QuizSettingsCopyWith(
          _QuizSettings value, $Res Function(_QuizSettings) _then) =
      __$QuizSettingsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool allowAnonymous,
      int? perQuestionTimerSec,
      @TimestampConverter() DateTime? deadlineAt,
      @JsonKey(fromJson: _revealFromJson, toJson: _revealToJson)
      RevealMode revealMode});
}

/// @nodoc
class __$QuizSettingsCopyWithImpl<$Res>
    implements _$QuizSettingsCopyWith<$Res> {
  __$QuizSettingsCopyWithImpl(this._self, this._then);

  final _QuizSettings _self;
  final $Res Function(_QuizSettings) _then;

  /// Create a copy of QuizSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? allowAnonymous = null,
    Object? perQuestionTimerSec = freezed,
    Object? deadlineAt = freezed,
    Object? revealMode = null,
  }) {
    return _then(_QuizSettings(
      allowAnonymous: null == allowAnonymous
          ? _self.allowAnonymous
          : allowAnonymous // ignore: cast_nullable_to_non_nullable
              as bool,
      perQuestionTimerSec: freezed == perQuestionTimerSec
          ? _self.perQuestionTimerSec
          : perQuestionTimerSec // ignore: cast_nullable_to_non_nullable
              as int?,
      deadlineAt: freezed == deadlineAt
          ? _self.deadlineAt
          : deadlineAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      revealMode: null == revealMode
          ? _self.revealMode
          : revealMode // ignore: cast_nullable_to_non_nullable
              as RevealMode,
    ));
  }
}

/// @nodoc
mixin _$QuizStats {
  int get attemptCount;
  double get averageScore;
  int? get hardestQuestionIndex;

  /// Create a copy of QuizStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QuizStatsCopyWith<QuizStats> get copyWith =>
      _$QuizStatsCopyWithImpl<QuizStats>(this as QuizStats, _$identity);

  /// Serializes this QuizStats to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QuizStats &&
            (identical(other.attemptCount, attemptCount) ||
                other.attemptCount == attemptCount) &&
            (identical(other.averageScore, averageScore) ||
                other.averageScore == averageScore) &&
            (identical(other.hardestQuestionIndex, hardestQuestionIndex) ||
                other.hardestQuestionIndex == hardestQuestionIndex));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, attemptCount, averageScore, hardestQuestionIndex);

  @override
  String toString() {
    return 'QuizStats(attemptCount: $attemptCount, averageScore: $averageScore, hardestQuestionIndex: $hardestQuestionIndex)';
  }
}

/// @nodoc
abstract mixin class $QuizStatsCopyWith<$Res> {
  factory $QuizStatsCopyWith(QuizStats value, $Res Function(QuizStats) _then) =
      _$QuizStatsCopyWithImpl;
  @useResult
  $Res call({int attemptCount, double averageScore, int? hardestQuestionIndex});
}

/// @nodoc
class _$QuizStatsCopyWithImpl<$Res> implements $QuizStatsCopyWith<$Res> {
  _$QuizStatsCopyWithImpl(this._self, this._then);

  final QuizStats _self;
  final $Res Function(QuizStats) _then;

  /// Create a copy of QuizStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attemptCount = null,
    Object? averageScore = null,
    Object? hardestQuestionIndex = freezed,
  }) {
    return _then(_self.copyWith(
      attemptCount: null == attemptCount
          ? _self.attemptCount
          : attemptCount // ignore: cast_nullable_to_non_nullable
              as int,
      averageScore: null == averageScore
          ? _self.averageScore
          : averageScore // ignore: cast_nullable_to_non_nullable
              as double,
      hardestQuestionIndex: freezed == hardestQuestionIndex
          ? _self.hardestQuestionIndex
          : hardestQuestionIndex // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _QuizStats implements QuizStats {
  const _QuizStats(
      {this.attemptCount = 0,
      this.averageScore = 0.0,
      this.hardestQuestionIndex});
  factory _QuizStats.fromJson(Map<String, dynamic> json) =>
      _$QuizStatsFromJson(json);

  @override
  @JsonKey()
  final int attemptCount;
  @override
  @JsonKey()
  final double averageScore;
  @override
  final int? hardestQuestionIndex;

  /// Create a copy of QuizStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QuizStatsCopyWith<_QuizStats> get copyWith =>
      __$QuizStatsCopyWithImpl<_QuizStats>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$QuizStatsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuizStats &&
            (identical(other.attemptCount, attemptCount) ||
                other.attemptCount == attemptCount) &&
            (identical(other.averageScore, averageScore) ||
                other.averageScore == averageScore) &&
            (identical(other.hardestQuestionIndex, hardestQuestionIndex) ||
                other.hardestQuestionIndex == hardestQuestionIndex));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, attemptCount, averageScore, hardestQuestionIndex);

  @override
  String toString() {
    return 'QuizStats(attemptCount: $attemptCount, averageScore: $averageScore, hardestQuestionIndex: $hardestQuestionIndex)';
  }
}

/// @nodoc
abstract mixin class _$QuizStatsCopyWith<$Res>
    implements $QuizStatsCopyWith<$Res> {
  factory _$QuizStatsCopyWith(
          _QuizStats value, $Res Function(_QuizStats) _then) =
      __$QuizStatsCopyWithImpl;
  @override
  @useResult
  $Res call({int attemptCount, double averageScore, int? hardestQuestionIndex});
}

/// @nodoc
class __$QuizStatsCopyWithImpl<$Res> implements _$QuizStatsCopyWith<$Res> {
  __$QuizStatsCopyWithImpl(this._self, this._then);

  final _QuizStats _self;
  final $Res Function(_QuizStats) _then;

  /// Create a copy of QuizStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? attemptCount = null,
    Object? averageScore = null,
    Object? hardestQuestionIndex = freezed,
  }) {
    return _then(_QuizStats(
      attemptCount: null == attemptCount
          ? _self.attemptCount
          : attemptCount // ignore: cast_nullable_to_non_nullable
              as int,
      averageScore: null == averageScore
          ? _self.averageScore
          : averageScore // ignore: cast_nullable_to_non_nullable
              as double,
      hardestQuestionIndex: freezed == hardestQuestionIndex
          ? _self.hardestQuestionIndex
          : hardestQuestionIndex // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
