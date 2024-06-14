import 'package:flutter/material.dart';
import 'package:ngo/view/MainView.dart';

class LoadingCompleteView extends StatefulWidget {
  const LoadingCompleteView({super.key});

  @override
  ReadingCompleteViewState createState() => ReadingCompleteViewState();
}

class ReadingCompleteViewState extends State<LoadingCompleteView> {
  @override
  void initState() {
    super.initState();
    // 일정 시간이 지난 후 자동으로 다음 페이지 이동
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const MainView(initialIndex: 4)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Loading',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          CircularProgressIndicator(color: Color(0xFF7AD8C2)),
        ],
      ),
    ));
  }
}
