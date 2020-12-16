import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();
final FacebookLogin _facebookLogin = FacebookLogin();
bool isFLogin = false;


Future<bool> googleSignIn() async {
  GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();

  if(googleSignInAccount != null) {
    GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

    AuthCredential credential = GoogleAuthProvider.getCredential(idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    AuthResult result =  await _auth.signInWithCredential(credential);

    FirebaseUser user = await _auth.currentUser();
    print(user.uid);

    return Future.value(true);
  }
}

Future handleLogin () async {
  FacebookLoginResult _result = await _facebookLogin.logIn(['email']);

  switch (_result.status) {
    case FacebookLoginStatus.cancelledByUser:
      print('cancelled by user');
      break;
    case FacebookLoginStatus.error:
      print('error');
      break;
    case FacebookLoginStatus.loggedIn:
      await facebookSignIn(_result);
      break;
  }
}

Future facebookSignIn(FacebookLoginResult _result) async {
  FacebookAccessToken _accessToken = _result.accessToken;
  AuthCredential _credential = FacebookAuthProvider.getCredential(accessToken: _accessToken.token);
  var a = await _auth.signInWithCredential(_credential);
  isFLogin = true;
}

Future<bool> signOutUser() async {
  FirebaseUser user = await _auth.currentUser();
  if (user.providerData[1].providerId == 'google.com') {
    await _googleSignIn.disconnect();
  }
  await _auth.signOut();
  _facebookLogin.logOut();

  isFLogin = false;
  return Future.value(true);

}
