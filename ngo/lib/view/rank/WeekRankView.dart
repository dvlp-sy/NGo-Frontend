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
      RankWidget(viewModel: viewModel),
      MyRankWidget(viewModel: viewModel)
    ]);
  }
}
