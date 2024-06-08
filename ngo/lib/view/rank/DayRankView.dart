import 'package:flutter/material.dart';
import 'package:ngo/view/common/MyRankWidget.dart';
import 'package:ngo/view/common/RankWidget.dart';
import 'package:ngo/viewModel/RankViewModel.dart';
import 'package:provider/provider.dart';

class DayRankView extends StatefulWidget {
  final double height;
  const DayRankView({super.key, required this.height});

  @override
  State<DayRankView> createState() => _DayRankState();
}

class _DayRankState extends State<DayRankView> {
  late DayRankViewModel viewModel;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    viewModel = Provider.of<DayRankViewModel>(context);
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Container(
          width: 350,
          height: 30,
          padding: const EdgeInsets.only(top: 10, left: 10),
          child: const Text(
            "일일 랭킹은 매일 오전 6:00에 초기화됩니다",
            textAlign: TextAlign.left,
            style: TextStyle(color: Color(0xFF868686)),
          )),
      RankWidget(
        viewModel: viewModel,
        height: widget.height,
      ),
      MyRankWidget(viewModel: viewModel)
    ]);
  }
}
