import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _surnameCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _phoneCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();
  final TextEditingController _confirmCtrl = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Inscription réussie')));
      // Do not navigate to login — stay on the registration page.
    }
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _surnameCtrl.dispose();
    _emailCtrl.dispose();
    _phoneCtrl.dispose();
    _passwordCtrl.dispose();
    _confirmCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade800,
        elevation: 0,
        title:
            const Text("Registration", style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Colors.grey,
               Colors.grey.shade100
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameCtrl,
                      decoration: InputDecoration(
                          labelText: "enter Name",
                          hintStyle: const TextStyle(color: Colors.grey),
                          border: const OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return 'please enter name';
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _surnameCtrl,
                        decoration: InputDecoration(
                            labelText: "enter surname",
                            hintStyle: const TextStyle(color: Colors.grey),
                            border: const OutlineInputBorder()),
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return 'please enter surname';
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _emailCtrl,
                        decoration: InputDecoration(
                            labelText: "enter email",
                            hintStyle: const TextStyle(color: Colors.grey),
                            border: const OutlineInputBorder()),
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return 'please enter email';
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _phoneCtrl,
                        decoration: InputDecoration(
                            labelText: "enter phone number",
                            hintStyle: const TextStyle(color: Colors.grey),
                            border: const OutlineInputBorder()),
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return 'please enter phone number';
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _passwordCtrl,
                        decoration: InputDecoration(
                            labelText: "enter password",
                            hintStyle: const TextStyle(color: Colors.grey),
                            border: const OutlineInputBorder()),
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return 'please enter password';
                          if (value.length < 6) return 'password too short';
                          return null;
                        },
                        obscureText: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _confirmCtrl,
                        decoration: InputDecoration(
                            labelText: "confirm password",
                            hintStyle: const TextStyle(color: Colors.grey),
                            border: const OutlineInputBorder()),
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return 'please confirm password';
                          if (value != _passwordCtrl.text)
                            return 'passwords do not match';
                          return null;
                        },
                        obscureText: true,
                      ),
                    ),
                    ElevatedButton(
                        onPressed: _submitForm, child: const Text('Submit'))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
