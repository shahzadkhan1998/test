import 'package:ecommerce/db/users.dart';
import 'package:ecommerce/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  Signup({Key key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  UserServices _userServices = UserServices();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailTexController = TextEditingController();
  TextEditingController _passwordTexController = TextEditingController();
  TextEditingController _conformpasswordTexController = TextEditingController();
  TextEditingController _nameTexController = TextEditingController();
  bool loading = false;
  String Email;
  String Password;
  bool hidepass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: ListView(
        children: [
          Column(
            children: [
              /////++++++++++ Loading bar================>/////////
              Visibility(
                visible: loading ?? true,
                child: Container(
                  color: Colors.white.withOpacity(0.7),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                  ),
                ),
              ),
              //<================Logo Image===============>
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  child: Image.asset(
                    "images/lg.png",
                    width: double.infinity,
                    height: 200,
                  ),
                ),
              ),
              //<=========== Email Field ==============>
              Container(
                width: 0.8 * MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    //========================= Name =====================>////
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Name *",
                          prefixIcon: Icon(Icons.person_outline),
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        controller: _nameTexController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return " NAme Cannot Be Empty";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      //=============== Email======================>//
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Email *",
                          prefixIcon: Icon(Icons.email_sharp),
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailTexController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return " EMail Cannot Be Empty";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      //<=================== Paasword Field =====================>
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Password *",
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.remove_red_eye),
                            onPressed: () {
                              setState(() {
                                hidepass = false;
                              });
                            },
                          ),
                          border: OutlineInputBorder(),
                        ),
                        obscureText: hidepass,
                        keyboardType: TextInputType.emailAddress,
                        controller: _passwordTexController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Password Cannot Be Empty";
                          } else if (value.length < 6) {
                            return "Password Must be At least 6 digits";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      //<=================== Conformed Paasword Field =====================>
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Password *",
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.remove_red_eye),
                            onPressed: () {
                              setState(() {
                                hidepass = false;
                              });
                            },
                          ),
                          border: OutlineInputBorder(),
                        ),
                        obscureText: hidepass,
                        keyboardType: TextInputType.visiblePassword,
                        controller: _conformpasswordTexController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Password Cannot Be Empty";
                          } else if (value.length < 6) {
                            return "Password Must be At least 6 digits";
                          } else if (_conformpasswordTexController.text !=
                              value) {
                            return "password do not match ";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),

              //<===========SignUp============================>
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Material(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.cyan,
                  child: MaterialButton(
                    onPressed: () async {
                      validateForm();
                      print("iam workiing");
                    },
                    minWidth: 0.7 * MediaQuery.of(context).size.width,
                    child: Text(
                      "Sign Up",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ), //
              // <==================== Already Have Account ============>///////

              Column(
                children: [
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("I have Account ? click here to  :  "),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future validateForm() async {
    FormState formState = _formKey.currentState;

    if (formState.validate()) {
      final User user = firebaseAuth.currentUser;
      if (user == null) {
        firebaseAuth
            .createUserWithEmailAndPassword(
                email: _emailTexController.text,
                password: _passwordTexController.text)
            .then((user) => {
                  _userServices.createUser(user.user.uid.toString(), {
                    "username": user.user.displayName,
                    "email": user.user.email,
                    "userId": user.user.uid,
                  })
                })
            .catchError((e) => {print(e.toString())});
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => home()));
      }
    }
  }
}
