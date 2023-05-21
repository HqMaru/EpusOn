import "package:epus_on/ui/home.dart";
import "package:flutter/material.dart";

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.6,
                  decoration: BoxDecoration(color: Colors.white),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.6,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(70)),
                  ),
                  child: Center(
                    child: Image.asset(
                      "assets/img/books.png",
                      scale: 0.8,
                    ),
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.66,
                decoration: BoxDecoration(color: Colors.blue),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.66,
                padding: EdgeInsets.only(top: 40, bottom: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(70)),
                ),
                child: Column(
                  children: [
                    Text(
                      'Belajar Adalah Segalannya',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                        wordSpacing: 2,
                      ),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        'Belajar dengan Senang Hati, dimana pun Anda berada',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Material(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Home()));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 50),
                          child: Text(
                            'Mulai',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
