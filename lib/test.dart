//
// import 'dart:math';
// import 'package:fc_news/main.dart';
// import 'package:flutter/material.dart';
//
//
// class BalloonScreen extends StatefulWidget {
//   @override
//   _BalloonScreenState createState() => _BalloonScreenState();
// }
//
// class _BalloonScreenState extends State<BalloonScreen> {
//   double _balloonSize = 50.0; // Initial size
//   late double _burstThreshold;
//   final Random _random = Random();
//
//   @override
//   void initState() {
//     super.initState();
//     _generateBurstThreshold();
//   }
//
//   void _generateBurstThreshold() {
//     // Set a random size for the balloon to burst
//     _burstThreshold = 100.0 + _random.nextDouble() * 150.0; // Between 100 and 250
//   }
//
//   void _increaseSize() {
//     setState(() {
//       _balloonSize += 10.0; // Increase size
//
//       if (_balloonSize >= _burstThreshold) {
//         // If size exceeds the burst threshold, show the burst animation
//         _showBurstAnimation();
//         // Container(
//         //   height: height*0.1,
//         //   width: width*0.4,
//         //   decoration: BoxDecoration(
//         //       image: DecorationImage(image: AssetImage("assets/images/blasat.gif"))
//         //   ),
//         // );
//       }
//     });
//   }
//
//   void _showBurstAnimation() {
//     showDialog(
//       barrierColor: Colors.transparent,
//       context: context,
//       builder: (context) => AlertDialog(
//         // title: Text("POP!"),
//         content:Container(
//           height: height*0.1,
//           decoration: BoxDecoration(
//             image: DecorationImage(image: AssetImage("assets/images/blasat.gif"))
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//               _resetBalloon();
//             },
//             child: Text("Restart"),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _resetBalloon() {
//     setState(() {
//       _balloonSize = 50.0; // Reset to initial size
//       _generateBurstThreshold(); // Generate a new threshold
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Balloon Game")),
//       body: Container(
//         width: width,
//         height: height,
//         decoration: BoxDecoration(
//             image: DecorationImage(image: AssetImage("assets/images/bg.png"),fit: BoxFit.fill)
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Balloon widget
//             Center(
//               child: AnimatedContainer(
//                 duration: Duration(milliseconds: 300),
//                 width: _balloonSize,
//                 height: _balloonSize,
//                 decoration: BoxDecoration(
//                   // shape: BoxShape.circle,
//                   // color: Colors.red,
//                   image: DecorationImage(image: AssetImage("assets/images/balloon.png"))
//                 ),
//               ),
//             ),
//             SizedBox(height: height*0.22), // Space between the balloon and button
//             // Button to increase balloon size
//             ElevatedButton(
//               onPressed: _increaseSize,
//               child: Text("Tap to Inflate"),
//               style: ElevatedButton.styleFrom(
//                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//                 textStyle: TextStyle(fontSize: 18),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:math';
import 'package:flutter/material.dart';

import 'main.dart';


class BalloonScreen extends StatefulWidget {
  @override
  _BalloonScreenState createState() => _BalloonScreenState();
}

class _BalloonScreenState extends State<BalloonScreen>
    with SingleTickerProviderStateMixin {
  double _balloonSize = 50.0; // Initial size
  late double _burstThreshold;
  final Random _random = Random();

  // Animation for flying
  late AnimationController _controller;
  late Animation<double> _flyAnimation;

  bool _isFlying = false;

  @override
  void initState() {
    super.initState();
    _generateBurstThreshold();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _flyAnimation = Tween<double>(begin: 300.0, end: 500.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _showBurstAnimation();
      }
    });
  }

  void _generateBurstThreshold() {
    // Set a random size for the balloon to burst
    _burstThreshold = 120.0 + _random.nextDouble() * 100.0; // Between 120 and 220
  }

  void _increaseSize() {
    if (_isFlying) return; // Prevent size increase while flying

    setState(() {
      _balloonSize += 10.0; // Increase size

      if (_balloonSize >= _burstThreshold) {
        // If size exceeds threshold, start flying
        if (_random.nextBool()) {
          _startFlying(); // Balloon flies
        } else {
          _showBurstAnimation(); // Balloon bursts
        }
      }
    });
  }

  void _startFlying() {
    setState(() {
      _isFlying = true;
    });
    _controller.forward();
  }

  void _showBurstAnimation() {
    showDialog(
      barrierColor: Colors.transparent,
      context: context,
      builder: (context) => AlertDialog(
        title: Text("POP!"),
      content:Container(
        height: height*0.1,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/blasat.gif"))
        ),),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _resetBalloon();
            },
            child: Text("Restart"),
          ),
        ],
      ),
    );
  }

  void _resetBalloon() {
    setState(() {
      _balloonSize = 50.0; // Reset to initial size
      _generateBurstThreshold(); // Generate a new threshold
      _isFlying = false;
    });
    _controller.reset();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Balloon Game")),
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/bg.png"),fit: BoxFit.fill)
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Balloon widget
            Positioned(
              bottom: _flyAnimation.value, // Use animation for vertical position
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: _balloonSize,
                height: _balloonSize,
                decoration: BoxDecoration(
                    // shape: BoxShape.circle,
                    // color: Colors.red,
                      image: DecorationImage(image: AssetImage("assets/images/balloon.png"))

                ),
              ),
            ),
            // Button to increase balloon size
            if (!_isFlying)
              Positioned(
                bottom: 50, // Position button near the bottom
                child: ElevatedButton(
                  onPressed: _increaseSize,
                  child: Text("Tap to Inflate"),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
