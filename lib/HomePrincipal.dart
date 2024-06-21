import 'package:flutter/material.dart';
import 'maquina1.dart';
import 'seguimiento.dart';

class HomePrincipal extends StatefulWidget {
  const HomePrincipal({super.key});

  @override
  _HomePrincipalState createState() => _HomePrincipalState();
}

class _HomePrincipalState extends State<HomePrincipal> {
  String? _selectedMaquina;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coffee App'),
       backgroundColor: Color.fromARGB(255, 0, 0, 116),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Seleccione la maquina a usar en el proceso'),
              SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(5, (index) {
                  int machineNumber = index + 1;
                  return ElevatedButton(
                    onPressed: () {
                      if (machineNumber == 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Maquina1Page()),
                        );
                      } else {
                        setState(() => _selectedMaquina = 'Maquina $machineNumber');
                      }
                    },
                    child: Text('$machineNumber'),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      backgroundColor: _selectedMaquina == 'Maquina $machineNumber' ? Colors.lightBlue : null, //color de los botones
                    ),
                  );
                }),
              ),
              SizedBox(height: 16.0),  // Añade un espacio entre los botones y el botón de seguimiento
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SeguimientoPage()),
                  );
                },
                child: Text('Seguimiento'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
