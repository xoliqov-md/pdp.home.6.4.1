import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:untitled1/ui/response_screen.dart';
import 'package:untitled1/utils/controllers.dart';

void main() async{
  await Hive.initFlutter();
  await Hive.openBox('user');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(26, 29, 55, 110),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(),
            Container(
              margin: const EdgeInsets.all(10),
              width: 70,
              height: 70,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://xoliqov.netlify.app/assets/img/profile-img.jpg'
                      )
                  )
              ),
              alignment: Alignment.center,
            ),
            FittedBox(
              child: Text(
                'Welcome Back !',
                style: GoogleFonts.rubik(fontSize: 30, color: Colors.white),
              ),
            ),
            FittedBox(
              child: Text(
                'Sign in to continue',
                style: GoogleFonts.roboto(color: Colors.white, fontSize: 20),
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  TextField(
                    style: const TextStyle(color: Colors.white),
                    controller: InputController.username,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: 'User name',
                        hintStyle: TextStyle(color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        fillColor: Colors.white,
                        prefixIconColor: Colors.white,
                        focusColor: Colors.white),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    style: const TextStyle(color: Colors.white),
                    controller: InputController.password,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.key_outlined),
                        hintText: 'User name',
                        hintStyle: TextStyle(color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        fillColor: Colors.white,
                        prefixIconColor: Colors.white,
                        focusColor: Colors.white),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: const Text(
                      'Forgot Password ?',
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: FloatingActionButton(
                onPressed: () {
                  if(InputController.username.text.isEmpty || InputController.password.text.isEmpty){
                      AwesomeDialog(
                          context: context,
                          dialogType: DialogType.error,
                          animType: AnimType.rightSlide,
                          title: 'Error !',
                          desc: 'error !',
                          btnCancelOnPress: () {},
                          btnOkOnPress: () {},
                      ).show();
                  }
                  var box = Hive.box('user');
                  box.put('username', InputController.username.text);
                  box.put('password', InputController.password.text);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ResponseScreen()));
                },
                child: const Icon(Icons.arrow_forward),
              ),
            ),
            const Spacer(),
            Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Don\'t have an account ?',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'SIGN UP',
                    style: TextStyle(color: Colors.blue),
                  )
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
