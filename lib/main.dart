import 'package:exp_country/provider/favourite_provider.dart';
import 'package:exp_country/provider/home_provider.dart';
import 'package:exp_country/screen/home%20screen/home_screen.dart';
import 'package:exp_country/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HomeProvider homeProvider = HomeProvider();
  homeProvider.fecthData();


  runApp(CountryExplore(
    homeProvider: homeProvider,
  ));
}

class CountryExplore extends StatelessWidget {
  const CountryExplore({super.key, required this.homeProvider});

  final HomeProvider homeProvider;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => homeProvider,
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
