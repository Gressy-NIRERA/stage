import 'package:flutter/material.dart';
import 'register.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stage App',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.orange.shade900,
              Colors.orange.shade800,
              Colors.orange.shade400
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 80),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Login',
                      style: TextStyle(color: Colors.white, fontSize: 40)),
                  SizedBox(height: 10),
                  Text('Welcome',
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 40),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: const Color.fromRGBO(225, 95, 27, .3),
                                blurRadius: 20,
                                offset: const Offset(0, 10)),
                          ],
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(color: Colors.grey))),
                              child: TextField(
                                controller: _emailCtrl,
                                decoration: const InputDecoration(
                                    labelText: 'Email or Phone number',
                                    border: InputBorder.none),
                              ),
                            ),
                            Container(
                              child: TextField(
                                controller: _passwordCtrl,
                                obscureText: true,
                                decoration: const InputDecoration(
                                    labelText: 'Mot de passe',
                                    border: InputBorder.none),
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          // Add login logic
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange[900],
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 48),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        child: const Text('Se connecter',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("vous n'avez pas de compte? ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Registration()));
                            },
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.grey.shade800),
                            child: const Text("S'Inscrire"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
