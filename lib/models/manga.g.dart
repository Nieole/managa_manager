// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manga.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMangaCollection on Isar {
  IsarCollection<Manga> get mangas => this.collection();
}

const MangaSchema = CollectionSchema(
  name: r'Manga',
  id: -5643034226035087553,
  properties: {
    r'adult': PropertySchema(
      id: 0,
      name: r'adult',
      type: IsarType.bool,
    ),
    r'author': PropertySchema(
      id: 1,
      name: r'author',
      type: IsarType.string,
    ),
    r'categories': PropertySchema(
      id: 2,
      name: r'categories',
      type: IsarType.stringList,
    ),
    r'coverLocalPath': PropertySchema(
      id: 3,
      name: r'coverLocalPath',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 4,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'dateCreated': PropertySchema(
      id: 5,
      name: r'dateCreated',
      type: IsarType.string,
    ),
    r'dateUpdated': PropertySchema(
      id: 6,
      name: r'dateUpdated',
      type: IsarType.string,
    ),
    r'description': PropertySchema(
      id: 7,
      name: r'description',
      type: IsarType.string,
    ),
    r'favoriteCount': PropertySchema(
      id: 8,
      name: r'favoriteCount',
      type: IsarType.long,
    ),
    r'imageUrl': PropertySchema(
      id: 9,
      name: r'imageUrl',
      type: IsarType.string,
    ),
    r'isCompleted': PropertySchema(
      id: 10,
      name: r'isCompleted',
      type: IsarType.bool,
    ),
    r'isDownloaded': PropertySchema(
      id: 11,
      name: r'isDownloaded',
      type: IsarType.bool,
    ),
    r'isFavorite': PropertySchema(
      id: 12,
      name: r'isFavorite',
      type: IsarType.bool,
    ),
    r'lastBookUpdate': PropertySchema(
      id: 13,
      name: r'lastBookUpdate',
      type: IsarType.string,
    ),
    r'lastChapterUpdate': PropertySchema(
      id: 14,
      name: r'lastChapterUpdate',
      type: IsarType.string,
    ),
    r'localPath': PropertySchema(
      id: 15,
      name: r'localPath',
      type: IsarType.string,
    ),
    r'mangaId': PropertySchema(
      id: 16,
      name: r'mangaId',
      type: IsarType.string,
    ),
    r'monthViews': PropertySchema(
      id: 17,
      name: r'monthViews',
      type: IsarType.long,
    ),
    r'ntr': PropertySchema(
      id: 18,
      name: r'ntr',
      type: IsarType.bool,
    ),
    r'otherTitles': PropertySchema(
      id: 19,
      name: r'otherTitles',
      type: IsarType.stringList,
    ),
    r'reasons': PropertySchema(
      id: 20,
      name: r'reasons',
      type: IsarType.stringList,
    ),
    r'sexualContent': PropertySchema(
      id: 21,
      name: r'sexualContent',
      type: IsarType.bool,
    ),
    r'sexyLevel': PropertySchema(
      id: 22,
      name: r'sexyLevel',
      type: IsarType.long,
    ),
    r'sexyLevelReason': PropertySchema(
      id: 23,
      name: r'sexyLevelReason',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 24,
      name: r'status',
      type: IsarType.string,
    ),
    r'title': PropertySchema(
      id: 25,
      name: r'title',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 26,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'views': PropertySchema(
      id: 27,
      name: r'views',
      type: IsarType.long,
    ),
    r'warnings': PropertySchema(
      id: 28,
      name: r'warnings',
      type: IsarType.stringList,
    ),
    r'year': PropertySchema(
      id: 29,
      name: r'year',
      type: IsarType.long,
    )
  },
  estimateSize: _mangaEstimateSize,
  serialize: _mangaSerialize,
  deserialize: _mangaDeserialize,
  deserializeProp: _mangaDeserializeProp,
  idName: r'id',
  indexes: {
    r'mangaId': IndexSchema(
      id: 7466570075891278896,
      name: r'mangaId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'mangaId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'chapters': LinkSchema(
      id: -1477759690489116902,
      name: r'chapters',
      target: r'Chapter',
      single: false,
      linkName: r'manga',
    )
  },
  embeddedSchemas: {},
  getId: _mangaGetId,
  getLinks: _mangaGetLinks,
  attach: _mangaAttach,
  version: '3.1.0+1',
);

int _mangaEstimateSize(
  Manga object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.author.length * 3;
  bytesCount += 3 + object.categories.length * 3;
  {
    for (var i = 0; i < object.categories.length; i++) {
      final value = object.categories[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.coverLocalPath.length * 3;
  {
    final value = object.dateCreated;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.dateUpdated;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.imageUrl.length * 3;
  {
    final value = object.lastBookUpdate;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.lastChapterUpdate;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.localPath.length * 3;
  bytesCount += 3 + object.mangaId.length * 3;
  bytesCount += 3 + object.otherTitles.length * 3;
  {
    for (var i = 0; i < object.otherTitles.length; i++) {
      final value = object.otherTitles[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.reasons.length * 3;
  {
    for (var i = 0; i < object.reasons.length; i++) {
      final value = object.reasons[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.sexyLevelReason;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.status.length * 3;
  bytesCount += 3 + object.title.length * 3;
  bytesCount += 3 + object.warnings.length * 3;
  {
    for (var i = 0; i < object.warnings.length; i++) {
      final value = object.warnings[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _mangaSerialize(
  Manga object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.adult);
  writer.writeString(offsets[1], object.author);
  writer.writeStringList(offsets[2], object.categories);
  writer.writeString(offsets[3], object.coverLocalPath);
  writer.writeDateTime(offsets[4], object.createdAt);
  writer.writeString(offsets[5], object.dateCreated);
  writer.writeString(offsets[6], object.dateUpdated);
  writer.writeString(offsets[7], object.description);
  writer.writeLong(offsets[8], object.favoriteCount);
  writer.writeString(offsets[9], object.imageUrl);
  writer.writeBool(offsets[10], object.isCompleted);
  writer.writeBool(offsets[11], object.isDownloaded);
  writer.writeBool(offsets[12], object.isFavorite);
  writer.writeString(offsets[13], object.lastBookUpdate);
  writer.writeString(offsets[14], object.lastChapterUpdate);
  writer.writeString(offsets[15], object.localPath);
  writer.writeString(offsets[16], object.mangaId);
  writer.writeLong(offsets[17], object.monthViews);
  writer.writeBool(offsets[18], object.ntr);
  writer.writeStringList(offsets[19], object.otherTitles);
  writer.writeStringList(offsets[20], object.reasons);
  writer.writeBool(offsets[21], object.sexualContent);
  writer.writeLong(offsets[22], object.sexyLevel);
  writer.writeString(offsets[23], object.sexyLevelReason);
  writer.writeString(offsets[24], object.status);
  writer.writeString(offsets[25], object.title);
  writer.writeDateTime(offsets[26], object.updatedAt);
  writer.writeLong(offsets[27], object.views);
  writer.writeStringList(offsets[28], object.warnings);
  writer.writeLong(offsets[29], object.year);
}

Manga _mangaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Manga();
  object.adult = reader.readBoolOrNull(offsets[0]);
  object.author = reader.readString(offsets[1]);
  object.categories = reader.readStringList(offsets[2]) ?? [];
  object.coverLocalPath = reader.readString(offsets[3]);
  object.dateCreated = reader.readStringOrNull(offsets[5]);
  object.dateUpdated = reader.readStringOrNull(offsets[6]);
  object.description = reader.readStringOrNull(offsets[7]);
  object.favoriteCount = reader.readLong(offsets[8]);
  object.id = id;
  object.imageUrl = reader.readString(offsets[9]);
  object.isDownloaded = reader.readBool(offsets[11]);
  object.isFavorite = reader.readBool(offsets[12]);
  object.lastBookUpdate = reader.readStringOrNull(offsets[13]);
  object.lastChapterUpdate = reader.readStringOrNull(offsets[14]);
  object.localPath = reader.readString(offsets[15]);
  object.mangaId = reader.readString(offsets[16]);
  object.monthViews = reader.readLongOrNull(offsets[17]);
  object.ntr = reader.readBoolOrNull(offsets[18]);
  object.otherTitles = reader.readStringList(offsets[19]) ?? [];
  object.reasons = reader.readStringList(offsets[20]) ?? [];
  object.sexualContent = reader.readBoolOrNull(offsets[21]);
  object.sexyLevel = reader.readLongOrNull(offsets[22]);
  object.sexyLevelReason = reader.readStringOrNull(offsets[23]);
  object.status = reader.readString(offsets[24]);
  object.title = reader.readString(offsets[25]);
  object.views = reader.readLongOrNull(offsets[27]);
  object.warnings = reader.readStringList(offsets[28]) ?? [];
  object.year = reader.readLong(offsets[29]);
  return object;
}

P _mangaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBoolOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readStringList(offset) ?? []) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (reader.readBool(offset)) as P;
    case 12:
      return (reader.readBool(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readString(offset)) as P;
    case 16:
      return (reader.readString(offset)) as P;
    case 17:
      return (reader.readLongOrNull(offset)) as P;
    case 18:
      return (reader.readBoolOrNull(offset)) as P;
    case 19:
      return (reader.readStringList(offset) ?? []) as P;
    case 20:
      return (reader.readStringList(offset) ?? []) as P;
    case 21:
      return (reader.readBoolOrNull(offset)) as P;
    case 22:
      return (reader.readLongOrNull(offset)) as P;
    case 23:
      return (reader.readStringOrNull(offset)) as P;
    case 24:
      return (reader.readString(offset)) as P;
    case 25:
      return (reader.readString(offset)) as P;
    case 26:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 27:
      return (reader.readLongOrNull(offset)) as P;
    case 28:
      return (reader.readStringList(offset) ?? []) as P;
    case 29:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _mangaGetId(Manga object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _mangaGetLinks(Manga object) {
  return [object.chapters];
}

void _mangaAttach(IsarCollection<dynamic> col, Id id, Manga object) {
  object.id = id;
  object.chapters.attach(col, col.isar.collection<Chapter>(), r'chapters', id);
}

extension MangaByIndex on IsarCollection<Manga> {
  Future<Manga?> getByMangaId(String mangaId) {
    return getByIndex(r'mangaId', [mangaId]);
  }

  Manga? getByMangaIdSync(String mangaId) {
    return getByIndexSync(r'mangaId', [mangaId]);
  }

  Future<bool> deleteByMangaId(String mangaId) {
    return deleteByIndex(r'mangaId', [mangaId]);
  }

  bool deleteByMangaIdSync(String mangaId) {
    return deleteByIndexSync(r'mangaId', [mangaId]);
  }

  Future<List<Manga?>> getAllByMangaId(List<String> mangaIdValues) {
    final values = mangaIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'mangaId', values);
  }

  List<Manga?> getAllByMangaIdSync(List<String> mangaIdValues) {
    final values = mangaIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'mangaId', values);
  }

  Future<int> deleteAllByMangaId(List<String> mangaIdValues) {
    final values = mangaIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'mangaId', values);
  }

  int deleteAllByMangaIdSync(List<String> mangaIdValues) {
    final values = mangaIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'mangaId', values);
  }

  Future<Id> putByMangaId(Manga object) {
    return putByIndex(r'mangaId', object);
  }

  Id putByMangaIdSync(Manga object, {bool saveLinks = true}) {
    return putByIndexSync(r'mangaId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByMangaId(List<Manga> objects) {
    return putAllByIndex(r'mangaId', objects);
  }

  List<Id> putAllByMangaIdSync(List<Manga> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'mangaId', objects, saveLinks: saveLinks);
  }
}

extension MangaQueryWhereSort on QueryBuilder<Manga, Manga, QWhere> {
  QueryBuilder<Manga, Manga, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MangaQueryWhere on QueryBuilder<Manga, Manga, QWhereClause> {
  QueryBuilder<Manga, Manga, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Manga, Manga, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Manga, Manga, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Manga, Manga, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterWhereClause> mangaIdEqualTo(String mangaId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'mangaId',
        value: [mangaId],
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterWhereClause> mangaIdNotEqualTo(
      String mangaId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'mangaId',
              lower: [],
              upper: [mangaId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'mangaId',
              lower: [mangaId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'mangaId',
              lower: [mangaId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'mangaId',
              lower: [],
              upper: [mangaId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension MangaQueryFilter on QueryBuilder<Manga, Manga, QFilterCondition> {
  QueryBuilder<Manga, Manga, QAfterFilterCondition> adultIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'adult',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> adultIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'adult',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> adultEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'adult',
        value: value,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> authorEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> authorGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> authorLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> authorBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'author',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> authorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> authorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> authorContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> authorMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'author',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> authorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'author',
        value: '',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> authorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'author',
        value: '',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> categoriesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition>
      categoriesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'categories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> categoriesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'categories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> categoriesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'categories',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> categoriesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'categories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> categoriesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'categories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> categoriesElementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'categories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> categoriesElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'categories',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> categoriesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categories',
        value: '',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition>
      categoriesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'categories',
        value: '',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> categoriesLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> categoriesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> categoriesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> categoriesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> categoriesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> categoriesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> coverLocalPathEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coverLocalPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> coverLocalPathGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'coverLocalPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> coverLocalPathLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'coverLocalPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> coverLocalPathBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'coverLocalPath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> coverLocalPathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'coverLocalPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> coverLocalPathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'coverLocalPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> coverLocalPathContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'coverLocalPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> coverLocalPathMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'coverLocalPath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> coverLocalPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coverLocalPath',
        value: '',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> coverLocalPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'coverLocalPath',
        value: '',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> createdAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> createdAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> createdAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> createdAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> dateCreatedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dateCreated',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> dateCreatedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dateCreated',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> dateCreatedEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateCreated',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> dateCreatedGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dateCreated',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> dateCreatedLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dateCreated',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> dateCreatedBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dateCreated',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> dateCreatedStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dateCreated',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> dateCreatedEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dateCreated',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> dateCreatedContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dateCreated',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> dateCreatedMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dateCreated',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> dateCreatedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateCreated',
        value: '',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> dateCreatedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dateCreated',
        value: '',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> dateUpdatedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dateUpdated',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> dateUpdatedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dateUpdated',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> dateUpdatedEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateUpdated',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> dateUpdatedGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dateUpdated',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> dateUpdatedLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dateUpdated',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> dateUpdatedBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dateUpdated',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> dateUpdatedStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dateUpdated',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> dateUpdatedEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dateUpdated',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> dateUpdatedContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dateUpdated',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> dateUpdatedMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dateUpdated',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> dateUpdatedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateUpdated',
        value: '',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> dateUpdatedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dateUpdated',
        value: '',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> descriptionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> descriptionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> favoriteCountEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'favoriteCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> favoriteCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'favoriteCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> favoriteCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'favoriteCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> favoriteCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'favoriteCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> imageUrlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> imageUrlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> imageUrlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> imageUrlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imageUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> imageUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> imageUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> imageUrlContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> imageUrlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imageUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> imageUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> imageUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> isCompletedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> isDownloadedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDownloaded',
        value: value,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> isFavoriteEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isFavorite',
        value: value,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> lastBookUpdateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastBookUpdate',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> lastBookUpdateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastBookUpdate',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> lastBookUpdateEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastBookUpdate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> lastBookUpdateGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastBookUpdate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> lastBookUpdateLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastBookUpdate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> lastBookUpdateBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastBookUpdate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> lastBookUpdateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lastBookUpdate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> lastBookUpdateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lastBookUpdate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> lastBookUpdateContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lastBookUpdate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> lastBookUpdateMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lastBookUpdate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> lastBookUpdateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastBookUpdate',
        value: '',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> lastBookUpdateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lastBookUpdate',
        value: '',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> lastChapterUpdateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastChapterUpdate',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition>
      lastChapterUpdateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastChapterUpdate',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> lastChapterUpdateEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastChapterUpdate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition>
      lastChapterUpdateGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastChapterUpdate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> lastChapterUpdateLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastChapterUpdate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> lastChapterUpdateBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastChapterUpdate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> lastChapterUpdateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lastChapterUpdate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> lastChapterUpdateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lastChapterUpdate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> lastChapterUpdateContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lastChapterUpdate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> lastChapterUpdateMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lastChapterUpdate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> lastChapterUpdateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastChapterUpdate',
        value: '',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition>
      lastChapterUpdateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lastChapterUpdate',
        value: '',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> localPathEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> localPathGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'localPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> localPathLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'localPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> localPathBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'localPath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> localPathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'localPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> localPathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'localPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> localPathContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'localPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> localPathMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'localPath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> localPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localPath',
        value: '',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> localPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'localPath',
        value: '',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> mangaIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mangaId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> mangaIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mangaId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> mangaIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mangaId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> mangaIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mangaId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> mangaIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'mangaId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> mangaIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'mangaId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> mangaIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mangaId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> mangaIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mangaId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> mangaIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mangaId',
        value: '',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> mangaIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'mangaId',
        value: '',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> monthViewsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'monthViews',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> monthViewsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'monthViews',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> monthViewsEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'monthViews',
        value: value,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> monthViewsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'monthViews',
        value: value,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> monthViewsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'monthViews',
        value: value,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> monthViewsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'monthViews',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> ntrIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ntr',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> ntrIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ntr',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> ntrEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ntr',
        value: value,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> otherTitlesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'otherTitles',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition>
      otherTitlesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'otherTitles',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> otherTitlesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'otherTitles',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> otherTitlesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'otherTitles',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition>
      otherTitlesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'otherTitles',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> otherTitlesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'otherTitles',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> otherTitlesElementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'otherTitles',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> otherTitlesElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'otherTitles',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition>
      otherTitlesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'otherTitles',
        value: '',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition>
      otherTitlesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'otherTitles',
        value: '',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> otherTitlesLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'otherTitles',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> otherTitlesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'otherTitles',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> otherTitlesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'otherTitles',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> otherTitlesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'otherTitles',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition>
      otherTitlesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'otherTitles',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> otherTitlesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'otherTitles',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> reasonsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reasons',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> reasonsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reasons',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> reasonsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reasons',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> reasonsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reasons',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> reasonsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'reasons',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> reasonsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'reasons',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> reasonsElementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'reasons',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> reasonsElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'reasons',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> reasonsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reasons',
        value: '',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> reasonsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'reasons',
        value: '',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> reasonsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'reasons',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> reasonsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'reasons',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> reasonsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'reasons',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> reasonsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'reasons',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> reasonsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'reasons',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> reasonsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'reasons',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> sexualContentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sexualContent',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> sexualContentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sexualContent',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> sexualContentEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sexualContent',
        value: value,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> sexyLevelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sexyLevel',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> sexyLevelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sexyLevel',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> sexyLevelEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sexyLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> sexyLevelGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sexyLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> sexyLevelLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sexyLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> sexyLevelBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sexyLevel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> sexyLevelReasonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sexyLevelReason',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> sexyLevelReasonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sexyLevelReason',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> sexyLevelReasonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sexyLevelReason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> sexyLevelReasonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sexyLevelReason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> sexyLevelReasonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sexyLevelReason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> sexyLevelReasonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sexyLevelReason',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> sexyLevelReasonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sexyLevelReason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> sexyLevelReasonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sexyLevelReason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> sexyLevelReasonContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sexyLevelReason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> sexyLevelReasonMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sexyLevelReason',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> sexyLevelReasonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sexyLevelReason',
        value: '',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition>
      sexyLevelReasonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sexyLevelReason',
        value: '',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> statusEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> statusGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> statusLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> statusBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> statusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> statusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> statusContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> statusMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> titleContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> titleMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> updatedAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> updatedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> updatedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> updatedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> viewsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'views',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> viewsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'views',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> viewsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'views',
        value: value,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> viewsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'views',
        value: value,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> viewsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'views',
        value: value,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> viewsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'views',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> warningsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'warnings',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> warningsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'warnings',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> warningsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'warnings',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> warningsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'warnings',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> warningsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'warnings',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> warningsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'warnings',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> warningsElementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'warnings',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> warningsElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'warnings',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> warningsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'warnings',
        value: '',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition>
      warningsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'warnings',
        value: '',
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> warningsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'warnings',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> warningsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'warnings',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> warningsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'warnings',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> warningsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'warnings',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> warningsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'warnings',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> warningsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'warnings',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> yearEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'year',
        value: value,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> yearGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'year',
        value: value,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> yearLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'year',
        value: value,
      ));
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> yearBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'year',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension MangaQueryObject on QueryBuilder<Manga, Manga, QFilterCondition> {}

extension MangaQueryLinks on QueryBuilder<Manga, Manga, QFilterCondition> {
  QueryBuilder<Manga, Manga, QAfterFilterCondition> chapters(
      FilterQuery<Chapter> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'chapters');
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> chaptersLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'chapters', length, true, length, true);
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> chaptersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'chapters', 0, true, 0, true);
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> chaptersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'chapters', 0, false, 999999, true);
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> chaptersLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'chapters', 0, true, length, include);
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> chaptersLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'chapters', length, include, 999999, true);
    });
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> chaptersLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'chapters', lower, includeLower, upper, includeUpper);
    });
  }
}

extension MangaQuerySortBy on QueryBuilder<Manga, Manga, QSortBy> {
  QueryBuilder<Manga, Manga, QAfterSortBy> sortByAdult() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adult', Sort.asc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortByAdultDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adult', Sort.desc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortByAuthor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'author', Sort.asc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortByAuthorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'author', Sort.desc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortByCoverLocalPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverLocalPath', Sort.asc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortByCoverLocalPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverLocalPath', Sort.desc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortByDateCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateCreated', Sort.asc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortByDateCreatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateCreated', Sort.desc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortByDateUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateUpdated', Sort.asc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortByDateUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateUpdated', Sort.desc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortByFavoriteCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'favoriteCount', Sort.asc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortByFavoriteCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'favoriteCount', Sort.desc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortByImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.asc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortByImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.desc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortByIsDownloaded() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDownloaded', Sort.asc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortByIsDownloadedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDownloaded', Sort.desc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.asc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortByIsFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.desc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortByLastBookUpdate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastBookUpdate', Sort.asc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortByLastBookUpdateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastBookUpdate', Sort.desc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortByLastChapterUpdate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastChapterUpdate', Sort.asc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortByLastChapterUpdateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastChapterUpdate', Sort.desc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortByLocalPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localPath', Sort.asc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortByLocalPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localPath', Sort.desc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortByMangaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mangaId', Sort.asc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortByMangaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mangaId', Sort.desc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortByMonthViews() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthViews', Sort.asc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortByMonthViewsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthViews', Sort.desc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortByNtr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ntr', Sort.asc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortByNtrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ntr', Sort.desc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortBySexualContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sexualContent', Sort.asc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortBySexualContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sexualContent', Sort.desc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortBySexyLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sexyLevel', Sort.asc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortBySexyLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sexyLevel', Sort.desc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortBySexyLevelReason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sexyLevelReason', Sort.asc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortBySexyLevelReasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sexyLevelReason', Sort.desc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortByViews() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'views', Sort.asc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortByViewsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'views', Sort.desc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.asc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortByYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.desc);
    });
  }
}

extension MangaQuerySortThenBy on QueryBuilder<Manga, Manga, QSortThenBy> {
  QueryBuilder<Manga, Manga, QAfterSortBy> thenByAdult() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adult', Sort.asc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenByAdultDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adult', Sort.desc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenByAuthor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'author', Sort.asc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenByAuthorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'author', Sort.desc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenByCoverLocalPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverLocalPath', Sort.asc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenByCoverLocalPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverLocalPath', Sort.desc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenByDateCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateCreated', Sort.asc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenByDateCreatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateCreated', Sort.desc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenByDateUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateUpdated', Sort.asc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenByDateUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateUpdated', Sort.desc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenByFavoriteCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'favoriteCount', Sort.asc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenByFavoriteCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'favoriteCount', Sort.desc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenByImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.asc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenByImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.desc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenByIsDownloaded() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDownloaded', Sort.asc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenByIsDownloadedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDownloaded', Sort.desc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.asc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenByIsFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.desc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenByLastBookUpdate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastBookUpdate', Sort.asc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenByLastBookUpdateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastBookUpdate', Sort.desc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenByLastChapterUpdate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastChapterUpdate', Sort.asc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenByLastChapterUpdateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastChapterUpdate', Sort.desc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenByLocalPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localPath', Sort.asc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenByLocalPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localPath', Sort.desc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenByMangaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mangaId', Sort.asc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenByMangaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mangaId', Sort.desc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenByMonthViews() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthViews', Sort.asc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenByMonthViewsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthViews', Sort.desc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenByNtr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ntr', Sort.asc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenByNtrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ntr', Sort.desc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenBySexualContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sexualContent', Sort.asc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenBySexualContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sexualContent', Sort.desc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenBySexyLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sexyLevel', Sort.asc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenBySexyLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sexyLevel', Sort.desc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenBySexyLevelReason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sexyLevelReason', Sort.asc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenBySexyLevelReasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sexyLevelReason', Sort.desc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenByViews() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'views', Sort.asc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenByViewsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'views', Sort.desc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.asc);
    });
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenByYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.desc);
    });
  }
}

