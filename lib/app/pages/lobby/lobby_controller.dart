import 'dart:io';
import 'package:chewie/chewie.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

/// An [LobbyController], to update the UI for [LobbyView]
class LobbyController extends GetxController {
  LobbyController(this.lobbyPresenter);
  final LobbyPresenter lobbyPresenter;

  /// [lobbyVideoController] is instance/object of [VideoPlayerController].
  VideoPlayerController? lobbyVideoController;

  /// [chewieController] is instance/object of [ChewieController].
  ChewieController? chewieController;

  /// variable used to start video and initilize the [VideoPlayerController].
  Future? initializeLobbyPlayer;

  /// variable will be true when the video is in playing state.
  bool play = false;

  /// method used to play or pause the video.
  void playPause() {
    play = !play;
    if (play) {
      chewieController!.pause();
    } else {
      chewieController!.play();
    }
    update();
  }

  bool commentBoxOnDialog = false;

  void goToCommentBoxOnDialog() {
    commentBoxOnDialog = !commentBoxOnDialog;
    update();
  }

  /// Entered comment text
  String commentText = '';

  /// Send icon
  bool isSend = false;

  ///save comment and send icon enable
  void commentAndSend(String value) {
    commentText = value;
    if (value.isNotEmpty) {
      isSend = true;
    } else {
      isSend = false;
    }
    update();
  }

  /// variable will be true if the video volume is unmute.
  bool volumeDown = false;

  /// method used to do mute/volumedown or unmute/volumeup.
  void mute() {
    volumeDown = !volumeDown;
    if (volumeDown) {
      chewieController!.setVolume(0.0);
    } else {
      chewieController!.setVolume(1.0);
    }
    update();
  }

  /// method used to play video using Source by calling from anywhere or used
  ///
  /// play video after downloading videos.
  void videoPlayerInit(String src) {
    debugPrint('video is starting..');
    lobbyVideoController = VideoPlayerController.network(src);
    initializeLobbyPlayer = lobbyVideoController!.initialize();
    if (assetFile != null) {
      chewieController = ChewieController(
        videoPlayerController: VideoPlayerController.file(assetFile!),
        autoInitialize: true,
        autoPlay: true,
        looping: false,
        // showOptions: true,
        showControlsOnInitialize: false,
        allowMuting: true,
      );
    } else {
      chewieController = ChewieController(
        videoPlayerController: VideoPlayerController.network(src),
        autoInitialize: true,
        autoPlay: true,
        looping: false,
        // showOptions: true,
        showControlsOnInitialize: false,
        allowMuting: true,
      );
    }
    update();
  }

  /// if added to [MyListView] varibale [isMyListed] is true
  bool isMyListed = false;

  /// add to my list
  void addToMylist() {
    isMyListed = !isMyListed;
    update();
  }

  /// if video is Liked varibale [isLiked] is true
  bool isLiked = false;

  /// make the video faviorite
  void makeFavorite(bool value) {
    isLiked = value;
    update();
  }

// coverage:ignore-start

  /// [assetFile] store the new file downloaded.
  File? assetFile;

  /// Open downloaded file
  Future getFile({String? url, String? fileName}) async {
    Utility.showLoader();
    final file = await downloadFile(url, fileName);
    if (file != null) {
      Utility.closeLoader();
      assetFile = File(file.path);
      videoPlayerInit('');
      update();
      // await OpenFile.open(file.path);
    } else {
      Utility.closeLoader();
      return;
    }
  }

  /// Download file into private folder
  Future<File?> downloadFile(String? url, String? name) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/$name');

    try {
      final response = await Dio().get<dynamic>(
        url!,
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            receiveTimeout: 0),
      );

      final d = response.data as List<int>;

      final ref = file.openSync(mode: FileMode.write);
      ref.writeFromSync(d);

      await ref.close();

      return file;
    } on Exception {
      return null;
    }
  }

  Future? initializeLobbPlayer;

  void playDownloadedMovie(String moviePath) {
    debugPrint('movie is starting.. ===========> $moviePath');
    lobbyVideoController = VideoPlayerController.file(File(moviePath));
    initializeLobbPlayer = lobbyVideoController!.initialize();

    chewieController = ChewieController(
      videoPlayerController: VideoPlayerController.file(File(moviePath)),
      autoInitialize: true,
      autoPlay: true,
      looping: false,
      // showOptions: true,
      showControlsOnInitialize: false,
      allowMuting: true,
    );
    update();
  }

  /// lobby product, episode, morelike this strip
  int? categoryNumber = 1;

  /// change the category
  void changeLobbyCategory(int index) {
    categoryNumber = index;
    update();
  }

// coverage:ignore-end

  @override
  void onInit() {
    var movie = Get.arguments as String? ?? AssetConstants.movieLink;
    lobbyVideoController = VideoPlayerController.network('');
    chewieController = ChewieController(
        videoPlayerController: VideoPlayerController.network(''),
        autoInitialize: true);
    playDownloadedMovie(movie.toString());
    super.onInit();
  }

  @override
  void onClose() {
    lobbyVideoController!.dispose();
    chewieController!.dispose();
    super.onClose();
  }
}
