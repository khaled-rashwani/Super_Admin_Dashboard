import 'package:flutter/material.dart';

abstract class CreateAdminStates {}

class CreateAdminInitialState extends CreateAdminStates {}

class CreateAdminLoadingState extends CreateAdminStates {}
class CreateAdminSuccessState extends CreateAdminStates {}
class CreateAdminErrorState extends CreateAdminStates {}

class CreateAdminImageLoadingState extends CreateAdminStates {}
class  CreateAdminImageSuccessState extends CreateAdminStates {}
class  CreateAdminImageErrorState extends CreateAdminStates {}

class  GetImageCreateAdminSuccessState extends CreateAdminStates {}



