import 'package:flutter/material.dart';

abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class LoginLoadingState extends AuthStates {}
class LoginSuccessState extends AuthStates {}
class LoginErrorState extends AuthStates {}

class LogoutLoadingState extends AuthStates {}
class LogoutSuccessState extends AuthStates {}
class LogoutErrorState extends AuthStates {}

class SuperAdminLogoutLoadingState extends AuthStates {}
class SuperAdminLogoutSuccessState extends AuthStates {}
class SuperAdminLogoutErrorState extends AuthStates {}


class ChangePasswordVisibilityState extends AuthStates {}



class RegisterLoadingState extends AuthStates {}
class RegisterSuccessState extends AuthStates {}
class RegisterErrorState extends AuthStates {}

class ProfileImageSelectedSuccessState extends AuthStates {}
class ProfileImageSelectedErrorState extends AuthStates {}
class ProfileImageSelectedLoadingState extends AuthStates {}