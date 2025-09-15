class Input$EditAccountRequest {
  factory Input$EditAccountRequest({
    required Enum$EditAccountType editType,
    required String value,
  }) =>
      Input$EditAccountRequest._({
        r'editType': editType,
        r'value': value,
      });

  Input$EditAccountRequest._(this._$data);

  factory Input$EditAccountRequest.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$editType = data['editType'];
    result$data['editType'] =
        fromJson$Enum$EditAccountType((l$editType as String));
    final l$value = data['value'];
    result$data['value'] = (l$value as String);
    return Input$EditAccountRequest._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$EditAccountType get editType =>
      (_$data['editType'] as Enum$EditAccountType);

  String get value => (_$data['value'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$editType = editType;
    result$data['editType'] = toJson$Enum$EditAccountType(l$editType);
    final l$value = value;
    result$data['value'] = l$value;
    return result$data;
  }

  CopyWith$Input$EditAccountRequest<Input$EditAccountRequest> get copyWith =>
      CopyWith$Input$EditAccountRequest(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$EditAccountRequest ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$editType = editType;
    final lOther$editType = other.editType;
    if (l$editType != lOther$editType) {
      return false;
    }
    final l$value = value;
    final lOther$value = other.value;
    if (l$value != lOther$value) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$editType = editType;
    final l$value = value;
    return Object.hashAll([
      l$editType,
      l$value,
    ]);
  }
}

abstract class CopyWith$Input$EditAccountRequest<TRes> {
  factory CopyWith$Input$EditAccountRequest(
    Input$EditAccountRequest instance,
    TRes Function(Input$EditAccountRequest) then,
  ) = _CopyWithImpl$Input$EditAccountRequest;

  factory CopyWith$Input$EditAccountRequest.stub(TRes res) =
      _CopyWithStubImpl$Input$EditAccountRequest;

  TRes call({
    Enum$EditAccountType? editType,
    String? value,
  });
}

class _CopyWithImpl$Input$EditAccountRequest<TRes>
    implements CopyWith$Input$EditAccountRequest<TRes> {
  _CopyWithImpl$Input$EditAccountRequest(
    this._instance,
    this._then,
  );

  final Input$EditAccountRequest _instance;

  final TRes Function(Input$EditAccountRequest) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? editType = _undefined,
    Object? value = _undefined,
  }) =>
      _then(Input$EditAccountRequest._({
        ..._instance._$data,
        if (editType != _undefined && editType != null)
          'editType': (editType as Enum$EditAccountType),
        if (value != _undefined && value != null) 'value': (value as String),
      }));
}

class _CopyWithStubImpl$Input$EditAccountRequest<TRes>
    implements CopyWith$Input$EditAccountRequest<TRes> {
  _CopyWithStubImpl$Input$EditAccountRequest(this._res);

  TRes _res;

  call({
    Enum$EditAccountType? editType,
    String? value,
  }) =>
      _res;
}

class Input$FeedbackRequest {
  factory Input$FeedbackRequest({
    required Enum$FeedbackType feedbackType,
    String? email,
    String? detail,
    required List<Enum$BugFeedbackType?> bugFeedback,
    String? relatedComicId,
  }) =>
      Input$FeedbackRequest._({
        r'feedbackType': feedbackType,
        if (email != null) r'email': email,
        if (detail != null) r'detail': detail,
        r'bugFeedback': bugFeedback,
        if (relatedComicId != null) r'relatedComicId': relatedComicId,
      });

  Input$FeedbackRequest._(this._$data);

  factory Input$FeedbackRequest.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$feedbackType = data['feedbackType'];
    result$data['feedbackType'] =
        fromJson$Enum$FeedbackType((l$feedbackType as String));
    if (data.containsKey('email')) {
      final l$email = data['email'];
      result$data['email'] = (l$email as String?);
    }
    if (data.containsKey('detail')) {
      final l$detail = data['detail'];
      result$data['detail'] = (l$detail as String?);
    }
    final l$bugFeedback = data['bugFeedback'];
    result$data['bugFeedback'] = (l$bugFeedback as List<dynamic>)
        .map((e) =>
            e == null ? null : fromJson$Enum$BugFeedbackType((e as String)))
        .toList();
    if (data.containsKey('relatedComicId')) {
      final l$relatedComicId = data['relatedComicId'];
      result$data['relatedComicId'] = (l$relatedComicId as String?);
    }
    return Input$FeedbackRequest._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$FeedbackType get feedbackType =>
      (_$data['feedbackType'] as Enum$FeedbackType);

  String? get email => (_$data['email'] as String?);

  String? get detail => (_$data['detail'] as String?);

