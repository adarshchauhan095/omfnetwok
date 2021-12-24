import 'dart:io' as io;
import 'dart:io';
import 'dart:math';
import 'package:chewie/chewie.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:omf_netflix/app/app.dart';
import 'package:omf_netflix/domain/domain.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

/// A controller for [HomeView] to update the UI.
class HomeController extends GetxController {
  HomeController(this.homePresenter);
  final HomePresenter homePresenter;

  // Download Section ==========================================================

  /// chek download list is availble or not
  void resetDownloadList() {
    total = 0;
    received = 0;
    omfDownload.clear();
    update();
  }

  void deleteMovie(int index) {
    omfDownload.removeAt(index);
    update();
  }

  /// variable that takes total bytes of downloading file.
  int total = 0;

  /// variable that takes received bytes of downloading file.
  int received = 0;

  /// takes the downloading response
  late http.StreamedResponse response;

  /// stores the bytes of downloading file
  final List<int> bytes = [];

// *****************
  bool isDownloadingMovie = false;

  int totalSizeOfMovieInBytes = 0;

  int receivedSizeOfMovieInBytes = 0;

  String sizeOfMovie = '0 KB';

  String? movieThumbnail;

  final List<OmfDownload> omfDownload = [];

// *****************

// ====================
  // late DownloaderUtils options;
  // late DownloaderCore core;

  // letsDownload(String movieLink) async {
  //   isDownloadingMovie = true;
  //   String? movieName = 'video${Utility.getRandomNumer()}.mp4';
  //   final file =
  //       File('${(await getApplicationDocumentsDirectory()).path}/$movieName');

  //   movieThumbnail = await VideoThumbnail.thumbnailFile(
  //     video: movieLink,
  //     thumbnailPath: (await getTemporaryDirectory()).path,
  //     imageFormat: ImageFormat.JPEG,
  //     maxHeight: 100,
  //     maxWidth: 100,
  //     quality: 75,
  //   );

  //   final movie = OmfDownload(
  //     id: movieName,
  //     movie: file.toString(),
  //     movieName: movieName,
  //     movieThumbnail: movieThumbnail,
  //     movieSize: sizeOfMovie,
  //     receivedBytes: receivedSizeOfMovieInBytes,
  //     totalBytes: totalSizeOfMovieInBytes,
  //     isDownloading: true,
  //     isExpired: false,
  //     pauseDownloading: false,
  //   );

  //   omfDownload.add(movie);

  //   options = DownloaderUtils(
  //     progressCallback: (current, total) {
  //       totalSizeOfMovieInBytes = total;
  //       receivedSizeOfMovieInBytes = current;

  //       final progress = (current / total) * 100;

  //       final movieWhileDownloading =
  //           omfDownload.firstWhere((element) => element.id == movieName);
  //       movieWhileDownloading.receivedBytes = received;

  //       print('Downloading: $progress');

  //       update();
  //     },
  //     file: file,
  //     progress: ProgressImplementation(),
  //     onDone: () => print('COMPLETE'),
  //     deleteOnCancel: true,
  //   );
  //   core = await Flowder.download(movieLink, options);
  //   update();
  // }

  // some(String movieName, File file) {
  //   isDownloadingMovie = false;

  //   final movieAfterDownload =
  //       omfDownload.firstWhere((element) => element.id == movieName);
  //   movieAfterDownload.isDownloading = false;
  //   movieAfterDownload.movie = file.toString();
  //   movieAfterDownload.movieSize = sizeOfMovie;
  //   print('COMPLETE');
  // }

// ====================

  /// Dummy api for download the video in download tab
  Future<void> downloadVideo(String url) async {
    isDownloadingMovie = true;
    response = await http.Client().send(http.Request('GET', Uri.parse(url)));
    total = response.contentLength ?? 0;
    totalSizeOfMovieInBytes = response.contentLength ?? 0;

    String? movieName = 'video${Utility.getRandomNumer()}.mp4';
    movieThumbnail = await VideoThumbnail.thumbnailFile(
      video: url,
      thumbnailPath: (await getTemporaryDirectory()).path,
      imageFormat: ImageFormat.JPEG,
      maxHeight: 100,
      maxWidth: 100,
      quality: 75,
    );

    final file =
        File('${(await getApplicationDocumentsDirectory()).path}/$movieName');

    final movie = OmfDownload(
      id: movieName,
      movie: file.toString(),
      movieName: movieName,
      movieThumbnail: movieThumbnail,
      movieSize: sizeOfMovie,
      receivedBytes: receivedSizeOfMovieInBytes,
      totalBytes: totalSizeOfMovieInBytes,
      isDownloading: true,
      isExpired: false,
      pauseDownloading: false,
    );

    omfDownload.add(movie);

    // print('totalSizeOfMovieInBytes: $totalSizeOfMovieInBytes\n\n');
    // print('recievedSizeOfMovieInBytes: $receivedSizeOfMovieInBytes\n\n');
    // print('\n|\n|\n|\n|\n|\n');

    response.stream.listen((value) {
      bytes.addAll(value);
      received += value.length;
      receivedSizeOfMovieInBytes = received;
      final movieWhileDownloading =
          omfDownload.firstWhere((element) => element.id == movieName);
      movieWhileDownloading.receivedBytes = received;

      update();
    }).onDone(() async {
      await file.writeAsBytes(bytes);

      sizeOfMovie = Utility.getFileSize(totalSizeOfMovieInBytes);

      isDownloadingMovie = false;

      final movieAfterDownload =
          omfDownload.firstWhere((element) => element.id == movieName);
      movieAfterDownload.isDownloading = false;
      movieAfterDownload.movie = file.toString();
      movieAfterDownload.movieSize = sizeOfMovie;

      received = 0;
      total = 0;
      totalSizeOfMovieInBytes = 0;
      receivedSizeOfMovieInBytes = 0;
      update();
    });
  }

