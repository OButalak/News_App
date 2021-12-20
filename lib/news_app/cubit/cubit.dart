import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/news_app/cubit/states.dart';
import 'package:news/news_app/dio_helper.dart';
import 'package:news/news_app/screenes/business_screen.dart';
import 'package:news/news_app/screenes/science_screen.dart';
import 'package:news/news_app/screenes/sport_screen.dart';



class AppCubit extends Cubit<NewsStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.business,
        ),
        label: 'business'
    ),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.sports,
        ),
        label: 'sports'
    ),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.science,
        ),
        label: 'science'
    ),
  ];
  List<Widget> screens = [
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),
  ];

  void changeBottomNavBar(index) {
    currentIndex = index;
    if (index == 1)
      getSports();
    else if (index == 2)
      getScience();
    emit(AppChangeBottomNavBarState());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(url: 'v2/top-headlines',
      query:
      {
        'country': 'us',
        'category': 'business',
        'apiKey': '84f3700ef9284bb0881759069383fed6'
      },).then((value) {
      //print(value.data['articles'][0]['title']);
      business = value.data['articles'];
      print(business[0]['title']);

      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(NewsGetSportsLoadingState());

    if (sports.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country': 'us',
          'category': 'sport',
          'apiKey': '84f3700ef9284bb0881759069383fed6'
        },
      ).then((value) {
        //print(value.data['articles'][0]['title']);
        sports = value.data['articles'];
        print(sports[0]['title']);

        emit(NewsGetSportsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));
      });
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }

  List<dynamic> science = [];

  void getScience() {
    emit(NewsGetScienceLoadingState());

    if (science.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country': 'us',
          'category': 'science',
          'apiKey': '84f3700ef9284bb0881759069383fed6'
        },
      ).then((value) {
        //print(value.data['articles'][0]['title']);
        science = value.data['articles'];
        print(science[0]['title']);

        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }


  //**********************************

}