import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/news_app/cubit/cubit.dart';
import 'package:news/news_app/cubit/states.dart';


import '../reused_compoents.dart';

class ScienceScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var list = AppCubit.get(context).science;
        return articleBuilder(list,context);
      },
    );
  }
}

