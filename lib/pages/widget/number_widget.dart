import 'package:bloc_access_training/bloc/bloc_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NumberWidget extends StatelessWidget {
  const NumberWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: context.read<Counter>(),
      builder: (context, state) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "$state",
                style: Theme.of(context).textTheme.headline4,
              ),
              const SizedBox(
                height: 22,
              ),
            ],
          ),
        );
      },
    );
  }
}
