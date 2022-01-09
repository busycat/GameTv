import 'package:flutter/material.dart';

class InsightsCard extends StatelessWidget {
  const InsightsCard({Key? key}) : super(key: key);
  static const insightWidth = 100.0;
  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        constraints: BoxConstraints(maxWidth: insightWidth * 3),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getInsightFor('34', 'Tournaments Played', Colors.amber),
              getInsightFor('09', 'Tournaments Won', Colors.purple),
              getInsightFor('26%', 'Winning Percentage', Colors.red)
            ],
          ),
        ),
      ),
    );
  }

  Widget getInsightFor(String kpi, String title, Color color) {
    return Container(
      constraints: BoxConstraints(maxWidth: insightWidth),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [color, color.withAlpha(160)],
        ),
      ),
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            kpi,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
