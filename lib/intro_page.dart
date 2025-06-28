import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_toc_game/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});
  static var myNewFontWhite = GoogleFonts.pressStart2p(
    textStyle: TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 15),
  );
  static var myNewFont = GoogleFonts.pressStart2p(
    textStyle: TextStyle(color: Colors.black, letterSpacing: 3),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Text(
                "TIC TAC TOE",
                style: myNewFontWhite.copyWith(fontSize: 30),
              ),
            ),
            Expanded(
              child: SizedBox(
                child: AvatarGlow(
                  animate: true,
                  glowShape: BoxShape.circle,
                  // glowBorderRadius: BorderRadius.circular(80),
                  duration: Duration(seconds: 3),

                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(style: BorderStyle.none),
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      radius: 80,
                      child: SizedBox(
                        child: Image.asset(
                          'lib/images/tic_tac.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            Text(
              "@Created by Ibrahim",
              style: myNewFontWhite.copyWith(fontSize: 20),
            ),
            SizedBox(height: 50),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20,
                  bottom: 30,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(30),
                  child: Center(child: Text("PLAY GAME", style: myNewFont)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
