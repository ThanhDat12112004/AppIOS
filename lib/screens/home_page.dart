import 'package:duongthanhdatbuoi3/screens/tempe_convert_screen.dart';
import 'package:duongthanhdatbuoi3/screens/unit_convert_screen.dart';
import 'package:duongthanhdatbuoi3/screens/usd_convert_screen.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late VideoPlayerController videoController;
  late Future<void> initializeVideoPlayerFuture;
  @override
  void initState() {
    super.initState();
    videoController = VideoPlayerController.asset('lib/assets/video.mp4');
    initializeVideoPlayerFuture = videoController.initialize();
    videoController.setLooping(true);
  }

  @override
  void dispose() {
    videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ứng dụng chuyển đổi'),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const TemperatureConverterScreen()),
                  );
                },
                child: const Text('Chuyển đổi nhiệt độ'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UnitConverterScreen()),
                  );
                },
                child: const Text('Chuyển đổi đơn vị đo'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const USDConverterScreen()),
                  );
                },
                child: const Text('Chuyển VND sàn USD'),
              ),
              const SizedBox(height: 20),
              // Hiển thị ảnh từ thư mục assets
              Image.asset(
                'lib/assets/meooo.png',
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              // Hiển thị ảnh từ Internet
              Image.network(
                'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              // Hiển thị video
              FutureBuilder(
                future: initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    // If the VideoPlayerController has finished initialization
                    return Column(
                      children: [
                        AspectRatio(
                          aspectRatio: videoController.value.aspectRatio,
                          child: VideoPlayer(videoController),
                        ),
                        VideoProgressIndicator(
                          videoController,
                          allowScrubbing: true,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              // If the video is playing, pause it.
                              if (videoController.value.isPlaying) {
                                videoController.pause();
                              } else {
                                // If the video is paused, play it.
                                videoController.play();
                              }
                            });
                          },
                          child: Icon(
                            videoController.value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow,
                          ),
                        ),
                      ],
                    );
                  } else {
                    // If the VideoPlayerController is still initializing, show a loading spinner
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
