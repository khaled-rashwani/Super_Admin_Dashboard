import 'package:flutter/material.dart';

abstract class CreateSubCategoriesStates {}

class CreateSubCategoriesInitialState extends CreateSubCategoriesStates {}

class CreateSubCategoriesLoadingState extends CreateSubCategoriesStates {}
class CreateSubCategoriesSuccessState extends CreateSubCategoriesStates {}
class CreateSubCategoriesErrorState extends CreateSubCategoriesStates {}

class CreateSubCategoriesImageSuccessState extends CreateSubCategoriesStates {}
class CreateSubCategoriesImageErrorState extends CreateSubCategoriesStates {}
class CreateSubCategoriesImageLoadingState extends CreateSubCategoriesStates {}

class getCategoriesNameSuccessState extends CreateSubCategoriesStates {}
class getCategoriesNameErrorState extends CreateSubCategoriesStates {}
class getCategoriesNameLoadingState extends CreateSubCategoriesStates {}

class ImageSubCategory extends CreateSubCategoriesStates {}



