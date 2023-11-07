// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'information_capture_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InformationCaptureStore on _InformationCaptureStoreBase, Store {
  late final _$informationsAtom =
      Atom(name: '_InformationCaptureStoreBase.informations', context: context);

  @override
  List<InformationModel> get informations {
    _$informationsAtom.reportRead();
    return super.informations;
  }

  @override
  set informations(List<InformationModel> value) {
    _$informationsAtom.reportWrite(value, super.informations, () {
      super.informations = value;
    });
  }

  late final _$informationAtom =
      Atom(name: '_InformationCaptureStoreBase.information', context: context);

  @override
  InformationModel? get information {
    _$informationAtom.reportRead();
    return super.information;
  }

  @override
  set information(InformationModel? value) {
    _$informationAtom.reportWrite(value, super.information, () {
      super.information = value;
    });
  }

  late final _$editingInformationAtom = Atom(
      name: '_InformationCaptureStoreBase.editingInformation',
      context: context);

  @override
  bool get editingInformation {
    _$editingInformationAtom.reportRead();
    return super.editingInformation;
  }

  @override
  set editingInformation(bool value) {
    _$editingInformationAtom.reportWrite(value, super.editingInformation, () {
      super.editingInformation = value;
    });
  }

  late final _$_InformationCaptureStoreBaseActionController =
      ActionController(name: '_InformationCaptureStoreBase', context: context);

  @override
  void setEditingInformation(bool value) {
    final _$actionInfo =
        _$_InformationCaptureStoreBaseActionController.startAction(
            name: '_InformationCaptureStoreBase.setEditingInformation');
    try {
      return super.setEditingInformation(value);
    } finally {
      _$_InformationCaptureStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setInformation(InformationModel value) {
    final _$actionInfo = _$_InformationCaptureStoreBaseActionController
        .startAction(name: '_InformationCaptureStoreBase.setInformation');
    try {
      return super.setInformation(value);
    } finally {
      _$_InformationCaptureStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
informations: ${informations},
information: ${information},
editingInformation: ${editingInformation}
    ''';
  }
}