extension MangaQueryWhereDistinct on QueryBuilder<Manga, Manga, QDistinct> {
  QueryBuilder<Manga, Manga, QDistinct> distinctByAdult() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'adult');
    });
  }

  QueryBuilder<Manga, Manga, QDistinct> distinctByAuthor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'author', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Manga, Manga, QDistinct> distinctByCategories() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'categories');
    });
  }

  QueryBuilder<Manga, Manga, QDistinct> distinctByCoverLocalPath(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coverLocalPath',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Manga, Manga, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<Manga, Manga, QDistinct> distinctByDateCreated(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateCreated', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Manga, Manga, QDistinct> distinctByDateUpdated(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateUpdated', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Manga, Manga, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Manga, Manga, QDistinct> distinctByFavoriteCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'favoriteCount');
    });
  }

  QueryBuilder<Manga, Manga, QDistinct> distinctByImageUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imageUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Manga, Manga, QDistinct> distinctByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCompleted');
    });
  }

  QueryBuilder<Manga, Manga, QDistinct> distinctByIsDownloaded() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDownloaded');
    });
  }

  QueryBuilder<Manga, Manga, QDistinct> distinctByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isFavorite');
    });
  }

  QueryBuilder<Manga, Manga, QDistinct> distinctByLastBookUpdate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastBookUpdate',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Manga, Manga, QDistinct> distinctByLastChapterUpdate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastChapterUpdate',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Manga, Manga, QDistinct> distinctByLocalPath(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'localPath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Manga, Manga, QDistinct> distinctByMangaId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mangaId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Manga, Manga, QDistinct> distinctByMonthViews() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'monthViews');
    });
  }

  QueryBuilder<Manga, Manga, QDistinct> distinctByNtr() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ntr');
    });
  }

  QueryBuilder<Manga, Manga, QDistinct> distinctByOtherTitles() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'otherTitles');
    });
  }

  QueryBuilder<Manga, Manga, QDistinct> distinctByReasons() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reasons');
    });
  }

  QueryBuilder<Manga, Manga, QDistinct> distinctBySexualContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sexualContent');
    });
  }

  QueryBuilder<Manga, Manga, QDistinct> distinctBySexyLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sexyLevel');
    });
  }

  QueryBuilder<Manga, Manga, QDistinct> distinctBySexyLevelReason(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sexyLevelReason',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Manga, Manga, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Manga, Manga, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Manga, Manga, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<Manga, Manga, QDistinct> distinctByViews() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'views');
    });
  }

  QueryBuilder<Manga, Manga, QDistinct> distinctByWarnings() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'warnings');
    });
  }

  QueryBuilder<Manga, Manga, QDistinct> distinctByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'year');
    });
  }
}

