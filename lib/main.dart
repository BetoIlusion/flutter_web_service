import 'export.dart';
import 'screens/login_screen.dart';
import 'screens/pruebas/w_s_prueba1.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Web Services',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
