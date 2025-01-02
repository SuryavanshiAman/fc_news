// import 'package:fc_news/controller/home_controller.dart';
// import 'package:fc_news/main.dart';
// import 'package:fc_news/res/color-const.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class ViewNewsScreen extends StatefulWidget {
//   const ViewNewsScreen({super.key});
//
//   @override
//   State<ViewNewsScreen> createState() => _ViewNewsScreenState();
// }
//
// class _ViewNewsScreenState extends State<ViewNewsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final homeController =Provider.of<HomeController>(context);
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           // Icon(Icons.bookmark_border,color: AppColor.gray,),
//           Icon(homeController.savedIndices.contains(1)
//               ? Icons.bookmark
//               : Icons.bookmark_border,
//             color: homeController.savedIndices.contains(1)
//                 ? AppColor.secondaryColor
//                 : AppColor.gray,),
//           SizedBox(width: width*0.05,),
//           Icon(Icons.share,color:AppColor.gray,),
//           SizedBox(width: width*0.08,)
//         ],
//       ),
//       body: ListView(
//         children: [
//           Container(
//             width: width,
//             height: height*0.25,
//             // color: Colors.blue,
//             decoration: BoxDecoration(
//               image: DecorationImage(image: NetworkImage(homeController.newsItems[0]["image"].toString(),),fit: BoxFit.fill)
//             ),
//           ),
//           SizedBox(height: height*0.02,),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               "Election Campaigns Heat Up:",
//               style: TextStyle(
//                 color: AppColor.black,
//                 fontFamily: "NewYork",
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//                 "The Delhi government has directed operators of the city's hotels, clubs and restaurants serving liquor to verify the age of their clients through hard copies of government-issued identity proofs after violations of the legal drinking age norm were detected."
//                     "\nIn Delhi, liquor is served only to persons aged 25 years and above."
//                     "\n The excise department of the Delhi government, during routine inspections by its teams in recent days, found customers younger than 25 years having alcohol at bars, clubs and restaurants."
//             "\n The inspections also revealed that some customers were consuming liquor pretending to have completed 25 years. Complaints were also received by the department that some excise licensees were serving liquor to underage persons, officials said.",
//               style: TextStyle(
//                 color: AppColor.gray,
//                 fontFamily: "Nunito",
//                 fontSize: 14,
//                 fontWeight: FontWeight.w700
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
///
// import 'package:fc_news/controller/home_controller.dart';
// import 'package:fc_news/main.dart';
// import 'package:fc_news/res/color-const.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:video_player/video_player.dart';
//
// class ViewNewsScreen extends StatefulWidget {
//   const ViewNewsScreen({super.key});
//
//   @override
//   State<ViewNewsScreen> createState() => _ViewNewsScreenState();
// }
//
// class _ViewNewsScreenState extends State<ViewNewsScreen> {
//   late VideoPlayerController _videoController;
//
//   @override
//   void initState() {
//     super.initState();
//     final homeController = Provider.of<HomeController>(context, listen: false);
//
//     // Initialize the VideoPlayerController with the video URL
//     _videoController = VideoPlayerController.network(
//         "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4"
//     )..initialize().then((_) {
//       setState(() {}); // Refresh the UI once the video is initialized
//     });
//     _videoController.setLooping(true); // Optional: Loop the video
//   }
//
//   @override
//   void dispose() {
//     _videoController.dispose(); // Dispose of the controller to free resources
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final homeController = Provider.of<HomeController>(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           Icon(
//             homeController.savedIndices.contains(1)
//                 ? Icons.bookmark
//                 : Icons.bookmark_border,
//             color: homeController.savedIndices.contains(1)
//                 ? AppColor.secondaryColor
//                 : AppColor.gray,
//           ),
//           SizedBox(width: width * 0.05),
//           Icon(Icons.share, color: AppColor.gray),
//           SizedBox(width: width * 0.08),
//         ],
//       ),
//       body: ListView(
//         children: [
//           Container(
//             width: width,
//             height: height * 0.25,
//             child: _videoController.value.isInitialized
//                 ? GestureDetector(
//               onTap: () {
//                 // Play or pause the video when tapped
//                 setState(() {
//                   if (_videoController.value.isPlaying) {
//                     _videoController.pause();
//                   } else {
//                     _videoController.play();
//                   }
//                 });
//               },
//               child: AspectRatio(
//                 aspectRatio: _videoController.value.aspectRatio,
//                 child: VideoPlayer(_videoController),
//               ),
//             )
//                 : Center(child: CircularProgressIndicator()),
//           ),
//           SizedBox(height: height * 0.02),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               "Election Campaigns Heat Up:",
//               style: TextStyle(
//                 color: AppColor.black,
//                 fontFamily: "NewYork",
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               "The Delhi government has directed operators of the city's hotels, clubs, and restaurants serving liquor to verify the age of their clients through hard copies of government-issued identity proofs after violations of the legal drinking age norm were detected."
//                   "\nIn Delhi, liquor is served only to persons aged 25 years and above."
//                   "\nThe excise department of the Delhi government, during routine inspections by its teams in recent days, found customers younger than 25 years having alcohol at bars, clubs, and restaurants."
//                   "\nThe inspections also revealed that some customers were consuming liquor pretending to have completed 25 years. Complaints were also received by the department that some excise licensees were serving liquor to underage persons, officials said.",
//               style: TextStyle(
//                 color: AppColor.gray,
//                 fontFamily: "Nunito",
//                 fontSize: 14,
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
///
import 'package:fc_news/controller/home_controller.dart';
import 'package:fc_news/main.dart';
import 'package:fc_news/res/color-const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class ViewNewsScreen extends StatefulWidget {
  const ViewNewsScreen({super.key});

  @override
  State<ViewNewsScreen> createState() => _ViewNewsScreenState();
}

class _ViewNewsScreenState extends State<ViewNewsScreen> {
  late VideoPlayerController _videoController;
  bool _isBuffering = false;
  double _currentPosition = 0.0;
  double _videoLength = 0.0;
  @override

   void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_){
      final homeController = Provider.of<HomeController>(context, listen: false);
      final data = homeController.newsItems[homeController.selectedIndex];
      Uri videoUri = Uri.parse(data['videoUrl'] ?? '');
      _videoController = VideoPlayerController.networkUrl(
          videoUri)
        ..addListener(() {
          setState(() {
            _isBuffering = _videoController.value.isBuffering;
            _currentPosition = _videoController.value.position.inSeconds.toDouble();
            _videoLength = _videoController.value.duration.inSeconds.toDouble();
          });
        })
        ..initialize().then((_) {
          setState(() {});
        });

      _videoController.setLooping(true);
    });
 // Optional: Loop the video
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }


  void _seekTo(double value) {
    final position = Duration(seconds: value.toInt());
    _videoController.seekTo(position);
  }

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context);
    final data = homeController.newsItems[homeController.selectedIndex];
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(
            homeController.savedIndices.contains(1)
                ? Icons.bookmark
                : Icons.bookmark_border,
            color: homeController.savedIndices.contains(1)
                ? AppColor.secondaryColor
                : AppColor.gray,
          ),
          SizedBox(width: width * 0.05),
          Icon(Icons.share, color: AppColor.gray),
          SizedBox(width: width * 0.08),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            width: width,
            height: height * 0.25,

            child: _videoController.value.isInitialized
                ?
            Stack(
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () {
                      // Play or pause the video when tapped
                      setState(() {
                        if (_videoController.value.isPlaying) {
                          _videoController.pause();
                        } else {
                          _videoController.play();
                        }
                      });
                    },
                    child: AspectRatio(
                      aspectRatio: _videoController.value.aspectRatio,
                      child: VideoPlayer(_videoController),
                    ),
                  ),
                ),
                // Buffering indicator
                if (_isBuffering)
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
                // Play/Pause button
                Positioned(
                  bottom: 20,
                  left: width * 0.4, // Adjust this value as needed
                  child: IconButton(
                    icon: Icon(
                      _videoController.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                      color: Colors.white,
                      size: 40,
                    ),
                    onPressed: () {
                      setState(() {
                        if (_videoController.value.isPlaying) {
                          _videoController.pause();
                        } else {
                          _videoController.play();
                        }
                      });
                    },
                  ),
                ),
              ],
            )
                : const Center(child: CircularProgressIndicator()),
          ),
          SizedBox(height: height * 0.02),

          // Seekbar to move forward or backward in the video
          if (_videoController.value.isInitialized)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Slider(
                    value: _currentPosition,
                    min: 0.0,
                    max: _videoLength,
                    onChanged: (value) {
                      // Seek the video to the new value
                      _seekTo(value);
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Duration(seconds: _currentPosition.toInt()).toString().split('.').first,
                        style: TextStyle(color: AppColor.gray),
                      ),
                      Text(
                        Duration(seconds: _videoLength.toInt()).toString().split('.').first,
                        style: TextStyle(color: AppColor.gray),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              data["heading"]??"",
              style: TextStyle(
                color: AppColor.black,
                fontFamily: "NewYork",
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              data["description"]??"",
              style: TextStyle(
                color: AppColor.gray,
                fontFamily: "Nunito",
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
