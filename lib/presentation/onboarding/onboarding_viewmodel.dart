import 'dart:async';
import '../../domain/model.dart';
import '../base/baseviewmodel.dart';
import '../resources/assets_manager.dart';
import '../resources/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  //stream controller yani Viewmodel ile View arasındaki bağlantıyı sağlayan araç
  final StreamController _streamController =
      StreamController<SliderViewObject>();

  late final List<SliderObject> _list;
  int _currentindex = 0;

  //girdiler
  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _list = _getSliderData();
    //bu veriyi aldık ama view'a göndermemizde lazım
    _postDataToView();
  }

  @override
  int goNext() {
    int nextIndex = _currentindex++;
    if (nextIndex >= _list.length) {
      _currentindex = 0;
    }
    return _currentindex;
  }

  @override
  int goPrevious() {
    int previousIndex = _currentindex--;
    if (previousIndex == -1) {
      _currentindex = _list.length - 1;
    }
    return _currentindex;
  }

  @override
  void onPageChanged(int newIndex) {
    _currentindex = newIndex;
    _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;
  //bu şu demek abstract sınıfımızda verdiğimiz inputSliderViewObject teminatını bu satırda initialize ederek gerçekleştirmiş oluyoruz.

  //çıktılar
  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((slideViewObject) => slideViewObject);
  //üst satırda gömülen veriyi yayma işlemi veriyi aldığımız gibi yolluyoruz.
  //ama stream.map((slideViewObject) => slideViewObject) satırı stream.map((slideViewObject) => validate(slideViewObject)) gibi başka bir işlemden geçirilip de yayın yapılabilirdi.
  //tabi o zaman Stream<SlideViewObject> da belirttiğimiz SlideViewObject tipi yerine işlemden sonra hangi tipte veri dönderecekse o şekilde düzeltilmeli.

  //viewmodel'in private fonksiyonları
  List<SliderObject> _getSliderData() => [
        SliderObject(AppStrings.onBoardingTitle1,
            AppStrings.onBoardingSubtitle1, ImageAssets.onboardingLogo1),
        SliderObject(AppStrings.onBoardingTitle2,
            AppStrings.onBoardingSubtitle2, ImageAssets.onboardingLogo2),
        SliderObject(AppStrings.onBoardingTitle3,
            AppStrings.onBoardingSubtitle3, ImageAssets.onboardingLogo3),
        SliderObject(AppStrings.onBoardingTitle4,
            AppStrings.onBoardingSubtitle4, ImageAssets.onboardingLogo4),
      ];

  //view'a veriyi nasıl gönderiyorduk sink tabiki
  _postDataToView() {
    inputSliderViewObject.add(
        SliderViewObject(_list[_currentindex], _list.length, _currentindex));
  }
}

//Viewmodelin View'den alacağı komutlar
abstract class OnBoardingViewModelInputs {
  void goNext(); //sağ oka tıklama veya sola kaydırma işlevi
  void goPrevious(); //sol oka tıklama veya sağa kaydırma işlevi
  void onPageChanged(int newIndex);

  Sink
      get inputSliderViewObject; //bu stream'a veri eklemenin yolu.Stream'a bu şekilde girdi yapıyoruz yayması için.
}

//Viewmodel'in View'a göndereceği veri veya sonuçlar
abstract class OnBoardingViewModelOutputs {
  Stream<SliderViewObject> get outputSliderViewObject;
}

//Bu bizim viewmodel'imizden view'ımıza göndereceğimiz veri yapısı.
class SliderViewObject {
  int currentIndex;
  int numOfSlide;
  SliderObject sliderObject;

  SliderViewObject(
    this.sliderObject,
    this.numOfSlide,
    this.currentIndex,
  );
}
