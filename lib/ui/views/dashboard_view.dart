import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        // shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: [
          Text('Dashboard view', style: CustomLabels.h1),
          SizedBox(height: 10),
          WhiteCard(title: 'Sale statistics', child: Text('Hola mundo')),
        ],
      ),
    );
  }
}
