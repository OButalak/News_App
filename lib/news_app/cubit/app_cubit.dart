
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/news_app/cubit/states.dart';


class App_Cubit extends Cubit<NewsStates> {
  App_Cubit() : super(AppInitialState());
  static App_Cubit get(context) => BlocProvider.of(context);
  bool isdark = true;

  void changeThemeMode() {
    isdark = !isdark;
    emit(AppChangeThemeModeState());
  }
}
