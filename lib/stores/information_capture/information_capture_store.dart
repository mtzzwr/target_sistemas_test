import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'package:target_sistemas_test/models/information_model.dart';
part 'information_capture_store.g.dart';

class InformationCaptureStore = _InformationCaptureStoreBase
    with _$InformationCaptureStore;

abstract class _InformationCaptureStoreBase with Store {
  final uuid = const Uuid();

  @observable
  List<InformationModel> informations = [];

  @observable
  InformationModel? information;

  @observable
  bool editingInformation = false;

  @action
  void setEditingInformation(bool value) => editingInformation = value;

  @action
  void setInformation(InformationModel value) => information = value;

  Future<List<InformationModel>> getInformations() async {
    final prefs = await SharedPreferences.getInstance();
    final encodedInformations = prefs.getString('informations') ?? '';
    if (encodedInformations.isEmpty) return [];

    informations = InformationModel.decode(encodedInformations);

    return informations;
  }

  void createInformation(InformationModel info) async {
    final prefs = await SharedPreferences.getInstance();
    List<InformationModel> informations = await getInformations();
    informations = informations..add(info);
    final encodedInformations = InformationModel.encode(informations);
    prefs.remove('informations');
    await prefs.setString('informations', encodedInformations);
    getInformations();
  }

  void editInformation(InformationModel info) async {
    final prefs = await SharedPreferences.getInstance();
    final index = informations.indexOf(information!);
    informations.removeAt(index);
    informations.insert(index, info);
    final encodedInformations = InformationModel.encode(informations);
    prefs.remove('informations');
    await prefs.setString('informations', encodedInformations);
    setEditingInformation(false);
    getInformations();
  }

  void deleteInformation(InformationModel info) async {
    final prefs = await SharedPreferences.getInstance();
    informations.removeWhere(
      (element) => element.uid == info.uid,
    );
    final encodedInformations = InformationModel.encode(informations);
    prefs.remove('informations');
    await prefs.setString('informations', encodedInformations);
    getInformations();
  }
}
