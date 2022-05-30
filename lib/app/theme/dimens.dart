// coverage:ignore-file
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

/// Contains the dimensions and padding used
/// all over the application.
/// Will be ignored for test since all are static values and would not change.
abstract class Dimens {
  static double zero = 0.sp;
  static double one = 1.sp;
  static double two = 2.sp;
  static double three = 3.sp;
  static double four = 4.sp;
  static double five = 5.sp;
  static double six = 6.sp;
  static double seven = 7.sp;
  static double eight = 8.sp;
  static double nine = 9.sp;
  static double ten = 10.sp;
  static double eleven = 11.sp;
  static double twelve = 12.sp;
  static double thirteen = 13.sp;
  static double fourteen = 14.sp;
  static double fifteen = 15.sp;
  static double sixteen = 16.sp;
  static double seventeen = 17.sp;
  static double eighteen = 18.sp;
  static double nineteen = 19.sp;
  static double twenty = 20.sp;
  static double twentyTwo = 22.sp;
  static double twentyThree = 23.sp;
  static double twentyFour = 24.sp;
  static double twentyFive = 25.sp;
  static double twentySix = 26.sp;
  static double thirty = 30.sp;
  static double thirtyTwo = 32.sp;
  static double thirtyFour = 34.sp;
  static double thirtyFive = 35.sp;
  static double thirtyEight = 38.sp;
  static double thirtyNine = 39.sp;
  static double fourty = 40.sp;
  static double fourtyFour = 44.sp;
  static double fourtyFive = 45.sp;
  static double fourtyEight = 48.sp;
  static double fourtyNine = 49.sp;
  static double fifty = 50.sp;
  static double fiftyTwo = 52.sp;
  static double fiftyFour = 54.sp;
  static double fiftyFive = 55.sp;
  static double fiftySix = 56.sp;
  static double sixty = 60.sp;
  static double seventy = 70.sp;
  static double seventyFour = 74.sp;
  static double eighty = 80.sp;
  static double eightyFive = 85.sp;
  static double eightySix = 86.sp;
  static double ninty = 90.sp;
  static double nintyFour = 94.sp;
  static double hundred = 100.sp;
  static double hundredSix = 106.sp;
  static double hundredEight = 108.sp;
  static double hundredTwenty = 120.sp;
  static double hundredThirty = 130.sp;
  static double hundredThirtyFour = 134.sp;
  static double hundredThirtySix = 136.sp;
  static double hundredThirtySeven = 137.sp;
  static double hundredFourty = 140.sp;
  static double hundredFourtyEight = 148.sp;
  static double hundredFifty = 150.sp;
  static double hundredFiftyOne = 151.sp;
  static double hundredFiftyFive = 155.sp;
  static double hundredSixtyTwo = 162.sp;
  static double hundredSeventyTwo = 172.sp;
  static double hundredEightyEight = 188.sp;
  static double hundredNinty = 190.sp;
  static double twoHundred = 200.sp;
  static double twoHundredThirtySix = 236.sp;
  static double twoHundredFifty = 250.sp;
  static double twoHundredEighty = 280.sp;
  static double threeHundred = 300.sp;
  static double threeHundredTwentySix = 326.sp;
  static double threeHundredTwentyEight = 328.sp;
  static double fourHundred = 400.sp;

  static double fifteenStatic = 15;
  static double twentyStatic = 20;
  static double hundredStatic = 100;
  static double hundredFiftyStatic = 150;
  static double twoHundredStatic = 200;

