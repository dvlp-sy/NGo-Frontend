import 'package:flutter/material.dart';
import 'package:ngo/view/MainView.dart';
import 'package:ngo/view/common/AppBarWidget.dart';
import 'package:ngo/viewModel/LoginViewModel.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  final TextEditingController loginIdController = TextEditingController();
  final TextEditingController loginPwController = TextEditingController();

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<LoginViewModel>(context);

    return Scaffold(
        appBar: const AppBarWidget(text: ""),
        backgroundColor: const Color(0xFFEEEEEE),
        body: Center(
          child: Container(
            width: 350,
            height: 450,
            decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 5),
                    child: const Text("아이디")),
                Container(
                    padding: const EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                        color: const Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(20)),
                    child: TextField(
                      controller: loginIdController,
                      decoration: const InputDecoration(
                          labelText: '아이디를 입력해주세요',
                          labelStyle: TextStyle(color: Color(0xFF868686)),
                          border: InputBorder.none),
                    )),
                Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 5),
                    child: const Text("패스워드")),
                Container(
                    padding: const EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                        color: const Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(20)),
                    child: TextField(
                      controller: loginPwController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          labelText: '패스워드를 입력해주세요',
                          labelStyle: TextStyle(color: Color(0xFF868686)),
                          border: InputBorder.none),
                    )),
                const SizedBox(height: 10),
                SizedBox(
                    width: 350,
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed)) {
                              return const Color.fromARGB(
                                  255, 146, 255, 228); // 눌렸을 때 배경색
                            }
                            return const Color(0xFF7AD9C2); // 기본 배경색
                          }),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white)),
                      onPressed: () async {
                        await loginViewModel.login(
                          loginIdController.text,
                          loginPwController.text,
                        );

                        if (loginViewModel.isLogin) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MainView()));
                        }
                      },
                      child: const Text('Login'),
                    )),
                if (loginViewModel.errorMessage != null)
                  Text(
                    loginViewModel.errorMessage!,
                    style: const TextStyle(color: Color(0xFF868686)),
                  ),
              ],
            ),
          ),
        ));
  }
}
