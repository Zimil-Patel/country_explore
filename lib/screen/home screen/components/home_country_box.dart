import 'package:exp_country/main.dart';
import 'package:exp_country/provider/home_provider.dart';
import 'package:exp_country/screen/detail%20screen/detail_screen.dart';
import 'package:exp_country/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeCountryBox extends StatelessWidget {
  const HomeCountryBox({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final homeP = context.watch<HomeProvider>();
    final homeF = context.read<HomeProvider>();

    final isFav = homeF.checkIsFav(homeP.coutryLsit[index].name.common);

    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DetailScreen(country: homeP.coutryLsit[index]),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(
            horizontal: defPadding, vertical: defPadding / 2),
        color: secondary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    height: height * 0.10,
                    width: height * 0.10,
                    margin: EdgeInsets.all(defPadding),
                    padding: EdgeInsets.all(defPadding),
                    decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Image.network(homeP.coutryLsit[index].flag.png),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: defPadding / 2, vertical: defPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // TITLE
                        Text(
                          homeP.coutryLsit[index].name.common,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: height * 0.02,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        // capital
                        Row(
                          children: [
                            Text('Capital: '),
                            Text(
                              homeP.coutryLsit[index].capital[0],
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: height * 0.015,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defPadding),
              child: Center(
                child: IconButton(
                  onPressed: () {
                    if (!isFav) {
                      context
                          .read<HomeProvider>()
                          .savePrefernce(homeP.coutryLsit[index]);
                    } else {
                      context
                          .read<HomeProvider>()
                          .removePrefernce(homeP.coutryLsit[index]);
                    }
                  },
                  icon: isFav
                      ? Icon(
                          Icons.favorite_rounded,
                          color: Colors.redAccent,
                        )
                      : Icon(
                          Icons.favorite_border_rounded,
                          color: primary,
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
