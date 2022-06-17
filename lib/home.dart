import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const uvIndex = 71.0;
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.grey.shade100,
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _header(),
                const SizedBox(
                  height: 40,
                ),
                _uvIndexIndicator(uvIndex),
                const SizedBox(
                  height: 20,
                ),
                _uvIndexAlert(uvIndex),
                const SizedBox(
                  height: 20,
                ),
                _sunburn(uvIndex),
                const SizedBox(
                  height: 20,
                ),
                _peakUVIndex(uvIndex),
                const SizedBox(
                  height: 20,
                ),
                _sunscreenReminder()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Morning, Sitharaj!",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        Row(
          children: [
            Icon(
              Icons.location_on_rounded,
              color: Colors.blue.shade500,
            ),
            const SizedBox(
              width: 8,
            ),
            const Text(
              "Chennai",
              style: TextStyle(fontWeight: FontWeight.w600),
            )
          ],
        )
      ],
    );
  }

  Widget _uvIndexIndicator(double index) {
    final size = Get.width * 0.6;
    final changeUVIndexFactor = index / 10.0;
    return Stack(
      children: [
        SizedBox(
          width: size,
          height: size,
          child: CircularPercentIndicator(
            circularStrokeCap: CircularStrokeCap.round,
            radius: size / 2,
            center: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$changeUVIndexFactor",
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                ),
                const Text(
                  "UV Index",
                  style: TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w500, height: 1.5),
                )
              ],
            ),
            percent: index / 100,
            lineWidth: 25,
            backgroundColor: Colors.grey.shade200,
            progressColor: _getColorBasedOnUVIndex(index),
          ),
        ),
      ],
    );
  }

  Widget _uvIndexAlert(double index) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _getUVAlertMessage(index),
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              decoration: BoxDecoration(
                  color: _getColorBasedOnUVIndex(index),
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                "${index / 10}",
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 17),
              ),
            )
          ],
        ),
      ),
    );
  }

  String _getUVAlertMessage(double index) {
    String msg = "Low UV Index";
    if (index >= 35 && index < 70) {
      msg = "High UV Index";
    } else if (index >= 70) {
      msg = "Very High UV Index";
    }
    return msg;
  }

  Color _getColorBasedOnUVIndex(double index) {
    Color color = Colors.green.shade700;
    if (index >= 35 && index < 70) {
      color = Colors.yellow.shade700;
    } else if (index >= 70) {
      color = Colors.orange.shade700;
    }
    return color;
  }

  Widget _sunburn(double index) {
    final width = Get.width / 2.4;
    return Container(
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              width: width,
              height: width / 1.8,
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.access_time_filled_sharp,
                        color: Colors.red,
                        size: 19,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        "60 min",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  const Text(
                    "Time to sun burn",
                    style: TextStyle(fontSize: 11, color: Colors.grey),
                  )
                ],
              ),
            ),
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: SizedBox(
              width: width,
              height: width / 1.8,
              child: const Center(
                child: Text(
                  "50 SPF",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _peakUVIndex(double index) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      "2:00",
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 6),
                      child: Text(
                        "PM",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                const Text(
                  "Peak UV hour",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
                )
              ],
            ),
            Icon(
              Icons.light_mode,
              color: Colors.yellow.shade700,
              size: 50,
            )
          ],
        ),
      ),
    );
  }

  Widget _sunscreenReminder() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 8, 10, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Sunscreen reminder",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            CupertinoSwitch(value: false, onChanged: (value) {}),
          ],
        ),
      ),
    );
  }
}
