import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/news_app/cubit/cubit.dart';

import 'cubit/app_cubit.dart';
import 'cubit/states.dart';

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getBusiness(),
      child: BlocConsumer<AppCubit, NewsStates>(
          listener: (context, stats) => {},
          builder: (context, stats) {
            var cubit = AppCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  'News App',
                ),
                actions: [
                  // IconButton(
                  //     onPressed: () {},
                  //     icon: Icon(
                  //       Icons.search,
                  //     )),
                  IconButton(
                      onPressed: () {
                        App_Cubit.get(context).changeThemeMode();
                      },
                      icon: Icon(
                        Icons.dark_mode_rounded,
                      ))
                ],
              ),
              body: cubit.screens[cubit.currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                  items: cubit.bottomItems,
                  currentIndex: cubit.currentIndex,
                  onTap: (index) {
                    cubit.changeBottomNavBar(index);
                  }),
              // drawer: Drawer(
              //   child: ListView(
              //     children: [
              //       Container(
              //         height: 60.0,
              //         child: Expanded(
              //           child: const DrawerHeader(
              //             decoration: BoxDecoration(
              //               color: Colors.deepOrange,
              //             ),
              //             child: Text('Drawer Header',
              //             style: TextStyle(
              //               fontSize: 20.0,
              //               fontWeight: FontWeight.bold,
              //             ),),
              //           ),
              //         ),
              //       ),
              //       ListTile(
              //         title: const Text('language'),
              //         onTap: () {
              //           Navigator.pop(context);
              //         },
              //       ),
              //       ListTile(
              //         title: const Text('dark mode'),
              //         onTap: () {
              //
              //           Navigator.pop(context);
              //         },
              //       ),
              //     ],
              //   ),
              // ),
            );
          }),
    );
  }
}
