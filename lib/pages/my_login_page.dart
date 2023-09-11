import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String email = '';
  String password = '';

  void getTextInput() {
    setState(() {
      email = emailController.text;
      password = passwordController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        body: Column(children: [
          Flexible(
              fit: FlexFit.tight,
              child: Container(
                  color: const Color(0xFF182E4A),
                  child: const FittedBox(
                    fit: BoxFit.fitWidth,
                      child: Image(
                          image: AssetImage('assets/logo.png'), width: 450)))),
          Container(
              height: MediaQuery.of(context).size.height * 0.45,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Color(0xFFEEEEEE),
              ),
              child: SizedBox(
                height: 300,
                child: Column(children: [
                  SizedBox(
                    width: 328,
                    height: 51.57,
                    child: Material(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      child: TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            prefixIcon: Padding(padding: EdgeInsets.only(right: 2),
                                child: Icon(Icons.email_rounded, color: Colors.black54)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none),
                            labelText: 'Email',
                            hintText: 'Insira um e-mail'),
                        autocorrect: true,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: 328,
                    height: 51.57,
                    child: Material(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      child: TextField(
                        controller: passwordController,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: true,
                        decoration: const InputDecoration(
                            prefixIcon: Padding(padding: EdgeInsets.only(right: 2),
                                child: Icon(Icons.lock_rounded, color: Colors.black54)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none),
                            labelText: 'Senha',
                            hintText: 'Insira a senha'),
                        autocorrect: true,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 328,
                        height: 51.57,
                        child: Material(
                          color: const Color(0xFF182E4A),
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                            onTap: () {
                              getTextInput();
                              if (email != "" && password != "") {
                                Navigator.pushNamed(context, '/home');
                              }

                              if (email == "" && password != ""){
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Email vazio'),
                                      content: const Text('Preencha o campo de email.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }

                              if (password == "" && email != "") {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Senha vazia'),
                                      content: const Text('Preencha o campo de senha.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }

                              if (email == "" && password == "") {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Campos vazios'),
                                      content: const Text('Preencha os campos de email e senha.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                            child: const Center(
                              child: Text(
                                'ENTRAR',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ]),
              )),
        ]),
      ),
    );
  }
}
