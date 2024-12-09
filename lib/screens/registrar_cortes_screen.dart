import 'package:flutter_web_service/export.dart';


///formulario para registracortes 
class RegistrarCortesScreen extends StatefulWidget {
  const RegistrarCortesScreen({super.key});

  @override
  State<RegistrarCortesScreen> createState() => _RegistrarCortesScreenState();
}

class _RegistrarCortesScreenState extends State<RegistrarCortesScreen> {
final _formKey = GlobalKey<FormState>();
  final _codUserController = TextEditingController();
  final _codFijoController = TextEditingController();
  final _nombreController = TextEditingController();
  final _medidorController = TextEditingController();
  final _numberController = TextEditingController();
  String? _selectedObservacion;

  List<String> observaciones = [
    'No se pudo leer el medidor',
    'Medidor dañado',
    'Acceso bloqueado',
    // Añade más observaciones según necesites
  ];

  @override
  void dispose() {
    _codUserController.dispose();
    _codFijoController.dispose();
    _nombreController.dispose();
    _medidorController.dispose();
    _numberController.dispose();
    super.dispose();
  }

  Future<void> _grabarCorte() async {
    if (_formKey.currentState!.validate()) {
      // TODO: Implementar la lógica para guardar el corte
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Corte registrado correctamente')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Logo
                Row(
                  children: [
                    Image.asset(
                      'assets/logo_gosiv.png',
                      height: 40,
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Campos de información
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _codUserController,
                        decoration: const InputDecoration(
                          labelText: 'Cod. Usuario',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Campo requerido';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: _codFijoController,
                        decoration: const InputDecoration(
                          labelText: 'Cod. Fijo',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Campo requerido';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Nombre
                TextFormField(
                  controller: _nombreController,
                  decoration: const InputDecoration(
                    labelText: 'Nombre',
                    border: OutlineInputBorder(),
                  ),
                  readOnly: true,
                ),

                const SizedBox(height: 16),

                // Medidor Serie y Número
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _medidorController,
                        decoration: const InputDecoration(
                          labelText: 'Medidor Serie',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: _numberController,
                        decoration: const InputDecoration(
                          labelText: 'Número',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Dropdown de observaciones
                DropdownButtonFormField<String>(
                  value: _selectedObservacion,
                  decoration: const InputDecoration(
                    labelText: 'Observación',
                    border: OutlineInputBorder(),
                  ),
                  items: observaciones.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _selectedObservacion = value;
                    });
                  },
                ),

                const SizedBox(height: 24),

                // Botón Grabar Corte
                ElevatedButton(
                  onPressed: _grabarCorte,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: const Text(
                    'Grabar Corte',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                // Botón Ir al plano
                ElevatedButton(
                  onPressed: () {
                    // TODO: Implementar navegación al plano
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: const Text(
                    'Ir al plano',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                // Botón Volver al menú
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: const Text(
                    'Volver al menú',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}