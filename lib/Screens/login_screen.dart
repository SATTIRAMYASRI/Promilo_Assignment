import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:promilo_assignment/Screens/home_screen.dart';
import 'package:promilo_assignment/constants/image_constants.dart';
import 'package:promilo_assignment/constants/string_constants.dart';
import 'package:promilo_assignment/constants/space_constants.dart';
import 'package:promilo_assignment/model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> globalFormkey = new GlobalKey<FormState>();
  bool rememberMe = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late LoginRequestModel requestModel;

  @override
  void initState() {
    requestModel = LoginRequestModel(
        email: emailController.text, password: passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(15),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    StringConstants.promilo,
                    style: TextStyle(
                        color: Colors.grey.shade900,
                        fontSize: 16,
                        fontWeight: FontWeight.w900),
                  ),
                  VerticalSpaceConstants.verticalSpace30,
                  Text(
                    StringConstants.hiWelcomeBack,
                    style: TextStyle(
                        color: Colors.indigo.shade800,
                        fontSize: 16,
                        fontWeight: FontWeight.w900),
                  ),
                  VerticalSpaceConstants.verticalSpace15,
                  Form(
                    key: globalFormkey,
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            StringConstants.pleaseSignInToContinue,
                            style: TextStyle(
                                color: Colors.indigo.shade700,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          VerticalSpaceConstants.verticalSpace5,
                          TextFormField(
                            controller: emailController,
                            onSaved: (input) => requestModel.email = input!,
                            keyboardType: TextInputType.emailAddress,
                            validator: (input) => input!.contains("@")
                                ? null
                                : 'Enter a valid email Id',
                            decoration: InputDecoration(
                              hintText: StringConstants.enterEmailOrMobNo,
                              hintStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1.5),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.indigo.shade400, width: 1.5),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                            ),
                          ),
                          VerticalSpaceConstants.verticalSpace5,
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                StringConstants.signInWithOtp,
                                style: TextStyle(
                                    color: Colors.blue.shade700,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          VerticalSpaceConstants.verticalSpace15,
                          Text(
                            StringConstants.password,
                            style: TextStyle(
                                color: Colors.indigo.shade700,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          VerticalSpaceConstants.verticalSpace5,
                          TextFormField(
                            validator: (input) => input!.length > 4
                                ? null
                                : 'Enter a valid Password',
                            controller: passwordController,
                            onSaved: (input) {
                              requestModel.password = input!;
                            },
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              hintText: StringConstants.enterPassword,
                              hintStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1.5),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.indigo.shade400, width: 1.5),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                            ),
                          ),
                          VerticalSpaceConstants.verticalSpace5,
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox(
                                    value: rememberMe,
                                    activeColor: Colors.indigo,
                                    onChanged: (newValue) {
                                      setState(() {
                                        rememberMe = newValue!;
                                      });
                                    },
                                  ),
                                  Text(
                                    StringConstants.rememberMe,
                                    style: TextStyle(
                                        color: Colors.grey.shade700,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              Text(
                                StringConstants.forgetPassword,
                                style: TextStyle(
                                    color: Colors.blue.shade700,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          VerticalSpaceConstants.verticalSpace20,
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                          (states) {
                                    if (emailController.text.isNotEmpty &&
                                        passwordController.text.isNotEmpty) {
                                      return Colors.indigo.shade700;
                                    } else {
                                      return Colors.grey.shade700;
                                    }
                                  }),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  if (validateAndSave()) {
                                    login();
                                  }
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(12),
                                  child: Text(
                                    StringConstants.submit,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )),
                          ),
                          VerticalSpaceConstants.verticalSpace20,
                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: Colors.grey.shade500,
                                  thickness: 0.5,
                                ),
                              ),
                              HorizontalSpaceConstants.horizontalSpace5,
                              Text(
                                StringConstants.or,
                                style: TextStyle(color: Colors.grey.shade800),
                              ),
                              HorizontalSpaceConstants.horizontalSpace5,
                              Expanded(
                                child: Divider(
                                  color: Colors.grey.shade500,
                                  thickness: 0.5,
                                ),
                              ),
                            ],
                          ),
                          VerticalSpaceConstants.verticalSpace20,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: Image.asset(ImageConstants.googleIcon,
                                      fit: BoxFit.cover),
                                ),
                                SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: Image.asset(
                                      ImageConstants.linkedinIcon,
                                      fit: BoxFit.cover),
                                ),
                                SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: Image.asset(
                                      ImageConstants.facebookIcon,
                                      fit: BoxFit.cover),
                                ),
                                SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: Image.asset(
                                      ImageConstants.instagramIcon,
                                      fit: BoxFit.cover),
                                ),
                                SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: Image.asset(
                                      ImageConstants.whatsappIcon,
                                      fit: BoxFit.cover),
                                ),
                              ],
                            ),
                          ),
                          VerticalSpaceConstants.verticalSpace20,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    StringConstants.businessUser,
                                    style: TextStyle(
                                        color: Colors.grey.shade700,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    StringConstants.loginHere,
                                    style: TextStyle(
                                        color: Colors.blue.shade700,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    StringConstants.dontHaveAnAccount,
                                    style: TextStyle(
                                        color: Colors.grey.shade700,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    StringConstants.signUp,
                                    style: TextStyle(
                                        color: Colors.blue.shade700,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              )
                            ],
                          ),
                          VerticalSpaceConstants.verticalSpace10,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                StringConstants.byContinuingYouAgreeToPromilos,
                                style: TextStyle(
                                    color: Colors.grey.shade400,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                StringConstants.termsOfUseAndPrivacyPolicy,
                                style: TextStyle(
                                    color: Colors.grey.shade900,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          )
                        ]),
                  )
                ]),
          ),
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormkey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<void> login() async {
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();
    final String hashedPassword =
        sha256.convert(utf8.encode(password)).toString();

    final String basicAuth = 'Basic UHJvbWlsbzpxNCE1NkBaeSN4MiRHQg==';
    final Uri url = Uri.parse('https://apiv2stg.promilo.com/user/oauth/token');
    final Map<String, String> body = {
      'username': email,
      'password': hashedPassword,
      'grant_type': 'password',
    };

    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': basicAuth,
      },
      body: body,
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final String? token = responseData['response']['access_token'];
      if (token != null) {
        await storeTokenLocally(token);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => HomeScreen()), // Navigate to HomeScreen
        );
      } else {
        final snackBar = SnackBar(content: Text('Token not found in response'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } else {
      final snackBar = SnackBar(content: Text('Invalid ID Password'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future<void> storeTokenLocally(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<String?> getTokenFromLocalStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
}