  List<Enum$BugFeedbackType?> get bugFeedback =>
      (_$data['bugFeedback'] as List<Enum$BugFeedbackType?>);

  String? get relatedComicId => (_$data['relatedComicId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$feedbackType = feedbackType;
    result$data['feedbackType'] = toJson$Enum$FeedbackType(l$feedbackType);
    if (_$data.containsKey('email')) {
      final l$email = email;
      result$data['email'] = l$email;
    }
    if (_$data.containsKey('detail')) {
      final l$detail = detail;
      result$data['detail'] = l$detail;
    }
    final l$bugFeedback = bugFeedback;
    result$data['bugFeedback'] = l$bugFeedback
        .map((e) => e == null ? null : toJson$Enum$BugFeedbackType(e))
        .toList();
    if (_$data.containsKey('relatedComicId')) {
      final l$relatedComicId = relatedComicId;
      result$data['relatedComicId'] = l$relatedComicId;
    }
    return result$data;
  }

  CopyWith$Input$FeedbackRequest<Input$FeedbackRequest> get copyWith =>
      CopyWith$Input$FeedbackRequest(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$FeedbackRequest || runtimeType != other.runtimeType) {
      return false;
    }
    final l$feedbackType = feedbackType;
    final lOther$feedbackType = other.feedbackType;
    if (l$feedbackType != lOther$feedbackType) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (_$data.containsKey('email') != other._$data.containsKey('email')) {
      return false;
    }
    if (l$email != lOther$email) {
      return false;
    }
    final l$detail = detail;
    final lOther$detail = other.detail;
    if (_$data.containsKey('detail') != other._$data.containsKey('detail')) {
      return false;
    }
    if (l$detail != lOther$detail) {
      return false;
    }
    final l$bugFeedback = bugFeedback;
    final lOther$bugFeedback = other.bugFeedback;
    if (l$bugFeedback.length != lOther$bugFeedback.length) {
      return false;
    }
    for (int i = 0; i < l$bugFeedback.length; i++) {
      final l$bugFeedback$entry = l$bugFeedback[i];
      final lOther$bugFeedback$entry = lOther$bugFeedback[i];
      if (l$bugFeedback$entry != lOther$bugFeedback$entry) {
        return false;
      }
    }
    final l$relatedComicId = relatedComicId;
    final lOther$relatedComicId = other.relatedComicId;
    if (_$data.containsKey('relatedComicId') !=
        other._$data.containsKey('relatedComicId')) {
      return false;
    }
    if (l$relatedComicId != lOther$relatedComicId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$feedbackType = feedbackType;
    final l$email = email;
    final l$detail = detail;
    final l$bugFeedback = bugFeedback;
    final l$relatedComicId = relatedComicId;
    return Object.hashAll([
      l$feedbackType,
      _$data.containsKey('email') ? l$email : const {},
      _$data.containsKey('detail') ? l$detail : const {},
      Object.hashAll(l$bugFeedback.map((v) => v)),
      _$data.containsKey('relatedComicId') ? l$relatedComicId : const {},
    ]);
  }
}

abstract class CopyWith$Input$FeedbackRequest<TRes> {
  factory CopyWith$Input$FeedbackRequest(
    Input$FeedbackRequest instance,
    TRes Function(Input$FeedbackRequest) then,
  ) = _CopyWithImpl$Input$FeedbackRequest;

  factory CopyWith$Input$FeedbackRequest.stub(TRes res) =
      _CopyWithStubImpl$Input$FeedbackRequest;

  TRes call({
    Enum$FeedbackType? feedbackType,
    String? email,
    String? detail,
    List<Enum$BugFeedbackType?>? bugFeedback,
    String? relatedComicId,
  });
}

class _CopyWithImpl$Input$FeedbackRequest<TRes>
    implements CopyWith$Input$FeedbackRequest<TRes> {
  _CopyWithImpl$Input$FeedbackRequest(
    this._instance,
    this._then,
  );

  final Input$FeedbackRequest _instance;

  final TRes Function(Input$FeedbackRequest) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? feedbackType = _undefined,
    Object? email = _undefined,
    Object? detail = _undefined,
    Object? bugFeedback = _undefined,
    Object? relatedComicId = _undefined,
  }) =>
      _then(Input$FeedbackRequest._({
        ..._instance._$data,
        if (feedbackType != _undefined && feedbackType != null)
          'feedbackType': (feedbackType as Enum$FeedbackType),
        if (email != _undefined) 'email': (email as String?),
        if (detail != _undefined) 'detail': (detail as String?),
        if (bugFeedback != _undefined && bugFeedback != null)
          'bugFeedback': (bugFeedback as List<Enum$BugFeedbackType?>),
        if (relatedComicId != _undefined)
          'relatedComicId': (relatedComicId as String?),
      }));
}

