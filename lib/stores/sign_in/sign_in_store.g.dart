// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignInStore on _SignInStoreBase, Store {
  Computed<bool>? _$isUserValidComputed;

  @override
  bool get isUserValid =>
      (_$isUserValidComputed ??= Computed<bool>(() => super.isUserValid,
              name: '_SignInStoreBase.isUserValid'))
          .value;
  Computed<bool>? _$isPasswordValidComputed;

  @override
  bool get isPasswordValid =>
      (_$isPasswordValidComputed ??= Computed<bool>(() => super.isPasswordValid,
              name: '_SignInStoreBase.isPasswordValid'))
          .value;
  Computed<bool>? _$isSignInFormValidComputed;

  @override
  bool get isSignInFormValid => (_$isSignInFormValidComputed ??= Computed<bool>(
          () => super.isSignInFormValid,
          name: '_SignInStoreBase.isSignInFormValid'))
      .value;

  late final _$userAtom = Atom(name: '_SignInStoreBase.user', context: context);

  @override
  String get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(String value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_SignInStoreBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$_SignInStoreBaseActionController =
      ActionController(name: '_SignInStoreBase', context: context);

  @override
  void setUser(String value) {
    final _$actionInfo = _$_SignInStoreBaseActionController.startAction(
        name: '_SignInStoreBase.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$_SignInStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_SignInStoreBaseActionController.startAction(
        name: '_SignInStoreBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_SignInStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
password: ${password},
isUserValid: ${isUserValid},
isPasswordValid: ${isPasswordValid},
isSignInFormValid: ${isSignInFormValid}
    ''';
  }
}
