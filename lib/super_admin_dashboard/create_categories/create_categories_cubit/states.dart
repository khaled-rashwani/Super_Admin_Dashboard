import 'package:flutter/material.dart';

abstract class CreateCategoriesStates {}

class CreateCategoriesInitialState extends CreateCategoriesStates {}

class CreateCategoriesLoadingState extends CreateCategoriesStates {}
class CreateCategoriesSuccessState extends CreateCategoriesStates {}
class CreateCategoriesErrorState extends CreateCategoriesStates {}

class ImageLoadingState extends CreateCategoriesStates {}
class  ImageSuccessState extends CreateCategoriesStates {}
class  ImageErrorState extends CreateCategoriesStates {}

class  ImagePickSuccessState extends CreateCategoriesStates {}