extension MangaQueryProperty on QueryBuilder<Manga, Manga, QQueryProperty> {
  QueryBuilder<Manga, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Manga, bool?, QQueryOperations> adultProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'adult');
    });
  }

  QueryBuilder<Manga, String, QQueryOperations> authorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'author');
    });
  }

  QueryBuilder<Manga, List<String>, QQueryOperations> categoriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'categories');
    });
  }

  QueryBuilder<Manga, String, QQueryOperations> coverLocalPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coverLocalPath');
    });
  }

  QueryBuilder<Manga, DateTime?, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<Manga, String?, QQueryOperations> dateCreatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateCreated');
    });
  }

  QueryBuilder<Manga, String?, QQueryOperations> dateUpdatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateUpdated');
    });
  }

  QueryBuilder<Manga, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<Manga, int, QQueryOperations> favoriteCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'favoriteCount');
    });
  }

  QueryBuilder<Manga, String, QQueryOperations> imageUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imageUrl');
    });
  }

  QueryBuilder<Manga, bool, QQueryOperations> isCompletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCompleted');
    });
  }

  QueryBuilder<Manga, bool, QQueryOperations> isDownloadedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDownloaded');
    });
  }

  QueryBuilder<Manga, bool, QQueryOperations> isFavoriteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isFavorite');
    });
  }

  QueryBuilder<Manga, String?, QQueryOperations> lastBookUpdateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastBookUpdate');
    });
  }

  QueryBuilder<Manga, String?, QQueryOperations> lastChapterUpdateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastChapterUpdate');
    });
  }

  QueryBuilder<Manga, String, QQueryOperations> localPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localPath');
    });
  }

  QueryBuilder<Manga, String, QQueryOperations> mangaIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mangaId');
    });
  }

  QueryBuilder<Manga, int?, QQueryOperations> monthViewsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'monthViews');
    });
  }

  QueryBuilder<Manga, bool?, QQueryOperations> ntrProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ntr');
    });
  }

  QueryBuilder<Manga, List<String>, QQueryOperations> otherTitlesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'otherTitles');
    });
  }

  QueryBuilder<Manga, List<String>, QQueryOperations> reasonsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reasons');
    });
  }

  QueryBuilder<Manga, bool?, QQueryOperations> sexualContentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sexualContent');
    });
  }

  QueryBuilder<Manga, int?, QQueryOperations> sexyLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sexyLevel');
    });
  }

  QueryBuilder<Manga, String?, QQueryOperations> sexyLevelReasonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sexyLevelReason');
    });
  }

  QueryBuilder<Manga, String, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<Manga, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<Manga, DateTime?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<Manga, int?, QQueryOperations> viewsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'views');
    });
  }

  QueryBuilder<Manga, List<String>, QQueryOperations> warningsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'warnings');
    });
  }

  QueryBuilder<Manga, int, QQueryOperations> yearProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'year');
    });
  }
}
