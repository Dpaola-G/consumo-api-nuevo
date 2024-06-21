import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // para decodificar la respuesta JSON

class Maquina1Page extends StatefulWidget {
  @override
  _Maquina1PageState createState() => _Maquina1PageState();
}

class _Maquina1PageState extends State<Maquina1Page> {
  List<dynamic> data = []; // Lista para almacenar los datos recibidos

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('http://localhost:8000/api/datos'));

    if (response.statusCode == 200) {
      setState(() {
        // Decodificar la respuesta JSON y asignarla a la lista 'data'
        data = json.decode(response.body);
      });
    } else {
      setState(() {
        // En caso de error, mostrar un mensaje
        data = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maquina1'),
        backgroundColor: Color.fromARGB(255, 0, 0, 116),
      ),
      body: Center(
        child: data.isEmpty
            ? Text('Loading...')
            : ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Temperatura: ${data[index]["temperatura"]}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('ID Máquina: ${data[index]["idMaquina"]}'),
                        Text(
                            'temperatura_s1: ${data[index]["temperatura_s1"]}'),
                        Text(
                            'temperatura_s2: ${data[index]["temperatura_s2"]}'),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
