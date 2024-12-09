import 'package:exp_country/model/country_model.dart';
import 'package:exp_country/provider/home_provider.dart';
import 'package:exp_country/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.country});
  final CountryModel country;

  @override
  Widget build(BuildContext context) {
    final homeF = context.read<HomeProvider>();

    final isFav = context.watch<HomeProvider>().checkIsFav(country.name.common);

    return Scaffold(
      backgroundColor: fourth,
      appBar: AppBar(
        title: Text(
          country.name.common,
          style: TextStyle(
            fontSize: height * 0.03,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defPadding),
            child: Center(
              child: IconButton(
                onPressed: () {
                  if (!isFav) {
                    context.read<HomeProvider>().savePrefernce(country);
                  } else {
                    context.read<HomeProvider>().removePrefernce(country);
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: defPadding * 2),
                child: SizedBox(
                  height: height * 0.2,
                  width: height * 0.4,
                  child: Image.network(
                    country.flag.png,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            // NAME
            LabelValueRow(
              lable: "Official name",
              value: country.name.official,
            ),

            LabelValueRow(
              lable: "Capital",
              value: country.capital[0],
            ),

            LabelValueRow(
              lable: "Independent",
              value: country.independent ? "Yes" : "No",
            ),

            LabelValueRow(
              lable: "Region",
              value: country.region,
            ),

            LabelValueRow(
              lable: "AltSpellings",
              value: country.altSpellings.toString(),
            ),

            LabelValueRow(
              lable: "Lat Lng",
              value: country.latlng.toString(),
            ),

            LabelValueRow(
              lable: "Population",
              value: country.population.toString(),
            ),

            LabelValueRow(
              lable: "Stat of Week",
              value: country.startOfWeek.toString(),
            ),
          ],
        ),
      ),
    );
  }
}

class LabelValueRow extends StatelessWidget {
  const LabelValueRow({
    super.key,
    required this.lable,
    required this.value,
  });

  final String lable, value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: defPadding, horizontal: defPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$lable : ",
            style: TextStyle(
              fontSize: height * 0.022,
              fontWeight: FontWeight.w700,
            ),
          ),
          Expanded(
            child: Text(
              value,
              softWrap: true,
              style: TextStyle(
                fontSize: height * 0.022,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
