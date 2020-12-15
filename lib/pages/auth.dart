import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

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

Future<bool> signOutUser() async {
  FirebaseUser user = await _auth.currentUser();
  if (user.providerData[1].providerId == 'google.com') {
    await _googleSignIn.disconnect();
  }
  await _auth.signOut();

  return Future.value(true);

}