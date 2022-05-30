import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

class SearchBox extends StatelessWidget {
  SearchBox({Key? key, required this.padding}) : super(key: key);
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
        builder: (_controller) => Padding(
          padding: padding,
          child: FormFieldWidget(
            contentPadding: Dimens.edgeInsets16,
            onChange: _controller.searchSuggestion,
            cursorColor: ColorsValue.primaryColor,
            prefixIcon: const Icon(
              Icons.search_outlined,
              color: ColorsValue.greyColor,
            ),
            suffixIcon: const Icon(
              Icons.mic,
              color: ColorsValue.greyColor,
            ),
            fillColor: ColorsValue.greyBoxColor,
            formStyle: Styles.primaryText14,
            textInputType: TextInputType.text,
            focusedBorder:
                const OutlineInputBorder(borderSide: BorderSide.none),
            hintStyle: Styles.grey13,
            hintText: 'searchForAShowMovieGenreEtc'.tr,
            formBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(Dimens.seven),
            ),
          ),
        ),
      );
}
