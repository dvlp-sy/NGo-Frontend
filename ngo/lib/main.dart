import 'package:flutter/material.dart';
import 'package:ngo/view/MainView.dart';
import 'package:ngo/viewModel/LoginViewModel.dart';
import 'package:ngo/viewModel/TodayNewsViewModel.dart';
import 'package:ngo/viewModel/UserViewModel.dart';
import 'package:ngo/viewModel/scrapViewModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => TodayNewsViewModel()),
      ],
      child: Builder(
        builder: (context) {
          final loginViewModel = Provider.of<LoginViewModel>(context);
          final userId = loginViewModel.userId;
          const scrapId = 0;
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                  create: (_) =>
                      ScrapListViewModel(loginViewModel.userId ?? 0)),
              ChangeNotifierProvider(
                  create: (_) => ScrapViewModel(userId ?? 0, scrapId)),
              ChangeNotifierProvider(
                  create: (_) =>
                      ScrapSavingViewModel(userId ?? 0, "", "", "", "", "")),
              ChangeNotifierProvider(
                  create: (_) => UserViewModel(loginViewModel.userId ?? 0)),
            ],
            child: const MaterialApp(
              title: '신문고',
              home: MainView(),
              debugShowCheckedModeBanner: false,
            ),
          );
        },
      ),
    );
  }
}
