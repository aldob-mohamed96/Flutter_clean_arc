// Mocks generated by Mockito 5.4.2 from annotations
// in project/test/features/domain/usecases/get_theme_usecase_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:project/core/resources/export_file.dart' as _i2;
import 'package:project/features/data/request/requests.dart' as _i6;
import 'package:project/features/domain/entity/data_value.dart' as _i5;
import 'package:project/features/domain/entity/logout.dart' as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AppRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAppRepository extends _i1.Mock implements _i2.AppRepository {
  @override
  _i3.Future<_i2.Either<_i2.Failure, _i4.Logout>> logout() =>
      (super.noSuchMethod(
        Invocation.method(
          #logout,
          [],
        ),
        returnValue: _i3.Future<_i2.Either<_i2.Failure, _i4.Logout>>.value(
            _FakeEither_0<_i2.Failure, _i4.Logout>(
          this,
          Invocation.method(
            #logout,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i3.Future<_i2.Either<_i2.Failure, _i4.Logout>>.value(
                _FakeEither_0<_i2.Failure, _i4.Logout>(
          this,
          Invocation.method(
            #logout,
            [],
          ),
        )),
      ) as _i3.Future<_i2.Either<_i2.Failure, _i4.Logout>>);
  @override
  _i3.Future<
      _i2.Either<_i2.Failure,
          _i5.AppAuthenticationLevelData>> getLevelAuthenticationApp() =>
      (super.noSuchMethod(
        Invocation.method(
          #getLevelAuthenticationApp,
          [],
        ),
        returnValue: _i3.Future<
                _i2.Either<_i2.Failure, _i5.AppAuthenticationLevelData>>.value(
            _FakeEither_0<_i2.Failure, _i5.AppAuthenticationLevelData>(
          this,
          Invocation.method(
            #getLevelAuthenticationApp,
            [],
          ),
        )),
        returnValueForMissingStub: _i3.Future<
                _i2.Either<_i2.Failure, _i5.AppAuthenticationLevelData>>.value(
            _FakeEither_0<_i2.Failure, _i5.AppAuthenticationLevelData>(
          this,
          Invocation.method(
            #getLevelAuthenticationApp,
            [],
          ),
        )),
      ) as _i3.Future<_i2.Either<_i2.Failure, _i5.AppAuthenticationLevelData>>);
  @override
  _i3.Future<
      _i2.Either<_i2.Failure, _i5.SuccessOperation>> cashLevelAuthenticationApp(
          _i6.AppAuthenticationLevelRequest? appAuthenticationLevelRequest) =>
      (super.noSuchMethod(
        Invocation.method(
          #cashLevelAuthenticationApp,
          [appAuthenticationLevelRequest],
        ),
        returnValue:
            _i3.Future<_i2.Either<_i2.Failure, _i5.SuccessOperation>>.value(
                _FakeEither_0<_i2.Failure, _i5.SuccessOperation>(
          this,
          Invocation.method(
            #cashLevelAuthenticationApp,
            [appAuthenticationLevelRequest],
          ),
        )),
        returnValueForMissingStub:
            _i3.Future<_i2.Either<_i2.Failure, _i5.SuccessOperation>>.value(
                _FakeEither_0<_i2.Failure, _i5.SuccessOperation>(
          this,
          Invocation.method(
            #cashLevelAuthenticationApp,
            [appAuthenticationLevelRequest],
          ),
        )),
      ) as _i3.Future<_i2.Either<_i2.Failure, _i5.SuccessOperation>>);
  @override
  _i3.Future<_i2.Either<_i2.Failure, _i5.ThemeModeData>> getThemeApp() =>
      (super.noSuchMethod(
        Invocation.method(
          #getThemeApp,
          [],
        ),
        returnValue:
            _i3.Future<_i2.Either<_i2.Failure, _i5.ThemeModeData>>.value(
                _FakeEither_0<_i2.Failure, _i5.ThemeModeData>(
          this,
          Invocation.method(
            #getThemeApp,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i3.Future<_i2.Either<_i2.Failure, _i5.ThemeModeData>>.value(
                _FakeEither_0<_i2.Failure, _i5.ThemeModeData>(
          this,
          Invocation.method(
            #getThemeApp,
            [],
          ),
        )),
      ) as _i3.Future<_i2.Either<_i2.Failure, _i5.ThemeModeData>>);
  @override
  _i3.Future<_i2.Either<_i2.Failure, _i5.SuccessOperation>> cashThemeApp(
          _i6.ThemeModeAppReuest? themeModeAppReuest) =>
      (super.noSuchMethod(
        Invocation.method(
          #cashThemeApp,
          [themeModeAppReuest],
        ),
        returnValue:
            _i3.Future<_i2.Either<_i2.Failure, _i5.SuccessOperation>>.value(
                _FakeEither_0<_i2.Failure, _i5.SuccessOperation>(
          this,
          Invocation.method(
            #cashThemeApp,
            [themeModeAppReuest],
          ),
        )),
        returnValueForMissingStub:
            _i3.Future<_i2.Either<_i2.Failure, _i5.SuccessOperation>>.value(
                _FakeEither_0<_i2.Failure, _i5.SuccessOperation>(
          this,
          Invocation.method(
            #cashThemeApp,
            [themeModeAppReuest],
          ),
        )),
      ) as _i3.Future<_i2.Either<_i2.Failure, _i5.SuccessOperation>>);
  @override
  _i3.Future<_i2.Either<_i2.Failure, _i5.TokenData>> getToken() =>
      (super.noSuchMethod(
        Invocation.method(
          #getToken,
          [],
        ),
        returnValue: _i3.Future<_i2.Either<_i2.Failure, _i5.TokenData>>.value(
            _FakeEither_0<_i2.Failure, _i5.TokenData>(
          this,
          Invocation.method(
            #getToken,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i3.Future<_i2.Either<_i2.Failure, _i5.TokenData>>.value(
                _FakeEither_0<_i2.Failure, _i5.TokenData>(
          this,
          Invocation.method(
            #getToken,
            [],
          ),
        )),
      ) as _i3.Future<_i2.Either<_i2.Failure, _i5.TokenData>>);
  @override
  _i3.Future<_i2.Either<_i2.Failure, _i5.SuccessOperation>> cashToken(
          _i6.TokenRequest? tokenRequest) =>
      (super.noSuchMethod(
        Invocation.method(
          #cashToken,
          [tokenRequest],
        ),
        returnValue:
            _i3.Future<_i2.Either<_i2.Failure, _i5.SuccessOperation>>.value(
                _FakeEither_0<_i2.Failure, _i5.SuccessOperation>(
          this,
          Invocation.method(
            #cashToken,
            [tokenRequest],
          ),
        )),
        returnValueForMissingStub:
            _i3.Future<_i2.Either<_i2.Failure, _i5.SuccessOperation>>.value(
                _FakeEither_0<_i2.Failure, _i5.SuccessOperation>(
          this,
          Invocation.method(
            #cashToken,
            [tokenRequest],
          ),
        )),
      ) as _i3.Future<_i2.Either<_i2.Failure, _i5.SuccessOperation>>);
  @override
  _i3.Future<_i2.Either<_i2.Failure, _i5.SuccessOperation>> cashLocalApp(
          _i6.LocalAppRequest? localAppRequest) =>
      (super.noSuchMethod(
        Invocation.method(
          #cashLocalApp,
          [localAppRequest],
        ),
        returnValue:
            _i3.Future<_i2.Either<_i2.Failure, _i5.SuccessOperation>>.value(
                _FakeEither_0<_i2.Failure, _i5.SuccessOperation>(
          this,
          Invocation.method(
            #cashLocalApp,
            [localAppRequest],
          ),
        )),
        returnValueForMissingStub:
            _i3.Future<_i2.Either<_i2.Failure, _i5.SuccessOperation>>.value(
                _FakeEither_0<_i2.Failure, _i5.SuccessOperation>(
          this,
          Invocation.method(
            #cashLocalApp,
            [localAppRequest],
          ),
        )),
      ) as _i3.Future<_i2.Either<_i2.Failure, _i5.SuccessOperation>>);
  @override
  _i3.Future<_i2.Either<_i2.Failure, _i5.LocalAppData>> getLocalApp() =>
      (super.noSuchMethod(
        Invocation.method(
          #getLocalApp,
          [],
        ),
        returnValue:
            _i3.Future<_i2.Either<_i2.Failure, _i5.LocalAppData>>.value(
                _FakeEither_0<_i2.Failure, _i5.LocalAppData>(
          this,
          Invocation.method(
            #getLocalApp,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i3.Future<_i2.Either<_i2.Failure, _i5.LocalAppData>>.value(
                _FakeEither_0<_i2.Failure, _i5.LocalAppData>(
          this,
          Invocation.method(
            #getLocalApp,
            [],
          ),
        )),
      ) as _i3.Future<_i2.Either<_i2.Failure, _i5.LocalAppData>>);
}