class _CopyWithStubImpl$Input$FeedbackRequest<TRes>
    implements CopyWith$Input$FeedbackRequest<TRes> {
  _CopyWithStubImpl$Input$FeedbackRequest(this._res);

  TRes _res;

  call({
    Enum$FeedbackType? feedbackType,
    String? email,
    String? detail,
    List<Enum$BugFeedbackType?>? bugFeedback,
    String? relatedComicId,
  }) =>
      _res;
}

class Input$Pagination {
  factory Input$Pagination({
    required int limit,
    required int offset,
    required Enum$OrderBy orderBy,
    required bool asc,
    String? status,
    Enum$ReadProgressType? readProgress,
    int? sexyLevel,
  }) =>
      Input$Pagination._({
        r'limit': limit,
        r'offset': offset,
        r'orderBy': orderBy,
        r'asc': asc,
        if (status != null) r'status': status,
        if (readProgress != null) r'readProgress': readProgress,
        if (sexyLevel != null) r'sexyLevel': sexyLevel,
      });

  Input$Pagination._(this._$data);

  factory Input$Pagination.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$limit = data['limit'];
    result$data['limit'] = (l$limit as int);
    final l$offset = data['offset'];
    result$data['offset'] = (l$offset as int);
    final l$orderBy = data['orderBy'];
    result$data['orderBy'] = fromJson$Enum$OrderBy((l$orderBy as String));
    final l$asc = data['asc'];
    result$data['asc'] = (l$asc as bool);
    if (data.containsKey('status')) {
      final l$status = data['status'];
      result$data['status'] = (l$status as String?);
    }
    if (data.containsKey('readProgress')) {
      final l$readProgress = data['readProgress'];
      result$data['readProgress'] = l$readProgress == null
          ? null
          : fromJson$Enum$ReadProgressType((l$readProgress as String));
    }
    if (data.containsKey('sexyLevel')) {
      final l$sexyLevel = data['sexyLevel'];
      result$data['sexyLevel'] = (l$sexyLevel as int?);
    }
    return Input$Pagination._(result$data);
  }

  Map<String, dynamic> _$data;

  int get limit => (_$data['limit'] as int);

  int get offset => (_$data['offset'] as int);

  Enum$OrderBy get orderBy => (_$data['orderBy'] as Enum$OrderBy);

  bool get asc => (_$data['asc'] as bool);

  String? get status => (_$data['status'] as String?);

  Enum$ReadProgressType? get readProgress =>
      (_$data['readProgress'] as Enum$ReadProgressType?);

  int? get sexyLevel => (_$data['sexyLevel'] as int?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$limit = limit;
    result$data['limit'] = l$limit;
    final l$offset = offset;
    result$data['offset'] = l$offset;
    final l$orderBy = orderBy;
    result$data['orderBy'] = toJson$Enum$OrderBy(l$orderBy);
    final l$asc = asc;
    result$data['asc'] = l$asc;
    if (_$data.containsKey('status')) {
      final l$status = status;
      result$data['status'] = l$status;
    }
    if (_$data.containsKey('readProgress')) {
      final l$readProgress = readProgress;
      result$data['readProgress'] = l$readProgress == null
          ? null
          : toJson$Enum$ReadProgressType(l$readProgress);
    }
    if (_$data.containsKey('sexyLevel')) {
      final l$sexyLevel = sexyLevel;
      result$data['sexyLevel'] = l$sexyLevel;
    }
    return result$data;
  }

  CopyWith$Input$Pagination<Input$Pagination> get copyWith =>
      CopyWith$Input$Pagination(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$Pagination || runtimeType != other.runtimeType) {
      return false;
    }
    final l$limit = limit;
    final lOther$limit = other.limit;
    if (l$limit != lOther$limit) {
      return false;
    }
    final l$offset = offset;
    final lOther$offset = other.offset;
    if (l$offset != lOther$offset) {
      return false;
    }
    final l$orderBy = orderBy;
    final lOther$orderBy = other.orderBy;
    if (l$orderBy != lOther$orderBy) {
      return false;
    }
    final l$asc = asc;
    final lOther$asc = other.asc;
    if (l$asc != lOther$asc) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (_$data.containsKey('status') != other._$data.containsKey('status')) {
      return false;
    }
    if (l$status != lOther$status) {
      return false;
    }
    final l$readProgress = readProgress;
    final lOther$readProgress = other.readProgress;
    if (_$data.containsKey('readProgress') !=
        other._$data.containsKey('readProgress')) {
      return false;
    }
    if (l$readProgress != lOther$readProgress) {
      return false;
    }
    final l$sexyLevel = sexyLevel;
    final lOther$sexyLevel = other.sexyLevel;
    if (_$data.containsKey('sexyLevel') !=
        other._$data.containsKey('sexyLevel')) {
      return false;
    }
    if (l$sexyLevel != lOther$sexyLevel) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$limit = limit;
    final l$offset = offset;
    final l$orderBy = orderBy;
    final l$asc = asc;
    final l$status = status;
    final l$readProgress = readProgress;
    final l$sexyLevel = sexyLevel;
    return Object.hashAll([
      l$limit,
      l$offset,
      l$orderBy,
      l$asc,
      _$data.containsKey('status') ? l$status : const {},
      _$data.containsKey('readProgress') ? l$readProgress : const {},
      _$data.containsKey('sexyLevel') ? l$sexyLevel : const {},
    ]);
  }
}

