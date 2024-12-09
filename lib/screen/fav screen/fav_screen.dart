import 'package:exp_country/provider/home_provider.dart';
import 'package:exp_country/screen/fav%20screen/components/fav_box.dart';
import 'package:exp_country/screen/home%20screen/components/home_country_box.dart';
import 'package:exp_country/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeP = context.watch<HomeProvider>();

    return Scaffold(
      backgroundColor: fourth,
      appBar: AppBar(
        backgroundColor: primary,
        elevation: 2,
        shadowColor: Colors.black38,
        title: Text(
          'Favourite Country',
          style: TextStyle(
            fontSize: height * 0.03,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: homeP.coutryLsit.isNotEmpty
          ? ListView.builder(
              shrinkWrap: true,
              itemCount: homeP.favCountryModelList.length,
              itemBuilder: (context, index) => FavCountryBox(index: index),
            )
          : const Center(
              child: Text("No Favourties"),
            ),
    );
  }
}
