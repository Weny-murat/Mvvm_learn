import 'package:mvvm_learn/presentation/base/baseviewmodel.dart';

class OnBoardingViewModel extends BaseViewModel with OnBoardingViewModelInputs,OnBoardingViewModelOutputs{
  //girdiler
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void start() {
    // TODO: implement start
  }
  
  @override
  void goNext() {
    // TODO: implement goNext
  }
  
  @override
  void goPrevious() {
    // TODO: implement goPrevious
  }
  
  @override
  void onPageChanged(int index) {
    // TODO: implement onPageChanged
  }
}

//Viewmodelin View'den alacağı komutlar
abstract class OnBoardingViewModelInputs {
  void goNext(); //sağ oka tıklama veya sola kaydırma işlevi
  void goPrevious(); //sol oka tıklama veya sağa kaydırma işlevi
  void onPageChanged(int index);
}

//Viewmodel'in View'a göndereceği veri veya sonuçlar
abstract class OnBoardingViewModelOutputs {
  //daha sonra eklenecek.
}