abstract class CopyWith$Input$Pagination<TRes> {
  factory CopyWith$Input$Pagination(
    Input$Pagination instance,
    TRes Function(Input$Pagination) then,
  ) = _CopyWithImpl$Input$Pagination;

  factory CopyWith$Input$Pagination.stub(TRes res) =
      _CopyWithStubImpl$Input$Pagination;

  TRes call({
    int? limit,
    int? offset,
    Enum$OrderBy? orderBy,
    bool? asc,
    String? status,
    Enum$ReadProgressType? readProgress,
    int? sexyLevel,
  });
}

class _CopyWithImpl$Input$Pagination<TRes>
    implements CopyWith$Input$Pagination<TRes> {
  _CopyWithImpl$Input$Pagination(
    this._instance,
    this._then,
  );

  final Input$Pagination _instance;

  final TRes Function(Input$Pagination) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? limit = _undefined,
    Object? offset = _undefined,
    Object? orderBy = _undefined,
    Object? asc = _undefined,
    Object? status = _undefined,
    Object? readProgress = _undefined,
    Object? sexyLevel = _undefined,
  }) =>
      _then(Input$Pagination._({
        ..._instance._$data,
        if (limit != _undefined && limit != null) 'limit': (limit as int),
        if (offset != _undefined && offset != null) 'offset': (offset as int),
        if (orderBy != _undefined && orderBy != null)
          'orderBy': (orderBy as Enum$OrderBy),
        if (asc != _undefined && asc != null) 'asc': (asc as bool),
        if (status != _undefined) 'status': (status as String?),
        if (readProgress != _undefined)
          'readProgress': (readProgress as Enum$ReadProgressType?),
        if (sexyLevel != _undefined) 'sexyLevel': (sexyLevel as int?),
      }));
}

class _CopyWithStubImpl$Input$Pagination<TRes>
    implements CopyWith$Input$Pagination<TRes> {
  _CopyWithStubImpl$Input$Pagination(this._res);

  TRes _res;

  call({
    int? limit,
    int? offset,
    Enum$OrderBy? orderBy,
    bool? asc,
    String? status,
    Enum$ReadProgressType? readProgress,
    int? sexyLevel,
  }) =>
      _res;
}

class Input$RegisterAccountRequest {
  factory Input$RegisterAccountRequest({
    required String email,
    required String password,
    required String recaptchaToken,
    String? nickname,
  }) =>
      Input$RegisterAccountRequest._({
        r'email': email,
        r'password': password,
        r'recaptchaToken': recaptchaToken,
        if (nickname != null) r'nickname': nickname,
      });

  Input$RegisterAccountRequest._(this._$data);

