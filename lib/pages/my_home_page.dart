import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class _getDados {
  var listaChamados = [];

  // método que cria e adiciona os objetos Chamado
  List criarChamados() {
    var chamado1 = Chamado("Empresa 1", "Rua 1", "Pendente");
    var chamado2 = Chamado("Empresa 2", "Rua 2", "Pendente");
    var chamado3 = Chamado("Empresa 3", "Rua 3", "Pendente");

    listaChamados.add(chamado1);
    listaChamados.add(chamado2);
    listaChamados.add(chamado3);

    return listaChamados;
  }
}

class Chamado {
  final String empresa;
  final String endereco;
  final String status;

  Chamado(this.empresa, this.endereco, this.status);
}

class Atendimentos {
  int realizados;
  int pendentes;

  Atendimentos(this.realizados, this.pendentes);
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  @override
  Widget build(BuildContext context) {
    const String usuario = "Fernando";
    var atendimento = Atendimentos(100, 20);

    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                color: const Color(0xFF182E4A),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.75,
                color: const Color(0xFFEEEEEE),
              )
            ],
          ),
          Positioned(
              width: MediaQuery.of(context).size.width,
              top: MediaQuery.of(context).size.height * 0.095,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Olá, $usuario",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            decoration: TextDecoration.none,
                            fontSize: 28,
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        TextButton(
                          onPressed: (() =>
                              {Navigator.pushNamed(context, '/')}),
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          child: const Text('SAIR',
                              style: TextStyle(
                                  color: Color(0xFF182E4A),
                                  fontSize: 14.46,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 46),
                    Card(
                        margin: const EdgeInsets.all(0),
                        color: const Color(0xFFFFFFFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: IntrinsicHeight(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "${atendimento.realizados}",
                                      style: const TextStyle(
                                        fontFamily: 'Roboto',
                                        decoration: TextDecoration.none,
                                        fontSize: 28,
                                        color: Color(0xFF182E4A),
                                        fontWeight: FontWeight.w700,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const Text(
                                      "Atendidos",
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        decoration: TextDecoration.none,
                                        fontSize: 14,
                                        color: Color(0xFF182E4A),
                                      ),
                                    ),
                                  ],
                                ),
                                const VerticalDivider(
                                  color: Colors.grey,
                                  thickness: 0,
                                  width: 1,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "${atendimento.pendentes}",
                                      style: const TextStyle(
                                        fontFamily: 'Roboto',
                                        decoration: TextDecoration.none,
                                        fontSize: 28,
                                        color: Color(0xFF182E4A),
                                        fontWeight: FontWeight.w700,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const Text(
                                      "Pendentes",
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        decoration: TextDecoration.none,
                                        fontSize: 14,
                                        color: Color(0xFF182E4A),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 5),
                      child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Meus atendimentos",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                decoration: TextDecoration.none,
                                fontSize: 19,
                                color: Color(0xFF182E4A),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 7),
                            Text(
                              'Veja os atendimentos disponíveis',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'Inter',
                                decoration: TextDecoration.none,
                                fontSize: 15,
                                color: Color(0xFF6B7280),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ]),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Column(
                      children: [
                        Card(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.12,
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Empresa A",
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                decoration: TextDecoration.none,
                                                fontSize: 19,
                                                color: Color(0xFF182E4A),
                                                fontWeight: FontWeight.w700,
                                              )),
                                        ],
                                      ),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            RichText(
                                                textAlign: TextAlign.start,
                                                text: const TextSpan(children: [
                                                  WidgetSpan(
                                                    child: Icon(
                                                        Icons
                                                            .location_on_rounded,
                                                        size: 17,
                                                        color:
                                                            Color(0xFF182E4A)),
                                                  ),
                                                  TextSpan(
                                                    text: "Rua XYZ",
                                                    style: TextStyle(
                                                      fontFamily: 'Inter',
                                                      decoration:
                                                          TextDecoration.none,
                                                      fontSize: 14.18,
                                                      color: Color(0xFF6B7280),
                                                    ),
                                                  ),
                                                ])),
                                            const Badge(
                                              alignment: Alignment.bottomRight,
                                              textStyle: TextStyle(
                                                fontFamily: 'Inter',
                                                decoration: TextDecoration.none,
                                                fontSize: 15,
                                                color: Color(0xFFFFFFFF),
                                              ),
                                              backgroundColor:
                                                  Color(0xFFFED049),
                                              label: Text('INICIADO'),
                                              largeSize: Checkbox.width * 2,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20),
                                            ),
                                          ]),
                                    ])
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                        Card(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.12,
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Empresa B",
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                decoration: TextDecoration.none,
                                                fontSize: 19,
                                                color: Color(0xFF182E4A),
                                                fontWeight: FontWeight.w700,
                                              )),
                                        ],
                                      ),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            RichText(
                                                textAlign: TextAlign.start,
                                                text: const TextSpan(children: [
                                                  WidgetSpan(
                                                    child: Icon(
                                                        Icons
                                                            .location_on_rounded,
                                                        size: 17,
                                                        color:
                                                            Color(0xFF182E4A)),
                                                  ),
                                                  TextSpan(
                                                    text: "Rua XYZ",
                                                    style: TextStyle(
                                                      fontFamily: 'Inter',
                                                      decoration:
                                                          TextDecoration.none,
                                                      fontSize: 14.18,
                                                      color: Color(0xFF6B7280),
                                                    ),
                                                  ),
                                                ])),
                                            const Badge(
                                              alignment: Alignment.bottomRight,
                                              textStyle: TextStyle(
                                                fontFamily: 'Inter',
                                                decoration: TextDecoration.none,
                                                fontSize: 15,
                                                color: Color(0xFFFFFFFF),
                                              ),
                                              backgroundColor:
                                                  Color(0xFFEB455F),
                                              label: Text('CANCELADO'),
                                              largeSize: Checkbox.width * 2,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 7
                                              ),
                                            ),
                                          ]
                                      ),
                                    ]
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                        Card(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.12,
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Empresa C",
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                decoration: TextDecoration.none,
                                                fontSize: 19,
                                                color: Color(0xFF182E4A),
                                                fontWeight: FontWeight.w700,
                                              )),
                                        ],
                                      ),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            RichText(
                                                textAlign: TextAlign.start,
                                                text: const TextSpan(children: [
                                                  WidgetSpan(
                                                    child: Icon(
                                                        Icons
                                                            .location_on_rounded,
                                                        size: 17,
                                                        color:
                                                            Color(0xFF182E4A)),
                                                  ),
                                                  TextSpan(
                                                    text: "Rua XYZ",
                                                    style: TextStyle(
                                                      fontFamily: 'Inter',
                                                      decoration:
                                                          TextDecoration.none,
                                                      fontSize: 14.18,
                                                      color: Color(0xFF6B7280),
                                                    ),
                                                  ),
                                                ])),
                                            const Badge(
                                              alignment: Alignment.bottomRight,
                                              textStyle: TextStyle(
                                                fontFamily: 'Inter',
                                                decoration: TextDecoration.none,
                                                fontSize: 15,
                                                color: Color(0xFFFFFFFF),
                                              ),
                                              backgroundColor:
                                                  Color(0xFF3C6255),
                                              label: Text('CONCLUÍDO'),
                                              largeSize: Checkbox.width * 2,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 9),
                                            ),
                                          ]),
                                    ])
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
