import 'package:flutter/material.dart';

abstract class CreateProductStates {}

class CreateProductInitialState extends CreateProductStates {}

// class CreateProductButtonLoadingState extends CreateProductStates {}
// class CreateProductButtonSuccessState extends CreateProductStates {}
// class CreateProductButtonErrorState extends CreateProductStates {}

class GetColorsLoadingState extends CreateProductStates {}
class GetColorsSuccessState extends CreateProductStates {}
class GetColorsErrorState extends CreateProductStates {}

class CreateProductLoadingState extends CreateProductStates {}
class CreateProductSuccessState extends CreateProductStates {}
class CreateProductErrorState extends CreateProductStates {}



class GetSizesLoadingState extends CreateProductStates {}
class GetSizesSuccessState extends CreateProductStates {}
class GetSizesErrorState extends CreateProductStates {}

class GetCategoryNameLoadingState extends CreateProductStates {}
class GetCategoryNameSuccessState extends CreateProductStates {}
class GetCategoryNameErrorState extends CreateProductStates {}


class LastLoadingState extends CreateProductStates {}
class LastSuccessState extends CreateProductStates {}
class LastErrorState extends CreateProductStates {}

class ImagePickSuccessState extends CreateProductStates {}









