import 'package:flutter/material.dart';
import 'package:ngo/view/common/AppBarWidget.dart';
import 'package:ngo/view/scrap/ScrapView.dart';
import 'package:ngo/viewModel/scrapViewModel.dart';
import 'package:provider/provider.dart';

class ScrapListView extends StatelessWidget {
  const ScrapListView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: AppBarWidget(text: "스크랩"),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ScrapBoxView(),
          ],
        )));
  }
}

class ScrapBoxView extends StatefulWidget {
  const ScrapBoxView({super.key});

  @override
  State<ScrapBoxView> createState() => _ScrapBoxState();
}

class _ScrapBoxState extends State<ScrapBoxView> {
  late ScrapListViewModel scrapListViewModel;
  late ScrapViewModel scrapViewModel;

  void _buttonPressed(BuildContext context, int scrapId, int userId) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ScrapView(scrapId: scrapId, userId: userId)));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    scrapListViewModel =
        Provider.of<ScrapListViewModel>(context, listen: false);
    scrapViewModel = Provider.of<ScrapViewModel>(context, listen: false);

    return Container(
        width: 450,
        height: 600,
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
            child: Column(children: [
          if (scrapListViewModel.scrapListDto?.scrapDtoList != null)
            ...scrapListViewModel.scrapListDto!.scrapDtoList!.map((scrap) {
              return GestureDetector(
                  onTap: () {
                    _buttonPressed(
                        context, scrap.scrapId ?? 0, scrapListViewModel.userId);
                  },
                  child: Container(
                      width: 450,
                      height: 180,
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.only(left: 20, right: 30),
                      decoration: BoxDecoration(
                          color: const Color(0xFFEEEEEE),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                margin:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Text("${scrap.title}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold))),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      width: 100,
                                      height: 30,
                                      margin: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      decoration: BoxDecoration(
                                          color: const Color(0xFF7AD9C2),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Center(
                                          child: Text(
                                        "${scrap.media}",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFFFFFFFF)),
                                      ))),
                                  const Icon(Icons.arrow_forward, size: 20)
                                ])
                          ])));
            })
        ])));
  }
}
