abstract class AppStates{}

class AppInitialState extends AppStates{}

class AppLoadingHomeDataState extends AppStates{}

class AppSuccessHomeDataState extends AppStates{}

class AppErrorHomeDataState extends AppStates{
  final String error;
  AppErrorHomeDataState(this.error);
}

class AppLoadingProductDataState extends AppStates{}

class AppSuccessProductDataState extends AppStates{}

class AppErrorProductDataState extends AppStates{
  final String error;
  AppErrorProductDataState(this.error);
}
