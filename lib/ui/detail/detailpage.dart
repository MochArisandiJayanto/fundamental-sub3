import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/restaurant_detail_provider.dart';
import './detail_item.dart';

class DetailPage extends StatefulWidget {
  static const route = '/detail_page';
  final String? id;
  const DetailPage({required this.id});

  @override
  _DetailPage createState() => _DetailPage();
}

class _DetailPage extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RestaurantDetailProvider>(
      create: (_) => RestaurantDetailProvider(context, id: widget.id),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Restaurant Detail"),
          backgroundColor: Colors.teal,
        ),
        body: SingleChildScrollView(
          child: Consumer<RestaurantDetailProvider>(
            builder: (context, state, _) {
              if (state.state == ResultState.loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.state == ResultState.hasData) {
                return const DetailItem();
              } else if (state.state == ResultState.noData) {
                return Center(
                  child: Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height,
                    child:
                        const Text("No Result", style: TextStyle(fontSize: 18)),
                  ),
                );
              } else {
                return Center(
                  child: Container(
                    child: Wrap(children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 550,
                            width: 500,
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/noInternet.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
