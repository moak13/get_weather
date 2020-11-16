import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../view_models/wrapper_view_model.dart';
import '../widget/get_index_view.dart';

class WrapperView extends StatelessWidget {
  const WrapperView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WrapperViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: GetIndexView(
          index: model.currentIndex,
        ),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            currentIndex: model.currentIndex,
            onTap: model.setIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.assessment),
                title: Text('Forecast'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text('Search'),
              ),
            ]),
      ),
      viewModelBuilder: () => WrapperViewModel(),
    );
  }
}
