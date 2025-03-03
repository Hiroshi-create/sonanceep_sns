// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'firestore_song.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FirestoreSong _$FirestoreSongFromJson(Map<String, dynamic> json) {
  return _FirestoreSong.fromJson(json);
}

/// @nodoc
mixin _$FirestoreSong {
// const factory 違うクラスのインスタンスを返すことができるコンストラクタ
  dynamic get createdAt =>
      throw _privateConstructorUsedError; // dynamic型 なんでも許す
  dynamic get updatedAt => throw _privateConstructorUsedError;
  Map<String, dynamic> get searchToken => throw _privateConstructorUsedError;
  String get artistId => throw _privateConstructorUsedError;
  String get albumType => throw _privateConstructorUsedError;
  String get songName => throw _privateConstructorUsedError;
  String get songId => throw _privateConstructorUsedError;
  double get songBpm => throw _privateConstructorUsedError;
  int get songKey => throw _privateConstructorUsedError;
  List<String> get songGenre => throw _privateConstructorUsedError;
  List<String> get songAlbums => throw _privateConstructorUsedError;
  List<String> get songImageURL => throw _privateConstructorUsedError;
  int get songDuration => throw _privateConstructorUsedError;
  dynamic get releaseDate => throw _privateConstructorUsedError;
  dynamic get artistRef => throw _privateConstructorUsedError;
  String get wavFileName => throw _privateConstructorUsedError;
  String get wavFileURL => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FirestoreSongCopyWith<FirestoreSong> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirestoreSongCopyWith<$Res> {
  factory $FirestoreSongCopyWith(
          FirestoreSong value, $Res Function(FirestoreSong) then) =
      _$FirestoreSongCopyWithImpl<$Res, FirestoreSong>;
  @useResult
  $Res call(
      {dynamic createdAt,
      dynamic updatedAt,
      Map<String, dynamic> searchToken,
      String artistId,
      String albumType,
      String songName,
      String songId,
      double songBpm,
      int songKey,
      List<String> songGenre,
      List<String> songAlbums,
      List<String> songImageURL,
      int songDuration,
      dynamic releaseDate,
      dynamic artistRef,
      String wavFileName,
      String wavFileURL});
}

/// @nodoc
class _$FirestoreSongCopyWithImpl<$Res, $Val extends FirestoreSong>
    implements $FirestoreSongCopyWith<$Res> {
  _$FirestoreSongCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? searchToken = null,
    Object? artistId = null,
    Object? albumType = null,
    Object? songName = null,
    Object? songId = null,
    Object? songBpm = null,
    Object? songKey = null,
    Object? songGenre = null,
    Object? songAlbums = null,
    Object? songImageURL = null,
    Object? songDuration = null,
    Object? releaseDate = freezed,
    Object? artistRef = freezed,
    Object? wavFileName = null,
    Object? wavFileURL = null,
  }) {
    return _then(_value.copyWith(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      searchToken: null == searchToken
          ? _value.searchToken
          : searchToken // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      artistId: null == artistId
          ? _value.artistId
          : artistId // ignore: cast_nullable_to_non_nullable
              as String,
      albumType: null == albumType
          ? _value.albumType
          : albumType // ignore: cast_nullable_to_non_nullable
              as String,
      songName: null == songName
          ? _value.songName
          : songName // ignore: cast_nullable_to_non_nullable
              as String,
      songId: null == songId
          ? _value.songId
          : songId // ignore: cast_nullable_to_non_nullable
              as String,
      songBpm: null == songBpm
          ? _value.songBpm
          : songBpm // ignore: cast_nullable_to_non_nullable
              as double,
      songKey: null == songKey
          ? _value.songKey
          : songKey // ignore: cast_nullable_to_non_nullable
              as int,
      songGenre: null == songGenre
          ? _value.songGenre
          : songGenre // ignore: cast_nullable_to_non_nullable
              as List<String>,
      songAlbums: null == songAlbums
          ? _value.songAlbums
          : songAlbums // ignore: cast_nullable_to_non_nullable
              as List<String>,
      songImageURL: null == songImageURL
          ? _value.songImageURL
          : songImageURL // ignore: cast_nullable_to_non_nullable
              as List<String>,
      songDuration: null == songDuration
          ? _value.songDuration
          : songDuration // ignore: cast_nullable_to_non_nullable
              as int,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      artistRef: freezed == artistRef
          ? _value.artistRef
          : artistRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
      wavFileName: null == wavFileName
          ? _value.wavFileName
          : wavFileName // ignore: cast_nullable_to_non_nullable
              as String,
      wavFileURL: null == wavFileURL
          ? _value.wavFileURL
          : wavFileURL // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FirestoreSongImplCopyWith<$Res>
    implements $FirestoreSongCopyWith<$Res> {
  factory _$$FirestoreSongImplCopyWith(
          _$FirestoreSongImpl value, $Res Function(_$FirestoreSongImpl) then) =
      __$$FirestoreSongImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic createdAt,
      dynamic updatedAt,
      Map<String, dynamic> searchToken,
      String artistId,
      String albumType,
      String songName,
      String songId,
      double songBpm,
      int songKey,
      List<String> songGenre,
      List<String> songAlbums,
      List<String> songImageURL,
      int songDuration,
      dynamic releaseDate,
      dynamic artistRef,
      String wavFileName,
      String wavFileURL});
}

/// @nodoc
class __$$FirestoreSongImplCopyWithImpl<$Res>
    extends _$FirestoreSongCopyWithImpl<$Res, _$FirestoreSongImpl>
    implements _$$FirestoreSongImplCopyWith<$Res> {
  __$$FirestoreSongImplCopyWithImpl(
      _$FirestoreSongImpl _value, $Res Function(_$FirestoreSongImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? searchToken = null,
    Object? artistId = null,
    Object? albumType = null,
    Object? songName = null,
    Object? songId = null,
    Object? songBpm = null,
    Object? songKey = null,
    Object? songGenre = null,
    Object? songAlbums = null,
    Object? songImageURL = null,
    Object? songDuration = null,
    Object? releaseDate = freezed,
    Object? artistRef = freezed,
    Object? wavFileName = null,
    Object? wavFileURL = null,
  }) {
    return _then(_$FirestoreSongImpl(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      searchToken: null == searchToken
          ? _value._searchToken
          : searchToken // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      artistId: null == artistId
          ? _value.artistId
          : artistId // ignore: cast_nullable_to_non_nullable
              as String,
      albumType: null == albumType
          ? _value.albumType
          : albumType // ignore: cast_nullable_to_non_nullable
              as String,
      songName: null == songName
          ? _value.songName
          : songName // ignore: cast_nullable_to_non_nullable
              as String,
      songId: null == songId
          ? _value.songId
          : songId // ignore: cast_nullable_to_non_nullable
              as String,
      songBpm: null == songBpm
          ? _value.songBpm
          : songBpm // ignore: cast_nullable_to_non_nullable
              as double,
      songKey: null == songKey
          ? _value.songKey
          : songKey // ignore: cast_nullable_to_non_nullable
              as int,
      songGenre: null == songGenre
          ? _value._songGenre
          : songGenre // ignore: cast_nullable_to_non_nullable
              as List<String>,
      songAlbums: null == songAlbums
          ? _value._songAlbums
          : songAlbums // ignore: cast_nullable_to_non_nullable
              as List<String>,
      songImageURL: null == songImageURL
          ? _value._songImageURL
          : songImageURL // ignore: cast_nullable_to_non_nullable
              as List<String>,
      songDuration: null == songDuration
          ? _value.songDuration
          : songDuration // ignore: cast_nullable_to_non_nullable
              as int,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      artistRef: freezed == artistRef
          ? _value.artistRef
          : artistRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
      wavFileName: null == wavFileName
          ? _value.wavFileName
          : wavFileName // ignore: cast_nullable_to_non_nullable
              as String,
      wavFileURL: null == wavFileURL
          ? _value.wavFileURL
          : wavFileURL // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FirestoreSongImpl
    with DiagnosticableTreeMixin
    implements _FirestoreSong {
  const _$FirestoreSongImpl(
      {required this.createdAt,
      required this.updatedAt,
      required final Map<String, dynamic> searchToken,
      required this.artistId,
      required this.albumType,
      required this.songName,
      required this.songId,
      required this.songBpm,
      required this.songKey,
      required final List<String> songGenre,
      required final List<String> songAlbums,
      required final List<String> songImageURL,
      required this.songDuration,
      required this.releaseDate,
      required this.artistRef,
      required this.wavFileName,
      required this.wavFileURL})
      : _searchToken = searchToken,
        _songGenre = songGenre,
        _songAlbums = songAlbums,
        _songImageURL = songImageURL;

  factory _$FirestoreSongImpl.fromJson(Map<String, dynamic> json) =>
      _$$FirestoreSongImplFromJson(json);

// const factory 違うクラスのインスタンスを返すことができるコンストラクタ
  @override
  final dynamic createdAt;
// dynamic型 なんでも許す
  @override
  final dynamic updatedAt;
  final Map<String, dynamic> _searchToken;
  @override
  Map<String, dynamic> get searchToken {
    if (_searchToken is EqualUnmodifiableMapView) return _searchToken;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_searchToken);
  }

  @override
  final String artistId;
  @override
  final String albumType;
  @override
  final String songName;
  @override
  final String songId;
  @override
  final double songBpm;
  @override
  final int songKey;
  final List<String> _songGenre;
  @override
  List<String> get songGenre {
    if (_songGenre is EqualUnmodifiableListView) return _songGenre;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_songGenre);
  }

  final List<String> _songAlbums;
  @override
  List<String> get songAlbums {
    if (_songAlbums is EqualUnmodifiableListView) return _songAlbums;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_songAlbums);
  }

  final List<String> _songImageURL;
  @override
  List<String> get songImageURL {
    if (_songImageURL is EqualUnmodifiableListView) return _songImageURL;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_songImageURL);
  }

  @override
  final int songDuration;
  @override
  final dynamic releaseDate;
  @override
  final dynamic artistRef;
  @override
  final String wavFileName;
  @override
  final String wavFileURL;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FirestoreSong(createdAt: $createdAt, updatedAt: $updatedAt, searchToken: $searchToken, artistId: $artistId, albumType: $albumType, songName: $songName, songId: $songId, songBpm: $songBpm, songKey: $songKey, songGenre: $songGenre, songAlbums: $songAlbums, songImageURL: $songImageURL, songDuration: $songDuration, releaseDate: $releaseDate, artistRef: $artistRef, wavFileName: $wavFileName, wavFileURL: $wavFileURL)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FirestoreSong'))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('searchToken', searchToken))
      ..add(DiagnosticsProperty('artistId', artistId))
      ..add(DiagnosticsProperty('albumType', albumType))
      ..add(DiagnosticsProperty('songName', songName))
      ..add(DiagnosticsProperty('songId', songId))
      ..add(DiagnosticsProperty('songBpm', songBpm))
      ..add(DiagnosticsProperty('songKey', songKey))
      ..add(DiagnosticsProperty('songGenre', songGenre))
      ..add(DiagnosticsProperty('songAlbums', songAlbums))
      ..add(DiagnosticsProperty('songImageURL', songImageURL))
      ..add(DiagnosticsProperty('songDuration', songDuration))
      ..add(DiagnosticsProperty('releaseDate', releaseDate))
      ..add(DiagnosticsProperty('artistRef', artistRef))
      ..add(DiagnosticsProperty('wavFileName', wavFileName))
      ..add(DiagnosticsProperty('wavFileURL', wavFileURL));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirestoreSongImpl &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality()
                .equals(other._searchToken, _searchToken) &&
            (identical(other.artistId, artistId) ||
                other.artistId == artistId) &&
            (identical(other.albumType, albumType) ||
                other.albumType == albumType) &&
            (identical(other.songName, songName) ||
                other.songName == songName) &&
            (identical(other.songId, songId) || other.songId == songId) &&
            (identical(other.songBpm, songBpm) || other.songBpm == songBpm) &&
            (identical(other.songKey, songKey) || other.songKey == songKey) &&
            const DeepCollectionEquality()
                .equals(other._songGenre, _songGenre) &&
            const DeepCollectionEquality()
                .equals(other._songAlbums, _songAlbums) &&
            const DeepCollectionEquality()
                .equals(other._songImageURL, _songImageURL) &&
            (identical(other.songDuration, songDuration) ||
                other.songDuration == songDuration) &&
            const DeepCollectionEquality()
                .equals(other.releaseDate, releaseDate) &&
            const DeepCollectionEquality().equals(other.artistRef, artistRef) &&
            (identical(other.wavFileName, wavFileName) ||
                other.wavFileName == wavFileName) &&
            (identical(other.wavFileURL, wavFileURL) ||
                other.wavFileURL == wavFileURL));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(_searchToken),
      artistId,
      albumType,
      songName,
      songId,
      songBpm,
      songKey,
      const DeepCollectionEquality().hash(_songGenre),
      const DeepCollectionEquality().hash(_songAlbums),
      const DeepCollectionEquality().hash(_songImageURL),
      songDuration,
      const DeepCollectionEquality().hash(releaseDate),
      const DeepCollectionEquality().hash(artistRef),
      wavFileName,
      wavFileURL);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FirestoreSongImplCopyWith<_$FirestoreSongImpl> get copyWith =>
      __$$FirestoreSongImplCopyWithImpl<_$FirestoreSongImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FirestoreSongImplToJson(
      this,
    );
  }
}

