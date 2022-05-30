import 'dart:convert';
import 'dart:io' as io;
import 'dart:io';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:omf_netflix/app/app.dart';
import 'package:omf_netflix/domain/domain.dart';
import 'package:path_provider/path_provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

/// A controller for [HomeView] to update the UI.
class HomeController extends GetxController {
  HomeController(this._homePresenter);
  final HomePresenter _homePresenter;

 
  final List<String> videos = [
    'https://res.cloudinary.com/dxkoc9aao/video/upload/c_fill/v1644818615/ShopAR/post/video/1644818599729/611f8c531fd0a50014af3121.mp4',
    'https://res.cloudinary.com/dxkoc9aao/video/upload/c_fill/v1644819786/ShopAR/post/video/1644819780863/611f8c531fd0a50014af3121.mp4',
    'https://res.cloudinary.com/dxkoc9aao/video/upload/c_fill/v1644818723/ShopAR/post/video/1644818712537/611f8c531fd0a50014af3121.mp4',
    'https://res.cloudinary.com/dxkoc9aao/video/upload/c_fill/v1644818482/ShopAR/post/video/1644818478491/611f8c531fd0a50014af3121.mp4',
  ];

 
  var collectionNameController = TextEditingController();

  /// Collection Response Model
  var collectionReponseModel = CollectionListResponse();

  Future<void> getCollections({
    required String limit,
    required String offset,
    required bool loading,
  }) async {
    final res = await _homePresenter.getCollections(
        limit: limit, offset: offset, loading: loading);

    if (res != null) {
      collectionReponseModel = res;
      update();
    } else {}
  }

  /// postId: '62054f19f1349052617247a1',
  Future<String> createCollection() async {
    final res = await _homePresenter.createCollection(
        title: collectionNameController.text, loading: true);
    if (!res.hasError) {
      final data = jsonDecode(res.data) as Map<String, dynamic>;
      if (data['data']['collectionId'] != null) {
        final res = await _homePresenter.bookmarkPost(
          postId: '62054f19f1349052617247a1',
          collectionId: data['data']['collectionId'] as String,
          loading: true,
        );
        if (!res.hasError) {
          await getCollections(limit: '10', loading: false, offset: '1');
          update();
          return 'Collection Created & Saved';
        }
        return 'Error';
      }
      return 'Error';
    }
    return 'Error';
  }

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

