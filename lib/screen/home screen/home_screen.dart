import 'package:exp_country/provider/home_provider.dart';
import 'package:exp_country/screen/fav%20screen/fav_screen.dart';
import 'package:exp_country/screen/home%20screen/components/home_country_box.dart';
import 'package:exp_country/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeP = context.watch<HomeProvider>();

    return Scaffold(
      backgroundColor: fourth,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const FavScreen()));
            },
            icon: Icon(Icons.book),
          ),
        ],
        backgroundColor: primary,
        elevation: 2,
        shadowColor: Colors.black38,
        title: Text(
          'Country Explore',
          style: TextStyle(
            fontSize: height * 0.03,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: homeP.coutryLsit.isNotEmpty
          ? ListView.builder(
              shrinkWrap: true,
              itemCount: homeP.coutryLsit.length,
              itemBuilder: (context, index) => HomeCountryBox(index: index),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
