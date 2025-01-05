//
//
// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart'as http;
//
// class CountdownScreen extends StatefulWidget {
//   @override
//   _CountdownScreenState createState() => _CountdownScreenState();
// }
//
// class _CountdownScreenState extends State<CountdownScreen> {
//   int countdownSeconds = 0;
//   Timer? countdownTimer;
//
//   @override
//   void initState() {
//     super.initState();
//     // Start the timer immediately using local time
//     startLocalCountdown();
//     // Sync with server time in the background
//     syncWithServerTime();
//   }
//
//   @override
//   void dispose() {
//     countdownTimer?.cancel();
//     super.dispose();
//   }
//
//   /// Start countdown using device time (immediate start)
//   void startLocalCountdown() {
//     DateTime localTime = DateTime.now().toUtc();
//     int initialSeconds = 30 - (localTime.second % 30);
//
//     setState(() {
//       countdownSeconds = initialSeconds;
//     });
//
//     countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       updateUI();
//     });
//   }
//
//   /// Sync countdown with server time to adjust any drift
//   Future<void> syncWithServerTime() async {
//     try {
//       DateTime serverTime = await fetchServerTime();
//       int serverSeconds = 30 - (serverTime.second % 30);
//
//       setState(() {
//         countdownSeconds = serverSeconds;
//       });
//     } catch (e) {
//       print('Error syncing with server time: $e');
//     }
//   }
//
//   /// Fetch server time from Google's headers
//   Future<DateTime> fetchServerTime() async {
//     try {
//       final response = await http.get(Uri.parse('https://www.google.com'));
//       if (response.statusCode == 200) {
//         String dateString = response.headers['date']!;
//         return DateTime.parse(dateString).toUtc();
//       } else {
//         throw Exception('Failed to fetch server time');
//       }
//     } catch (e) {
//       print('Error fetching server time: $e');
//       return DateTime.now().toUtc(); // Fallback to local time
//     }
//   }
//
//   /// Update UI for each countdown tick
//   void updateUI() {
//     setState(() {
//       if (countdownSeconds == 0) {
//         countdownSeconds = 30;
//       } else {
//         countdownSeconds--;
//       }
//
//       // Trigger actions at specific seconds
//       if (countdownSeconds == 29) {
//         print("Start betting!");
//       } else if (countdownSeconds == 13) {
//         print("Stop betting!");
//       } else if (countdownSeconds == 1) {
//         print("Game over!");
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Countdown Timer')),
//       body: Center(
//         child: Text(
//           'Countdown: $countdownSeconds',
//           style: const TextStyle(fontSize: 36),
//         ),
//       ),
//     );
//   }
// }
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CountdownScreen extends StatefulWidget {
  @override
  _CountdownScreenState createState() => _CountdownScreenState();
}

class _CountdownScreenState extends State<CountdownScreen> {
  int countdownSeconds = 0;
  Timer? countdownTimer;

  @override
  void initState() {
    super.initState();
    startLocalCountdown();
    syncWithServerTime();
  }

  @override
  void dispose() {
    countdownTimer?.cancel();
    super.dispose();
  }

