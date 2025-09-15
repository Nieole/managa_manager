import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Query$ComicById {
  factory Variables$Query$ComicById({required String comicId}) =>
      Variables$Query$ComicById._({
        r'comicId': comicId,
      });

  Variables$Query$ComicById._(this._$data);

  factory Variables$Query$ComicById.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$comicId = data['comicId'];
    result$data['comicId'] = (l$comicId as String);
    return Variables$Query$ComicById._(result$data);
  }

  Map<String, dynamic> _$data;

  String get comicId => (_$data['comicId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$comicId = comicId;
    result$data['comicId'] = l$comicId;
    return result$data;
  }

  CopyWith$Variables$Query$ComicById<Variables$Query$ComicById> get copyWith =>
      CopyWith$Variables$Query$ComicById(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$ComicById ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$comicId = comicId;
    final lOther$comicId = other.comicId;
    if (l$comicId != lOther$comicId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$comicId = comicId;
    return Object.hashAll([l$comicId]);
  }
}

abstract class CopyWith$Variables$Query$ComicById<TRes> {
  factory CopyWith$Variables$Query$ComicById(
    Variables$Query$ComicById instance,
    TRes Function(Variables$Query$ComicById) then,
  ) = _CopyWithImpl$Variables$Query$ComicById;

  factory CopyWith$Variables$Query$ComicById.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$ComicById;

  TRes call({String? comicId});
}

class _CopyWithImpl$Variables$Query$ComicById<TRes>
    implements CopyWith$Variables$Query$ComicById<TRes> {
  _CopyWithImpl$Variables$Query$ComicById(
    this._instance,
    this._then,
  );

  final Variables$Query$ComicById _instance;

  final TRes Function(Variables$Query$ComicById) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? comicId = _undefined}) =>
      _then(Variables$Query$ComicById._({
        ..._instance._$data,
        if (comicId != _undefined && comicId != null)
          'comicId': (comicId as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$ComicById<TRes>
    implements CopyWith$Variables$Query$ComicById<TRes> {
  _CopyWithStubImpl$Variables$Query$ComicById(this._res);

  TRes _res;

  call({String? comicId}) => _res;
}

class Query$ComicById {
  Query$ComicById({
    this.comicById,
    this.$__typename = 'Query',
  });

  factory Query$ComicById.fromJson(Map<String, dynamic> json) {
    final l$comicById = json['comicById'];
    final l$$__typename = json['__typename'];
    return Query$ComicById(
      comicById: l$comicById == null
          ? null
          : Query$ComicById$comicById.fromJson(
              (l$comicById as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$ComicById$comicById? comicById;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$comicById = comicById;
    _resultData['comicById'] = l$comicById?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$comicById = comicById;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$comicById,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$ComicById || runtimeType != other.runtimeType) {
      return false;
    }
    final l$comicById = comicById;
    final lOther$comicById = other.comicById;
    if (l$comicById != lOther$comicById) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$ComicById on Query$ComicById {
  CopyWith$Query$ComicById<Query$ComicById> get copyWith =>
      CopyWith$Query$ComicById(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$ComicById<TRes> {
  factory CopyWith$Query$ComicById(
    Query$ComicById instance,
    TRes Function(Query$ComicById) then,
  ) = _CopyWithImpl$Query$ComicById;

  factory CopyWith$Query$ComicById.stub(TRes res) =
      _CopyWithStubImpl$Query$ComicById;

  TRes call({
    Query$ComicById$comicById? comicById,
    String? $__typename,
  });
  CopyWith$Query$ComicById$comicById<TRes> get comicById;
}

class _CopyWithImpl$Query$ComicById<TRes>
    implements CopyWith$Query$ComicById<TRes> {
  _CopyWithImpl$Query$ComicById(
    this._instance,
    this._then,
  );

  final Query$ComicById _instance;

  final TRes Function(Query$ComicById) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? comicById = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$ComicById(
        comicById: comicById == _undefined
            ? _instance.comicById
            : (comicById as Query$ComicById$comicById?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$ComicById$comicById<TRes> get comicById {
    final local$comicById = _instance.comicById;
    return local$comicById == null
        ? CopyWith$Query$ComicById$comicById.stub(_then(_instance))
        : CopyWith$Query$ComicById$comicById(
            local$comicById, (e) => call(comicById: e));
  }
}

class _CopyWithStubImpl$Query$ComicById<TRes>
    implements CopyWith$Query$ComicById<TRes> {
  _CopyWithStubImpl$Query$ComicById(this._res);

  TRes _res;

  call({
    Query$ComicById$comicById? comicById,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$ComicById$comicById<TRes> get comicById =>
      CopyWith$Query$ComicById$comicById.stub(_res);
}

const documentNodeQueryComicById = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'ComicById'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'comicId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'comicById'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'comicId'),
            value: VariableNode(name: NameNode(value: 'comicId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'title'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'year'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'imageUrl'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'adult'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'dateCreated'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'dateUpdated'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'views'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'monthViews'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'favoriteCount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'lastBookUpdate'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'lastChapterUpdate'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'description'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'reasons'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'sexyLevel'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'sexyLevelReason'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'sexualContent'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'ntr'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'warnings'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'otherTitles'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'authors'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'name'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'categories'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'name'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Query$ComicById _parserFn$Query$ComicById(Map<String, dynamic> data) =>
    Query$ComicById.fromJson(data);
typedef OnQueryComplete$Query$ComicById = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$ComicById?,
);

class Options$Query$ComicById extends graphql.QueryOptions<Query$ComicById> {
  Options$Query$ComicById({
    String? operationName,
    required Variables$Query$ComicById variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$ComicById? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$ComicById? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$ComicById(data),
                  ),
          onError: onError,
          document: documentNodeQueryComicById,
          parserFn: _parserFn$Query$ComicById,
        );

  final OnQueryComplete$Query$ComicById? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$ComicById
    extends graphql.WatchQueryOptions<Query$ComicById> {
  WatchOptions$Query$ComicById({
    String? operationName,
    required Variables$Query$ComicById variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$ComicById? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryComicById,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$ComicById,
        );
}

class FetchMoreOptions$Query$ComicById extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$ComicById({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$ComicById variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryComicById,
        );
}

extension ClientExtension$Query$ComicById on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$ComicById>> query$ComicById(
          Options$Query$ComicById options) async =>
      await this.query(options);

  graphql.ObservableQuery<Query$ComicById> watchQuery$ComicById(
          WatchOptions$Query$ComicById options) =>
      this.watchQuery(options);

  void writeQuery$ComicById({
    required Query$ComicById data,
    required Variables$Query$ComicById variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryComicById),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );

  Query$ComicById? readQuery$ComicById({
    required Variables$Query$ComicById variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryComicById),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$ComicById.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$ComicById> useQuery$ComicById(
        Options$Query$ComicById options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$ComicById> useWatchQuery$ComicById(
        WatchOptions$Query$ComicById options) =>
    graphql_flutter.useWatchQuery(options);

class Query$ComicById$Widget extends graphql_flutter.Query<Query$ComicById> {
  Query$ComicById$Widget({
    widgets.Key? key,
    required Options$Query$ComicById options,
    required graphql_flutter.QueryBuilder<Query$ComicById> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$ComicById$comicById {
  Query$ComicById$comicById({
    required this.id,
    required this.title,
    required this.status,
    required this.year,
    required this.imageUrl,
    this.adult,
    this.dateCreated,
    this.dateUpdated,
    this.views,
    this.monthViews,
    required this.favoriteCount,
    this.lastBookUpdate,
    this.lastChapterUpdate,
    this.description,
    required this.reasons,
    this.sexyLevel,
    this.sexyLevelReason,
    this.sexualContent,
    this.ntr,
    required this.warnings,
    required this.otherTitles,
    required this.authors,
    required this.categories,
    this.$__typename = 'Comic',
  });

  factory Query$ComicById$comicById.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$status = json['status'];
    final l$year = json['year'];
    final l$imageUrl = json['imageUrl'];
    final l$adult = json['adult'];
    final l$dateCreated = json['dateCreated'];
    final l$dateUpdated = json['dateUpdated'];
    final l$views = json['views'];
    final l$monthViews = json['monthViews'];
    final l$favoriteCount = json['favoriteCount'];
    final l$lastBookUpdate = json['lastBookUpdate'];
    final l$lastChapterUpdate = json['lastChapterUpdate'];
    final l$description = json['description'];
    final l$reasons = json['reasons'];
    final l$sexyLevel = json['sexyLevel'];
    final l$sexyLevelReason = json['sexyLevelReason'];
    final l$sexualContent = json['sexualContent'];
    final l$ntr = json['ntr'];
    final l$warnings = json['warnings'];
    final l$otherTitles = json['otherTitles'];
    final l$authors = json['authors'];
    final l$categories = json['categories'];
    final l$$__typename = json['__typename'];
    return Query$ComicById$comicById(
      id: (l$id as String),
      title: (l$title as String),
      status: (l$status as String),
      year: (l$year as int),
      imageUrl: (l$imageUrl as String),
      adult: (l$adult as bool?),
      dateCreated: (l$dateCreated as String?),
      dateUpdated: (l$dateUpdated as String?),
      views: (l$views as int?),
      monthViews: (l$monthViews as int?),
      favoriteCount: (l$favoriteCount as int),
      lastBookUpdate: (l$lastBookUpdate as String?),
      lastChapterUpdate: (l$lastChapterUpdate as String?),
      description: (l$description as String?),
      reasons: (l$reasons as List<dynamic>).map((e) => (e as String?)).toList(),
      sexyLevel: (l$sexyLevel as int?),
      sexyLevelReason: (l$sexyLevelReason as String?),
      sexualContent: (l$sexualContent as bool?),
      ntr: (l$ntr as bool?),
      warnings:
          (l$warnings as List<dynamic>).map((e) => (e as String?)).toList(),
      otherTitles:
          (l$otherTitles as List<dynamic>).map((e) => (e as String?)).toList(),
      authors: (l$authors as List<dynamic>)
          .map((e) => e == null
              ? null
              : Query$ComicById$comicById$authors.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      categories: (l$categories as List<dynamic>)
          .map((e) => e == null
              ? null
              : Query$ComicById$comicById$categories.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final String status;

  final int year;

  final String imageUrl;

  final bool? adult;

  final String? dateCreated;

  final String? dateUpdated;

  final int? views;

  final int? monthViews;

  final int favoriteCount;

  final String? lastBookUpdate;

  final String? lastChapterUpdate;

  final String? description;

  final List<String?> reasons;

  final int? sexyLevel;

  final String? sexyLevelReason;

  final bool? sexualContent;

  final bool? ntr;

  final List<String?> warnings;

  final List<String?> otherTitles;

  final List<Query$ComicById$comicById$authors?> authors;

  final List<Query$ComicById$comicById$categories?> categories;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$year = year;
    _resultData['year'] = l$year;
    final l$imageUrl = imageUrl;
    _resultData['imageUrl'] = l$imageUrl;
    final l$adult = adult;
    _resultData['adult'] = l$adult;
    final l$dateCreated = dateCreated;
    _resultData['dateCreated'] = l$dateCreated;
    final l$dateUpdated = dateUpdated;
    _resultData['dateUpdated'] = l$dateUpdated;
    final l$views = views;
    _resultData['views'] = l$views;
    final l$monthViews = monthViews;
    _resultData['monthViews'] = l$monthViews;
    final l$favoriteCount = favoriteCount;
    _resultData['favoriteCount'] = l$favoriteCount;
    final l$lastBookUpdate = lastBookUpdate;
    _resultData['lastBookUpdate'] = l$lastBookUpdate;
    final l$lastChapterUpdate = lastChapterUpdate;
    _resultData['lastChapterUpdate'] = l$lastChapterUpdate;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$reasons = reasons;
    _resultData['reasons'] = l$reasons.map((e) => e).toList();
    final l$sexyLevel = sexyLevel;
    _resultData['sexyLevel'] = l$sexyLevel;
    final l$sexyLevelReason = sexyLevelReason;
    _resultData['sexyLevelReason'] = l$sexyLevelReason;
    final l$sexualContent = sexualContent;
    _resultData['sexualContent'] = l$sexualContent;
    final l$ntr = ntr;
    _resultData['ntr'] = l$ntr;
    final l$warnings = warnings;
    _resultData['warnings'] = l$warnings.map((e) => e).toList();
    final l$otherTitles = otherTitles;
    _resultData['otherTitles'] = l$otherTitles.map((e) => e).toList();
    final l$authors = authors;
    _resultData['authors'] = l$authors.map((e) => e?.toJson()).toList();
    final l$categories = categories;
    _resultData['categories'] = l$categories.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$status = status;
    final l$year = year;
    final l$imageUrl = imageUrl;
    final l$adult = adult;
    final l$dateCreated = dateCreated;
    final l$dateUpdated = dateUpdated;
    final l$views = views;
    final l$monthViews = monthViews;
    final l$favoriteCount = favoriteCount;
    final l$lastBookUpdate = lastBookUpdate;
    final l$lastChapterUpdate = lastChapterUpdate;
    final l$description = description;
    final l$reasons = reasons;
    final l$sexyLevel = sexyLevel;
    final l$sexyLevelReason = sexyLevelReason;
    final l$sexualContent = sexualContent;
    final l$ntr = ntr;
    final l$warnings = warnings;
    final l$otherTitles = otherTitles;
    final l$authors = authors;
    final l$categories = categories;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$status,
      l$year,
      l$imageUrl,
      l$adult,
      l$dateCreated,
      l$dateUpdated,
      l$views,
      l$monthViews,
      l$favoriteCount,
      l$lastBookUpdate,
      l$lastChapterUpdate,
      l$description,
      Object.hashAll(l$reasons.map((v) => v)),
      l$sexyLevel,
      l$sexyLevelReason,
      l$sexualContent,
      l$ntr,
      Object.hashAll(l$warnings.map((v) => v)),
      Object.hashAll(l$otherTitles.map((v) => v)),
      Object.hashAll(l$authors.map((v) => v)),
      Object.hashAll(l$categories.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$ComicById$comicById ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$year = year;
    final lOther$year = other.year;
    if (l$year != lOther$year) {
      return false;
    }
    final l$imageUrl = imageUrl;
    final lOther$imageUrl = other.imageUrl;
    if (l$imageUrl != lOther$imageUrl) {
      return false;
    }
    final l$adult = adult;
    final lOther$adult = other.adult;
    if (l$adult != lOther$adult) {
      return false;
    }
    final l$dateCreated = dateCreated;
    final lOther$dateCreated = other.dateCreated;
    if (l$dateCreated != lOther$dateCreated) {
      return false;
    }
    final l$dateUpdated = dateUpdated;
    final lOther$dateUpdated = other.dateUpdated;
    if (l$dateUpdated != lOther$dateUpdated) {
      return false;
    }
    final l$views = views;
    final lOther$views = other.views;
    if (l$views != lOther$views) {
      return false;
    }
    final l$monthViews = monthViews;
    final lOther$monthViews = other.monthViews;
    if (l$monthViews != lOther$monthViews) {
      return false;
    }
    final l$favoriteCount = favoriteCount;
    final lOther$favoriteCount = other.favoriteCount;
    if (l$favoriteCount != lOther$favoriteCount) {
      return false;
    }
    final l$lastBookUpdate = lastBookUpdate;
    final lOther$lastBookUpdate = other.lastBookUpdate;
    if (l$lastBookUpdate != lOther$lastBookUpdate) {
      return false;
    }
    final l$lastChapterUpdate = lastChapterUpdate;
    final lOther$lastChapterUpdate = other.lastChapterUpdate;
    if (l$lastChapterUpdate != lOther$lastChapterUpdate) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$reasons = reasons;
    final lOther$reasons = other.reasons;
    if (l$reasons.length != lOther$reasons.length) {
      return false;
    }
    for (int i = 0; i < l$reasons.length; i++) {
      final l$reasons$entry = l$reasons[i];
      final lOther$reasons$entry = lOther$reasons[i];
      if (l$reasons$entry != lOther$reasons$entry) {
        return false;
      }
    }
    final l$sexyLevel = sexyLevel;
    final lOther$sexyLevel = other.sexyLevel;
    if (l$sexyLevel != lOther$sexyLevel) {
      return false;
    }
    final l$sexyLevelReason = sexyLevelReason;
    final lOther$sexyLevelReason = other.sexyLevelReason;
    if (l$sexyLevelReason != lOther$sexyLevelReason) {
      return false;
    }
    final l$sexualContent = sexualContent;
    final lOther$sexualContent = other.sexualContent;
    if (l$sexualContent != lOther$sexualContent) {
      return false;
    }
    final l$ntr = ntr;
    final lOther$ntr = other.ntr;
    if (l$ntr != lOther$ntr) {
      return false;
    }
    final l$warnings = warnings;
    final lOther$warnings = other.warnings;
    if (l$warnings.length != lOther$warnings.length) {
      return false;
    }
    for (int i = 0; i < l$warnings.length; i++) {
      final l$warnings$entry = l$warnings[i];
      final lOther$warnings$entry = lOther$warnings[i];
      if (l$warnings$entry != lOther$warnings$entry) {
        return false;
      }
    }
    final l$otherTitles = otherTitles;
    final lOther$otherTitles = other.otherTitles;
    if (l$otherTitles.length != lOther$otherTitles.length) {
      return false;
    }
    for (int i = 0; i < l$otherTitles.length; i++) {
      final l$otherTitles$entry = l$otherTitles[i];
      final lOther$otherTitles$entry = lOther$otherTitles[i];
      if (l$otherTitles$entry != lOther$otherTitles$entry) {
        return false;
      }
    }
    final l$authors = authors;
    final lOther$authors = other.authors;
    if (l$authors.length != lOther$authors.length) {
      return false;
    }
    for (int i = 0; i < l$authors.length; i++) {
      final l$authors$entry = l$authors[i];
      final lOther$authors$entry = lOther$authors[i];
      if (l$authors$entry != lOther$authors$entry) {
        return false;
      }
    }
    final l$categories = categories;
    final lOther$categories = other.categories;
    if (l$categories.length != lOther$categories.length) {
      return false;
    }
    for (int i = 0; i < l$categories.length; i++) {
      final l$categories$entry = l$categories[i];
      final lOther$categories$entry = lOther$categories[i];
      if (l$categories$entry != lOther$categories$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$ComicById$comicById
    on Query$ComicById$comicById {
  CopyWith$Query$ComicById$comicById<Query$ComicById$comicById> get copyWith =>
      CopyWith$Query$ComicById$comicById(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$ComicById$comicById<TRes> {
  factory CopyWith$Query$ComicById$comicById(
    Query$ComicById$comicById instance,
    TRes Function(Query$ComicById$comicById) then,
  ) = _CopyWithImpl$Query$ComicById$comicById;

  factory CopyWith$Query$ComicById$comicById.stub(TRes res) =
      _CopyWithStubImpl$Query$ComicById$comicById;

  TRes call({
    String? id,
    String? title,
    String? status,
    int? year,
    String? imageUrl,
    bool? adult,
    String? dateCreated,
    String? dateUpdated,
    int? views,
    int? monthViews,
    int? favoriteCount,
    String? lastBookUpdate,
    String? lastChapterUpdate,
    String? description,
    List<String?>? reasons,
    int? sexyLevel,
    String? sexyLevelReason,
    bool? sexualContent,
    bool? ntr,
    List<String?>? warnings,
    List<String?>? otherTitles,
    List<Query$ComicById$comicById$authors?>? authors,
    List<Query$ComicById$comicById$categories?>? categories,
    String? $__typename,
  });
  TRes authors(
      Iterable<Query$ComicById$comicById$authors?> Function(
              Iterable<
                  CopyWith$Query$ComicById$comicById$authors<
                      Query$ComicById$comicById$authors>?>)
          _fn);
  TRes categories(
      Iterable<Query$ComicById$comicById$categories?> Function(
              Iterable<
                  CopyWith$Query$ComicById$comicById$categories<
                      Query$ComicById$comicById$categories>?>)
          _fn);
}

class _CopyWithImpl$Query$ComicById$comicById<TRes>
    implements CopyWith$Query$ComicById$comicById<TRes> {
  _CopyWithImpl$Query$ComicById$comicById(
    this._instance,
    this._then,
  );

  final Query$ComicById$comicById _instance;

  final TRes Function(Query$ComicById$comicById) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? status = _undefined,
    Object? year = _undefined,
    Object? imageUrl = _undefined,
    Object? adult = _undefined,
    Object? dateCreated = _undefined,
    Object? dateUpdated = _undefined,
    Object? views = _undefined,
    Object? monthViews = _undefined,
    Object? favoriteCount = _undefined,
    Object? lastBookUpdate = _undefined,
    Object? lastChapterUpdate = _undefined,
    Object? description = _undefined,
    Object? reasons = _undefined,
    Object? sexyLevel = _undefined,
    Object? sexyLevelReason = _undefined,
    Object? sexualContent = _undefined,
    Object? ntr = _undefined,
    Object? warnings = _undefined,
    Object? otherTitles = _undefined,
    Object? authors = _undefined,
    Object? categories = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$ComicById$comicById(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        year:
            year == _undefined || year == null ? _instance.year : (year as int),
        imageUrl: imageUrl == _undefined || imageUrl == null
            ? _instance.imageUrl
            : (imageUrl as String),
        adult: adult == _undefined ? _instance.adult : (adult as bool?),
        dateCreated: dateCreated == _undefined
            ? _instance.dateCreated
            : (dateCreated as String?),
        dateUpdated: dateUpdated == _undefined
            ? _instance.dateUpdated
            : (dateUpdated as String?),
        views: views == _undefined ? _instance.views : (views as int?),
        monthViews: monthViews == _undefined
            ? _instance.monthViews
            : (monthViews as int?),
        favoriteCount: favoriteCount == _undefined || favoriteCount == null
            ? _instance.favoriteCount
            : (favoriteCount as int),
        lastBookUpdate: lastBookUpdate == _undefined
            ? _instance.lastBookUpdate
            : (lastBookUpdate as String?),
        lastChapterUpdate: lastChapterUpdate == _undefined
            ? _instance.lastChapterUpdate
            : (lastChapterUpdate as String?),
        description: description == _undefined
            ? _instance.description
            : (description as String?),
        reasons: reasons == _undefined || reasons == null
            ? _instance.reasons
            : (reasons as List<String?>),
        sexyLevel:
            sexyLevel == _undefined ? _instance.sexyLevel : (sexyLevel as int?),
        sexyLevelReason: sexyLevelReason == _undefined
            ? _instance.sexyLevelReason
            : (sexyLevelReason as String?),
        sexualContent: sexualContent == _undefined
            ? _instance.sexualContent
            : (sexualContent as bool?),
        ntr: ntr == _undefined ? _instance.ntr : (ntr as bool?),
        warnings: warnings == _undefined || warnings == null
            ? _instance.warnings
            : (warnings as List<String?>),
        otherTitles: otherTitles == _undefined || otherTitles == null
            ? _instance.otherTitles
            : (otherTitles as List<String?>),
        authors: authors == _undefined || authors == null
            ? _instance.authors
            : (authors as List<Query$ComicById$comicById$authors?>),
        categories: categories == _undefined || categories == null
            ? _instance.categories
            : (categories as List<Query$ComicById$comicById$categories?>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes authors(
          Iterable<Query$ComicById$comicById$authors?> Function(
                  Iterable<
                      CopyWith$Query$ComicById$comicById$authors<
                          Query$ComicById$comicById$authors>?>)
              _fn) =>
      call(
          authors: _fn(_instance.authors.map((e) => e == null
              ? null
              : CopyWith$Query$ComicById$comicById$authors(
                  e,
                  (i) => i,
                ))).toList());

  TRes categories(
          Iterable<Query$ComicById$comicById$categories?> Function(
                  Iterable<
                      CopyWith$Query$ComicById$comicById$categories<
                          Query$ComicById$comicById$categories>?>)
              _fn) =>
      call(
          categories: _fn(_instance.categories.map((e) => e == null
              ? null
              : CopyWith$Query$ComicById$comicById$categories(
                  e,
                  (i) => i,
                ))).toList());
}

class _CopyWithStubImpl$Query$ComicById$comicById<TRes>
    implements CopyWith$Query$ComicById$comicById<TRes> {
  _CopyWithStubImpl$Query$ComicById$comicById(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? status,
    int? year,
    String? imageUrl,
    bool? adult,
    String? dateCreated,
    String? dateUpdated,
    int? views,
    int? monthViews,
    int? favoriteCount,
    String? lastBookUpdate,
    String? lastChapterUpdate,
    String? description,
    List<String?>? reasons,
    int? sexyLevel,
    String? sexyLevelReason,
    bool? sexualContent,
    bool? ntr,
    List<String?>? warnings,
    List<String?>? otherTitles,
    List<Query$ComicById$comicById$authors?>? authors,
    List<Query$ComicById$comicById$categories?>? categories,
    String? $__typename,
  }) =>
      _res;

  authors(_fn) => _res;

  categories(_fn) => _res;
}

class Query$ComicById$comicById$authors {
  Query$ComicById$comicById$authors({
    required this.id,
    required this.name,
    this.$__typename = 'Author',
  });

  factory Query$ComicById$comicById$authors.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$ComicById$comicById$authors(
      id: (l$id as String),
      name: (l$name as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$ComicById$comicById$authors ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$ComicById$comicById$authors
    on Query$ComicById$comicById$authors {
  CopyWith$Query$ComicById$comicById$authors<Query$ComicById$comicById$authors>
      get copyWith => CopyWith$Query$ComicById$comicById$authors(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$ComicById$comicById$authors<TRes> {
  factory CopyWith$Query$ComicById$comicById$authors(
    Query$ComicById$comicById$authors instance,
    TRes Function(Query$ComicById$comicById$authors) then,
  ) = _CopyWithImpl$Query$ComicById$comicById$authors;

  factory CopyWith$Query$ComicById$comicById$authors.stub(TRes res) =
      _CopyWithStubImpl$Query$ComicById$comicById$authors;

  TRes call({
    String? id,
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$ComicById$comicById$authors<TRes>
    implements CopyWith$Query$ComicById$comicById$authors<TRes> {
  _CopyWithImpl$Query$ComicById$comicById$authors(
    this._instance,
    this._then,
  );

  final Query$ComicById$comicById$authors _instance;

  final TRes Function(Query$ComicById$comicById$authors) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$ComicById$comicById$authors(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$ComicById$comicById$authors<TRes>
    implements CopyWith$Query$ComicById$comicById$authors<TRes> {
  _CopyWithStubImpl$Query$ComicById$comicById$authors(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? $__typename,
  }) =>
      _res;
}

class Query$ComicById$comicById$categories {
  Query$ComicById$comicById$categories({
    required this.id,
    required this.name,
    this.$__typename = 'Category',
  });

  factory Query$ComicById$comicById$categories.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$ComicById$comicById$categories(
      id: (l$id as String),
      name: (l$name as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$ComicById$comicById$categories ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$ComicById$comicById$categories
    on Query$ComicById$comicById$categories {
  CopyWith$Query$ComicById$comicById$categories<
          Query$ComicById$comicById$categories>
      get copyWith => CopyWith$Query$ComicById$comicById$categories(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$ComicById$comicById$categories<TRes> {
  factory CopyWith$Query$ComicById$comicById$categories(
    Query$ComicById$comicById$categories instance,
    TRes Function(Query$ComicById$comicById$categories) then,
  ) = _CopyWithImpl$Query$ComicById$comicById$categories;

  factory CopyWith$Query$ComicById$comicById$categories.stub(TRes res) =
      _CopyWithStubImpl$Query$ComicById$comicById$categories;

  TRes call({
    String? id,
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$ComicById$comicById$categories<TRes>
    implements CopyWith$Query$ComicById$comicById$categories<TRes> {
  _CopyWithImpl$Query$ComicById$comicById$categories(
    this._instance,
    this._then,
  );

  final Query$ComicById$comicById$categories _instance;

  final TRes Function(Query$ComicById$comicById$categories) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$ComicById$comicById$categories(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$ComicById$comicById$categories<TRes>
    implements CopyWith$Query$ComicById$comicById$categories<TRes> {
  _CopyWithStubImpl$Query$ComicById$comicById$categories(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? $__typename,
  }) =>
      _res;
}
