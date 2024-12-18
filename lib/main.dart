
import 'export.dart';
import 'screens/login_screen.dart';

import 'screens/registrar_cortes_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Web Services',
      debugShowCheckedModeBanner: false,
      //home: MapScreen(),
      home: LoginScreen(),
    );
  }
}
