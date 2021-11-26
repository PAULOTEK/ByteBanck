import 'package:bytebank/models/transferencias/transferencias.dart';
import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final _titulo = 'Últimas transferências';
final _conteudoBotao = 'Visualizar todas';

class UltimasTransferencias extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(_titulo),
        Consumer<Transferencias>(
          builder: (context, transferencias, child) {
            final _ultimasTransferencias = transferencias.transferencias.reversed.toList();
            final _quantidade = transferencias.transferencias.length;
            int tamanho;

            if (_quantidade < 3) {
              tamanho = _quantidade;
            } else {
              tamanho = 2;
            }

            return ListView.builder(
              padding: const EdgeInsets.all(8),
              shrinkWrap: true,
              itemCount: tamanho,
              itemBuilder: (context, indice) {
                final _transferencia = _ultimasTransferencias[indice];
                final _valor = _transferencia.toStringValor();
                final _conta = _transferencia.toStringConta();

                return Card(
                  child: ListTile(
                    leading: Icon(Icons.monetization_on),
                    title: Text(_valor),
                    subtitle: Text(_conta),
                  ),
                );
              },
            );
          },
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
          ),
          child: Text(_conteudoBotao),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return ListaTransferencias();
              }),
            );
          },
        ),
      ],
    );
  }
}

class SemtransferenciasCadastrada extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      margin: EdgeInsets.all(48),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          "Você ainda não tem tranfêrencia",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
