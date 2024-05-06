import 'package:flutter/material.dart';

void main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Colors.pink,
          onPrimary: Colors.white70,
          secondary: Colors.greenAccent,
          onSecondary: const Color.fromARGB(255, 27, 61, 121),
          error: Colors.black,
          onError: Colors.black87,
          background: const Color.fromARGB(255, 163, 177, 255),
          onBackground: Colors.redAccent,
          surface: Color.fromARGB(255, 207, 252, 95),
          onSurface: Colors.cyanAccent,
        ),
      ),
      home: Scaffold(
        body: Conversor(),
      ),
    );
  }
}

class Conversor extends StatefulWidget {
  @override
  _ConversorState createState() => _ConversorState();
}

class _ConversorState extends State<Conversor> {
  TextEditingController _controller = TextEditingController();
  String moeda1 = "";
  String moeda2 = "";
  double valor = 0;
  double resultado = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conversor de Moedas'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selecione a moeda que vai ser convertida',
              style: TextStyle(fontSize: 18),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  moeda1 = "real";
                });
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: Text('Real'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  moeda1 = "dolar";
                });
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: Text('Dolar'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  moeda1 = "euro";
                });
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: Text('Euro'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Valor a ser convertido',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  valor = double.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              'Selecione para qual moeda vai converter',
              style: TextStyle(fontSize: 18),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  moeda2 = "real";
                });
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: Text('Real'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  moeda2 = "dolar";
                });
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: Text('Dolar'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  moeda2 = "euro";
                });
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: Text('Euro'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (moeda1 == "real" && moeda2 == "real") {
                    resultado = valor * 1;
                  } else if (moeda1 == "real" && moeda2 == "dolar") {
                    resultado = valor / 5.07;
                  } else if (moeda1 == "real" && moeda2 == "euro") {
                    resultado = valor / 5.46;
                  } else if (moeda1 == "dolar" && moeda2 == "real") {
                    resultado = valor * 5.07;
                  } else if (moeda1 == "dolar" && moeda2 == "dolar") {
                    resultado = valor * 1;
                  } else if (moeda1 == "dolar" && moeda2 == "euro") {
                    resultado = valor / 1.08;
                  } else if (moeda1 == "euro" && moeda2 == "real") {
                    resultado = valor * 5.46;
                  } else if (moeda1 == "euro" && moeda2 == "dolar") {
                    resultado = valor * 1.08;
                  } else if (moeda1 == "euro" && moeda2 == "euro") {
                    resultado = valor * 1;
                  }
                });
              },
              child: Text('Converter'),
            ),
            SizedBox(height: 20),
            Text(
              'Resultado: ${resultado.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
