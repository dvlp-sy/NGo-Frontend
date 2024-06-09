import 'package:flutter/material.dart';
import 'package:ngo/view/MainView.dart';
import 'package:ngo/view/common/ImageWidget.dart';
import 'package:ngo/viewModel/LoginViewModel.dart';
import 'package:ngo/viewModel/UserViewModel.dart';
import 'package:provider/provider.dart';

class MyPageView extends StatelessWidget {
  const MyPageView({super.key});

  String getString(String? value, String defaultValue) {
    if (value != null && value != "") {
      return value.toString();
    }
    return defaultValue;
  }

  int getLevel(String? level) {
    if (level == "low") {
      return 0;
    } else if (level == "mid") {
      return 1;
    } else {
      return 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context);
    int level = getLevel(userViewModel.userDto?.level);

    return Container(
        width: 350,
        height: 200,
        margin: const EdgeInsets.all(10),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            SizedBox(
                width: 100,
                height: 100,
                child: ImageWidget(
                    imageUrl: getString(userViewModel.userDto?.profileImage,
                        "https://static.vecteezy.com/system/resources/previews/022/059/000/large_2x/no-image-available-icon-vector.jpg"))),
            SizedBox(
                width: 230,
                height: 100,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          width: 200,
                          child: Text(
                              getString(userViewModel.userDto?.userName, ""),
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold))),
                      SizedBox(
                          width: 200,
                          child: Text(
                              getString(userViewModel.userDto?.email, ""),
                              textAlign: TextAlign.left,
                              style: const TextStyle(fontSize: 14)))
                    ])),
          ]),
          LevelWidget(
              userId: userViewModel.userDto?.userId ?? 0, initialIndex: level),
          const AccountWidget()
        ]));
  }
}

class LevelWidget extends StatefulWidget {
  final int initialIndex;
  final int userId;
  const LevelWidget(
      {super.key, required this.initialIndex, required this.userId});

  @override
  State<LevelWidget> createState() => LevelWidgetState();
}

class LevelWidgetState extends State<LevelWidget> {
  late int _selectedIndex;
  late UserLevelViewModel userLevelViewModel;

  late Color _LowLevelColor = const Color(0xFFEEEEEE);
  late Color _MidLevelColor = const Color(0xFFEEEEEE);
  late Color _HighLevelColor = const Color(0xFFEEEEEE);

  void _updateColors() {
    if (_selectedIndex == 0) {
      _LowLevelColor = const Color(0xFF7AD9C2);
      _MidLevelColor = const Color(0xFFEEEEEE);
      _HighLevelColor = const Color(0xFFEEEEEE);
    } else if (_selectedIndex == 1) {
      _LowLevelColor = const Color(0xFFEEEEEE);
      _MidLevelColor = const Color(0xFF7AD9C2);
      _HighLevelColor = const Color(0xFFEEEEEE);
    } else {
      _LowLevelColor = const Color(0xFFEEEEEE);
      _MidLevelColor = const Color(0xFFEEEEEE);
      _HighLevelColor = const Color(0xFF7AD9C2);
    }
  }

  void _selectButton(int index) {
    setState(() {
      _selectedIndex = index;
      _updateColors();

      String level;
      if (_selectedIndex == 0) {
        level = "low";
      } else if (_selectedIndex == 1) {
        level = "mid";
      } else {
        level = "high";
      }

      userLevelViewModel.updateUserLevel(widget.userId, level);
    });
  }

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
    _updateColors();
  }

  @override
  Widget build(BuildContext context) {
    userLevelViewModel = Provider.of<UserLevelViewModel>(context);

    return SizedBox(
        width: 350,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          GestureDetector(
              onTap: () => _selectButton(0),
              child: Button(text: "Low", color: _LowLevelColor)),
          GestureDetector(
              onTap: () => _selectButton(1),
              child: Button(text: "Mid", color: _MidLevelColor)),
          GestureDetector(
              onTap: () => _selectButton(2),
              child: Button(text: "High", color: _HighLevelColor))
        ]));
  }
}

class Button extends StatelessWidget {
  final String text;
  final Color color;
  const Button({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        height: 35,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(20)),
        child: Center(
            child: Text(text,
                style: TextStyle(
                    color: color == const Color(0xFF7AD9C2)
                        ? const Color(0xFFFFFFFF)
                        : const Color(0xFF000000),
                    fontSize: 16,
                    fontWeight: FontWeight.bold))));
  }
}

