import 'package:flutter/material.dart';
import 'package:provider_test/Shopping_cart/views/color.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(Icons.shopify_sharp, color: MyColors.primary,size: 40,),
        Text('...', style: TextStyle(color: MyColors.primary, fontSize: 20),),
      ],
    );
  }
}