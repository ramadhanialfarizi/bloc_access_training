import 'package:bloc/bloc.dart';

class Counter extends Cubit<int> {
  int init;

  Counter({this.init = 0}) : super(init);

  void increment() {
    emit(state + 1);
  }

  @override
  void onChange(Change<int> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }
}
