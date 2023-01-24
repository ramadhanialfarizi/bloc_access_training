import 'package:bloc_access_training/bloc/bloc_state.dart';
import 'package:bloc_access_training/pages/Local_access_bloc_page.dart';
import 'package:bloc_access_training/pages/anonymous_access_pages.dart';
import 'package:bloc_access_training/pages/widget/number_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Counter myCounter = Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Access'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const NumberWidget(),

          // LOCAL ACCESS
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const OtherPage();
                  },
                ),
              );
            },
            child: const Text('Local Access'),
          ),

          // ANONYMOUS ROUTE ACCESS
          ElevatedButton(
            onPressed: () {
              // Anonymous Route Access
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return BlocProvider.value(
                      value: myCounter,
                      child: const AnonymousAccessPages(),
                    );
                  },
                ),
              );
            },
            child: const Text('Anonymous Route Access'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /*
           untuk mengambil data dari state management bloc bisa menggunakan :
           - context.read<Counter>();
           - BlocProvider.of<Counter>(context);
           */

          // bisa begini
          context.read<Counter>().increment();

          // atau bisa begini
          //BlocProvider.of<Counter>(context).increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), //
    );
  }
}
