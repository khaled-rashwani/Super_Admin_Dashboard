import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../super_admin_dashboard/shared/components/components.dart';
import '../project_shared/constants.dart';
import 'login_cubit/login_cubit.dart';
import 'login_cubit/login_states.dart';


class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isPassword = true;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: myDarkBG,
                elevation: 0,
              ),
              body: Stack(
                children: [
// Background image
                  Positioned.fill(
                    child: Image.asset(
                      'assets/images/background3.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 700,
                      height: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: SingleChildScrollView(
                          child: Form(
                            key: formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    "We welcome all success partners",
                                    style:
                                    TextStyle(fontSize: 10, color: Colors.grey),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      child: Text(
                                        "Login to our community",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 35),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 17),
                                      child: Container(
                                        width: 8,
                                        height: 8,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: primaryColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 200,
                                  child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          width: 300,
                                          height: 300,
                                          child: Image.asset(
                                            'assets/images/logo.png',
                                            width: 55,
                                            fit: BoxFit.contain,
                                          ),
                                        )
                                      ]),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: emailController,
                                  onFieldSubmitted: (value) {},
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Email Address must not be empty";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: "Email Address",
                                    prefixIcon: Icon(Icons.email_outlined),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  controller: passwordController,
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: isPassword,
                                  onFieldSubmitted: (value) {},
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Password must not be empty";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: "Password",
                                    suffix: InkWell(
                                      onTap: () {
                                        setState(() {
                                          isPassword = !isPassword;
                                        });
                                      },
                                      child: isPassword
                                          ? Icon(Icons.visibility)
                                          : Icon(Icons.visibility_off),
                                    ),
                                    suffixIconConstraints: BoxConstraints(
                                      minWidth: 2,
                                      minHeight: 2,
                                    ),
                                    prefixIcon: Icon(Icons.lock_outline),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                // Center(
                                //   child: defaultCreatebuttom(
                                //       height: 60,
                                //       width: 180,
                                //       label: "Login Admin",
                                //       onTap: () {
                                //         if (formKey.currentState!.validate()) {
                                //           AuthCubit.get(context).userLogin(
                                //               email: emailController.text,
                                //               password: passwordController.text,context: context);
                                //         }
                                //       }),
                                // )
                                Center(
                                    child : ConditionalBuilder(
                                      condition: state is! LoginLoadingState,
                                      //condition: true,
                                      builder: (context) =>defaultCreatebuttom(
                                          height: 60,
                                          width: 180,
                                          label: "Login Admin",
                                          onTap: () {
                                            if (formKey.currentState!.validate()) {
                                                        AuthCubit.get(context).userLogin(
                                                            email: emailController.text,
                                                            password: passwordController.text,context: context);
                                              //Dragon Context
                                            }
                                          }),
                                      fallback: (context) =>Center(child: CircularProgressIndicator(),),
                                    )
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ));
        });
  }
}
