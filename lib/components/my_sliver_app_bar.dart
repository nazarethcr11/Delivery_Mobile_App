import 'package:flutter/material.dart';

import '../pages/cart_page.dart';

class MySliverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;
  const MySliverAppBar({
    super.key,
    required this.child,
    required this.title,
});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      title: Text('Food Dinner'),
      expandedHeight: 300,
      collapsedHeight: 120,
      floating: false,
      pinned: true,
      actions: [
        //cart button
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {
            //go to cart page
            Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage(),),);
          },
        ),
      ],
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      flexibleSpace: FlexibleSpaceBar(
        title: title,
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: child,
        ),
        centerTitle: true,
        titlePadding: const EdgeInsets.only(left: 0, right: 0, top:0),
        expandedTitleScale: 1,
      ),
    );
  }
}