  static double pointZeroZeroEight = 0.08.sp;
  static double pointZeroZeroNine = 0.09.sp;
  static double pointOne = 0.1.sp;
  static double pointOneStatic = 0.1;
  static double pointOneSeven = 0.17.sp;
  static double pointOneEight = 0.18.sp;
  static double pointTwo = 0.2.sp;
  static double pointThree = 0.3.sp;
  static double pointThreeTwo = 0.32.sp;
  static double pointThreeThree = 0.33.sp;
  static double pointThreeFour = 0.34.sp;
  static double pointThreeFive = 0.35.sp;
  static double pointFour = 0.4.sp;
  static double pointFourFive = 0.45.sp;
  static double pointFive = 0.5.sp;
  static double pointFiveFive = 0.55.sp;
  static double pointSix = 0.6.sp;
  static double pointSixFive = 0.65.sp;
  static double pointSeven = 0.7.sp;
  static double pointEight = 0.8.sp;
  static double pointNine = 0.9.sp;
  static double pointNineFour = 0.94.sp;
  static double pointNineSix = 0.96.sp;
  static double pointZeroZeroNineStatic = 0.09;
  static double pointOneSevenStatic = 0.17;
  static double pointOneFiveStatic = 0.15;
  static double pointTwoStatic = 0.2;
  static double pointTwoFiveStatic = 0.25;
  static double pointThreeStatic = 0.3;
  static double pointThreeThreeStatic = 0.33;
  static double pointThreeFourStatic = 0.34;
  static double pointThreeFiveStatic = 0.35;
  static double pointThreeSixStatic = 0.36;
  static double pointThreeSevenStatic = 0.37;
  static double pointFourStatic = 0.4;
  static double pointFiveStatic = 0.5;
  static double pointFiveFiveStatic = 0.55;
  static double pointSixStatic = 0.6;
  static double pointSixFiveStatic = 0.65;
  static double pointSevenStatic = 0.7;
  static double pointEightStatic = 0.8;
  static double oneStatic = 1.0;

  /// Get the height with the percent value of the screen height.
  static double percentHeight(double percentValue) => percentValue.sh;

  /// Get the width with the percent value of the screen width.
  static double percentWidth(double percentValue) => percentValue.sw;

  /// Get height percent [value].
  static double getHeightPercent(double value) => Get.height * value;

  /// Get width percent [value].
  static double getWidthPercent(double value) => Get.width * value;

  static SizedBox getBoxWidth(double value) => SizedBox(
        width: getWidthPercent(value),
      );
  static SizedBox getBoxHeight(double value) => SizedBox(
        height: getHeightPercent(value),
      );

  /// Paddings
  static EdgeInsets edgeInsets0 = EdgeInsets.all(zero);
  static EdgeInsets edgeInsets10 = EdgeInsets.all(ten);
  static EdgeInsets edgeInsets12 = EdgeInsets.all(twelve);
  static EdgeInsets edgeInsets15 = EdgeInsets.all(fifteen);
  static EdgeInsets edgeInsets16 = EdgeInsets.all(sixteen);
  static EdgeInsets edgeInsets18 = EdgeInsets.all(eighteen);
  static EdgeInsets edgeInsets20 = EdgeInsets.all(twenty);
  static EdgeInsets edgeInsets30 = EdgeInsets.all(thirty);
  static EdgeInsets edgeInsets40 = EdgeInsets.all(fourty);
  static EdgeInsets edgeInsets50 = EdgeInsets.all(fifty);
  static EdgeInsets edgeInsets60 = EdgeInsets.all(sixty);

  static EdgeInsets edgeInsets4_0_4_0 = EdgeInsets.fromLTRB(
    four,
    zero,
    four,
    zero,
  );

  static EdgeInsets edgeInsets56_336_56_336 = EdgeInsets.fromLTRB(
    fiftySix,
    hundredThirtyFour,
    fiftySix,
    hundredThirtyFour,
  );

  static EdgeInsets edgeInsets56_0_56_0 = EdgeInsets.fromLTRB(
    fiftySix,
    zero,
    fiftySix,
    zero,
  );

  static EdgeInsets edgeInsets0_5_0_5 = EdgeInsets.fromLTRB(
    zero,
    five,
    zero,
    five,
  );

  static EdgeInsets edgeInsets0_0_0_20 = EdgeInsets.fromLTRB(
    zero,
    zero,
    zero,
    twenty,
  );

  static EdgeInsets edgeInsets10_15_10_15 = EdgeInsets.fromLTRB(
    ten,
    fifteen,
    ten,
    fifteen,
  );

  static EdgeInsets edgeInsets0_0_4_0 = EdgeInsets.fromLTRB(
    zero,
    zero,
    four,
    zero,
  );

  static EdgeInsets edgeInsets14_0_0_0 = EdgeInsets.fromLTRB(
    fourteen,
    zero,
    zero,
    zero,
  );

  static EdgeInsets edgeInsets15_15_0_0 = EdgeInsets.fromLTRB(
    fifteen,
    fifteen,
    zero,
    zero,
  );

