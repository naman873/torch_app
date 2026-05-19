import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Party Lights',
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => TorchHome()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox.expand(
        child: Image.asset(
          "assets/splash.png",
          fit: BoxFit.cover, // 🔥 FULL SCREEN
        ),
      ),
    );
  }
}

class TorchHome extends StatefulWidget {
  const TorchHome({super.key});

  @override
  _TorchHomeState createState() => _TorchHomeState();
}

class _TorchHomeState extends State<TorchHome> {
  // BannerAd? _bannerAd;
  //
  // Timer? timer;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   colors.insert(0, rainbowBlendColor);
  //
  //   setState(() {});
  //   _loadAd();
  // }
  //
  // Color selectedColor = Colors.red;
  //
  // Color rainbowBlendColor = Color.fromARGB(255, 127, 63, 191);
  //
  // List<Color> colors = [
  //   Colors.red,
  //   Colors.pink,
  //   Colors.purple,
  //   Colors.deepPurple,
  //   Colors.indigo,
  //   Colors.blue,
  //   Colors.lightBlue,
  //   Colors.cyan,
  //   Colors.teal,
  //   Colors.green,
  //   Colors.lightGreen,
  //   Colors.lime,
  //   Colors.yellow,
  //   Colors.amber,
  //   Colors.orange,
  //   Colors.deepOrange,
  //   Colors.brown,
  //   Colors.grey,
  //   Colors.blueGrey,
  //   Colors.redAccent,
  //   Colors.pinkAccent,
  //   Colors.purpleAccent,
  //   Colors.deepPurpleAccent,
  //   Colors.indigoAccent,
  //   Colors.blueAccent,
  //   Colors.lightBlueAccent,
  //   Colors.cyanAccent,
  //   Colors.tealAccent,
  //   Colors.greenAccent,
  //   Colors.lightGreenAccent,
  //   Colors.limeAccent,
  //   Colors.yellowAccent,
  //   Colors.amberAccent,
  //   Colors.orangeAccent,
  //   Colors.deepOrangeAccent,
  //   Colors.white,
  //   Colors.black,
  //   Colors.transparent,
  // ];
  //
  // void _loadAd() {
  //   _bannerAd = BannerAd(
  //     size: AdSize.banner,
  //     // adUnitId: 'ca-app-pub-3940256099942544/6300978111', // Test ID
  //     adUnitId: 'ca-app-pub-5435416900750556/6150776301', // Live ID
  //     listener: BannerAdListener(),
  //     request: AdRequest(),
  //   )..load();
  // }

//   bool _isOn = false;
//   final TorchController _torchController = TorchController();
//
//   void _toggleTorch() async {
//     await _torchController.setFullBrightness();
//     setState(() {
//       _isOn = !_isOn;
//     });
//     if (_isOn == false) {
//       await _torchController.setLowBrightness();
//     }
//   }
//
//   @override
//   void dispose() {
//     _bannerAd?.dispose();
//     super.dispose();
//   }
//
//   void discoLight() {
//     timer = Timer.periodic(Duration(milliseconds: 250), (_) {
//       setState(() {
//         selectedColor = colors[Random().nextInt(colors.length)];
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: _isOn ? selectedColor : Colors.black,
//       body: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Spacer(),
//             Container(
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.black, width: 4),
//                 color: Colors.white,
//                 shape: BoxShape.circle,
//               ),
//               child: IconButton(
//                 iconSize: 100,
//                 icon: Icon(
//                   _isOn ? Icons.flashlight_on : Icons.flashlight_off,
//                   color: _isOn ? Colors.black : Colors.black,
//                 ),
//                 onPressed: _toggleTorch,
//               ),
//             ),
//             Expanded(child: Container()),
//             SizedBox(
//               height: 50,
//               child: ListView.separated(
//                   shrinkWrap: true,
//                   scrollDirection: Axis.horizontal,
//                   itemCount: colors.length,
//                   separatorBuilder: (context, index) {
//                     return SizedBox(
//                       width: 2,
//                     );
//                   },
//                   itemBuilder: (context, index) {
//                     return GestureDetector(
//                       onTap: () {
//                         if (colors[index] ==
//                             Color.fromARGB(255, 127, 63, 191)) {
//                           discoLight();
//                         } else {
//                           if (timer != null) {
//                             timer!.cancel();
//                           }
//                           selectedColor = colors[index];
//                         }
//                         setState(() {});
//                       },
//                       child: colors[index] != Color.fromARGB(255, 127, 63, 191)
//                           ? Container(
//                               height: 30,
//                               width: 30,
//                               color: colors[index],
//                             )
//                           : Container(
//                               width: 50,
//                               height: 50,
//                               decoration: const BoxDecoration(
//                                 gradient: LinearGradient(
//                                   colors: [
//                                     Colors.red,
//                                     Colors.orange,
//                                     Colors.yellow,
//                                     Colors.green,
//                                     Colors.blue,
//                                     Colors.indigo,
//                                     Colors.purple,
//                                   ],
//                                   begin: Alignment.topLeft,
//                                   end: Alignment.bottomRight,
//                                 ),
//                               ),
//                             ),
//                     );
//                   }),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             if (_bannerAd != null)
//               SizedBox(
//                 height: _bannerAd!.size.height.toDouble(),
//                 width: MediaQuery.of(context).size.width,
//                 child: AdWidget(ad: _bannerAd!),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

  bool isOn = false;
  Timer? timer;
  BannerAd? _bannerAd;

  Color selectedColor = Colors.black;

  List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.purple,
    Colors.orange,
    Colors.yellow,
  ];
  double speed = 300;

  void toggleLight() {
    setState(() {
      isOn = !isOn;
    });
  }

  @override
  void initState() {
    _loadAd();
    super.initState();
  }

  void _loadAd() {
    _bannerAd = BannerAd(
      size: AdSize.banner,
      // adUnitId: 'ca-app-pub-3940256099942544/6300978111', // Test ID
      adUnitId: 'ca-app-pub-5435416900750556/6150776301', // Live ID
      listener: BannerAdListener(),
      request: AdRequest(),
    )..load();
  }

  void startDisco() {
    timer?.cancel();

    timer = Timer.periodic(Duration(milliseconds: (900 - speed).toInt()), (_) {
      setState(() {
        selectedColor = colors[Random().nextInt(colors.length)];
      });
    });
  }

  void stopDisco() {
    timer?.cancel();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  double hue = 0; // 0–360
  double brightness = 1.0;

  Color get currentColor => HSVColor.fromAHSV(1, hue, 1, brightness).toColor();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isOn ? selectedColor : Colors.black,
      body: AnimatedContainer(
        duration: Duration(milliseconds: 30),
        color: isOn ? selectedColor : Colors.black,
        child: SafeArea(
          child: Column(
            children: [
              /// 🔥 Title
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  "Party Lights",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                ),
              ),

              Spacer(),

              /// 🔥 Power Button
              GestureDetector(
                onTap: toggleLight,
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: isOn
                          ? [Colors.pink, Colors.blue]
                          : [Colors.grey.shade800, Colors.black],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: isOn ? Colors.pink : Colors.black,
                        blurRadius: 25,
                        spreadRadius: 3,
                      )
                    ],
                  ),
                  child: Icon(
                    isOn ? Icons.flash_on : Icons.flash_off,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),

              SizedBox(height: 40),

              /// 🎛️ Modes
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  modeButton("Color", () {
                    timer?.cancel();
                    isOn = true;
                    setState(() {});
                  }),
                  modeButton("Disco", () {
                    isOn = true;
                    startDisco();
                    setState(() {});
                  }),
                  modeButton("Strobe", () {
                    isOn = true;
                    startStrobe();
                    setState(() {});
                  }),
                ],
              ),

              SizedBox(height: 30),

              /// 🎚️ Speed Slider
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Text("Speed", style: TextStyle(color: Colors.white)),
                    Slider(
                        value: speed,
                        min: 100,
                        max: 800,
                        divisions: 7,
                        onChanged: (value) {
                          setState(() {
                            speed = value;
                          });

                          if (timer != null) {
                            startDisco(); // restart with new speed
                          }
                        }),
                  ],
                ),
              ),

              SizedBox(height: 20),

              /// 🎨 Color Picker
              // SizedBox(
              //   height: 60,
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: colors.length + 1,
              //     itemBuilder: (context, index) {
              //       return GestureDetector(
              //         onTap: () {
              //           if (index == 0) {
              //             // 🌈 Rainbow
              //             isOn = true;
              //             startDisco();
              //           } else {
              //             timer?.cancel();
              //             isOn = true; // 🔥 THIS WAS MISSING
              //             selectedColor = colors[index - 1];
              //           }
              //           setState(() {});
              //         },
              //         child: index == 0
              //             ? Container(
              //                 width: 50,
              //                 height: 50,
              //                 decoration: const BoxDecoration(
              //                   shape: BoxShape.circle,
              //                   gradient: LinearGradient(
              //                     colors: [
              //                       Colors.red,
              //                       Colors.orange,
              //                       Colors.yellow,
              //                       Colors.green,
              //                       Colors.blue,
              //                       Colors.indigo,
              //                       Colors.purple,
              //                     ],
              //                   ),
              //                 ),
              //               )
              //             : Container(
              //                 height: 40,
              //                 width: 40,
              //                 decoration: BoxDecoration(
              //                   color: colors[index - 1],
              //                   shape: BoxShape.circle,
              //                 ),
              //               ),
              //       );
              //     },
              //   ),
              // ),
              Container(
                height: 40,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [
                      // 🔴 Reds
                      Colors.red,
                      Colors.redAccent,

                      // 🌸 Pinks
                      Colors.pink,
                      Colors.pinkAccent,

                      // 🟣 Purples
                      Colors.purple,
                      Colors.deepPurple,
                      Colors.purpleAccent,
                      Colors.deepPurpleAccent,

                      // 🔵 Blues
                      Colors.blue,
                      Colors.lightBlue,
                      Colors.indigo,
                      Colors.blueAccent,
                      Colors.lightBlueAccent,
                      Colors.indigoAccent,

                      // 🟢 Greens
                      Colors.green,
                      Colors.lightGreen,
                      Colors.teal,
                      Colors.greenAccent,
                      Colors.lightGreenAccent,
                      Colors.tealAccent,

                      // 🟡 Yellows
                      Colors.yellow,
                      Colors.amber,
                      Colors.lime,
                      Colors.yellowAccent,
                      Colors.amberAccent,
                      Colors.limeAccent,

                      // 🟠 Oranges
                      Colors.orange,
                      Colors.deepOrange,
                      Colors.orangeAccent,
                      Colors.deepOrangeAccent,

                      // ⚪ Extras
                      Colors.white,
                      Colors.grey,
                      Colors.blueGrey,
                    ],
                  ),
                ),
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 0,
                    thumbColor: Colors.white,
                  ),
                  child: Slider(
                    value: hue,
                    min: 0,
                    max: 360,
                    onChanged: (value) {
                      setState(() {
                        hue = value;
                        selectedColor = currentColor;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Text("Brightness", style: TextStyle(color: Colors.white)),
                  Slider(
                    value: brightness,
                    min: 0.1,
                    max: 1,
                    onChanged: (value) {
                      setState(() {
                        brightness = value;
                        selectedColor = currentColor;
                      });
                    },
                  ),
                ],
              ),

              SizedBox(height: 20),
              if (_bannerAd != null)
                SizedBox(
                  height: _bannerAd!.size.height.toDouble(),
                  width: MediaQuery.of(context).size.width,
                  child: AdWidget(ad: _bannerAd!),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget modeButton(String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white.withOpacity(0.1),
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  /// ⚡ Strobe Mode
  void startStrobe() {
    timer?.cancel();

    bool toggle = false;

    timer = Timer.periodic(Duration(milliseconds: (9000 - speed).toInt()), (_) {
      setState(() {
        selectedColor = toggle ? Colors.white : Colors.black;
        toggle = !toggle;
      });
    });
  }
}
