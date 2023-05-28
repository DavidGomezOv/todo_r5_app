import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_r5_app/src/core/base/base_screen.dart';
import 'package:todo_r5_app/src/home/view_model/home_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, viewModel, child) => BaseScreen(
        loading: viewModel.loading,
        baseColor: Colors.white,
        brightnessColor:  Brightness.dark,
        body: const Center(
          child: Text('HomeScreen', style: TextStyle(color: Colors.black)),
        ),
      ),
    );
  }
}