  Future<String> getFileSize(File? file) async {
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
  List<io.FileSystemEntity> allFilesList = [];
  List<io.FileSystemEntity> videoList = [];

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
    Utility.showLoader();
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

// bottom navigation bar section ===============================================
  int selectedIndex = 0;

  bool btmNavBgTransparent = false;

  /// To switch index through bottomsheet
  void onItemTapped(int index) {
    selectedIndex = index;
    if (selectedIndex == 2) {
      btmNavBgTransparent = true;
    } else {
      btmNavBgTransparent = false;
    }
    // if (chewieController != null) {
    //   if (selectedIndex == 2) {
    //     videoInit(pageIndex);
    //     btmNavBgTransparent = true;
    //   } else {
    //     chewieController!.pause();
    //     btmNavBgTransparent = false;
    //   }
    // } else {
    //   btmNavBgTransparent = false;
    // }
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

  List<MoviesCategory> categoryList = [];

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

  List<String> subList = [];

  List<List<String>> mainList = [];

  Widget movieTypeListView(
      {MovieCategoryType? type,
      int? subIndex,
      List<MoviesSubCategory>? subCategory}) {
    switch (type) {
      case MovieCategoryType.movie:
        return MoviesListWidget(
            subCategoryIndex: subIndex, moviesSubCategory: subCategory!);
      case MovieCategoryType.omfseries:
        return OmfSeries(
            subCategoryIndex: subIndex, moviesSubCategory: subCategory!);
      case MovieCategoryType.continues:
        return ContinuesWatching(
            subCategoryIndex: subIndex, moviesSubCategory: subCategory!);
      default:
    }
    return Container(
      child: Center(
        child: Text(
          'No Data Found!',
          style: Styles.primaryText16,
        ),
      ),
    );
  }

// =====

  int lengthOfCategoryList = 0;

  // final itemScrollController = ItemScrollController();
  final List<ItemScrollController>? itemScrollControllerList = [];
  // final itemPositionsListener = ItemPositionsListener.create();
  final List<ItemPositionsListener>? itemPositionsListenerList = [];

  // List<int> indices = [];
  List<List<int>> indicesList = [];

  // int startIndex = 0;
  List<int> startIndexList = [];
  // int endIndex = 0;
  List<int> endIndexList = [];

  // void getIndices(int categoryIndex) {
  //   itemPositionsListenerList![categoryIndex].itemPositions.addListener(() {
  //     final indexesOfList = itemPositionsListenerList![categoryIndex]
  //         .itemPositions
  //         .value
  //         .where((element) {
  //           final isPreviousVisible = element.itemLeadingEdge >= 0;
  //           // final isNextVisble = element.itemTrailingEdge <= 1;
  //           return isPreviousVisible;
  //         })
  //         .map((e) => e.index)
  //         .toList();

  //     indicesList[categoryIndex].addAll(indexesOfList);

  //     startIndexList[categoryIndex] = indicesList[categoryIndex].isEmpty
  //         ? 0
  //         : indicesList[categoryIndex].reduce(min);
  //     endIndexList[categoryIndex] = indicesList[categoryIndex].isEmpty
  //         ? 0
  //         : indicesList[categoryIndex].reduce(max);

  //     // debugPrint(
  //     //     'startIndex is: ${startIndex} and endIndex is: ${endIndex}, and movielist length is: ${moviesList.length}');
  //     // debugPrint('$indices');
  //   });
  // }

  void scrollToNext(int index) async {
    if (indicesList[index].isEmpty) {
      // getIndices(index);
    } else {
      // getIndices(index);
      if (endIndexList[index] < moviesList.length - 1) {
        await itemScrollControllerList![index].scrollTo(
            index: endIndexList[index] + 1,
            alignment: 0.8,
            duration: const Duration(milliseconds: 200));
        debugPrint(
            'startIndex is: ${startIndexList[index]} and endIndex is: ${endIndexList[index]}, and movielist length is: ${moviesList.length}');
      } else {}
    }
  }

  void scrollToPrevious(int index) async {
    if (indicesList[index].isEmpty) {
      // getIndices(index);
    } else {
      // getIndices(index);
      if (startIndexList[index] > 0) {
        await itemScrollControllerList![index].scrollTo(
            index: startIndexList[index] - 1,
            alignment: 0,
            duration: const Duration(milliseconds: 200));
        // debugPrint('startIndex is: ${startIndex} and endIndex is: ${endIndex}');

      } else {}
    }
  }

  // ======

  /// footer menu list
  List<String> footerMenuList = [
    'audioAndSubtitles'.tr,
    'audioDescription'.tr,
    'helpCenter'.tr,
    'giftCards'.tr,
    'mediaCenter'.tr,
    'investorRelations'.tr,
    'jobs'.tr,
    'termsOfUse'.tr,
    'privacy'.tr,
    'legalNotices'.tr,
    'cookiePreferences'.tr,
    'corporateInformation'.tr,
    'contactUs'.tr,
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
  void selectMenu(int index) {
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

  /// the method set the [pageIndex] according to [PageView] index and runs the
  /// videoInit method via [pageIndex].
  void setPageIndex(int index) {
    pageIndex = index;
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

  void setWebWidgetIndex(int index) {
    webWidgetIndex = index;
    update();
  }

  bool isSearchIconTapped = false;

  void enableSearchBar() {
    isSearchIconTapped = !isSearchIconTapped;
    update();
  }

  bool isDropDownAppSettings = false;

  void viewDropDownMenus() {
    isDropDownAppSettings = !isDropDownAppSettings;
    update();
  }

  /// Date of Birth Picker ==========================================

  /// selected date
  DateTime? selectedDate;

  /// new date
  bool isNewDate = false;

  /// Date of birth variable as TextEditingController
  var dob = TextEditingController();

  /// Date Picker
  void selectDate(BuildContext context) async => await showDatePicker(
        context: context,
        initialDate: selectedDate != null ? selectedDate! : DateTime.now(),
        firstDate: DateTime(2000, 1),
        lastDate: DateTime(2040, 1),
        builder: (context, picker) => Theme(
          data: Theme.of(context),
          child: picker!,
        ),
      ).then((value) {
        isNewDate = true;
        if (value != null) {
          isNewDate = true;
          dob.text = Utility.getDayMonthYear(value);
          debugPrint(dob.text);
          update();
        }
      });

  /// API calls

  /// Logout API call
  Future<void> logout() async => await _homePresenter.logout();

  /// Profile Response
  ProfileResponse? profileResponse;

  /// isLoading
  bool isLoading = true;

  /// Profile API
  Future<void> getProfileData() async {
    try {
      var response = await _homePresenter.getProfileData();
      if (response!.data != null) {
        isLoading = false;
        profileResponse = response;
        debugPrint('Welcome ${profileResponse!.data}');
        debugPrint(
            '====================================================== ImageURL');
        debugPrint(
            '=========> ${LocalKeys.baseUrl}/${profileResponse!.data!.profilePic}');
        update();
      }
    } catch (e) {
      isLoading = true;
      debugPrint(e.toString());
    }
    update();
  }

  /// All [TextEditingController] =====================

  /// variable stores firstname of user.
  var firstName = TextEditingController();

  /// variable stores lastname of user.
  var lastName = TextEditingController();

  /// variable stores firstname of user.
  var userName = TextEditingController();

  /// variable stores email of user
  var emailId = TextEditingController();

  /// firstNameError will null if firstName is valid.
  String? firstNameError;

  /// method to validate firstName of user.
  void enterFirstName(String value) {
    // firstName = value;
    if (value.isNotEmpty) {
      firstNameError = null;
    } else {
      firstNameError = 'fieldRequired'.tr;
    }
    update();
  }

  /// LastName ========================================

  /// lastNameError will null if lastName is valid.
  String? lastNameError;

  /// method to validate [lastName] of user.
  void enterLastName(String value) {
    // lastName = value;
    if (value.isNotEmpty) {
      lastNameError = null;
    } else {
      lastNameError = 'fieldRequired'.tr;
    }
    update();
  }

  /// UserName ========================================

  /// userNameError will null if userName is valid.
  String? userNameError;

  /// Is true when the email is valid.
  bool isUserNameValid = true;

  /// Check if the userName is taken or not.
  bool isUserNameTaken = false;

  /// Check if the userName is checked or not.
  bool isUserNameChecked = false;

  /// method to validate [userName] of user.
  void enterUserName(String value) {
    isUserNameTaken = false;
    isUserNameChecked = false;
    isUserNameValid = userName.text.isNotEmpty;
    // userName = value;
    if (value.isNotEmpty) {
      userNameError = null;
    } else {
      userNameError = 'fieldRequired'.tr;
    }
    update();
  }

  /// Phone number =======================================

  /// variable stores phone number with country code
  var phoneNumber = TextEditingController();

  /// PhoneNumber object
  var pPhoneNumber = PhoneNumber(isoCode: 'IN');

  /// variable stores only country code
  String countryCode = 'IN';

  /// check phone number is valid or not
  bool isPhoneNumberValid = true;

  /// Check if the phonenumber is taken or not.
  bool isPhoneNumberTaken = true;

  /// Check if the phonenumber is checked or not.
  bool isPhoneNumberChecked = false;

  /// phonenumber valid or not
  void checkPhoneNumberValidity(bool isValid) {
    isPhoneNumberValid = isValid;
    debugPrint(isValid.toString());
    update();
  }

  /// Store the validated phone number
  void storePhoneNumber(PhoneNumber phone) {
    countryCode = phone.dialCode.toString();
    isPhoneNumberTaken = true;
    debugPrint('$countryCode ${phoneNumber.text}');
    update();
  }

  /// validate phone number API
  ///
  /// 6397308499 already registered number for testing
  // Future<int?> validatePhoneNumberApi(
  //     String phoneNumber, String countryCode) async {
  //   var response = await _homePresenter.validatePhoneNumberApi(
  //     phoneNumber: phoneNumber.split(' ').join(''),
  //     countryCode: countryCode,
  //   );
  //   if (response.errorCode == 200) {
  //     debugPrint(response.data);
  //     return response.errorCode;
  //   } else if (response.errorCode == 409) {
  //     debugPrint(response.data);
  //     return response.errorCode;
  //   }
  // }

  /// Email ==============================================

  /// Error text for email form field.
  String? emailErrorText;

  /// Is true when the email is valid.
  bool isEmailValid = true;

  /// Check if the email is valid or not.
  void checkIfEmailIsValid(String value) {
    isEmailValid = Utility.emailValidator(value);
    emailErrorText = isEmailValid ? null : 'pleaseEnterValidEmail'.tr;
    isEmailChecked = false;
    update();
  }

  /// Check if the email is taken or not.
  bool isEmailTaken = true;

  /// Check if the email is checked or not.
  bool isEmailChecked = false;

  /// Validate Email code
  // Future<int?> validateEmail({
  //   String emailId = '',
  //   required TypeOfEntry type,
  // }) async {
  //   var response = await _homePresenter.validateEmail(
  //     emailId: emailId,
  //     type: type,
  //   );
  //   if (!response.hasError) {
  //     // Utility.showMessage(
  //     //     response.data, MessageType.success, () => null, 'okay'.tr);
  //     return response.errorCode;
  //   } else {
  //     Utility.showMessage(
  //         response.data, MessageType.error, () => null, 'okay'.tr);
  //     return response.errorCode;
  //   }
  // }

  var imageBaseUrl = '';

  /// Get guesttoken form local
  Future<void> getSecureValue() async {
    var configImageBaseUrl =
        await _homePresenter.getSecureValue(LocalKeys.imageBaseUrl);
    imageBaseUrl = configImageBaseUrl!;
    update();
  }

  @override
  void onInit() async {
    // debugPrint(
    //     'Reusable video setup starts here...............................................................................');
    // _setupData();

    await getProfileData();
    await getCollections(limit: '10', loading: false, offset: '1');

    categoryList = moviesCategoryList;

    lengthOfCategoryList = categoryList.length;

    for (var i = 0; i < lengthOfCategoryList; i++) {
      itemScrollControllerList!.add(ItemScrollController());
      itemPositionsListenerList!.add(ItemPositionsListener.create());
    }

    super.onInit();
  }

  /// favorite or another post in profile
  int isFavoritePosts = 1;

  /// open favorite or another post
  void openFavPosts(int index) {
    isFavoritePosts = index;
    update();
  }

  /// bottom sheet
  void addNewCollectionSheet() {
    Get.bottomSheet<dynamic>(const AddCollectionContent());
  }

  /// first and last name of user
  String? userFirstAndLastName = '';

  /// username of user
  String? userUsername = '';

  /// get username
  void getUsername() async {
    userFirstAndLastName =
        await _homePresenter.getSecureValue(LocalKeys.userFirstAndLastName);
    userUsername = await _homePresenter.getSecureValue(LocalKeys.username);
    update();
  }

  
}
