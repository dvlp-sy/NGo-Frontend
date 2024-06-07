import 'package:flutter/material.dart';

class RankWidget extends StatelessWidget {
  final dynamic viewModel;
  const RankWidget({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 450,
        height: 450,
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
            child: Column(children: [
          if (viewModel.rankDto?.userRankDtoList != null)
            ...viewModel.rankDto!.userRankDtoList!.map((user) {
              return Container(
                  height: 40,
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, top: 10, bottom: 10),
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                      color: const Color(0xFFEEEEEE),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(left: 10, right: 10),
                            child: Text("${user.userRank}",
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold))),
                        Container(
                            margin: const EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              "${user.userName}",
                              style: const TextStyle(fontSize: 16),
                            ))
                      ]));
            })
        ])));
  }
}