  static EdgeInsets edgeInsets15_0_0_0 = EdgeInsets.fromLTRB(
    fifteen,
    zero,
    zero,
    zero,
  );

  static EdgeInsets edgeInsets5_0_5_0 = EdgeInsets.fromLTRB(
    five,
    zero,
    five,
    zero,
  );

  static EdgeInsets edgeInsets150_0_150_0 = EdgeInsets.fromLTRB(
    hundredFifty,
    zero,
    hundredFifty,
    zero,
  );

  static EdgeInsets edgeInsets250_0_250_0 = EdgeInsets.fromLTRB(
    twoHundredFifty,
    zero,
    twoHundredFifty,
    zero,
  );

  static EdgeInsets edgeInsets100_0_100_0 = EdgeInsets.fromLTRB(
    hundred,
    zero,
    hundred,
    zero,
  );

  static EdgeInsets edgeInsets0_10_0_10 = EdgeInsets.fromLTRB(
    zero,
    ten,
    zero,
    ten,
  );

  static EdgeInsets edgeInsets0_0_10_0 = EdgeInsets.fromLTRB(
    zero,
    zero,
    ten,
    zero,
  );

  static EdgeInsets edgeInsets0_20_0_0 = EdgeInsets.fromLTRB(
    zero,
    twenty,
    zero,
    zero,
  );

  static EdgeInsets edgeInsets0_0_15_0 = EdgeInsets.fromLTRB(
    zero,
    zero,
    fifteen,
    zero,
  );

  static EdgeInsets edgeInsets5_0_0_0 = EdgeInsets.fromLTRB(
    five,
    zero,
    zero,
    zero,
  );
  static EdgeInsets edgeInsets0_0_52_0 = EdgeInsets.fromLTRB(
    zero,
    zero,
    fiftyTwo,
    zero,
  );

  static EdgeInsets edgeInsets16_0_16_0 = EdgeInsets.fromLTRB(
    sixteen,
    zero,
    sixteen,
    zero,
  );

  static EdgeInsets edgeInsets12_0_12_0 = EdgeInsets.fromLTRB(
    twelve,
    zero,
    twelve,
    zero,
  );

  static EdgeInsets edgeInsets12_20_12_0 = EdgeInsets.fromLTRB(
    twelve,
    twenty,
    twelve,
    zero,
  );

  static EdgeInsets edgeInsets15_0_15_0 = EdgeInsets.fromLTRB(
    fifteen,
    zero,
    fifteen,
    zero,
  );

  static EdgeInsets edgeInsets24_0_24_0 = EdgeInsets.fromLTRB(
    twentyFour,
    zero,
    twentyFour,
    zero,
  );

  static EdgeInsets edgeInsets15_11_15_11 = EdgeInsets.fromLTRB(
    fifteen,
    eleven,
    fifteen,
    eleven,
  );

  static EdgeInsets edgeInsets35_11_15_11 = EdgeInsets.fromLTRB(
    thirtyFive,
    eleven,
    fifteen,
    eleven,
  );

  static EdgeInsets edgeInsets35_0_15_0 = EdgeInsets.fromLTRB(
    thirtyFive,
    zero,
    fifteen,
    zero,
  );

  static EdgeInsets edgeInsets35_0_15_0Minus12 = EdgeInsets.fromLTRB(
    thirtyFive - twelve,
    zero,
    fifteen,
    zero,
  );

  static EdgeInsets edgeInsets20_0_15_0 = EdgeInsets.fromLTRB(
    twenty,
    zero,
    fifteen,
    zero,
  );

  static EdgeInsets edgeInsets15_20_15_0 = EdgeInsets.fromLTRB(
    fifteen,
    twenty,
    fifteen,
    zero,
  );
  static EdgeInsets edgeInsets15_20_10_0 = EdgeInsets.fromLTRB(
    fifteen,
    twenty,
    ten,
    zero,
  );

  static EdgeInsets edgeInsets22_10_22_10 = EdgeInsets.fromLTRB(
    twentyTwo,
    ten,
    twentyTwo,
    ten,
  );

  static EdgeInsets edgeInsets22_0_22_0 = EdgeInsets.fromLTRB(
    twentyTwo,
    zero,
    twentyTwo,
    zero,
  );

  static EdgeInsets edgeInsets20_0_20_0 = EdgeInsets.fromLTRB(
    twenty,
    zero,
    twenty,
    zero,
  );

