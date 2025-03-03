// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'track.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Track _$TrackFromJson(Map<String, dynamic> json) {
  return _Track.fromJson(json);
}

/// @nodoc
mixin _$Track {
// const factory 違うクラスのインスタンスを返すことができるコンストラクタ
  String get trackName => throw _privateConstructorUsedError;
  double get trackVolume => throw _privateConstructorUsedError;
  List<bool> get soloMuteRec => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TrackCopyWith<Track> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrackCopyWith<$Res> {
  factory $TrackCopyWith(Track value, $Res Function(Track) then) =
      _$TrackCopyWithImpl<$Res, Track>;
  @useResult
  $Res call({String trackName, double trackVolume, List<bool> soloMuteRec});
}

/// @nodoc
class _$TrackCopyWithImpl<$Res, $Val extends Track>
    implements $TrackCopyWith<$Res> {
  _$TrackCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trackName = null,
    Object? trackVolume = null,
    Object? soloMuteRec = null,
  }) {
    return _then(_value.copyWith(
      trackName: null == trackName
          ? _value.trackName
          : trackName // ignore: cast_nullable_to_non_nullable
              as String,
      trackVolume: null == trackVolume
          ? _value.trackVolume
          : trackVolume // ignore: cast_nullable_to_non_nullable
              as double,
      soloMuteRec: null == soloMuteRec
          ? _value.soloMuteRec
          : soloMuteRec // ignore: cast_nullable_to_non_nullable
              as List<bool>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TrackImplCopyWith<$Res> implements $TrackCopyWith<$Res> {
  factory _$$TrackImplCopyWith(
          _$TrackImpl value, $Res Function(_$TrackImpl) then) =
      __$$TrackImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String trackName, double trackVolume, List<bool> soloMuteRec});
}

/// @nodoc
class __$$TrackImplCopyWithImpl<$Res>
    extends _$TrackCopyWithImpl<$Res, _$TrackImpl>
    implements _$$TrackImplCopyWith<$Res> {
  __$$TrackImplCopyWithImpl(
      _$TrackImpl _value, $Res Function(_$TrackImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trackName = null,
    Object? trackVolume = null,
    Object? soloMuteRec = null,
  }) {
    return _then(_$TrackImpl(
      trackName: null == trackName
          ? _value.trackName
          : trackName // ignore: cast_nullable_to_non_nullable
              as String,
      trackVolume: null == trackVolume
          ? _value.trackVolume
          : trackVolume // ignore: cast_nullable_to_non_nullable
              as double,
      soloMuteRec: null == soloMuteRec
          ? _value._soloMuteRec
          : soloMuteRec // ignore: cast_nullable_to_non_nullable
              as List<bool>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TrackImpl implements _Track {
  const _$TrackImpl(
      {required this.trackName,
      required this.trackVolume,
      required final List<bool> soloMuteRec})
      : _soloMuteRec = soloMuteRec;

  factory _$TrackImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrackImplFromJson(json);

// const factory 違うクラスのインスタンスを返すことができるコンストラクタ
  @override
  final String trackName;
  @override
  final double trackVolume;
  final List<bool> _soloMuteRec;
  @override
  List<bool> get soloMuteRec {
    if (_soloMuteRec is EqualUnmodifiableListView) return _soloMuteRec;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_soloMuteRec);
  }

  @override
  String toString() {
    return 'Track(trackName: $trackName, trackVolume: $trackVolume, soloMuteRec: $soloMuteRec)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrackImpl &&
            (identical(other.trackName, trackName) ||
                other.trackName == trackName) &&
            (identical(other.trackVolume, trackVolume) ||
                other.trackVolume == trackVolume) &&
            const DeepCollectionEquality()
                .equals(other._soloMuteRec, _soloMuteRec));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, trackName, trackVolume,
      const DeepCollectionEquality().hash(_soloMuteRec));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TrackImplCopyWith<_$TrackImpl> get copyWith =>
      __$$TrackImplCopyWithImpl<_$TrackImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrackImplToJson(
      this,
    );
  }
}

abstract class _Track implements Track {
  const factory _Track(
      {required final String trackName,
      required final double trackVolume,
      required final List<bool> soloMuteRec}) = _$TrackImpl;

  factory _Track.fromJson(Map<String, dynamic> json) = _$TrackImpl.fromJson;

  @override // const factory 違うクラスのインスタンスを返すことができるコンストラクタ
  String get trackName;
  @override
  double get trackVolume;
  @override
  List<bool> get soloMuteRec;
  @override
  @JsonKey(ignore: true)
  _$$TrackImplCopyWith<_$TrackImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
