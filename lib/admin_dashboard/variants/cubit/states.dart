import 'package:flutter/material.dart';

abstract class VariantsStates {}

class VariantsInitialState extends VariantsStates {}

class GetColorLoadingState extends VariantsStates {}
class GetColorSuccessState extends VariantsStates {}
class GetColorErrorState extends VariantsStates {}


class GetSizesLoadingState extends VariantsStates{}
class GetSizesSuccessState extends VariantsStates {}
class GetSizesErrorState extends VariantsStates {}

class GetProductNameSuccessState extends VariantsStates {}
class GetProductNameErrorState extends VariantsStates {}
class GetProductNameLoadingState extends VariantsStates {}

class AddVariantsSuccessState extends VariantsStates {}
class AddVariantsErrorState extends VariantsStates {}
class AddVariantsLoadingState extends VariantsStates {}



class LastVariantsSuccessState extends VariantsStates {}
class LastVariantsErrorState extends VariantsStates {}
class LastVariantsLoadingState extends VariantsStates {}




