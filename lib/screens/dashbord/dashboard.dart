import 'package:bytebank/components/saldo/saldo.dart';
import 'package:bytebank/screens/deposito/formulario.dart';
import 'package:bytebank/screens/transferencia/formulario.dart';
import 'package:bytebank/screens/transferencia/ultimas.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bytebank'),
      ),
      body: ListView(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SaldoCard(),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FormularioDeposito();
                  }));
                },
                child: Text("Receber depósito"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FormularioTransferencia();
                  }));
                },
                child: Text("Nova Transferência"),
              ),
            ],
          ),
          UltimasTransferencias(),
        ],
      ),
    );
  }
}
