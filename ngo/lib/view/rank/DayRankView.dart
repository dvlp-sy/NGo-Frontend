import 'package:flutter/material.dart';
import 'package:ngo/view/common/MyRankWidget.dart';
import 'package:ngo/view/common/RankWidget.dart';
import 'package:ngo/viewModel/RankViewModel.dart';
import 'package:provider/provider.dart';

class DayRankView extends StatefulWidget {
  const DayRankView({super.key});

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
    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      RankWidget(viewModel: viewModel),
      MyRankWidget(viewModel: viewModel)
    ]);
  }
}
