import 'package:flutter/material.dart';
import 'package:loan_app/screens/widgets/body_section.dart';
import 'package:loan_app/screens/widgets/header_section.dart';
import 'package:loan_app/screens/widgets/offer_section.dart';
import 'package:loan_app/screens/widgets/sort_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Expanded(
            flex: 1,
            child: HeaderSection(),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                const Expanded(
                  flex: 2,
                  child: SortSection(),
                ),
                Expanded(
                  flex: 5,
                  child: BodySection(),
                ),
                Expanded(
                  flex: 2,
                  child: OfferSection(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
