import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/pages/Signup.dart';
import 'package:ecommerce/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailTexController = TextEditingController();
  TextEditingController _passwordTexController = TextEditingController();
  SharedPreferences preferences;
  bool loading = false;
  bool isLogedin = false;
  String Email;
  String Password;
  bool hideshow = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSignedIn();
    setState(() {});
  }

  //================> SignIn Method Called ========================>//
  void isSignedIn() async {
    setState(() {
      loading = true;
    });

    preferences = await SharedPreferences.getInstance();
    isLogedin = await googleSignIn.isSignedIn();
    if (isLogedin) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => home()));
    }
    setState(() {
      loading = false;
    });
  }

  //=========================> Aother method to handle The sign in Method==================>//

  Future signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult =
        await firebaseAuth.signInWithCredential(credential);
    final User user = authResult.user;

    final User currentUser = firebaseAuth.currentUser;
    if (currentUser != null) {
      final QuerySnapshot result = await FirebaseFirestore.instance
          .collection('users')
          .where("id", isEqualTo: currentUser.uid)
          .get();
      final List<DocumentSnapshot> document = result.docs;
      if (document.length == 0) {
        FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser.uid)
            .set({
              'id': currentUser.uid,
              'username': currentUser.displayName,
              'profilePicture': currentUser.photoURL
            })
            .then((value) => print("User Added"))
            .catchError((error) => print("Failed to add user: $error"));

        await preferences.setString("id", currentUser.uid);
        await preferences.setString("username", currentUser.displayName);
        await preferences.setString("profilePicture", currentUser.displayName);
      } else {
        await preferences.setString("id", document[0]['id']);
        await preferences.setString("username", document[0]['displayName']);
        await preferences.setString(
            "profilePicture", document[0]['profilePicture']);
      }
      Fluttertoast.showToast(msg: "Login Was Successfully");
      setState(() {
        loading = false;
      });
    } else {}
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                padding: const EdgeInsets.all(50.0),
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
                    children: [
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
                          return Email = value;
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
                                hideshow = false;
                              });
                            },
                          ),
                          border: OutlineInputBorder(),
                        ),
                        obscureText: hideshow,
                        keyboardType: TextInputType.emailAddress,
                        controller: _passwordTexController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Password Cannot Be Empty";
                          } else if (value.length > 6) {
                            return "Password Must be At least 6 digits";
                          }
                          return Email = value;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              //<===========SignIn============================>
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Material(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.cyan,
                  child: MaterialButton(
                    onPressed: () {},
                    minWidth: 0.7 * MediaQuery.of(context).size.width,
                    child: Text(
                      "Login",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ), //
              // <==================== Forget Password ============>
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  child: Card(child: Text("Forget Password")),
                ),
              ),
              Column(
                children: [
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Dont have Account ? click here to  : "),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Signup()));
                          },
                          child: Text(
                            "Sign Up",
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
      // <============== GOogle SignIn Button ==============>//
      bottomNavigationBar: Container(
        width: 0.2 * MediaQuery.of(context).size.width,
        // ignore: deprecated_member_use
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
          child: InkWell(
            onTap: () {
              signInWithGoogle();
            },
            child: Card(
              elevation: 0.1,
              child: Text(
                "SignIn With Google",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
