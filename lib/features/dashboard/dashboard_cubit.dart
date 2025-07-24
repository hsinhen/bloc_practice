import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardCubit extends Cubit<String> {
  DashboardCubit() : super('Test test') {
    loadData();
  }

  void loadData() {
    emit("Loaded dashboard data at ${DateTime.now()}");
  }
}