  // Start countdown using local time (for immediate start)
  void startLocalCountdown() {
    DateTime localTime = DateTime.now().toUtc();
    int initialSeconds = 30 - (localTime.second % 30);

    setState(() {
      countdownSeconds = initialSeconds;
    });

    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      updateUI();
    });
  }

  // Sync countdown with server time to adjust any drift
  Future<void> syncWithServerTime() async {
    try {
      DateTime serverTime = await fetchServerTime();
      int serverSeconds = 30 - (serverTime.second % 30);

      setState(() {
        countdownSeconds = serverSeconds;
      });

      // Periodically update the countdown to stay in sync with the server
      Timer.periodic(const Duration(seconds: 30), (_) {
        fetchServerTimeAndSync();
      });
    } catch (e) {
      print('Error syncing with server time: $e');
    }
  }

  // Fetch the server time and sync the countdown
  Future<void> fetchServerTimeAndSync() async {
    try {
      DateTime serverTime = await fetchServerTime();
      int serverSeconds = 30 - (serverTime.second % 30);

      setState(() {
        countdownSeconds = serverSeconds;
      });
    } catch (e) {
      print('Error fetching server time during sync: $e');
    }
  }

  // Fetch server time from Google's headers
  Future<DateTime> fetchServerTime() async {
    try {
      final response = await http.get(Uri.parse('https://www.google.com'));
      if (response.statusCode == 200) {
        String dateString = response.headers['date']!;
        return DateTime.parse(dateString).toUtc();
      } else {
        throw Exception('Failed to fetch server time');
      }
    } catch (e) {
      print('Error fetching server time: $e');
      return DateTime.now().toUtc(); // Fallback to local time if unable to sync
    }
  }

  // Update UI for each countdown tick
  void updateUI() {
    setState(() {
      if (countdownSeconds == 0) {
        countdownSeconds = 30;
      } else {
        countdownSeconds--;
      }

      // Trigger actions at specific seconds
      if (countdownSeconds == 29) {
        print("Start betting!");
      } else if (countdownSeconds == 13) {
        print("Stop betting!");
      } else if (countdownSeconds == 1) {
        print("Game over!");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Countdown Timer')),
      body: Center(
        child: Text(
          'Countdown: $countdownSeconds',
          style: const TextStyle(fontSize: 36),
        ),
      ),
    );
  }
}
/// jump code
// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class CountdownScreen extends StatefulWidget {
//   @override
//   _CountdownScreenState createState() => _CountdownScreenState();
// }
//
// class _CountdownScreenState extends State<CountdownScreen> {
//   int countdownSeconds = 0;
//   Timer? countdownTimer;
//   DateTime? lastSyncedTime;
//
//   @override
//   void initState() {
//     super.initState();
//     startLocalCountdown();
//     syncWithServerTime();
//   }
//
//   @override
//   void dispose() {
//     countdownTimer?.cancel();
//     super.dispose();
//   }
//
//   // Start countdown using local time (for immediate start)
//   void startLocalCountdown() {
//     DateTime localTime = DateTime.now().toUtc();
//     int initialSeconds = 30 - (localTime.second % 30);
//
//     setState(() {
//       countdownSeconds = initialSeconds;
//       lastSyncedTime = localTime;
//     });
//
//     countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       updateUI();
//     });
//   }
//
//   // Sync countdown with server time to adjust any drift
//   Future<void> syncWithServerTime() async {
//     try {
//       DateTime serverTime = await fetchServerTime();
//       int serverSeconds = 30 - (serverTime.second % 30);
//
//       setState(() {
//         countdownSeconds = serverSeconds;
//         lastSyncedTime = serverTime;
//       });
//
//       // Periodically update the countdown to stay in sync with the server
//       Timer.periodic(const Duration(seconds: 30), (_) {
//         fetchServerTimeAndSync();
//       });
//     } catch (e) {
//       print('Error syncing with server time: $e');
//     }
//   }
//
//   // Fetch the server time and sync the countdown
//   Future<void> fetchServerTimeAndSync() async {
//     try {
//       DateTime serverTime = await fetchServerTime();
//       int serverSeconds = 30 - (serverTime.second % 30);
//
//       setState(() {
//         countdownSeconds = serverSeconds;
//         lastSyncedTime = serverTime;
//       });
//     } catch (e) {
//       print('Error fetching server time during sync: $e');
//       // In case of failure, jump the timer forward
//       adjustCountdownForDelay();
//     }
//   }
//
//   // Fetch server time from Google's headers
//   Future<DateTime> fetchServerTime() async {
//     try {
//       final response = await http.get(Uri.parse('https://www.google.com'));
//       if (response.statusCode == 200) {
//         String dateString = response.headers['date']!;
//         return DateTime.parse(dateString).toUtc();
//       } else {
//         throw Exception('Failed to fetch server time');
//       }
//     } catch (e) {
//       print('Error fetching server time: $e');
//       return DateTime.now().toUtc(); // Fallback to local time if unable to sync
//     }
//   }
//
//   // Adjust countdown in case of slow network or failure to sync
//   void adjustCountdownForDelay() {
//     // If sync fails or takes too long, jump ahead in the countdown
//     setState(() {
//       countdownSeconds = (countdownSeconds + 5) % 30; // Jump 5 seconds ahead
//       // You can adjust the jump value based on the typical network delay or your requirements
//     });
//   }
//
//   // Update UI for each countdown tick
//   void updateUI() {
//     setState(() {
//       if (countdownSeconds == 0) {
//         countdownSeconds = 30;
//       } else {
//         countdownSeconds--;
//       }
//
//       // Trigger actions at specific seconds
//       if (countdownSeconds == 29) {
//         print("Start betting!");
//       } else if (countdownSeconds == 13) {
//         print("Stop betting!");
//       } else if (countdownSeconds == 1) {
//         print("Game over!");
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Countdown Timer')),
//       body: Center(
//         child: Text(
//           'Countdown: $countdownSeconds',
//           style: const TextStyle(fontSize: 36),
//         ),
//       ),
//     );
//   }
// }
