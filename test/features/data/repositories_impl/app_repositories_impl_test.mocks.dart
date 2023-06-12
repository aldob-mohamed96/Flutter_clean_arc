// Mocks generated by Mockito 5.4.2 from annotations
// in project/test/features/data/repositories_impl/app_repositories_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i6;
import 'package:project/core/resources/export_file.dart' as _i3;
import 'package:project/features/data/request/requests.dart' as _i7;
import 'package:project/features/data/response/app_auth_response/app_auth_response.dart'
    as _i2;
import 'package:project/features/domain/entity/data_value.dart' as _i5;

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

class _FakeLogoutAuthResponse_0 extends _i1.SmartFake
    implements _i2.LogoutAuthResponse {
  _FakeLogoutAuthResponse_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [RemoteDataSourceImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoteDataSourceImpl extends _i1.Mock
    implements _i3.RemoteDataSourceImpl {
  @override
  _i4.Future<_i2.LogoutAuthResponse> logout() => (super.noSuchMethod(
        Invocation.method(
          #logout,
          [],
        ),
        returnValue:
            _i4.Future<_i2.LogoutAuthResponse>.value(_FakeLogoutAuthResponse_0(
          this,
          Invocation.method(
            #logout,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.LogoutAuthResponse>.value(_FakeLogoutAuthResponse_0(
          this,
          Invocation.method(
            #logout,
            [],
          ),
        )),
      ) as _i4.Future<_i2.LogoutAuthResponse>);
}

/// A class which mocks [LocalDataSourceImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocalDataSourceImpl extends _i1.Mock
    implements _i3.LocalDataSourceImpl {
  @override
  _i4.Future<_i5.SuccessOperation> logout() => (super.noSuchMethod(
        Invocation.method(
          #logout,
          [],
        ),
        returnValue: _i4.Future<_i5.SuccessOperation>.value(
            _i6.dummyValue<_i5.SuccessOperation>(
          this,
          Invocation.method(
            #logout,
            [],
          ),
        )),
        returnValueForMissingStub: _i4.Future<_i5.SuccessOperation>.value(
            _i6.dummyValue<_i5.SuccessOperation>(
          this,
          Invocation.method(
            #logout,
            [],
          ),
        )),
      ) as _i4.Future<_i5.SuccessOperation>);
  @override
  _i4.Future<_i3.AppAuthenticationLevel> getLevelAuthenticationApp() =>
      (super.noSuchMethod(
        Invocation.method(
          #getLevelAuthenticationApp,
          [],
        ),
        returnValue: _i4.Future<_i3.AppAuthenticationLevel>.value(
            _i3.AppAuthenticationLevel.darft),
        returnValueForMissingStub: _i4.Future<_i3.AppAuthenticationLevel>.value(
            _i3.AppAuthenticationLevel.darft),
      ) as _i4.Future<_i3.AppAuthenticationLevel>);
  @override
  _i4.Future<_i5.SuccessOperation> setLevelAuthenticationApp(
          _i7.AppAuthenticationLevelRequest? appAuthenticationLevelRequest) =>
      (super.noSuchMethod(
        Invocation.method(
          #setLevelAuthenticationApp,
          [appAuthenticationLevelRequest],
        ),
        returnValue: _i4.Future<_i5.SuccessOperation>.value(
            _i6.dummyValue<_i5.SuccessOperation>(
          this,
          Invocation.method(
            #setLevelAuthenticationApp,
            [appAuthenticationLevelRequest],
          ),
        )),
        returnValueForMissingStub: _i4.Future<_i5.SuccessOperation>.value(
            _i6.dummyValue<_i5.SuccessOperation>(
          this,
          Invocation.method(
            #setLevelAuthenticationApp,
            [appAuthenticationLevelRequest],
          ),
        )),
      ) as _i4.Future<_i5.SuccessOperation>);
  @override
  _i4.Future<_i5.ThemeModeData> getThemeAppPreferences() => (super.noSuchMethod(
        Invocation.method(
          #getThemeAppPreferences,
          [],
        ),
        returnValue: _i4.Future<_i5.ThemeModeData>.value(
            _i6.dummyValue<_i5.ThemeModeData>(
          this,
          Invocation.method(
            #getThemeAppPreferences,
            [],
          ),
        )),
        returnValueForMissingStub: _i4.Future<_i5.ThemeModeData>.value(
            _i6.dummyValue<_i5.ThemeModeData>(
          this,
          Invocation.method(
            #getThemeAppPreferences,
            [],
          ),
        )),
      ) as _i4.Future<_i5.ThemeModeData>);
  @override
  _i4.Future<_i5.SuccessOperation> setThemeAppPreferences(
          _i7.ThemeModeAppReuest? themeModeAppReuest) =>
      (super.noSuchMethod(
        Invocation.method(
          #setThemeAppPreferences,
          [themeModeAppReuest],
        ),
        returnValue: _i4.Future<_i5.SuccessOperation>.value(
            _i6.dummyValue<_i5.SuccessOperation>(
          this,
          Invocation.method(
            #setThemeAppPreferences,
            [themeModeAppReuest],
          ),
        )),
        returnValueForMissingStub: _i4.Future<_i5.SuccessOperation>.value(
            _i6.dummyValue<_i5.SuccessOperation>(
          this,
          Invocation.method(
            #setThemeAppPreferences,
            [themeModeAppReuest],
          ),
        )),
      ) as _i4.Future<_i5.SuccessOperation>);
  @override
  _i4.Future<_i5.TokenData> getToken() => (super.noSuchMethod(
        Invocation.method(
          #getToken,
          [],
        ),
        returnValue:
            _i4.Future<_i5.TokenData>.value(_i6.dummyValue<_i5.TokenData>(
          this,
          Invocation.method(
            #getToken,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i5.TokenData>.value(_i6.dummyValue<_i5.TokenData>(
          this,
          Invocation.method(
            #getToken,
            [],
          ),
        )),
      ) as _i4.Future<_i5.TokenData>);
  @override
  _i4.Future<_i5.SuccessOperation> setToken(_i7.TokenRequest? tokenRequest) =>
      (super.noSuchMethod(
        Invocation.method(
          #setToken,
          [tokenRequest],
        ),
        returnValue: _i4.Future<_i5.SuccessOperation>.value(
            _i6.dummyValue<_i5.SuccessOperation>(
          this,
          Invocation.method(
            #setToken,
            [tokenRequest],
          ),
        )),
        returnValueForMissingStub: _i4.Future<_i5.SuccessOperation>.value(
            _i6.dummyValue<_i5.SuccessOperation>(
          this,
          Invocation.method(
            #setToken,
            [tokenRequest],
          ),
        )),
      ) as _i4.Future<_i5.SuccessOperation>);
}

/// A class which mocks [NetworkInfoImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfoImpl extends _i1.Mock implements _i3.NetworkInfoImpl {
  @override
  _i4.Future<bool> get isConnected => (super.noSuchMethod(
        Invocation.getter(#isConnected),
        returnValue: _i4.Future<bool>.value(false),
        returnValueForMissingStub: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
}