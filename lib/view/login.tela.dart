import 'package:flutter/material.dart';

void main(){
  runApp(LoginPage());
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _tecEmail = TextEditingController();
  TextEditingController _tecSenha = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Column(
          children: [
            Container(
              height: 225,
              color: Theme.of(context).primaryColor,
              child: Row(
                children: const [
                  Expanded(
                    child: Center(
                      child: Text("MicroSistema",
                        style:TextStyle(
                            fontSize: 32,
                            color: Colors.white
                        ) ,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:40,right: 18,left: 18),
              child: TextFormField(
                controller: _tecEmail,
                decoration: InputDecoration(labelText: "Email"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:40,right: 18,left: 18),
              child: TextFormField(
                controller: _tecSenha,
                decoration: InputDecoration(labelText: "Senha"),
                obscureText: true,
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top:40,right: 18,left: 18),
                      child: ElevatedButton(
                        onPressed: (){
                        },
                        child: Text("Entrar"),
                      ),
                    )
                )
              ],
            )
          ],
        )
    );
  }
}