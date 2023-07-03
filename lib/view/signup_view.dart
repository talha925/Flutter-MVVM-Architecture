import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes.dart';
import 'package:provider/provider.dart';

import '../res/component/round_button.dart';
import '../utils/utils.dart';
import '../view_model/auth_view_model.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final ValueNotifier<bool> _obsecuretext = ValueNotifier(true);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordComtroller = TextEditingController();

  FocusNode emailFocuseNode = FocusNode();
  FocusNode passwordFocuseNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    emailController.dispose();
    passwordComtroller.dispose();
    emailFocuseNode.dispose();
    passwordFocuseNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Signup Screen"),
            centerTitle: true,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                focusNode: emailFocuseNode,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: "Email",
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
                onFieldSubmitted: (value) {
                  Utils.fieldFocusChange(
                      context, emailFocuseNode, passwordFocuseNode);
                },
              ),
              ValueListenableBuilder(
                valueListenable: _obsecuretext,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: passwordComtroller,
                    focusNode: passwordFocuseNode,
                    obscureText: _obsecuretext.value,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                      hintText: "Password",
                      labelText: 'password',
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: InkWell(
                        onTap: () {
                          _obsecuretext.value = !_obsecuretext.value;
                        },
                        child: Icon(_obsecuretext.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: height * .065,
              ),
              RoundButton(
                title: 'Signup',
                loading: authViewModel.signUpLoading,
                onTap: () {
                  if (emailController.text.isEmpty) {
                    Utils.snackBar("Please enter email", context);
                  } else if (passwordComtroller.text.isEmpty) {
                    Utils.snackBar("Please enter password", context);
                  } else if (passwordComtroller.text.length < 6) {
                    Utils.snackBar("Please enter 6 digit password", context);
                  } else {
                    Map data = {
                      'email': emailController.text.toString(),
                      'password': passwordComtroller.text.toString(),
                    };
                    authViewModel.signUpApi(data, context);
                    print("api hit ");
                  }
                },
              ),
              SizedBox(
                height: height * .02,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.login);
                },
                child: Text("Alredy have an account? Login"),
              ),
            ],
          )),
    );
  }
}
