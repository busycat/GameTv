import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const route = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            expandedHeight: 200,
            actions: const [Text('Action')],
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(50),
              child: Text('Recommended to you'),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate.fixed([
              Container(
                padding: EdgeInsets.all(50),
                child: Text('Hello'),
              )
            ]),
          )
        ],
      ),
    );
  }
}
