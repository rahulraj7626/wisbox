import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

///
/// Created by Sunil Kumar (sunil@smarttersstudio.com)
/// On 28-12-2021 04:29 PM
///
class VendorAnalyticsPage extends StatefulWidget {
  const VendorAnalyticsPage({Key? key}) : super(key: key);

  @override
  _VendorAnalyticsPageState createState() => _VendorAnalyticsPageState();
}

class _VendorAnalyticsPageState extends State<VendorAnalyticsPage> {
  int _selectedIndex = 1;
  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const titleTextStyle = TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w700,
    );
    const subTitleTextStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(color: theme.primaryColor),
        actionsIconTheme: IconThemeData(color: theme.primaryColor),
        title: Text(
          "Analytics",
          style:
              TextStyle(color: theme.primaryColor, fontWeight: FontWeight.w500),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                ActionChip(
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 1;
                    });
                  },
                  label: Text("Growth Rate"),
                  side: _selectedIndex == 1
                      ? BorderSide.none
                      : const BorderSide(width: 1.2),
                  labelStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: _selectedIndex == 1 ? Colors.white : Colors.black),
                  backgroundColor:
                      _selectedIndex == 1 ? Colors.deepPurple : Colors.white,
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                ),
                const SizedBox(width: 16),
                ActionChip(
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 2;
                    });
                  },
                  side: _selectedIndex == 2
                      ? BorderSide.none
                      : const BorderSide(width: 1.2),
                  label: const Text("Shop's Statistics"),
                  labelStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: _selectedIndex == 2 ? Colors.white : Colors.black),
                  backgroundColor:
                      _selectedIndex == 2 ? Colors.deepPurple : Colors.white,
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                ),
              ],
            ),
          ),
          ColoredBox(
            color: const Color(0xffEAE8FF),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        "Number of people visited",
                        style: subTitleTextStyle,
                      )),
                      Text(
                        "56",
                        style: titleTextStyle,
                      )
                    ],
                  ),
                ),
                AspectRatio(
                  aspectRatio: 1.3,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: AspectRatio(
                          aspectRatio: 1.3,
                          child: PieChart(
                            PieChartData(
                                pieTouchData: PieTouchData(touchCallback:
                                    (FlTouchEvent event, pieTouchResponse) {
                                  setState(() {
                                    if (!event.isInterestedForInteractions ||
                                        pieTouchResponse == null ||
                                        pieTouchResponse.touchedSection ==
                                            null) {
                                      touchedIndex = -1;
                                      return;
                                    }
                                    touchedIndex = pieTouchResponse
                                        .touchedSection!.touchedSectionIndex;
                                  });
                                }),
                                borderData: FlBorderData(
                                  show: false,
                                ),
                                sectionsSpace: 0,
                                centerSpaceRadius: 54,
                                sections: List.generate(4, (i) {
                                  final isTouched = i == touchedIndex;
                                  final radius = isTouched ? 40.0 : 30.0;
                                  switch (i) {
                                    case 0:
                                      return PieChartSectionData(
                                        color: const Color(0xff0293ee),
                                        value: 40,
                                        showTitle: false,
                                        radius: radius,
                                      );
                                    case 1:
                                      return PieChartSectionData(
                                        color: const Color(0xfff8b250),
                                        value: 30,
                                        showTitle: false,
                                        radius: radius,
                                      );
                                    case 2:
                                      return PieChartSectionData(
                                        color: const Color(0xff845bef),
                                        value: 15,
                                        showTitle: false,
                                        radius: radius,
                                      );
                                    case 3:
                                      return PieChartSectionData(
                                        color: const Color(0xff13d38e),
                                        value: 15,
                                        showTitle: false,
                                        radius: radius,
                                      );
                                    default:
                                      throw Error();
                                  }
                                })),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const <Widget>[
                          Indicator(
                            color: Color(0xff0293ee),
                            text: 'First',
                            isSquare: true,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Indicator(
                            color: Color(0xfff8b250),
                            text: 'Second',
                            isSquare: true,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Indicator(
                            color: Color(0xff845bef),
                            text: 'Third',
                            isSquare: true,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Indicator(
                            color: Color(0xff13d38e),
                            text: 'Fourth',
                            isSquare: true,
                          ),
                          SizedBox(height: 18),
                        ],
                      ),
                      const SizedBox(
                        width: 28,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final Color color;
  final String text;
  final bool isSquare;
  final double size;
  final Color textColor;

  const Indicator({
    Key? key,
    required this.color,
    required this.text,
    required this.isSquare,
    this.size = 16,
    this.textColor = const Color(0xff505050),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
        )
      ],
    );
  }
}
