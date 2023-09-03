import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../model/task_model.dart';
import '../../../util/utils.dart';
import '../../../view/home/home.dart';
import '../../../view_model/controller/signin_controller.dart';
import '../../../view_model/controller/signup_controller.dart';
import '../../shared pref/shared_pref.dart';


class FirebaseService {
  static final FirebaseAuth auth = FirebaseAuth.instance;
  static final FirebaseDatabase database = FirebaseDatabase.instance;
  static final signInController = Get.put(SignInController());
  static final signUpController = Get.put(SignupController());



  static Future<void> createAccount() async {
    try {
      signUpController.setLoading(true);
      final String str = signUpController.email.value.text.toString();
      final String node = str.substring(0, str.indexOf('@'));
      database.ref('Accounts').child(node).set({
        'name': '${signUpController.name.value.text} ',
        'email': signUpController.email.value.text.toString(),
        'password': signUpController.password.value.text.toString(),
      }).then((value) {
        auth
            .createUserWithEmailAndPassword(
                email: signUpController.email.value.text.toString(),
                password: signUpController.password.value.text.toString())
            .then((value) {
          UserPref.setUser(
              '${signUpController.name.value.text} ',
              signUpController.email.value.text.toString(),
              signUpController.password.value.text.toString(),
              node,
              value.user!.uid.toString());
          Utils.showSnackBar(
              'Sign up',
              "Account is successfully created",
              const Icon(
                Icons.done,
                color: Colors.white,
              ));
          Get.to(HomePage());
          signUpController.setLoading(false);
        }).onError((error, stackTrace) {
          Utils.showSnackBar(
              'Error',
              Utils.extractFirebaseError(error.toString()),
              const Icon(
                FontAwesomeIcons.triangleExclamation,
                color: Colors.red,
              ));
          signUpController.setLoading(false);
        });
      }).onError((error, stackTrace) {
        Utils.showSnackBar(
            'Error',
            Utils.extractFirebaseError(error.toString()),
            const Icon(
              FontAwesomeIcons.triangleExclamation,
              color: Colors.red,
            ));
        signUpController.setLoading(false);
      });
    } catch (e) {
      Utils.showSnackBar(
          'Error',
          Utils.extractFirebaseError(e.toString()),
          const Icon(
            FontAwesomeIcons.triangleExclamation,
            color: Colors.red,
          ));
      signUpController.setLoading(true);
    }
  }
  static Future<void> loginAccount() async {
    try {
      signInController.setLoading(true);
      auth
          .signInWithEmailAndPassword(
        email: signInController.email.value.text.toString(),
        password: signInController.password.value.text.toString(),
      )
          .then((value) {
        String node =
            value.user!.email!.substring(0, value.user!.email!.indexOf('@'));
        database.ref('Accounts').child(node).onValue.listen((event) {
          UserPref.setUser(
            event.snapshot.child('name').value.toString(),
            event.snapshot.child('email').value.toString(),
            event.snapshot.child('password').value.toString(),
            node,
            value.toString(),
          );
          Utils.showSnackBar(
              'Sign up',
              "Successfully Login.Welcome Back!",
              const Icon(
                Icons.done,
                color: Colors.white,
              ));
          Get.to(HomePage());
          signInController.setLoading(false);
        }).onError((error, stackTrace) {
          Utils.showSnackBar(
              'Error',
              Utils.extractFirebaseError(error.toString()),
              const Icon(
                FontAwesomeIcons.triangleExclamation,
                color: Colors.red,
              ));
          signInController.setLoading(false);
        });
      }).onError((error, stackTrace) {
        Utils.showSnackBar(
            'Error',
            Utils.extractFirebaseError(error.toString()),
            const Icon(
              FontAwesomeIcons.triangleExclamation,
              color: Colors.red,
            ));
        signInController.setLoading(false);
      });
    } catch (e) {
      Utils.showSnackBar(
          'Error',
          Utils.extractFirebaseError(e.toString()),
          const Icon(
            FontAwesomeIcons.triangleExclamation,
            color: Colors.red,
          ));
      signInController.setLoading(true);
    }
  }
  static Future<void> signInwWithGoogle()async{
    try{
      final GoogleSignIn googleSignIn = GoogleSignIn();
      googleSignIn.signIn().then((GoogleSignInAccount? googleSignInAccount) async {
        if (googleSignInAccount != null) {
          // Get the GoogleSignInAuthentication object
          final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
          // Create an AuthCredential object
          final AuthCredential credential = GoogleAuthProvider.credential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken,
          );

          await auth.signInWithCredential(credential).then((value) {
            final String str = value.user!.email.toString();
            final String node = str.substring(0, str.indexOf('@'));
            database.ref('Accounts').child(node).set({
              'name' : value.user!.displayName,
              'email' : value.user!.email,
            }).then((val) {
              Utils.showSnackBar(
                  'Login',
                  'Successfully Login',
                  const Icon(
                    FontAwesomeIcons.triangleExclamation,
                    color: Colors.red,
                  ));
              UserPref.setUser(
                  value.user!.displayName!,
                  value.user!.email!,
                  "NOPASSWORD",
                  node,
                  value.user!.uid);
            }).onError((error, stackTrace) {
              Utils.showSnackBar(
                  'Error',
                  Utils.extractFirebaseError(error.toString()),
                  const Icon(
                    FontAwesomeIcons.triangleExclamation,
                    color: Colors.red,
                  ));
              return;
            });
          }).onError((error, stackTrace) {
            Utils.showSnackBar(
                'Error',
                Utils.extractFirebaseError(error.toString()),
                const Icon(
                  FontAwesomeIcons.triangleExclamation,
                  color: Colors.red,
                ));
            return;
          });
        }
      }).onError((error, stackTrace) {
        Utils.showSnackBar(
            'Error',
            Utils.extractFirebaseError(error.toString()),
            const Icon(
              FontAwesomeIcons.triangleExclamation,
              color: Colors.red,
            ));
        return;
      });
    }catch(e){
      Utils.showSnackBar(
          'Error',
          Utils.extractFirebaseError(e.toString()),
          const Icon(
            FontAwesomeIcons.triangleExclamation,
            color: Colors.red,
          ));
    }
  }
  static Future<void> signInWithApple()async{
  }



  static Future<int> childCount()async{
    String str = auth.currentUser!.email.toString();
    String node = str.substring(0, str.indexOf('@'));
    return database.ref('Tasks').child(node).once().then((value){
      return value.snapshot.children.length;
    });
  }
  static Future<void> update(String key,String updateKey,String updateValue) async{
    String str = auth.currentUser!.email.toString();
    String node = str.substring(0, str.indexOf('@'));
   database.ref('Tasks').child(node).child(key).update({
     updateKey : updateValue
   });
  }


}
