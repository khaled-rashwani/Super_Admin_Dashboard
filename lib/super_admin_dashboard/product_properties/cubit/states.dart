import 'package:flutter/material.dart';

abstract class ProductPropertiesStates {}

class ProductPropertiesInitialState extends ProductPropertiesStates {}

class CreateColorLoadingState extends ProductPropertiesStates {}
class CreateColorSuccessState extends ProductPropertiesStates {}
class CreateColorErrorState extends ProductPropertiesStates {}

class CreateTypeSuccessState extends ProductPropertiesStates {}
class CreateTypeErrorState extends ProductPropertiesStates {}
class CreateTypeLoadingState extends ProductPropertiesStates {}

class CreateSizeSuccessState extends ProductPropertiesStates {}
class CreateSizeErrorState extends ProductPropertiesStates {}
class CreateSizeLoadingState extends ProductPropertiesStates {}

class GetTypeNameSuccessState extends ProductPropertiesStates {}
class GetTypeNameErrorState extends ProductPropertiesStates {}
class GetTypeNameLoadingState extends ProductPropertiesStates {}

// class CreateShoesSizeSuccessState extends ProductPropertiesStates {}
// class CreateShoesSizeErrorState extends ProductPropertiesStates {}
// class CreateShoesSizeLoadingState extends ProductPropertiesStates {}