  factory Input$RegisterAccountRequest.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$email = data['email'];
    result$data['email'] = (l$email as String);
    final l$password = data['password'];
    result$data['password'] = (l$password as String);
    final l$recaptchaToken = data['recaptchaToken'];
    result$data['recaptchaToken'] = (l$recaptchaToken as String);
    if (data.containsKey('nickname')) {
      final l$nickname = data['nickname'];
      result$data['nickname'] = (l$nickname as String?);
    }
    return Input$RegisterAccountRequest._(result$data);
  }

  Map<String, dynamic> _$data;

  String get email => (_$data['email'] as String);

  String get password => (_$data['password'] as String);

  String get recaptchaToken => (_$data['recaptchaToken'] as String);

  String? get nickname => (_$data['nickname'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$email = email;
    result$data['email'] = l$email;
    final l$password = password;
    result$data['password'] = l$password;
    final l$recaptchaToken = recaptchaToken;
    result$data['recaptchaToken'] = l$recaptchaToken;
    if (_$data.containsKey('nickname')) {
      final l$nickname = nickname;
      result$data['nickname'] = l$nickname;
    }
    return result$data;
  }

  CopyWith$Input$RegisterAccountRequest<Input$RegisterAccountRequest>
      get copyWith => CopyWith$Input$RegisterAccountRequest(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$RegisterAccountRequest ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$password = password;
    final lOther$password = other.password;
    if (l$password != lOther$password) {
      return false;
    }
    final l$recaptchaToken = recaptchaToken;
    final lOther$recaptchaToken = other.recaptchaToken;
    if (l$recaptchaToken != lOther$recaptchaToken) {
      return false;
    }
    final l$nickname = nickname;
    final lOther$nickname = other.nickname;
    if (_$data.containsKey('nickname') !=
        other._$data.containsKey('nickname')) {
      return false;
    }
    if (l$nickname != lOther$nickname) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$email = email;
    final l$password = password;
    final l$recaptchaToken = recaptchaToken;
    final l$nickname = nickname;
    return Object.hashAll([
      l$email,
      l$password,
      l$recaptchaToken,
      _$data.containsKey('nickname') ? l$nickname : const {},
    ]);
  }
}

abstract class CopyWith$Input$RegisterAccountRequest<TRes> {
  factory CopyWith$Input$RegisterAccountRequest(
    Input$RegisterAccountRequest instance,
    TRes Function(Input$RegisterAccountRequest) then,
  ) = _CopyWithImpl$Input$RegisterAccountRequest;

  factory CopyWith$Input$RegisterAccountRequest.stub(TRes res) =
      _CopyWithStubImpl$Input$RegisterAccountRequest;

  TRes call({
    String? email,
    String? password,
    String? recaptchaToken,
    String? nickname,
  });
}

class _CopyWithImpl$Input$RegisterAccountRequest<TRes>
    implements CopyWith$Input$RegisterAccountRequest<TRes> {
  _CopyWithImpl$Input$RegisterAccountRequest(
    this._instance,
    this._then,
  );

  final Input$RegisterAccountRequest _instance;

  final TRes Function(Input$RegisterAccountRequest) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? email = _undefined,
    Object? password = _undefined,
    Object? recaptchaToken = _undefined,
    Object? nickname = _undefined,
  }) =>
      _then(Input$RegisterAccountRequest._({
        ..._instance._$data,
        if (email != _undefined && email != null) 'email': (email as String),
        if (password != _undefined && password != null)
          'password': (password as String),
        if (recaptchaToken != _undefined && recaptchaToken != null)
          'recaptchaToken': (recaptchaToken as String),
        if (nickname != _undefined) 'nickname': (nickname as String?),
      }));
}

class _CopyWithStubImpl$Input$RegisterAccountRequest<TRes>
    implements CopyWith$Input$RegisterAccountRequest<TRes> {
  _CopyWithStubImpl$Input$RegisterAccountRequest(this._res);

  TRes _res;

  call({
    String? email,
    String? password,
    String? recaptchaToken,
    String? nickname,
  }) =>
      _res;
}

enum Enum$BugFeedbackType {
  SLOWNESS,
  COMIC,
  PAGE,
  OTHER,
  COMIC_DETAIL_ALL,
  COMIC_DESCRIPTION,
  COMIC_SEXY_LEVEL,
  COMIC_WARNING,
  $unknown;

  factory Enum$BugFeedbackType.fromJson(String value) =>
      fromJson$Enum$BugFeedbackType(value);

  String toJson() => toJson$Enum$BugFeedbackType(this);
}

String toJson$Enum$BugFeedbackType(Enum$BugFeedbackType e) {
  switch (e) {
    case Enum$BugFeedbackType.SLOWNESS:
      return r'SLOWNESS';
    case Enum$BugFeedbackType.COMIC:
      return r'COMIC';
    case Enum$BugFeedbackType.PAGE:
      return r'PAGE';
    case Enum$BugFeedbackType.OTHER:
      return r'OTHER';
    case Enum$BugFeedbackType.COMIC_DETAIL_ALL:
      return r'COMIC_DETAIL_ALL';
    case Enum$BugFeedbackType.COMIC_DESCRIPTION:
      return r'COMIC_DESCRIPTION';
    case Enum$BugFeedbackType.COMIC_SEXY_LEVEL:
      return r'COMIC_SEXY_LEVEL';
    case Enum$BugFeedbackType.COMIC_WARNING:
      return r'COMIC_WARNING';
    case Enum$BugFeedbackType.$unknown:
      return r'$unknown';
  }
}

