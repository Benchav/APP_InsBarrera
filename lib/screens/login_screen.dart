import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/index.dart';
import 'home_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(
            "Iniciar Sesión",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 171, 251),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlueAccent, Colors.blue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ChangeNotifierProvider(
            create: (_) => LoginFormProvider(),
            child: _LoginForm(),
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextFormField(
          autocorrect: false,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Correo Electrónico',
            labelStyle: TextStyle(color: Colors.white),
            filled: true,
            fillColor: Colors.white.withOpacity(0.2),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
          style: TextStyle(color: Colors.white),
          onChanged: (value) => loginForm.email = value,
          validator: (value) {
            String pattern =
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
            RegExp regExp = RegExp(pattern);
            return regExp.hasMatch(value ?? '') ? null : 'Correo no válido';
          },
        ),
        SizedBox(height: 20),
        TextFormField(
          autocorrect: false,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Contraseña',
            labelStyle: TextStyle(color: Colors.white),
            filled: true,
            fillColor: Colors.white.withOpacity(0.2),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
          style: TextStyle(color: Colors.white),
          onChanged: (value) => loginForm.password = value,
          validator: (value) {
            return (value != null && value.length >= 6)
                ? null
                : 'La contraseña debe tener al menos 6 caracteres';
          },
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: loginForm.isLoading
              ? null
              : () async {
                  FocusScope.of(context).unfocus();

                  final authService =
                      Provider.of<AuthService>(context, listen: false);

                  if (!loginForm.isValidForm()) return;

                  loginForm.isLoading = true;

                  final String? errorMessage = await authService.login(
                    loginForm.email,
                    loginForm.password,
                  );

                  if (errorMessage == null) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(errorMessage)),
                    );
                  }

                  loginForm.isLoading = false;
                },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white.withOpacity(0.8),
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            loginForm.isLoading ? 'Espere' : 'Iniciar Sesión',
            style: TextStyle(color: Color.fromARGB(255, 0, 171, 251)),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RegisterScreen()),
            );
          },
          child: Text(
            'Registrar',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
