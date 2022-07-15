abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutputs {
  //bütün viewmodeller için ortak olan değişken ve fonksiyonlar için kullanılacak
}

abstract class BaseViewModelInputs {
  void start();
  void dispose();
}

abstract class BaseViewModelOutputs {}