Enum$BugFeedbackType fromJson$Enum$BugFeedbackType(String value) {
  switch (value) {
    case r'SLOWNESS':
      return Enum$BugFeedbackType.SLOWNESS;
    case r'COMIC':
      return Enum$BugFeedbackType.COMIC;
    case r'PAGE':
      return Enum$BugFeedbackType.PAGE;
    case r'OTHER':
      return Enum$BugFeedbackType.OTHER;
    case r'COMIC_DETAIL_ALL':
      return Enum$BugFeedbackType.COMIC_DETAIL_ALL;
    case r'COMIC_DESCRIPTION':
      return Enum$BugFeedbackType.COMIC_DESCRIPTION;
    case r'COMIC_SEXY_LEVEL':
      return Enum$BugFeedbackType.COMIC_SEXY_LEVEL;
    case r'COMIC_WARNING':
      return Enum$BugFeedbackType.COMIC_WARNING;
    default:
      return Enum$BugFeedbackType.$unknown;
  }
}

enum Enum$EditAccountType {
  NICKNAME,
  EMAIL,
  $unknown;

  factory Enum$EditAccountType.fromJson(String value) =>
      fromJson$Enum$EditAccountType(value);

  String toJson() => toJson$Enum$EditAccountType(this);
}

String toJson$Enum$EditAccountType(Enum$EditAccountType e) {
  switch (e) {
    case Enum$EditAccountType.NICKNAME:
      return r'NICKNAME';
    case Enum$EditAccountType.EMAIL:
      return r'EMAIL';
    case Enum$EditAccountType.$unknown:
      return r'$unknown';
  }
}

Enum$EditAccountType fromJson$Enum$EditAccountType(String value) {
  switch (value) {
    case r'NICKNAME':
      return Enum$EditAccountType.NICKNAME;
    case r'EMAIL':
      return Enum$EditAccountType.EMAIL;
    default:
      return Enum$EditAccountType.$unknown;
  }
}

enum Enum$FeedbackType {
  SUGGESTION,
  BUG,
  RECOMMEND,
  REPORT,
  $unknown;

  factory Enum$FeedbackType.fromJson(String value) =>
      fromJson$Enum$FeedbackType(value);

  String toJson() => toJson$Enum$FeedbackType(this);
}

String toJson$Enum$FeedbackType(Enum$FeedbackType e) {
  switch (e) {
    case Enum$FeedbackType.SUGGESTION:
      return r'SUGGESTION';
    case Enum$FeedbackType.BUG:
      return r'BUG';
    case Enum$FeedbackType.RECOMMEND:
      return r'RECOMMEND';
    case Enum$FeedbackType.REPORT:
      return r'REPORT';
    case Enum$FeedbackType.$unknown:
      return r'$unknown';
  }
}

Enum$FeedbackType fromJson$Enum$FeedbackType(String value) {
  switch (value) {
    case r'SUGGESTION':
      return Enum$FeedbackType.SUGGESTION;
    case r'BUG':
      return Enum$FeedbackType.BUG;
    case r'RECOMMEND':
      return Enum$FeedbackType.RECOMMEND;
    case r'REPORT':
      return Enum$FeedbackType.REPORT;
    default:
      return Enum$FeedbackType.$unknown;
  }
}

enum Enum$OrderBy {
  DATE_UPDATED,
  DATE_CREATED,
  VIEWS,
  MONTH_VIEWS,
  ID,
  COMIC_DATE_UPDATED,
  FAVORITE_ADDED,
  FAVORITE_COUNT,
  $unknown;

  factory Enum$OrderBy.fromJson(String value) => fromJson$Enum$OrderBy(value);

  String toJson() => toJson$Enum$OrderBy(this);
}

String toJson$Enum$OrderBy(Enum$OrderBy e) {
  switch (e) {
    case Enum$OrderBy.DATE_UPDATED:
      return r'DATE_UPDATED';
    case Enum$OrderBy.DATE_CREATED:
      return r'DATE_CREATED';
    case Enum$OrderBy.VIEWS:
      return r'VIEWS';
    case Enum$OrderBy.MONTH_VIEWS:
      return r'MONTH_VIEWS';
    case Enum$OrderBy.ID:
      return r'ID';
    case Enum$OrderBy.COMIC_DATE_UPDATED:
      return r'COMIC_DATE_UPDATED';
    case Enum$OrderBy.FAVORITE_ADDED:
      return r'FAVORITE_ADDED';
    case Enum$OrderBy.FAVORITE_COUNT:
      return r'FAVORITE_COUNT';
    case Enum$OrderBy.$unknown:
      return r'$unknown';
  }
}

