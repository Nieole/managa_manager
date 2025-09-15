import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Query$ChaptersByComicId {
  factory Variables$Query$ChaptersByComicId({required String comicId}) =>
      Variables$Query$ChaptersByComicId._({
        r'comicId': comicId,
      });

  Variables$Query$ChaptersByComicId._(this._$data);

  factory Variables$Query$ChaptersByComicId.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$comicId = data['comicId'];
    result$data['comicId'] = (l$comicId as String);
    return Variables$Query$ChaptersByComicId._(result$data);
  }

  Map<String, dynamic> _$data;

  String get comicId => (_$data['comicId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$comicId = comicId;
    result$data['comicId'] = l$comicId;
    return result$data;
  }

  CopyWith$Variables$Query$ChaptersByComicId<Variables$Query$ChaptersByComicId>
      get copyWith => CopyWith$Variables$Query$ChaptersByComicId(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$ChaptersByComicId ||
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

abstract class CopyWith$Variables$Query$ChaptersByComicId<TRes> {
  factory CopyWith$Variables$Query$ChaptersByComicId(
    Variables$Query$ChaptersByComicId instance,
    TRes Function(Variables$Query$ChaptersByComicId) then,
  ) = _CopyWithImpl$Variables$Query$ChaptersByComicId;

  factory CopyWith$Variables$Query$ChaptersByComicId.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$ChaptersByComicId;

  TRes call({String? comicId});
}

class _CopyWithImpl$Variables$Query$ChaptersByComicId<TRes>
    implements CopyWith$Variables$Query$ChaptersByComicId<TRes> {
  _CopyWithImpl$Variables$Query$ChaptersByComicId(
    this._instance,
    this._then,
  );

  final Variables$Query$ChaptersByComicId _instance;

  final TRes Function(Variables$Query$ChaptersByComicId) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? comicId = _undefined}) =>
      _then(Variables$Query$ChaptersByComicId._({
        ..._instance._$data,
        if (comicId != _undefined && comicId != null)
          'comicId': (comicId as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$ChaptersByComicId<TRes>
    implements CopyWith$Variables$Query$ChaptersByComicId<TRes> {
  _CopyWithStubImpl$Variables$Query$ChaptersByComicId(this._res);

  TRes _res;

  call({String? comicId}) => _res;
}

class Query$ChaptersByComicId {
  Query$ChaptersByComicId({
    required this.chaptersByComicId,
    this.$__typename = 'Query',
  });

  factory Query$ChaptersByComicId.fromJson(Map<String, dynamic> json) {
    final l$chaptersByComicId = json['chaptersByComicId'];
    final l$$__typename = json['__typename'];
    return Query$ChaptersByComicId(
      chaptersByComicId: (l$chaptersByComicId as List<dynamic>)
          .map((e) => e == null
              ? null
              : Query$ChaptersByComicId$chaptersByComicId.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$ChaptersByComicId$chaptersByComicId?> chaptersByComicId;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$chaptersByComicId = chaptersByComicId;
    _resultData['chaptersByComicId'] =
        l$chaptersByComicId.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$chaptersByComicId = chaptersByComicId;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$chaptersByComicId.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$ChaptersByComicId || runtimeType != other.runtimeType) {
      return false;
    }
    final l$chaptersByComicId = chaptersByComicId;
    final lOther$chaptersByComicId = other.chaptersByComicId;
    if (l$chaptersByComicId.length != lOther$chaptersByComicId.length) {
      return false;
    }
    for (int i = 0; i < l$chaptersByComicId.length; i++) {
      final l$chaptersByComicId$entry = l$chaptersByComicId[i];
      final lOther$chaptersByComicId$entry = lOther$chaptersByComicId[i];
      if (l$chaptersByComicId$entry != lOther$chaptersByComicId$entry) {
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

extension UtilityExtension$Query$ChaptersByComicId on Query$ChaptersByComicId {
  CopyWith$Query$ChaptersByComicId<Query$ChaptersByComicId> get copyWith =>
      CopyWith$Query$ChaptersByComicId(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$ChaptersByComicId<TRes> {
  factory CopyWith$Query$ChaptersByComicId(
    Query$ChaptersByComicId instance,
    TRes Function(Query$ChaptersByComicId) then,
  ) = _CopyWithImpl$Query$ChaptersByComicId;

  factory CopyWith$Query$ChaptersByComicId.stub(TRes res) =
      _CopyWithStubImpl$Query$ChaptersByComicId;

  TRes call({
    List<Query$ChaptersByComicId$chaptersByComicId?>? chaptersByComicId,
    String? $__typename,
  });
  TRes chaptersByComicId(
      Iterable<Query$ChaptersByComicId$chaptersByComicId?> Function(
              Iterable<
                  CopyWith$Query$ChaptersByComicId$chaptersByComicId<
                      Query$ChaptersByComicId$chaptersByComicId>?>)
          _fn);
}

class _CopyWithImpl$Query$ChaptersByComicId<TRes>
    implements CopyWith$Query$ChaptersByComicId<TRes> {
  _CopyWithImpl$Query$ChaptersByComicId(
    this._instance,
    this._then,
  );

  final Query$ChaptersByComicId _instance;

  final TRes Function(Query$ChaptersByComicId) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? chaptersByComicId = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$ChaptersByComicId(
        chaptersByComicId:
            chaptersByComicId == _undefined || chaptersByComicId == null
                ? _instance.chaptersByComicId
                : (chaptersByComicId
                    as List<Query$ChaptersByComicId$chaptersByComicId?>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes chaptersByComicId(
          Iterable<Query$ChaptersByComicId$chaptersByComicId?> Function(
                  Iterable<
                      CopyWith$Query$ChaptersByComicId$chaptersByComicId<
                          Query$ChaptersByComicId$chaptersByComicId>?>)
              _fn) =>
      call(
          chaptersByComicId:
              _fn(_instance.chaptersByComicId.map((e) => e == null
                  ? null
                  : CopyWith$Query$ChaptersByComicId$chaptersByComicId(
                      e,
                      (i) => i,
                    ))).toList());
}

class _CopyWithStubImpl$Query$ChaptersByComicId<TRes>
    implements CopyWith$Query$ChaptersByComicId<TRes> {
  _CopyWithStubImpl$Query$ChaptersByComicId(this._res);

  TRes _res;

  call({
    List<Query$ChaptersByComicId$chaptersByComicId?>? chaptersByComicId,
    String? $__typename,
  }) =>
      _res;

  chaptersByComicId(_fn) => _res;
}

const documentNodeQueryChaptersByComicId = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'ChaptersByComicId'),
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
        name: NameNode(value: 'chaptersByComicId'),
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
            name: NameNode(value: 'serial'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'type'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'size'),
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
Query$ChaptersByComicId _parserFn$Query$ChaptersByComicId(
        Map<String, dynamic> data) =>
    Query$ChaptersByComicId.fromJson(data);
typedef OnQueryComplete$Query$ChaptersByComicId = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$ChaptersByComicId?,
);

class Options$Query$ChaptersByComicId
    extends graphql.QueryOptions<Query$ChaptersByComicId> {
  Options$Query$ChaptersByComicId({
    String? operationName,
    required Variables$Query$ChaptersByComicId variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$ChaptersByComicId? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$ChaptersByComicId? onComplete,
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
                    data == null
                        ? null
                        : _parserFn$Query$ChaptersByComicId(data),
                  ),
          onError: onError,
          document: documentNodeQueryChaptersByComicId,
          parserFn: _parserFn$Query$ChaptersByComicId,
        );

  final OnQueryComplete$Query$ChaptersByComicId? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$ChaptersByComicId
    extends graphql.WatchQueryOptions<Query$ChaptersByComicId> {
  WatchOptions$Query$ChaptersByComicId({
    String? operationName,
    required Variables$Query$ChaptersByComicId variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$ChaptersByComicId? typedOptimisticResult,
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
          document: documentNodeQueryChaptersByComicId,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$ChaptersByComicId,
        );
}

class FetchMoreOptions$Query$ChaptersByComicId
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$ChaptersByComicId({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$ChaptersByComicId variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryChaptersByComicId,
        );
}

extension ClientExtension$Query$ChaptersByComicId on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$ChaptersByComicId>> query$ChaptersByComicId(
          Options$Query$ChaptersByComicId options) async =>
      await this.query(options);

  graphql.ObservableQuery<Query$ChaptersByComicId> watchQuery$ChaptersByComicId(
          WatchOptions$Query$ChaptersByComicId options) =>
      this.watchQuery(options);

  void writeQuery$ChaptersByComicId({
    required Query$ChaptersByComicId data,
    required Variables$Query$ChaptersByComicId variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryChaptersByComicId),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );

  Query$ChaptersByComicId? readQuery$ChaptersByComicId({
    required Variables$Query$ChaptersByComicId variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryChaptersByComicId),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$ChaptersByComicId.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$ChaptersByComicId>
    useQuery$ChaptersByComicId(Options$Query$ChaptersByComicId options) =>
        graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$ChaptersByComicId>
    useWatchQuery$ChaptersByComicId(
            WatchOptions$Query$ChaptersByComicId options) =>
        graphql_flutter.useWatchQuery(options);

class Query$ChaptersByComicId$Widget
    extends graphql_flutter.Query<Query$ChaptersByComicId> {
  Query$ChaptersByComicId$Widget({
    widgets.Key? key,
    required Options$Query$ChaptersByComicId options,
    required graphql_flutter.QueryBuilder<Query$ChaptersByComicId> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$ChaptersByComicId$chaptersByComicId {
  Query$ChaptersByComicId$chaptersByComicId({
    required this.id,
    required this.serial,
    required this.type,
    required this.size,
    this.dateCreated,
    this.dateUpdated,
    this.$__typename = 'Chapter',
  });

  factory Query$ChaptersByComicId$chaptersByComicId.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$serial = json['serial'];
    final l$type = json['type'];
    final l$size = json['size'];
    final l$dateCreated = json['dateCreated'];
    final l$dateUpdated = json['dateUpdated'];
    final l$$__typename = json['__typename'];
    return Query$ChaptersByComicId$chaptersByComicId(
      id: (l$id as String),
      serial: (l$serial as String),
      type: (l$type as String),
      size: (l$size as int),
      dateCreated: (l$dateCreated as String?),
      dateUpdated: (l$dateUpdated as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String serial;

  final String type;

  final int size;

  final String? dateCreated;

  final String? dateUpdated;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$serial = serial;
    _resultData['serial'] = l$serial;
    final l$type = type;
    _resultData['type'] = l$type;
    final l$size = size;
    _resultData['size'] = l$size;
    final l$dateCreated = dateCreated;
    _resultData['dateCreated'] = l$dateCreated;
    final l$dateUpdated = dateUpdated;
    _resultData['dateUpdated'] = l$dateUpdated;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$serial = serial;
    final l$type = type;
    final l$size = size;
    final l$dateCreated = dateCreated;
    final l$dateUpdated = dateUpdated;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$serial,
      l$type,
      l$size,
      l$dateCreated,
      l$dateUpdated,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$ChaptersByComicId$chaptersByComicId ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$serial = serial;
    final lOther$serial = other.serial;
    if (l$serial != lOther$serial) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$size = size;
    final lOther$size = other.size;
    if (l$size != lOther$size) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$ChaptersByComicId$chaptersByComicId
    on Query$ChaptersByComicId$chaptersByComicId {
  CopyWith$Query$ChaptersByComicId$chaptersByComicId<
          Query$ChaptersByComicId$chaptersByComicId>
      get copyWith => CopyWith$Query$ChaptersByComicId$chaptersByComicId(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$ChaptersByComicId$chaptersByComicId<TRes> {
  factory CopyWith$Query$ChaptersByComicId$chaptersByComicId(
    Query$ChaptersByComicId$chaptersByComicId instance,
    TRes Function(Query$ChaptersByComicId$chaptersByComicId) then,
  ) = _CopyWithImpl$Query$ChaptersByComicId$chaptersByComicId;

  factory CopyWith$Query$ChaptersByComicId$chaptersByComicId.stub(TRes res) =
      _CopyWithStubImpl$Query$ChaptersByComicId$chaptersByComicId;

  TRes call({
    String? id,
    String? serial,
    String? type,
    int? size,
    String? dateCreated,
    String? dateUpdated,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$ChaptersByComicId$chaptersByComicId<TRes>
    implements CopyWith$Query$ChaptersByComicId$chaptersByComicId<TRes> {
  _CopyWithImpl$Query$ChaptersByComicId$chaptersByComicId(
    this._instance,
    this._then,
  );

  final Query$ChaptersByComicId$chaptersByComicId _instance;

  final TRes Function(Query$ChaptersByComicId$chaptersByComicId) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? serial = _undefined,
    Object? type = _undefined,
    Object? size = _undefined,
    Object? dateCreated = _undefined,
    Object? dateUpdated = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$ChaptersByComicId$chaptersByComicId(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        serial: serial == _undefined || serial == null
            ? _instance.serial
            : (serial as String),
        type: type == _undefined || type == null
            ? _instance.type
            : (type as String),
        size:
            size == _undefined || size == null ? _instance.size : (size as int),
        dateCreated: dateCreated == _undefined
            ? _instance.dateCreated
            : (dateCreated as String?),
        dateUpdated: dateUpdated == _undefined
            ? _instance.dateUpdated
            : (dateUpdated as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$ChaptersByComicId$chaptersByComicId<TRes>
    implements CopyWith$Query$ChaptersByComicId$chaptersByComicId<TRes> {
  _CopyWithStubImpl$Query$ChaptersByComicId$chaptersByComicId(this._res);

  TRes _res;

  call({
    String? id,
    String? serial,
    String? type,
    int? size,
    String? dateCreated,
    String? dateUpdated,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$ImagesByChapterId {
  factory Variables$Query$ImagesByChapterId({required String chapterId}) =>
      Variables$Query$ImagesByChapterId._({
        r'chapterId': chapterId,
      });

  Variables$Query$ImagesByChapterId._(this._$data);

  factory Variables$Query$ImagesByChapterId.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$chapterId = data['chapterId'];
    result$data['chapterId'] = (l$chapterId as String);
    return Variables$Query$ImagesByChapterId._(result$data);
  }

  Map<String, dynamic> _$data;

  String get chapterId => (_$data['chapterId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$chapterId = chapterId;
    result$data['chapterId'] = l$chapterId;
    return result$data;
  }

  CopyWith$Variables$Query$ImagesByChapterId<Variables$Query$ImagesByChapterId>
      get copyWith => CopyWith$Variables$Query$ImagesByChapterId(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$ImagesByChapterId ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$chapterId = chapterId;
    final lOther$chapterId = other.chapterId;
    if (l$chapterId != lOther$chapterId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$chapterId = chapterId;
    return Object.hashAll([l$chapterId]);
  }
}

abstract class CopyWith$Variables$Query$ImagesByChapterId<TRes> {
  factory CopyWith$Variables$Query$ImagesByChapterId(
    Variables$Query$ImagesByChapterId instance,
    TRes Function(Variables$Query$ImagesByChapterId) then,
  ) = _CopyWithImpl$Variables$Query$ImagesByChapterId;

  factory CopyWith$Variables$Query$ImagesByChapterId.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$ImagesByChapterId;

  TRes call({String? chapterId});
}

class _CopyWithImpl$Variables$Query$ImagesByChapterId<TRes>
    implements CopyWith$Variables$Query$ImagesByChapterId<TRes> {
  _CopyWithImpl$Variables$Query$ImagesByChapterId(
    this._instance,
    this._then,
  );

  final Variables$Query$ImagesByChapterId _instance;

  final TRes Function(Variables$Query$ImagesByChapterId) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? chapterId = _undefined}) =>
      _then(Variables$Query$ImagesByChapterId._({
        ..._instance._$data,
        if (chapterId != _undefined && chapterId != null)
          'chapterId': (chapterId as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$ImagesByChapterId<TRes>
    implements CopyWith$Variables$Query$ImagesByChapterId<TRes> {
  _CopyWithStubImpl$Variables$Query$ImagesByChapterId(this._res);

  TRes _res;

  call({String? chapterId}) => _res;
}

class Query$ImagesByChapterId {
  Query$ImagesByChapterId({
    required this.imagesByChapterId,
    this.$__typename = 'Query',
  });

  factory Query$ImagesByChapterId.fromJson(Map<String, dynamic> json) {
    final l$imagesByChapterId = json['imagesByChapterId'];
    final l$$__typename = json['__typename'];
    return Query$ImagesByChapterId(
      imagesByChapterId: (l$imagesByChapterId as List<dynamic>)
          .map((e) => e == null
              ? null
              : Query$ImagesByChapterId$imagesByChapterId.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$ImagesByChapterId$imagesByChapterId?> imagesByChapterId;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$imagesByChapterId = imagesByChapterId;
    _resultData['imagesByChapterId'] =
        l$imagesByChapterId.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$imagesByChapterId = imagesByChapterId;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$imagesByChapterId.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$ImagesByChapterId || runtimeType != other.runtimeType) {
      return false;
    }
    final l$imagesByChapterId = imagesByChapterId;
    final lOther$imagesByChapterId = other.imagesByChapterId;
    if (l$imagesByChapterId.length != lOther$imagesByChapterId.length) {
      return false;
    }
    for (int i = 0; i < l$imagesByChapterId.length; i++) {
      final l$imagesByChapterId$entry = l$imagesByChapterId[i];
      final lOther$imagesByChapterId$entry = lOther$imagesByChapterId[i];
      if (l$imagesByChapterId$entry != lOther$imagesByChapterId$entry) {
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

extension UtilityExtension$Query$ImagesByChapterId on Query$ImagesByChapterId {
  CopyWith$Query$ImagesByChapterId<Query$ImagesByChapterId> get copyWith =>
      CopyWith$Query$ImagesByChapterId(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$ImagesByChapterId<TRes> {
  factory CopyWith$Query$ImagesByChapterId(
    Query$ImagesByChapterId instance,
    TRes Function(Query$ImagesByChapterId) then,
  ) = _CopyWithImpl$Query$ImagesByChapterId;

  factory CopyWith$Query$ImagesByChapterId.stub(TRes res) =
      _CopyWithStubImpl$Query$ImagesByChapterId;

  TRes call({
    List<Query$ImagesByChapterId$imagesByChapterId?>? imagesByChapterId,
    String? $__typename,
  });
  TRes imagesByChapterId(
      Iterable<Query$ImagesByChapterId$imagesByChapterId?> Function(
              Iterable<
                  CopyWith$Query$ImagesByChapterId$imagesByChapterId<
                      Query$ImagesByChapterId$imagesByChapterId>?>)
          _fn);
}

class _CopyWithImpl$Query$ImagesByChapterId<TRes>
    implements CopyWith$Query$ImagesByChapterId<TRes> {
  _CopyWithImpl$Query$ImagesByChapterId(
    this._instance,
    this._then,
  );

  final Query$ImagesByChapterId _instance;

  final TRes Function(Query$ImagesByChapterId) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? imagesByChapterId = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$ImagesByChapterId(
        imagesByChapterId:
            imagesByChapterId == _undefined || imagesByChapterId == null
                ? _instance.imagesByChapterId
                : (imagesByChapterId
                    as List<Query$ImagesByChapterId$imagesByChapterId?>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes imagesByChapterId(
          Iterable<Query$ImagesByChapterId$imagesByChapterId?> Function(
                  Iterable<
                      CopyWith$Query$ImagesByChapterId$imagesByChapterId<
                          Query$ImagesByChapterId$imagesByChapterId>?>)
              _fn) =>
      call(
          imagesByChapterId:
              _fn(_instance.imagesByChapterId.map((e) => e == null
                  ? null
                  : CopyWith$Query$ImagesByChapterId$imagesByChapterId(
                      e,
                      (i) => i,
                    ))).toList());
}

class _CopyWithStubImpl$Query$ImagesByChapterId<TRes>
    implements CopyWith$Query$ImagesByChapterId<TRes> {
  _CopyWithStubImpl$Query$ImagesByChapterId(this._res);

  TRes _res;

  call({
    List<Query$ImagesByChapterId$imagesByChapterId?>? imagesByChapterId,
    String? $__typename,
  }) =>
      _res;

  imagesByChapterId(_fn) => _res;
}

const documentNodeQueryImagesByChapterId = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'ImagesByChapterId'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'chapterId')),
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
        name: NameNode(value: 'imagesByChapterId'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'chapterId'),
            value: VariableNode(name: NameNode(value: 'chapterId')),
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
            name: NameNode(value: 'kid'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'orderNumber'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'width'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'height'),
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
Query$ImagesByChapterId _parserFn$Query$ImagesByChapterId(
        Map<String, dynamic> data) =>
    Query$ImagesByChapterId.fromJson(data);
typedef OnQueryComplete$Query$ImagesByChapterId = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$ImagesByChapterId?,
);

class Options$Query$ImagesByChapterId
    extends graphql.QueryOptions<Query$ImagesByChapterId> {
  Options$Query$ImagesByChapterId({
    String? operationName,
    required Variables$Query$ImagesByChapterId variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$ImagesByChapterId? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$ImagesByChapterId? onComplete,
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
                    data == null
                        ? null
                        : _parserFn$Query$ImagesByChapterId(data),
                  ),
          onError: onError,
          document: documentNodeQueryImagesByChapterId,
          parserFn: _parserFn$Query$ImagesByChapterId,
        );

  final OnQueryComplete$Query$ImagesByChapterId? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$ImagesByChapterId
    extends graphql.WatchQueryOptions<Query$ImagesByChapterId> {
  WatchOptions$Query$ImagesByChapterId({
    String? operationName,
    required Variables$Query$ImagesByChapterId variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$ImagesByChapterId? typedOptimisticResult,
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
          document: documentNodeQueryImagesByChapterId,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$ImagesByChapterId,
        );
}

class FetchMoreOptions$Query$ImagesByChapterId
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$ImagesByChapterId({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$ImagesByChapterId variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryImagesByChapterId,
        );
}

extension ClientExtension$Query$ImagesByChapterId on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$ImagesByChapterId>> query$ImagesByChapterId(
          Options$Query$ImagesByChapterId options) async =>
      await this.query(options);

  graphql.ObservableQuery<Query$ImagesByChapterId> watchQuery$ImagesByChapterId(
          WatchOptions$Query$ImagesByChapterId options) =>
      this.watchQuery(options);

  void writeQuery$ImagesByChapterId({
    required Query$ImagesByChapterId data,
    required Variables$Query$ImagesByChapterId variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryImagesByChapterId),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );

  Query$ImagesByChapterId? readQuery$ImagesByChapterId({
    required Variables$Query$ImagesByChapterId variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryImagesByChapterId),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$ImagesByChapterId.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$ImagesByChapterId>
    useQuery$ImagesByChapterId(Options$Query$ImagesByChapterId options) =>
        graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$ImagesByChapterId>
    useWatchQuery$ImagesByChapterId(
            WatchOptions$Query$ImagesByChapterId options) =>
        graphql_flutter.useWatchQuery(options);

class Query$ImagesByChapterId$Widget
    extends graphql_flutter.Query<Query$ImagesByChapterId> {
  Query$ImagesByChapterId$Widget({
    widgets.Key? key,
    required Options$Query$ImagesByChapterId options,
    required graphql_flutter.QueryBuilder<Query$ImagesByChapterId> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$ImagesByChapterId$imagesByChapterId {
  Query$ImagesByChapterId$imagesByChapterId({
    required this.id,
    required this.kid,
    required this.orderNumber,
    required this.width,
    required this.height,
    this.dateCreated,
    this.dateUpdated,
    this.$__typename = 'Image',
  });

  factory Query$ImagesByChapterId$imagesByChapterId.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$kid = json['kid'];
    final l$orderNumber = json['orderNumber'];
    final l$width = json['width'];
    final l$height = json['height'];
    final l$dateCreated = json['dateCreated'];
    final l$dateUpdated = json['dateUpdated'];
    final l$$__typename = json['__typename'];
    return Query$ImagesByChapterId$imagesByChapterId(
      id: (l$id as String),
      kid: (l$kid as String),
      orderNumber: (l$orderNumber as int),
      width: (l$width as int),
      height: (l$height as int),
      dateCreated: (l$dateCreated as String?),
      dateUpdated: (l$dateUpdated as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String kid;

  final int orderNumber;

  final int width;

  final int height;

  final String? dateCreated;

  final String? dateUpdated;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$kid = kid;
    _resultData['kid'] = l$kid;
    final l$orderNumber = orderNumber;
    _resultData['orderNumber'] = l$orderNumber;
    final l$width = width;
    _resultData['width'] = l$width;
    final l$height = height;
    _resultData['height'] = l$height;
    final l$dateCreated = dateCreated;
    _resultData['dateCreated'] = l$dateCreated;
    final l$dateUpdated = dateUpdated;
    _resultData['dateUpdated'] = l$dateUpdated;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$kid = kid;
    final l$orderNumber = orderNumber;
    final l$width = width;
    final l$height = height;
    final l$dateCreated = dateCreated;
    final l$dateUpdated = dateUpdated;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$kid,
      l$orderNumber,
      l$width,
      l$height,
      l$dateCreated,
      l$dateUpdated,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$ImagesByChapterId$imagesByChapterId ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$kid = kid;
    final lOther$kid = other.kid;
    if (l$kid != lOther$kid) {
      return false;
    }
    final l$orderNumber = orderNumber;
    final lOther$orderNumber = other.orderNumber;
    if (l$orderNumber != lOther$orderNumber) {
      return false;
    }
    final l$width = width;
    final lOther$width = other.width;
    if (l$width != lOther$width) {
      return false;
    }
    final l$height = height;
    final lOther$height = other.height;
    if (l$height != lOther$height) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$ImagesByChapterId$imagesByChapterId
    on Query$ImagesByChapterId$imagesByChapterId {
  CopyWith$Query$ImagesByChapterId$imagesByChapterId<
          Query$ImagesByChapterId$imagesByChapterId>
      get copyWith => CopyWith$Query$ImagesByChapterId$imagesByChapterId(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$ImagesByChapterId$imagesByChapterId<TRes> {
  factory CopyWith$Query$ImagesByChapterId$imagesByChapterId(
    Query$ImagesByChapterId$imagesByChapterId instance,
    TRes Function(Query$ImagesByChapterId$imagesByChapterId) then,
  ) = _CopyWithImpl$Query$ImagesByChapterId$imagesByChapterId;

  factory CopyWith$Query$ImagesByChapterId$imagesByChapterId.stub(TRes res) =
      _CopyWithStubImpl$Query$ImagesByChapterId$imagesByChapterId;

  TRes call({
    String? id,
    String? kid,
    int? orderNumber,
    int? width,
    int? height,
    String? dateCreated,
    String? dateUpdated,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$ImagesByChapterId$imagesByChapterId<TRes>
    implements CopyWith$Query$ImagesByChapterId$imagesByChapterId<TRes> {
  _CopyWithImpl$Query$ImagesByChapterId$imagesByChapterId(
    this._instance,
    this._then,
  );

  final Query$ImagesByChapterId$imagesByChapterId _instance;

  final TRes Function(Query$ImagesByChapterId$imagesByChapterId) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? kid = _undefined,
    Object? orderNumber = _undefined,
    Object? width = _undefined,
    Object? height = _undefined,
    Object? dateCreated = _undefined,
    Object? dateUpdated = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$ImagesByChapterId$imagesByChapterId(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        kid: kid == _undefined || kid == null ? _instance.kid : (kid as String),
        orderNumber: orderNumber == _undefined || orderNumber == null
            ? _instance.orderNumber
            : (orderNumber as int),
        width: width == _undefined || width == null
            ? _instance.width
            : (width as int),
        height: height == _undefined || height == null
            ? _instance.height
            : (height as int),
        dateCreated: dateCreated == _undefined
            ? _instance.dateCreated
            : (dateCreated as String?),
        dateUpdated: dateUpdated == _undefined
            ? _instance.dateUpdated
            : (dateUpdated as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$ImagesByChapterId$imagesByChapterId<TRes>
    implements CopyWith$Query$ImagesByChapterId$imagesByChapterId<TRes> {
  _CopyWithStubImpl$Query$ImagesByChapterId$imagesByChapterId(this._res);

  TRes _res;

  call({
    String? id,
    String? kid,
    int? orderNumber,
    int? width,
    int? height,
    String? dateCreated,
    String? dateUpdated,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$GetDownloadChapterUrl {
  factory Variables$Query$GetDownloadChapterUrl({required String chapterId}) =>
      Variables$Query$GetDownloadChapterUrl._({
        r'chapterId': chapterId,
      });

  Variables$Query$GetDownloadChapterUrl._(this._$data);

  factory Variables$Query$GetDownloadChapterUrl.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$chapterId = data['chapterId'];
    result$data['chapterId'] = (l$chapterId as String);
    return Variables$Query$GetDownloadChapterUrl._(result$data);
  }

  Map<String, dynamic> _$data;

  String get chapterId => (_$data['chapterId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$chapterId = chapterId;
    result$data['chapterId'] = l$chapterId;
    return result$data;
  }

  CopyWith$Variables$Query$GetDownloadChapterUrl<
          Variables$Query$GetDownloadChapterUrl>
      get copyWith => CopyWith$Variables$Query$GetDownloadChapterUrl(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetDownloadChapterUrl ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$chapterId = chapterId;
    final lOther$chapterId = other.chapterId;
    if (l$chapterId != lOther$chapterId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$chapterId = chapterId;
    return Object.hashAll([l$chapterId]);
  }
}

abstract class CopyWith$Variables$Query$GetDownloadChapterUrl<TRes> {
  factory CopyWith$Variables$Query$GetDownloadChapterUrl(
    Variables$Query$GetDownloadChapterUrl instance,
    TRes Function(Variables$Query$GetDownloadChapterUrl) then,
  ) = _CopyWithImpl$Variables$Query$GetDownloadChapterUrl;

  factory CopyWith$Variables$Query$GetDownloadChapterUrl.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetDownloadChapterUrl;

  TRes call({String? chapterId});
}

class _CopyWithImpl$Variables$Query$GetDownloadChapterUrl<TRes>
    implements CopyWith$Variables$Query$GetDownloadChapterUrl<TRes> {
  _CopyWithImpl$Variables$Query$GetDownloadChapterUrl(
    this._instance,
    this._then,
  );

  final Variables$Query$GetDownloadChapterUrl _instance;

  final TRes Function(Variables$Query$GetDownloadChapterUrl) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? chapterId = _undefined}) =>
      _then(Variables$Query$GetDownloadChapterUrl._({
        ..._instance._$data,
        if (chapterId != _undefined && chapterId != null)
          'chapterId': (chapterId as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetDownloadChapterUrl<TRes>
    implements CopyWith$Variables$Query$GetDownloadChapterUrl<TRes> {
  _CopyWithStubImpl$Variables$Query$GetDownloadChapterUrl(this._res);

  TRes _res;

  call({String? chapterId}) => _res;
}

class Query$GetDownloadChapterUrl {
  Query$GetDownloadChapterUrl({
    required this.getDownloadChapterUrl,
    this.$__typename = 'Query',
  });

  factory Query$GetDownloadChapterUrl.fromJson(Map<String, dynamic> json) {
    final l$getDownloadChapterUrl = json['getDownloadChapterUrl'];
    final l$$__typename = json['__typename'];
    return Query$GetDownloadChapterUrl(
      getDownloadChapterUrl:
          Query$GetDownloadChapterUrl$getDownloadChapterUrl.fromJson(
              (l$getDownloadChapterUrl as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetDownloadChapterUrl$getDownloadChapterUrl getDownloadChapterUrl;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getDownloadChapterUrl = getDownloadChapterUrl;
    _resultData['getDownloadChapterUrl'] = l$getDownloadChapterUrl.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getDownloadChapterUrl = getDownloadChapterUrl;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$getDownloadChapterUrl,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetDownloadChapterUrl ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$getDownloadChapterUrl = getDownloadChapterUrl;
    final lOther$getDownloadChapterUrl = other.getDownloadChapterUrl;
    if (l$getDownloadChapterUrl != lOther$getDownloadChapterUrl) {
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

extension UtilityExtension$Query$GetDownloadChapterUrl
    on Query$GetDownloadChapterUrl {
  CopyWith$Query$GetDownloadChapterUrl<Query$GetDownloadChapterUrl>
      get copyWith => CopyWith$Query$GetDownloadChapterUrl(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetDownloadChapterUrl<TRes> {
  factory CopyWith$Query$GetDownloadChapterUrl(
    Query$GetDownloadChapterUrl instance,
    TRes Function(Query$GetDownloadChapterUrl) then,
  ) = _CopyWithImpl$Query$GetDownloadChapterUrl;

  factory CopyWith$Query$GetDownloadChapterUrl.stub(TRes res) =
      _CopyWithStubImpl$Query$GetDownloadChapterUrl;

  TRes call({
    Query$GetDownloadChapterUrl$getDownloadChapterUrl? getDownloadChapterUrl,
    String? $__typename,
  });
  CopyWith$Query$GetDownloadChapterUrl$getDownloadChapterUrl<TRes>
      get getDownloadChapterUrl;
}

class _CopyWithImpl$Query$GetDownloadChapterUrl<TRes>
    implements CopyWith$Query$GetDownloadChapterUrl<TRes> {
  _CopyWithImpl$Query$GetDownloadChapterUrl(
    this._instance,
    this._then,
  );

  final Query$GetDownloadChapterUrl _instance;

  final TRes Function(Query$GetDownloadChapterUrl) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getDownloadChapterUrl = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetDownloadChapterUrl(
        getDownloadChapterUrl:
            getDownloadChapterUrl == _undefined || getDownloadChapterUrl == null
                ? _instance.getDownloadChapterUrl
                : (getDownloadChapterUrl
                    as Query$GetDownloadChapterUrl$getDownloadChapterUrl),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetDownloadChapterUrl$getDownloadChapterUrl<TRes>
      get getDownloadChapterUrl {
    final local$getDownloadChapterUrl = _instance.getDownloadChapterUrl;
    return CopyWith$Query$GetDownloadChapterUrl$getDownloadChapterUrl(
        local$getDownloadChapterUrl, (e) => call(getDownloadChapterUrl: e));
  }
}

class _CopyWithStubImpl$Query$GetDownloadChapterUrl<TRes>
    implements CopyWith$Query$GetDownloadChapterUrl<TRes> {
  _CopyWithStubImpl$Query$GetDownloadChapterUrl(this._res);

  TRes _res;

  call({
    Query$GetDownloadChapterUrl$getDownloadChapterUrl? getDownloadChapterUrl,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetDownloadChapterUrl$getDownloadChapterUrl<TRes>
      get getDownloadChapterUrl =>
          CopyWith$Query$GetDownloadChapterUrl$getDownloadChapterUrl.stub(_res);
}

const documentNodeQueryGetDownloadChapterUrl = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetDownloadChapterUrl'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'chapterId')),
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
        name: NameNode(value: 'getDownloadChapterUrl'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'chapterId'),
            value: VariableNode(name: NameNode(value: 'chapterId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'url'),
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
Query$GetDownloadChapterUrl _parserFn$Query$GetDownloadChapterUrl(
        Map<String, dynamic> data) =>
    Query$GetDownloadChapterUrl.fromJson(data);
typedef OnQueryComplete$Query$GetDownloadChapterUrl = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetDownloadChapterUrl?,
);

class Options$Query$GetDownloadChapterUrl
    extends graphql.QueryOptions<Query$GetDownloadChapterUrl> {
  Options$Query$GetDownloadChapterUrl({
    String? operationName,
    required Variables$Query$GetDownloadChapterUrl variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetDownloadChapterUrl? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetDownloadChapterUrl? onComplete,
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
                    data == null
                        ? null
                        : _parserFn$Query$GetDownloadChapterUrl(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetDownloadChapterUrl,
          parserFn: _parserFn$Query$GetDownloadChapterUrl,
        );

  final OnQueryComplete$Query$GetDownloadChapterUrl? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetDownloadChapterUrl
    extends graphql.WatchQueryOptions<Query$GetDownloadChapterUrl> {
  WatchOptions$Query$GetDownloadChapterUrl({
    String? operationName,
    required Variables$Query$GetDownloadChapterUrl variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetDownloadChapterUrl? typedOptimisticResult,
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
          document: documentNodeQueryGetDownloadChapterUrl,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetDownloadChapterUrl,
        );
}

class FetchMoreOptions$Query$GetDownloadChapterUrl
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetDownloadChapterUrl({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetDownloadChapterUrl variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetDownloadChapterUrl,
        );
}

extension ClientExtension$Query$GetDownloadChapterUrl on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetDownloadChapterUrl>>
      query$GetDownloadChapterUrl(
              Options$Query$GetDownloadChapterUrl options) async =>
          await this.query(options);

  graphql.ObservableQuery<Query$GetDownloadChapterUrl>
      watchQuery$GetDownloadChapterUrl(
              WatchOptions$Query$GetDownloadChapterUrl options) =>
          this.watchQuery(options);

  void writeQuery$GetDownloadChapterUrl({
    required Query$GetDownloadChapterUrl data,
    required Variables$Query$GetDownloadChapterUrl variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryGetDownloadChapterUrl),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );

  Query$GetDownloadChapterUrl? readQuery$GetDownloadChapterUrl({
    required Variables$Query$GetDownloadChapterUrl variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryGetDownloadChapterUrl),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetDownloadChapterUrl.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetDownloadChapterUrl>
    useQuery$GetDownloadChapterUrl(
            Options$Query$GetDownloadChapterUrl options) =>
        graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetDownloadChapterUrl>
    useWatchQuery$GetDownloadChapterUrl(
            WatchOptions$Query$GetDownloadChapterUrl options) =>
        graphql_flutter.useWatchQuery(options);

class Query$GetDownloadChapterUrl$Widget
    extends graphql_flutter.Query<Query$GetDownloadChapterUrl> {
  Query$GetDownloadChapterUrl$Widget({
    widgets.Key? key,
    required Options$Query$GetDownloadChapterUrl options,
    required graphql_flutter.QueryBuilder<Query$GetDownloadChapterUrl> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$GetDownloadChapterUrl$getDownloadChapterUrl {
  Query$GetDownloadChapterUrl$getDownloadChapterUrl({
    this.url,
    required this.status,
    this.$__typename = 'DownloadChapterUrl',
  });

  factory Query$GetDownloadChapterUrl$getDownloadChapterUrl.fromJson(
      Map<String, dynamic> json) {
    final l$url = json['url'];
    final l$status = json['status'];
    final l$$__typename = json['__typename'];
    return Query$GetDownloadChapterUrl$getDownloadChapterUrl(
      url: (l$url as String?),
      status: (l$status as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String? url;

  final String status;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$url = url;
    _resultData['url'] = l$url;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$url = url;
    final l$status = status;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$url,
      l$status,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetDownloadChapterUrl$getDownloadChapterUrl ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$url = url;
    final lOther$url = other.url;
    if (l$url != lOther$url) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
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

extension UtilityExtension$Query$GetDownloadChapterUrl$getDownloadChapterUrl
    on Query$GetDownloadChapterUrl$getDownloadChapterUrl {
  CopyWith$Query$GetDownloadChapterUrl$getDownloadChapterUrl<
          Query$GetDownloadChapterUrl$getDownloadChapterUrl>
      get copyWith =>
          CopyWith$Query$GetDownloadChapterUrl$getDownloadChapterUrl(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetDownloadChapterUrl$getDownloadChapterUrl<
    TRes> {
  factory CopyWith$Query$GetDownloadChapterUrl$getDownloadChapterUrl(
    Query$GetDownloadChapterUrl$getDownloadChapterUrl instance,
    TRes Function(Query$GetDownloadChapterUrl$getDownloadChapterUrl) then,
  ) = _CopyWithImpl$Query$GetDownloadChapterUrl$getDownloadChapterUrl;

  factory CopyWith$Query$GetDownloadChapterUrl$getDownloadChapterUrl.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetDownloadChapterUrl$getDownloadChapterUrl;

  TRes call({
    String? url,
    String? status,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetDownloadChapterUrl$getDownloadChapterUrl<TRes>
    implements
        CopyWith$Query$GetDownloadChapterUrl$getDownloadChapterUrl<TRes> {
  _CopyWithImpl$Query$GetDownloadChapterUrl$getDownloadChapterUrl(
    this._instance,
    this._then,
  );

  final Query$GetDownloadChapterUrl$getDownloadChapterUrl _instance;

  final TRes Function(Query$GetDownloadChapterUrl$getDownloadChapterUrl) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? url = _undefined,
    Object? status = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetDownloadChapterUrl$getDownloadChapterUrl(
        url: url == _undefined ? _instance.url : (url as String?),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetDownloadChapterUrl$getDownloadChapterUrl<TRes>
    implements
        CopyWith$Query$GetDownloadChapterUrl$getDownloadChapterUrl<TRes> {
  _CopyWithStubImpl$Query$GetDownloadChapterUrl$getDownloadChapterUrl(
      this._res);

  TRes _res;

  call({
    String? url,
    String? status,
    String? $__typename,
  }) =>
      _res;
}
