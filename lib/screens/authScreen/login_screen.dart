import 'package:bloc_state_management/bloc/login_bloc/login_bloc.dart';
import 'package:bloc_state_management/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController(text: "eve.holt@reqres.in");
  TextEditingController passwordController = TextEditingController(text: "cityslicka");
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: emailController,
              onChanged: (value) {
                context.read<LoginBloc>().add(
                      EmailChangeEvent(
                        email:value,
                      ),
                    );
              },
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value?.isEmpty ?? false) {
                  return " Email Required";
                }
                return null;
              },
              decoration: const InputDecoration(
                  hintText: "Enter Email", border: OutlineInputBorder()),
            ),
            TextFormField(
              controller: passwordController,
              onChanged: (value) {
                context
                    .read<LoginBloc>()
                    .add(PasswordChangeEvent(password: value,));
              },
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value?.isEmpty ?? false) {
                  return "Password Required";
                }
                return null;
              },
              decoration: const InputDecoration(
                  hintText: "Enter Password", border: OutlineInputBorder()),
            ),
            BlocListener<LoginBloc, LoginState>(listener: (context, state) {
              if (state.status == LoginStatus.success) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: Text(
                        state.message,
                      ),
                    ),
                  );
              }
            }, child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<LoginBloc>().add(AuthEvent());


                        }
                      },
                      child: state.status == LoginStatus.loading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : Text("Login")),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
