import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';



class Graph extends StatefulWidget {
  const Graph({Key? key}) : super(key: key);

  @override
  State<Graph> createState() => _GraphState();
}

class _GraphState extends State<Graph> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardCubit, DashboardStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = DashboardCubit.get(context);
        return PieChart(PieChartData(
          borderData: FlBorderData(show: false),
          sectionsSpace: 0,
          //centerSpaceRadius: 40,
          sections: cubit.getGraphSections(),
        ));
      },
    );
  }
}

class GraphInfo extends StatefulWidget {
  const GraphInfo({Key? key}) : super(key: key);

  @override
  State<GraphInfo> createState() => _GraphInfoState();
}

class _GraphInfoState extends State<GraphInfo> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardCubit, DashboardStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = DashboardCubit.get(context);
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: cubit.GraphData.map((e) => Container(
                child: GraphInfoDesign(color: e.color, text: e.name , percent: e.percent.toString()),
              )).toList(),
        );
      },
    );
  }



  Widget GraphInfoDesign({
    required Color color,
    required String text,
    required String percent
  }) =>
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 200,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border:Border.all(color: Colors.white60),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 20),
              Text(
                "${percent}%",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      );
}
