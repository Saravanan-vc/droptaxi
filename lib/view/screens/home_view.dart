import 'package:droptaxi/view/widget/home_widget/body_widget.dart';
import 'package:droptaxi/view/widget/home_widget/nav_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: NavWidget(),
      drawer: AppDrawer(),
      body: BodyWidget(),
    );
  }
}