    static EdgeInsets edgeInsets8_0_8_0 = EdgeInsets.fromLTRB(
    eight,
    zero,
    eight,
    zero,
  );

    static EdgeInsets edgeInsets10_10_10_0 = EdgeInsets.fromLTRB(
    ten,
    ten,
    ten,
    zero,
  );

    static EdgeInsets edgeInsets15_0_0_5 = EdgeInsets.fromLTRB(
    fifteen,
    zero,
    zero,
    five,
  );

    static EdgeInsets edgeInsets6_4_6_4 = EdgeInsets.fromLTRB(
    six,
    four,
    six,
    four,
  );

    static EdgeInsets edgeInsets30_10_30_10 = EdgeInsets.fromLTRB(
    thirty,
    ten,
    thirty,
    ten,
  );

    static EdgeInsets edgeInsets30_0_30_0 = EdgeInsets.fromLTRB(
    thirty,
    zero,
    thirty,
    zero,
  );

    static EdgeInsets edgeInsets0_4_4_4 = EdgeInsets.fromLTRB(
    zero,
    four,
    four,
    four,
  );

  /// Box widths
  static SizedBox boxWidth0 = SizedBox(width: zero);
  static SizedBox boxWidth3 = SizedBox(width: three);
  static SizedBox boxWidth4 = SizedBox(width: four);
  static SizedBox boxWidth5 = SizedBox(width: five);
  static SizedBox boxWidth8 = SizedBox(width: eight);
  static SizedBox boxWidth10 = SizedBox(width: ten);
  static SizedBox boxWidth12 = SizedBox(width: twelve);
  static SizedBox boxWidth15 = SizedBox(width: fifteen);
  static SizedBox boxWidth16 = SizedBox(width: twentyFour - eight);
  static SizedBox boxWidth20 = SizedBox(width: twenty);
  static SizedBox boxWidth35 = SizedBox(width: thirtyFive);
  static SizedBox boxWidth50 = SizedBox(width: fifty);
  static SizedBox boxWidth60 = SizedBox(width: sixty);
  static SizedBox boxWidth100 = SizedBox(width: hundred);

  /// Box heights
  static SizedBox boxHeight0 = SizedBox(height: zero);
  static SizedBox boxHeight2 = SizedBox(height: two);
  static SizedBox boxHeight3 = SizedBox(height: three);
  static SizedBox boxHeight4 = SizedBox(height: four);
  static SizedBox boxHeight5 = SizedBox(height: five);
  static SizedBox boxHeight8 = SizedBox(height: eight);
  static SizedBox boxHeight9 = SizedBox(height: nine);
  static SizedBox boxHeight10 = SizedBox(height: ten);
  static SizedBox boxHeight12 = SizedBox(height: twelve);
  static SizedBox boxHeight15 = SizedBox(height: fifteen);
  static SizedBox boxHeight20 = SizedBox(height: twenty);
  static SizedBox boxHeight25 = SizedBox(height: twentyFive);
  static SizedBox boxHeight30 = SizedBox(height: thirty);
  static SizedBox boxHeight40 = SizedBox(height: fourty);
  static SizedBox boxHeight35 = SizedBox(height: thirtyFive);
  static SizedBox boxHeight44 = SizedBox(height: fourtyFour);
  static SizedBox boxHeight45 = SizedBox(height: fourtyFive);
  static SizedBox boxHeight50 = SizedBox(height: fifty);
  static SizedBox boxHeight60 = SizedBox(height: sixty);
  static SizedBox boxHeight80 = SizedBox(height: eighty);
  static SizedBox boxHeight90 = SizedBox(height: ninty);
  static SizedBox boxHeight134 = SizedBox(height: hundredThirtyFour);
  static SizedBox boxHeight136 = SizedBox(height: hundredThirtySix);
  static SizedBox boxHeight137 = SizedBox(height: hundredThirtySeven);
  static SizedBox boxHeight150 = SizedBox(height: hundredFifty);
  static SizedBox boxHeight190 = SizedBox(height: hundredNinty);
  static SizedBox boxHeight100 = SizedBox(height: hundred);
  static SizedBox boxHeight200 = SizedBox(height: twoHundred);

  static SizedBox box0 = const SizedBox.shrink();
}
