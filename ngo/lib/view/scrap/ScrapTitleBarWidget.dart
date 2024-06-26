import 'package:flutter/material.dart';
import 'package:ngo/view/common/GoBackWidget.dart';
import 'package:ngo/viewModel/scrapViewModel.dart';
import 'package:provider/provider.dart';

class ScrapTitleBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final int userId;
  final int scrapId;
  const ScrapTitleBarWidget(
      {super.key, required this.userId, required this.scrapId});

  String getString(String? value) {
    if (value != null && value != "") {
      return value.toString();
    }
    return "정보없음";
  }

  @override
  Widget build(BuildContext context) {
    ScrapViewModel viewModel = Provider.of<ScrapViewModel>(context);

    return Container(
        width: double.infinity,
        height: 400,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
            color: Color(0xFFEEEEEE),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: 350,
                  padding: const EdgeInsets.only(top: 60),
                  alignment: Alignment.centerLeft,
                  child: const Row(children: [
                    GoBackWidget(size: 24),
                  ])),
              Container(
                  width: 350,
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(getString(viewModel.scrap?.title),
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF000000)))),
              Container(
                  width: 350,
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: 100,
                            height: 30,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                color: const Color(0xFF7AD9C2),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Text(getString(viewModel.scrap?.media),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFFFFFFF))))),
                        Container(
                            width: 100,
                            height: 30,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                color: const Color(0xFFFFFFFF),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Text(getString(viewModel.scrap?.editor),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF000000)))))
                      ]))
            ]));
  }

  @override
  Size get preferredSize => const Size(0.0, 250.0);
}