Enum$OrderBy fromJson$Enum$OrderBy(String value) {
  switch (value) {
    case r'DATE_UPDATED':
      return Enum$OrderBy.DATE_UPDATED;
    case r'DATE_CREATED':
      return Enum$OrderBy.DATE_CREATED;
    case r'VIEWS':
      return Enum$OrderBy.VIEWS;
    case r'MONTH_VIEWS':
      return Enum$OrderBy.MONTH_VIEWS;
    case r'ID':
      return Enum$OrderBy.ID;
    case r'COMIC_DATE_UPDATED':
      return Enum$OrderBy.COMIC_DATE_UPDATED;
    case r'FAVORITE_ADDED':
      return Enum$OrderBy.FAVORITE_ADDED;
    case r'FAVORITE_COUNT':
      return Enum$OrderBy.FAVORITE_COUNT;
    default:
      return Enum$OrderBy.$unknown;
  }
}

enum Enum$ReadProgressType {
  COMPLETED,
  STARTED,
  UNREAD,
  ALL,
  $unknown;

  factory Enum$ReadProgressType.fromJson(String value) =>
      fromJson$Enum$ReadProgressType(value);

  String toJson() => toJson$Enum$ReadProgressType(this);
}

String toJson$Enum$ReadProgressType(Enum$ReadProgressType e) {
  switch (e) {
    case Enum$ReadProgressType.COMPLETED:
      return r'COMPLETED';
    case Enum$ReadProgressType.STARTED:
      return r'STARTED';
    case Enum$ReadProgressType.UNREAD:
      return r'UNREAD';
    case Enum$ReadProgressType.ALL:
      return r'ALL';
    case Enum$ReadProgressType.$unknown:
      return r'$unknown';
  }
}

Enum$ReadProgressType fromJson$Enum$ReadProgressType(String value) {
  switch (value) {
    case r'COMPLETED':
      return Enum$ReadProgressType.COMPLETED;
    case r'STARTED':
      return Enum$ReadProgressType.STARTED;
    case r'UNREAD':
      return Enum$ReadProgressType.UNREAD;
    case r'ALL':
      return Enum$ReadProgressType.ALL;
    default:
      return Enum$ReadProgressType.$unknown;
  }
}

enum Enum$__TypeKind {
  SCALAR,
  OBJECT,
  INTERFACE,
  UNION,
  ENUM,
  INPUT_OBJECT,
  LIST,
  NON_NULL,
  $unknown;

  factory Enum$__TypeKind.fromJson(String value) =>
      fromJson$Enum$__TypeKind(value);

  String toJson() => toJson$Enum$__TypeKind(this);
}

String toJson$Enum$__TypeKind(Enum$__TypeKind e) {
  switch (e) {
    case Enum$__TypeKind.SCALAR:
      return r'SCALAR';
    case Enum$__TypeKind.OBJECT:
      return r'OBJECT';
    case Enum$__TypeKind.INTERFACE:
      return r'INTERFACE';
    case Enum$__TypeKind.UNION:
      return r'UNION';
    case Enum$__TypeKind.ENUM:
      return r'ENUM';
    case Enum$__TypeKind.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum$__TypeKind.LIST:
      return r'LIST';
    case Enum$__TypeKind.NON_NULL:
      return r'NON_NULL';
    case Enum$__TypeKind.$unknown:
      return r'$unknown';
  }
}

Enum$__TypeKind fromJson$Enum$__TypeKind(String value) {
  switch (value) {
    case r'SCALAR':
      return Enum$__TypeKind.SCALAR;
    case r'OBJECT':
      return Enum$__TypeKind.OBJECT;
    case r'INTERFACE':
      return Enum$__TypeKind.INTERFACE;
    case r'UNION':
      return Enum$__TypeKind.UNION;
    case r'ENUM':
      return Enum$__TypeKind.ENUM;
    case r'INPUT_OBJECT':
      return Enum$__TypeKind.INPUT_OBJECT;
    case r'LIST':
      return Enum$__TypeKind.LIST;
    case r'NON_NULL':
      return Enum$__TypeKind.NON_NULL;
    default:
      return Enum$__TypeKind.$unknown;
  }
}

enum Enum$__DirectiveLocation {
  QUERY,
  MUTATION,
  SUBSCRIPTION,
  FIELD,
  FRAGMENT_DEFINITION,
  FRAGMENT_SPREAD,
  INLINE_FRAGMENT,
  VARIABLE_DEFINITION,
  SCHEMA,
  SCALAR,
  OBJECT,
  FIELD_DEFINITION,
  ARGUMENT_DEFINITION,
  INTERFACE,
  UNION,
  ENUM,
  ENUM_VALUE,
  INPUT_OBJECT,
  INPUT_FIELD_DEFINITION,
  $unknown;

