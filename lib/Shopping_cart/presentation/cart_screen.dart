import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/Shopping_cart/manager/shopping_provider.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ShoppingProvider>(
      builder: (BuildContext context, provider, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Cart Screen'),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: provider.state.myItems.isEmpty
                  ? const Center(
                      child: Text(
                        'No Item Added yet',
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  : ListView.separated(
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            provider.state.myItems[index],
                            style: const TextStyle(
                                fontSize: 18, color: Colors.white),
                          ),
                          tileColor: Colors.blue,
                          trailing: InkWell(
                            child: const Text(
                              'REMOVE',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            onTap: () {
                              setState(() {
                                provider
                                    .removeItem(provider.state.myItems[index]);
                              });
                            },
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Gap(10);
                      },
                      itemCount: provider.state.myItems.length),
            ),
          ),
        );
      },
    );
  }
}
