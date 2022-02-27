import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:shop_app_vendor/screens/registration_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
    stream: FirebaseAuth.instance.authStateChanges(),
    // If the user is already signed-in, use it as initial data
    initialData: FirebaseAuth.instance.currentUser,
    builder: (context, snapshot) {
    // User is not signed in
    if (!snapshot.hasData) {
      return  SignInScreen(
        headerBuilder: (context, constraints, _) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: AspectRatio(
        aspectRatio: 1,
        child: Image.network('https://firebase.flutter.dev/img/flutterfire_300x.png'),
      ),
    );
  },
  subtitleBuilder: (context, action) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        action == AuthAction.signIn
            ? 'Chào mừng bạn đến với trang quản trị, vui lòng đăng nhập để tiếp tục.'
            : 'Chào mừng bạn đến với trang quản trị, vui lòng tạo tài khoản mới',
      ),
    );
  },
  footerBuilder: (context, _) {
    return const Padding(
      padding: EdgeInsets.only(top: 16),
      child: Text(
        'By signing in, you agree to our terms and conditions.',
        style: TextStyle(color: Colors.grey),
      ),
    );
  },
  
        providerConfigs: const [
          //các hình thức đăng nhập
          EmailProviderConfiguration(),
          GoogleProviderConfiguration(clientId: '1:132811630565:android:306c415429a14ca297710c'),
          PhoneProviderConfiguration()
        ]
      );
    }

    // Render your application if authenticated
    return const RegistrationScreen();
  },
);
  }
}
