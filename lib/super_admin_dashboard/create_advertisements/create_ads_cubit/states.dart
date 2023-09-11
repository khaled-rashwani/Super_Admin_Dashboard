import 'package:flutter/material.dart';

abstract class CreateAdsStates {}

class CreateAdsInitialState extends CreateAdsStates {}

class CreateAdsLoadingState extends CreateAdsStates {}
class CreateAdsSuccessState extends CreateAdsStates {}
class CreateAdsErrorState extends CreateAdsStates {}

class CreateAdsImageSuccessState extends CreateAdsStates {}
class CreateAdsImageErrorState extends CreateAdsStates {}
class CreateAdsImageLoadingState extends CreateAdsStates {}

class getAdminNameSuccessState extends CreateAdsStates {}
class getAdminNameErrorState extends CreateAdsStates {}
class getAdminNameLoadingState extends CreateAdsStates {}

class AdsImage extends CreateAdsStates {}



