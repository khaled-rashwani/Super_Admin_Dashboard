abstract class AdsStates{

}

class AdsInitialState extends AdsStates{

}

class AdsLoadingState extends AdsStates {}
class  AdsSuccessState extends AdsStates {}
class  AdsErrorState extends AdsStates {}

class deleteAdsLoadingState extends AdsStates {}
class  deleteAdsSuccessState extends AdsStates {}
class  deleteAdsErrorState extends AdsStates {}

class ImageAdsLoadingState extends AdsStates {}
class  ImageAdsSuccessState extends AdsStates {}
class  ImageAdsErrorState extends AdsStates {}