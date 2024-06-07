import 'package:flutter/material.dart';
import 'package:ngo/view/common/MyRankWidget.dart';
import 'package:ngo/view/common/RankWidget.dart';
import 'package:ngo/viewModel/RankViewModel.dart';
import 'package:provider/provider.dart';

class WeekRankView extends StatefulWidget {
  const WeekRankView({super.key});

  @override
  State<WeekRankView> createState() => _WeekRankState();
}

class _WeekRankState extends State<WeekRankView> {
  late WeekRankViewModel viewModel;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    viewModel = Provider.of<WeekRankViewModel>(context);
    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Container(
          width: 350,
          padding: const EdgeInsets.only(top: 10, left: 10),
          child: const Text(
            "주간 랭킹은 매주 월요일 오전 6:00에 초기화됩니다",
            textAlign: TextAlign.left,
            style: TextStyle(color: Color(0xFF868686)),
          )),
      RankWidget(viewModel: viewModel),
      MyRankWidget(viewModel: viewModel)
    ]);
  }
}