abstract class _FirestoreSong implements FirestoreSong {
  const factory _FirestoreSong(
      {required final dynamic createdAt,
      required final dynamic updatedAt,
      required final Map<String, dynamic> searchToken,
      required final String artistId,
      required final String albumType,
      required final String songName,
      required final String songId,
      required final double songBpm,
      required final int songKey,
      required final List<String> songGenre,
      required final List<String> songAlbums,
      required final List<String> songImageURL,
      required final int songDuration,
      required final dynamic releaseDate,
      required final dynamic artistRef,
      required final String wavFileName,
      required final String wavFileURL}) = _$FirestoreSongImpl;

  factory _FirestoreSong.fromJson(Map<String, dynamic> json) =
      _$FirestoreSongImpl.fromJson;

  @override // const factory 違うクラスのインスタンスを返すことができるコンストラクタ
  dynamic get createdAt;
  @override // dynamic型 なんでも許す
  dynamic get updatedAt;
  @override
  Map<String, dynamic> get searchToken;
  @override
  String get artistId;
  @override
  String get albumType;
  @override
  String get songName;
  @override
  String get songId;
  @override
  double get songBpm;
  @override
  int get songKey;
  @override
  List<String> get songGenre;
  @override
  List<String> get songAlbums;
  @override
  List<String> get songImageURL;
  @override
  int get songDuration;
  @override
  dynamic get releaseDate;
  @override
  dynamic get artistRef;
  @override
  String get wavFileName;
  @override
  String get wavFileURL;
  @override
  @JsonKey(ignore: true)
  _$$FirestoreSongImplCopyWith<_$FirestoreSongImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