class AccountWidget extends StatefulWidget {
  const AccountWidget({super.key});

  @override
  State<AccountWidget> createState() => _AccountWidgetState();
}

class _AccountWidgetState extends State<AccountWidget> {
  final TextEditingController pwController = TextEditingController();
  final TextEditingController newPwController = TextEditingController();
  final TextEditingController newPwCheckController = TextEditingController();

  late LoginViewModel loginViewModel;
  late LoginPwViewModel loginPwViewModel;
  late UserViewModel userViewModel;

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          title: const Text("로그아웃",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          content: SizedBox(
              width: 250,
              height: 40,
              child: Center(
                  child: Container(
                      width: 200,
                      alignment: Alignment.bottomCenter,
                      child: const Text("로그아웃하시겠습니까?")))),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Button(color: Color(0xFFEEEEEE), text: "아니요")),
            TextButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                  await loginViewModel.logout();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const MainView(initialIndex: 0)));
                },
                child: const Button(color: Color(0xFF7AD9C2), text: "네")),
          ],
        );
      },
    );
  }

  void _showPasswordDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          title: const Text("패스워드 변경",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          content: SizedBox(
              width: 250,
              height: 350,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 5),
                        child: const Text("패스워드 입력")),
                    Container(
                        padding: const EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                            color: const Color(0xFFEEEEEE),
                            borderRadius: BorderRadius.circular(20)),
                        child: TextField(
                          controller: pwController,
                          obscureText: true,
                          decoration: const InputDecoration(
                              labelText: '패스워드를 입력해주세요',
                              labelStyle: TextStyle(color: Color(0xFF868686)),
                              border: InputBorder.none),
                        )),
                    Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 5),
                        child: const Text("새 패스워드 입력")),
                    Container(
                        padding: const EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                            color: const Color(0xFFEEEEEE),
                            borderRadius: BorderRadius.circular(20)),
                        child: TextField(
                          controller: newPwController,
                          obscureText: true,
                          decoration: const InputDecoration(
                              labelText: '새 패스워드를 입력해주세요',
                              labelStyle: TextStyle(color: Color(0xFF868686)),
                              border: InputBorder.none),
                        )),
                    Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 5),
                        child: const Text("패스워드 확인")),
                    Container(
                        padding: const EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                            color: const Color(0xFFEEEEEE),
                            borderRadius: BorderRadius.circular(20)),
                        child: TextField(
                          controller: newPwCheckController,
                          obscureText: true,
                          decoration: const InputDecoration(
                              labelText: '새 패스워드를 확인해주세요',
                              labelStyle: TextStyle(color: Color(0xFF868686)),
                              border: InputBorder.none),
                        )),
                  ])),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Button(color: Color(0xFFFFFFFF), text: "취소")),
            TextButton(
                onPressed: () async {
                  if (newPwController.text == newPwCheckController.text) {
                    Navigator.of(context).pop();
                    await loginPwViewModel.updateLoginPw(
                        userViewModel.userDto?.userId ?? 0,
                        newPwCheckController.text);
                  }
                },
                child: const Button(color: Color(0xFF7AD9C2), text: "저장")),
          ],
        );
      },
    );
  }

  void _onTapPassword() {
    _showPasswordDialog(context);
  }

  void _onTapLogout() {
    _showLogoutDialog(context);
  }

  @override
  Widget build(BuildContext context) {
    loginViewModel = Provider.of<LoginViewModel>(context);
    loginPwViewModel = Provider.of<LoginPwViewModel>(context);
    userViewModel = Provider.of<UserViewModel>(context);

    return SizedBox(
        width: 350,
        height: 150,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          GestureDetector(
              onTap: () => _onTapPassword(),
              child: const AccountButton(text: "패스워드 변경")),
          GestureDetector(
              onTap: () => _onTapLogout(),
              child: const AccountButton(text: "로그아웃"))
        ]));
  }
}

class AccountButton extends StatelessWidget {
  final String text;
  const AccountButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 350,
        height: 50,
        decoration: BoxDecoration(
            color: const Color(0xFFEEEEEE),
            borderRadius: BorderRadius.circular(20)),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
              width: 20,
              margin: const EdgeInsets.only(right: 20),
              decoration: const BoxDecoration(
                  color: Color(0xFF868686),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      topLeft: Radius.circular(20)))),
          Text(text,
              textAlign: TextAlign.left, style: const TextStyle(fontSize: 16))
        ]));
  }
}