  getFileSize(File? file) async {
    var size = await file!.length();
    if (size == 0) {
      return '0 KB';
    } else {
      var val = size / pow(1024, (log(size) / log(1024)).floor());
      if (size < 1024) {
        return '$val KB';
      } else {
        return '${val.toStringAsFixed(1)} MB';
      }
    }
  }

  String? directory;
  List allFilesList = [];
  var videoList = [];

  void listofFiles() async {
    directory = (await getApplicationDocumentsDirectory()).path;
    allFilesList = io.Directory('$directory/').listSync();

    for (var item in allFilesList) {
      var filePath = item.toString().replaceAll("\'", '');
      var typeString = filePath.substring(filePath.length - 3).toLowerCase();
      if (typeString.toLowerCase() == 'mp4') {
        videoList.add(item);
      }
    }
    debugPrint(
        'fileList  ${allFilesList.length}    videoList  ${videoList.length}');
    update();
  }

  /// Open downloaded file
  Future getFile({String? url, String? fileName}) async {
    Utility.showTextLoader('Downloading Please Wait...');
    final file = await downloadFile(url, fileName);
    if (file != null) {
      Utility.closeLoader();

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
      final response = await Dio().get(
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

// bottom navigation bar section ===============================================
  int selectedIndex = 0;

  bool btmNavBgTransparent = false;

  /// To switch index through bottomsheet
  void onItemTapped(int index) {
    selectedIndex = index;
    if (chewieController != null) {
      if (selectedIndex == 2) {
        videoInit(pageIndex);
        btmNavBgTransparent = true;
      } else {
        chewieController!.pause();
        btmNavBgTransparent = false;
      }
    } else {
      btmNavBgTransparent = false;
    }
    update();
  }

  /// Method that return Widget for [BottomNavBar] according to index/position
  // Widget getItemWidget(int position) {
  //   switch (position) {
  //     case 0:
  //       return const MainHomeView();
  //     case 1:
  //       return SearchView();
  //     case 2:
  //       return const TrendingView();
  //     case 3:
  //       return DownloadsView();
  //     case 4:
  //       return ProfileView();
  //     default:
  //       return const Text('Error');
  //   }
  // }

  /// List of Widgets that return Widget for [BottomNavBar] according to index/position
  List<Widget> pages = [
    MainHomeView(),
    SearchView(),
    const TrendingView(),
    DownloadsView(),
    ProfileView(),
  ];

// search section ==============================================================

  /// varibale will be true if the [searchSuggestion] method's value is true
  bool suggestionView = false;

  /// method that will validate if the search Value is matched to
  /// the suggestion keyword
  void searchSuggestion(String value) {
    if (value == 'shoe') {
      suggestionView = true;
    } else {
      suggestionView = false;
    }
    update();
  }

// main home page section ======================================================

  /// static list of images showed in [MainHomeView]
  List<String> moviesList = [
    AssetConstants.movie1,
    AssetConstants.movie2,
    AssetConstants.movie3,
    AssetConstants.movie4,
    AssetConstants.movie5,
    AssetConstants.movie6,
    AssetConstants.movie7,
    AssetConstants.movie8,
    AssetConstants.movie1,
    AssetConstants.movie2,
    AssetConstants.movie3,
    AssetConstants.movie4,
    AssetConstants.movie5,
    AssetConstants.movie6,
    AssetConstants.movie7,
  ];

  /// footer menu list
  List<String> footerMenuList = [
    StringConstants.audioAndSubtitles,
    StringConstants.audioDescription,
    StringConstants.helpCenter,
    StringConstants.giftCards,
    StringConstants.mediaCenter,
    StringConstants.investorRelations,
    StringConstants.jobs,
    StringConstants.termsOfUse,
    StringConstants.privacy,
    StringConstants.legalNotices,
    StringConstants.cookiePreferences,
    StringConstants.corporateInformation,
    StringConstants.contactUs,
  ];

  List<WebDrawer> drawerMenus = [
    WebDrawer(
        mTitle: 'Home', mIcon: Icons.home, isActive: true, mRoute: '/home'),
    WebDrawer(
        mTitle: 'Search',
        mIcon: Icons.search,
        isActive: false,
        mRoute: '/search'),
    WebDrawer(
        mTitle: 'Trending',
        mIcon: Icons.subdirectory_arrow_right_outlined,
        isActive: false,
        mRoute: '/trending'),
    WebDrawer(
        mTitle: 'Downloads',
        mIcon: Icons.download,
        isActive: false,
        mRoute: '/downloads'),
  ];

  /// Web drawer methods
  selectMenu(int index) {
    var item = drawerMenus
        .firstWhere((element) => element.mTitle == drawerMenus[index].mTitle);
    item.isActive = !item.isActive!;

    update();
  }

// TrendingView Section ========================================================

  /// variable that stores the index value of [PageView] builder
  ///
  /// And initilized as [0] as the first page of [PageView].
  int pageIndex = 0;

  /// varibale will be true if Volume of video is set to down or [0].
  bool volumeDown = false;

  /// [play] variable is true if the video state is in playing.
  bool play = true;

  /// the method set the [pageIndex] according to [PageView] index and runs the
  /// [videoInit] method via [pageIndex].
  void setPageIndex(int index) {
    pageIndex = index;
    videoInit(pageIndex);
    update();
  }

  /// if the video is likes or not.
  void makeFavorite(int index) {
    trendingReel[index].isLiked = !trendingReel[index].isLiked;
    update();
  }

  /// if the video is save in MyList or not.
  void addToMylist(int index) {
    trendingReel[index].isListed = !trendingReel[index].isListed;
    update();
  }

  /// make the playing video mute/volumedown or unmute/volumeup
  void mute() {
    volumeDown = !volumeDown;
    if (volumeDown) {
      chewieController!.setVolume(0.0);
    } else {
      chewieController!.setVolume(1.0);
    }
    update();
  }

  /// method that makes the playing video again if it is paused
  void makePlayTrue() {
    play = false;
    update();
  }

  /// a method that play or pause the video
  void playPause() {
    play = !play;
    if (play) {
      chewieController!.pause();
    } else {
      chewieController!.play();
    }
    update();
  }

  /// dummy data for trending reels
  List<TrendingReel> trendingReel = [];

  /// instance/object for [VideoPlayerController].
  VideoPlayerController? videoPlayerController;

  /// instance/object for [ChewieController].
  ChewieController? chewieController;

  /// varibale that will used as initilizer for video controllers.
  Future? initializePlayer;

  /// a variable used to store the video thumbnail.
  String? fileName;

  /// variable used to store the video thumbnail file from the [fileName] path.
  File? assetFile;

  /// method to get the thumbail from the video file.
  Future<void> getThumbnail(int index) async {
    fileName = await VideoThumbnail.thumbnailFile(
      video: trendingReel[index].video,
      thumbnailPath: (await getTemporaryDirectory()).path,
      imageFormat: ImageFormat.JPEG,
      quality: 75,
    );
    assetFile = File(fileName!);
  }

  /// method to start the video and initilize video player
  void videoInit(int pageNumber) async {
    makePlayTrue();
    debugPrint('video link is: ${trendingReel[pageNumber].video}');
    await getThumbnail(pageNumber);
    debugPrint(
        '${fileName!}is filename ====================================================================');
    initializePlayer = videoPlayerController!.initialize();
    chewieController = ChewieController(
      videoPlayerController:
          VideoPlayerController.network(trendingReel[pageNumber].video),
      autoInitialize: true,
      autoPlay: true,
      looping: true,
      showOptions: false,
      customControls: Dimens.box0,
      showControlsOnInitialize: false,
      aspectRatio: chewieController!.videoPlayerController.value.aspectRatio,
    );
    update();
  }

// Web View Section ============================================================

  bool isLoggedIn = false;

  void loginNewUser() {
    isLoggedIn = !isLoggedIn;
    update();
  }

  List<Widget> webWidgets = [
    AccountWidget(),
    const MyListWidget(),
    Container(),
    SubscriptionInformationWidget(),
    Container(),
    ChangePasswordWidget(),
  ];

  int webWidgetIndex = 0;

  setWebWidgetIndex(int index) {
    webWidgetIndex = index;
    update();
  }

  bool isSearchIconTapped = false;

  enableSearchBar() {
    isSearchIconTapped = !isSearchIconTapped;
    update();
  }

  bool isDropDownAppSettings = false;

  viewDropDownMenus() {
    isDropDownAppSettings = !isDropDownAppSettings;
    update();
  }

  @override
  void onInit() {
    trendingReel = reels;
    listofFiles();
    kIsWeb
        ? debugPrint('')
        : videoPlayerController =
            VideoPlayerController.network(AssetConstants.movieLink);
    kIsWeb
        ? debugPrint('')
        : chewieController = ChewieController(
            videoPlayerController:
                VideoPlayerController.network(trendingReel[0].video),
            autoInitialize: true);
    kIsWeb ? debugPrint('') : getThumbnail(0);
    super.onInit();
  }

  @override
  void onClose() {
    videoPlayerController!.dispose();
    chewieController!.dispose();
    super.onClose();
  }
}
