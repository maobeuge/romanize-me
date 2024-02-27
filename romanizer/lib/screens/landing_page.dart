import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:romanizer/services/navigation/navigation_bloc.dart';
import 'package:romanizer/services/navigation/navigation_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late YoutubePlayerController controller;
  final String videoUrl = 'https://www.youtube.com/watch?v=pV34xXVaODQ';

  @override
  void initState() {
    final String? videoID = YoutubePlayer.convertUrlToId(videoUrl);

    controller = YoutubePlayerController(
      initialVideoId: videoID!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          actions: [
            ElevatedButton(
              onPressed: () {
                context.read<NavigationBloc>().add(
                    ChangeIndex(newIndex: NavigationIndex.searchPage.index));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                iconColor: MaterialStateProperty.all<Color>(Colors.grey),
                elevation: MaterialStateProperty.all<double>(0),
              ),
              child: const Icon(
                Icons.search,
                size: 32,
              ),
            )
          ],
        ),
        body: Column(
          children: [
            YoutubePlayer(
              controller: controller,
              showVideoProgressIndicator: true,
              onReady: () => {
                print('Ready'),
              },
              bottomActions: [
                CurrentPosition(),
                ProgressBar(
                  isExpanded: true,
                  colors: const ProgressBarColors(
                    playedColor: Colors.amber,
                    handleColor: Colors.amberAccent,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('aeroj taoie ieagaoieng oaingona'),
                Text('aeroj taoie ieagaoieng oaingona'),
                Text('aeroj taoie ieagaoieng oaingona'),
                Text('aeroj taoie ieagaoieng oaingona'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
