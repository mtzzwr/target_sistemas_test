import 'package:mobx/mobx.dart';
part 'sign_in_store.g.dart';

class SignInStore = _SignInStoreBase with _$SignInStore;

abstract class _SignInStoreBase with Store {
  @observable
  String user = '';

  @observable
  String password = '';

  @action
  void setUser(String value) => user = value;

  @action
  void setPassword(String value) => password = value;

  @computed
  bool get isUserValid => user.isNotEmpty && !user.endsWith(' ');

  @computed
  bool get isPasswordValid =>
      password.isNotEmpty && password.length > 2 && !password.endsWith(' ');

  @computed
  bool get isSignInFormValid => isUserValid && isPasswordValid;
}