  factory Enum$__DirectiveLocation.fromJson(String value) =>
      fromJson$Enum$__DirectiveLocation(value);

  String toJson() => toJson$Enum$__DirectiveLocation(this);
}

String toJson$Enum$__DirectiveLocation(Enum$__DirectiveLocation e) {
  switch (e) {
    case Enum$__DirectiveLocation.QUERY:
      return r'QUERY';
    case Enum$__DirectiveLocation.MUTATION:
      return r'MUTATION';
    case Enum$__DirectiveLocation.SUBSCRIPTION:
      return r'SUBSCRIPTION';
    case Enum$__DirectiveLocation.FIELD:
      return r'FIELD';
    case Enum$__DirectiveLocation.FRAGMENT_DEFINITION:
      return r'FRAGMENT_DEFINITION';
    case Enum$__DirectiveLocation.FRAGMENT_SPREAD:
      return r'FRAGMENT_SPREAD';
    case Enum$__DirectiveLocation.INLINE_FRAGMENT:
      return r'INLINE_FRAGMENT';
    case Enum$__DirectiveLocation.VARIABLE_DEFINITION:
      return r'VARIABLE_DEFINITION';
    case Enum$__DirectiveLocation.SCHEMA:
      return r'SCHEMA';
    case Enum$__DirectiveLocation.SCALAR:
      return r'SCALAR';
    case Enum$__DirectiveLocation.OBJECT:
      return r'OBJECT';
    case Enum$__DirectiveLocation.FIELD_DEFINITION:
      return r'FIELD_DEFINITION';
    case Enum$__DirectiveLocation.ARGUMENT_DEFINITION:
      return r'ARGUMENT_DEFINITION';
    case Enum$__DirectiveLocation.INTERFACE:
      return r'INTERFACE';
    case Enum$__DirectiveLocation.UNION:
      return r'UNION';
    case Enum$__DirectiveLocation.ENUM:
      return r'ENUM';
    case Enum$__DirectiveLocation.ENUM_VALUE:
      return r'ENUM_VALUE';
    case Enum$__DirectiveLocation.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum$__DirectiveLocation.INPUT_FIELD_DEFINITION:
      return r'INPUT_FIELD_DEFINITION';
    case Enum$__DirectiveLocation.$unknown:
      return r'$unknown';
  }
}

Enum$__DirectiveLocation fromJson$Enum$__DirectiveLocation(String value) {
  switch (value) {
    case r'QUERY':
      return Enum$__DirectiveLocation.QUERY;
    case r'MUTATION':
      return Enum$__DirectiveLocation.MUTATION;
    case r'SUBSCRIPTION':
      return Enum$__DirectiveLocation.SUBSCRIPTION;
    case r'FIELD':
      return Enum$__DirectiveLocation.FIELD;
    case r'FRAGMENT_DEFINITION':
      return Enum$__DirectiveLocation.FRAGMENT_DEFINITION;
    case r'FRAGMENT_SPREAD':
      return Enum$__DirectiveLocation.FRAGMENT_SPREAD;
    case r'INLINE_FRAGMENT':
      return Enum$__DirectiveLocation.INLINE_FRAGMENT;
    case r'VARIABLE_DEFINITION':
      return Enum$__DirectiveLocation.VARIABLE_DEFINITION;
    case r'SCHEMA':
      return Enum$__DirectiveLocation.SCHEMA;
    case r'SCALAR':
      return Enum$__DirectiveLocation.SCALAR;
    case r'OBJECT':
      return Enum$__DirectiveLocation.OBJECT;
    case r'FIELD_DEFINITION':
      return Enum$__DirectiveLocation.FIELD_DEFINITION;
    case r'ARGUMENT_DEFINITION':
      return Enum$__DirectiveLocation.ARGUMENT_DEFINITION;
    case r'INTERFACE':
      return Enum$__DirectiveLocation.INTERFACE;
    case r'UNION':
      return Enum$__DirectiveLocation.UNION;
    case r'ENUM':
      return Enum$__DirectiveLocation.ENUM;
    case r'ENUM_VALUE':
      return Enum$__DirectiveLocation.ENUM_VALUE;
    case r'INPUT_OBJECT':
      return Enum$__DirectiveLocation.INPUT_OBJECT;
    case r'INPUT_FIELD_DEFINITION':
      return Enum$__DirectiveLocation.INPUT_FIELD_DEFINITION;
    default:
      return Enum$__DirectiveLocation.$unknown;
  }
}

const possibleTypesMap = <String, Set<String>>{};
