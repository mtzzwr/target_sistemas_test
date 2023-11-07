import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:target_sistemas_test/models/information_model.dart';
import 'package:target_sistemas_test/stores/information_capture/information_capture_store.dart';
import 'package:target_sistemas_test/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';

import '../utils/styles.dart';

class InformationCapturePage extends StatefulWidget {
  const InformationCapturePage({super.key});

  @override
  State<InformationCapturePage> createState() => _InformationCapturePageState();
}

class _InformationCapturePageState extends State<InformationCapturePage> {
  final store = InformationCaptureStore();
  final uuid = const Uuid();

  final textFieldFocus = FocusNode();
  final textFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textFieldFocus.requestFocus();
    store.getInformations();
  }

  void _launchUrl() async {
    final uri = Uri.parse(Constants.privacyPolicyUrl);
    launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Styles.darkerBackgroundColor,
            Styles.lighterBackgroundColor,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 340,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: SingleChildScrollView(
                    child: Observer(builder: (_) {
                      return Column(
                        children: store.informations
                            .map((info) => informationItem(info))
                            .toList(),
                      );
                    }),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: SizedBox(
                  height: 48,
                  child: TextField(
                    controller: textFieldController,
                    focusNode: textFieldFocus,
                    onSubmitted: (value) {
                      if (value.isEmpty) {
                        Constants.showSnackbar(
                          context,
                          'O campo não pode estar vazio',
                        );
                        textFieldFocus.requestFocus();
                        return;
                      }
                      store.editingInformation
                          ? store.editInformation(InformationModel(
                              uid: store.information!.uid!,
                              text: textFieldController.text,
                            ))
                          : store.createInformation(
                              InformationModel(
                                text: value,
                                uid: uuid.v1(),
                              ),
                            );
                      textFieldController.clear();
                      textFieldFocus.requestFocus();
                    },
                    textInputAction: TextInputAction.go,
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      hintText: 'Digite seu texto',
                      hintStyle: TextStyle(),
                      contentPadding: EdgeInsets.symmetric(vertical: 1),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              GestureDetector(
                onTap: () => _launchUrl(),
                child: const Center(
                  child: Text(
                    'Política de privacidade',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showDeleteInformationAlert(InformationModel info) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: SizedBox(
          height: 110,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Deseja realmente excluir a informação?'),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      store.deleteInformation(info);
                      Navigator.pop(context);
                    },
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 42,
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        decoration: BoxDecoration(
                          color: Styles.buttonColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Text(
                            'Sim',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 42,
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Text(
                            'Não',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget informationItem(InformationModel info) => Container(
        width: MediaQuery.of(context).size.width,
        constraints: const BoxConstraints(minHeight: 60),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Colors.grey,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                info.text!,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    store.setEditingInformation(true);
                    store.setInformation(info);
                    textFieldController.text = info.text!;
                  },
                  icon: const Icon(
                    Icons.edit,
                    size: 32,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showDeleteInformationAlert(info);
                  },
                  icon: Icon(
                    Icons.cancel,
                    size: 32,
                    color: Colors.red[800],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
