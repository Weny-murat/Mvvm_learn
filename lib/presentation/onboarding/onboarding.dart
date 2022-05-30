// ignore_for_file: prefer_final_fields
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvvm_learn/presentation/resources/assets_manager.dart';
import 'package:mvvm_learn/presentation/resources/color_manager.dart';
import 'package:mvvm_learn/presentation/resources/strings_manager.dart';
import 'package:mvvm_learn/presentation/resources/values_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late final List<SliderObject> _list = _sliderData;
  PageController _pageController = PageController(initialPage: 0);

  int _currentindex = 0;

  List<SliderObject> _sliderData = [
    SliderObject(AppStrings.onBoardingTitle1, AppStrings.onBoardingSubtitle1,
        ImageAssets.onboardingLogo1),
    SliderObject(AppStrings.onBoardingTitle2, AppStrings.onBoardingSubtitle2,
        ImageAssets.onboardingLogo2),
    SliderObject(AppStrings.onBoardingTitle3, AppStrings.onBoardingSubtitle4,
        ImageAssets.onboardingLogo3),
    SliderObject(AppStrings.onBoardingTitle4, AppStrings.onBoardingSubtitle4,
        ImageAssets.onboardingLogo4),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      // appBar: AppBar(
      //   backgroundColor: ColorManager.white,
      //   elevation: AppSize.s1_5,
      //   systemOverlayStyle: SystemUiOverlayStyle(
      //       statusBarColor: ColorManager.white,
      //       statusBarBrightness: Brightness.dark,
      //       statusBarIconBrightness: Brightness.dark),
      // ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: 4,
        onPageChanged: (index) {
          setState(() {
            _currentindex = index;
          });
        },
        itemBuilder: (context, index) {
          return OnBoardingPage(_list[index]);
        },
      ),
      bottomSheet: Container(
        color: ColorManager.white,
        height: AppSize.s100,
        child: Column(
          children: [
            Align(
              child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    AppStrings.skip,
                    textAlign: TextAlign.end,
                  )),
            ),
            _getBottomSheetWidget(),
          ],
        ),
      ),
    );
  }

  Widget _getBottomSheetWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(AppPadding.p14),
          child: GestureDetector(
            onTap: () {
              // _pageController.animateToPage(_getPreviousIndex(),
              //     duration: const Duration(milliseconds: DurationConstants.d300),
              //     curve: Curves.bounceInOut);
            },
            child: SizedBox(
              height: AppSize.s20,
              width: AppSize.s20,
              child: SvgPicture.asset(ImageAssets.leftArrowIc),
            ),
          ),
        ),
        Row(
          children: [
            for (int i = 0; i < _list.length; i++)
              Padding(
                padding: const EdgeInsets.all(AppPadding.p8),
                child: _getProperCircle(i),
              )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p14),
          child: GestureDetector(
            onTap: () {
              //go to next slide
            },
            child: SizedBox(
              height: AppSize.s20,
              width: AppSize.s20,
              child: SvgPicture.asset(ImageAssets.rightArrowIc),
            ),
          ),
        ),
      ],
    );
  }

  Widget _getProperCircle(int index) {
    if (index == _currentindex) {
      return SvgPicture.asset(ImageAssets.hollowCirlceIc);
    } else {
      return SvgPicture.asset(ImageAssets.solidCircleIc);
    }
  }
}

// ignore: must_be_immutable
class OnBoardingPage extends StatelessWidget {
  SliderObject _sliderObject;
  OnBoardingPage(this._sliderObject, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: AppSize.s40,
        ),
        Padding(
          padding: const EdgeInsets.all(AppSize.s8),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppSize.s8),
          child: Text(
            _sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        const SizedBox(
          height: AppSize.s60,
        ),
        SvgPicture.asset(_sliderObject.imagePath),
      ],
    );
  }
}

class SliderObject {
  String title;
  String subTitle;
  String imagePath;
  SliderObject(this.title, this.subTitle, this.imagePath);
}
