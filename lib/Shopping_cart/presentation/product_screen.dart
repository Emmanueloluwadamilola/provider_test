import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/Shopping_cart/manager/shopping_provider.dart';
import 'package:provider_test/Shopping_cart/presentation/cart_screen.dart';
import 'package:provider_test/Shopping_cart/views/color.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<String> products = [
    'bag',
    'shirt',
    'pen',
    'shoe',
    'food',
    'glass',
    'phone'
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<ShoppingProvider>(
      builder: (BuildContext context, provider, _) {
        return Scaffold(
          backgroundColor: MyColors.white,
          appBar: AppBar(
            title: Text('Welcome ${provider.state.name}'),
          ),
          body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          products[index],
                          style: const TextStyle(
                              fontSize: 18, color: Colors.white),
                        ),
                        trailing: InkWell(
                          child: const Text(
                            'ADD',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          onTap: () {
                            provider.addItem(products[index]);
                          },
                        ),
                        tileColor: Colors.blue,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Gap(10);
                    },
                    itemCount: products.length)),
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CartScreen()));
            },
            label: const Text('Cart'),
            icon: const Icon(Icons.arrow_forward_ios_outlined),
          ),
        );
      },
    );
  }
}
