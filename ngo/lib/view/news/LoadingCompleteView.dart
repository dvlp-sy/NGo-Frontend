import 'package:flutter/material.dart';
import 'package:ngo/view/MainView.dart';

class LoadingCompleteView extends StatefulWidget {
  const LoadingCompleteView({super.key});

  @override
  _ReadingCompleteViewState createState() => _ReadingCompleteViewState();
}

class _ReadingCompleteViewState extends State<LoadingCompleteView> {
  @override
  void initState() {
    super.initState();
    // 일정 시간이 지난 후에 자동으로 다음 페이지로 이동하도록 타이머 설정
    Future.delayed(Duration(seconds: 3), () {
      // 설정된 시간이 지나면 다음 페이지로 이동하는 콜백 호출
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const MainView(initialIndex: 5)));
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
            'You have finished reading!',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          CircularProgressIndicator(), // 사용자에게 기다리는 중임을 알리는 인디케이터
        ],
      ),
    ));
  }
}
