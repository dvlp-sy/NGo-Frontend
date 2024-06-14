import 'package:flutter/material.dart';
import 'package:ngo/model/Rank.dart';

class MyRankWidget extends StatelessWidget {
  final dynamic viewModel;
  const MyRankWidget({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    if (viewModel.rankDto != null) {
      RankDto user = viewModel.rankDto!;
      return Container(
          width: 350,
          height: 40,
          margin:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          padding: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
              color: const Color(0xFFEEEEEE),
              borderRadius: BorderRadius.circular(20)),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
                width: 20,
                decoration: const BoxDecoration(
                    color: Color(0xFF868686),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        topLeft: Radius.circular(20)))),
            Container(
                margin: const EdgeInsets.only(left: 20, right: 10),
                child: Text("${user.userRank}",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold))),
            Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  "${user.userName}",
                  style: const TextStyle(fontSize: 16),
                ))
          ]));
    }
    return Container(
        width: 350,
        height: 40,
        margin:
            const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10));
  }
}
