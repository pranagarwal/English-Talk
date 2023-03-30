import 'package:english_talk/providers/user_provider.dart';
import 'package:english_talk/screens/Vocab_screen/basic_vocab.dart';
import 'package:english_talk/screens/Vocabulary-View.dart';
import 'package:english_talk/screens/homePage.dart';
import 'package:english_talk/screens/loginPage.dart';
import 'package:english_talk/screens/premium_services.dart';
import 'package:english_talk/screens/radio_player.dart';
import 'package:english_talk/screens/signupPage.dart';
import 'package:english_talk/screens/verify_email.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routes: {
            '/': (context) => const Home(),
            'signup': (context) => const SignupPage(),
            'login': (context) => const LoginPage(),
            'homepage': (context) => HomePage(),
            'verifyemail': (context) => const VerifyEmailView(),
            'vocabularypage': (context) => const VocabularyView(),
            'premiumpage': (context) => const PremiumPageView(),
            'basicVocab': (context) => const BasicVocab(),
          }),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    addData();
  }

  addData() async {
    UserProvider _userProvider = Provider.of(context, listen: false);
    await _userProvider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            return HomePage();
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          }
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        }
        return const LoginPage();
      },
    );
  }
}
