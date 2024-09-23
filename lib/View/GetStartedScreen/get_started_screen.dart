import 'package:flutter/material.dart';
import 'package:glocery_app/View/LoginScreen/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/Images/8140 1.png"), fit: BoxFit.fill),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 320,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 56,
                    width: 48,
                    child: Image.asset("assets/Images/Group.png"),
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 27.0),
                    child: SizedBox(
                      // height: 106,
                      width: 200,
                      // margin: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        "Welcome",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 33,
                            color: Color.fromRGBO(255, 255, 255, 1)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    //height: 106,
                    width: 200,
                    // margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      "to our store",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 33,
                          color: Color.fromRGBO(255, 255, 255, 1)),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 20,
                width: 310,
                // margin: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Ger your groceries in as fast as one hour",
                  style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                      color: const Color.fromRGBO(252, 252, 252, 0.7)),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  });
                },
                child: Container(
                  height: 57,
                  width: 281,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19),
                      color: const Color.fromRGBO(83, 177, 117, 1)),
                  child: Center(
                    child: Text(
                      "Get started",
                      style: GoogleFonts.dmSans(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
