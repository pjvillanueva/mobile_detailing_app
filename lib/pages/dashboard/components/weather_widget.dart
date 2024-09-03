// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mobile_detailing_app/services/weather_service.dart';
import 'package:mobile_detailing_app/widgets/utils/constants.dart';
import 'package:weather/weather.dart';

class WeatherWidget extends StatefulWidget {
  const WeatherWidget({super.key});

  @override
  State<WeatherWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TodaysWeather(),
        Next5DaysWeather(),
      ],
    );
  }
}

class TodaysWeather extends StatelessWidget {
  const TodaysWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context).colorScheme.surface,
        child: Container(
            height: 120,
            width: 500,
            padding: const EdgeInsets.all(20.0),
            child: FutureBuilder<Weather?>(
                future: getTodaysWeather(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                        child: Column(children: [
                      const Icon(Icons.error_outline_outlined,
                          size: 50, color: Colors.red),
                      Text('${snapshot.error}', overflow: TextOverflow.ellipsis)
                    ]));
                  } else if (snapshot.hasData) {
                    Weather weather = snapshot.data!;
                    var temp =
                        weather.temperature?.fahrenheit?.toStringAsFixed(1) ??
                            '0.0';
                    var maxTemp =
                        weather.tempMax?.fahrenheit?.toStringAsFixed(1) ??
                            '0.0';
                    var minTemp =
                        weather.tempMin?.fahrenheit?.toStringAsFixed(1) ??
                            '0.0';
                    var area = weather.areaName ?? 'Unknown';
                    var description = weather.weatherDescription ?? 'Unknown';
                    var iconCode = weather.weatherIcon ?? '01d';

                    String assetUrl = 'assets/icons/$iconCode.png';
                    return Row(children: [
                      SizedBox(
                          width: 120,
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            Text('$temp°F',
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary,
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold)),
                            Text('H: $maxTemp° L: $minTemp°',
                                style: TextStyle(
                                    fontSize: 12.0,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary)),
                            Text(area,
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis))
                          ])),
                      const Spacer(),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Image.asset(assetUrl, height: 62, width: 62),
                            Row(children: [
                              Text(description,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary)),
                              const SizedBox(width: 10)
                            ])
                          ])
                    ]);
                  } else {
                    return const Center(
                        child: Column(children: [
                      Icon(Icons.error_outline_outlined,
                          size: 50, color: Colors.red),
                      Text('No Data')
                    ]));
                  }
                })));
  }
}

class Next5DaysWeather extends StatelessWidget {
  const Next5DaysWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<WeatherSummaryData>?>(
      future: getNext5DaysWeatherSummary(),
      builder: (context, snapShot) {
        if (snapShot.hasData) {
          List<WeatherSummaryData> weathersSummary = snapShot.data!;
          return Row(
            children: weathersSummary.map((WeatherSummaryData data) {
              var iconCode = data.icon;
              String assetUrl = 'assets/icons/$iconCode.png';
              return Expanded(
                  child: WeatherCard(
                day: data.day,
                tempMax: data.maxTemp,
                tempMin: data.minTemp,
                icon: Image.asset(assetUrl, height: 25, width: 25),
              ));
            }).toList(),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

class WeatherCard extends StatelessWidget {
  final String day;
  final String tempMax;
  final String tempMin;
  final Widget icon;

  const WeatherCard({
    super.key,
    required this.day,
    required this.tempMax,
    required this.tempMin,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(day,
              style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).colorScheme.onSurface)),
          const SizedBox(height: 5),
          icon,
          const SizedBox(height: 5),
          Text(tempMax,
              style: const TextStyle(
                  fontSize: 12,
                  color: Colors.red)),
          Text(tempMin,
              style: const TextStyle(
                  fontSize: 12, color: Colors.blue))
        ]),
      ),
    );
  }
}

Future<Weather?> getTodaysWeather() async {
  try {
    return await WeatherService().weatherFactory.currentWeatherByLocation(
        defaultLatLng.latitude, defaultLatLng.longitude);
  } catch (e) {
    print('[ERROR Getting Weather] - $e');
  }
  return null;
}

Future<List<WeatherSummaryData>> getNext5DaysWeatherSummary() async {
  try {
    List<Weather>? forecast = await WeatherService()
        .weatherFactory
        .fiveDayForecastByLocation(
            defaultLatLng.latitude, defaultLatLng.longitude);

    // ignore: unnecessary_null_comparison
    if (forecast == null) {
      throw Exception('Failed to fetch forecast data');
    }

    Map<String, List<Weather>> weatherListByDate = {};

    for (var weather in forecast) {
      String day = Jiffy.parse(weather.date.toString()).format(pattern: 'EEE');

      if (!weatherListByDate.containsKey(day)) {
        weatherListByDate[day] = [];
      }

      weatherListByDate[day]!.add(weather);
    }

    if (weatherListByDate.isNotEmpty) {
      String firstKey = weatherListByDate.keys.first;
      weatherListByDate.remove(firstKey);
    }

    List<WeatherSummaryData> summaryList = [];

    weatherListByDate.forEach((date, weathers) {
      List<double> maxTempsF = [];
      List<double> minTempsF = [];
      List<String> icons = [];

      for (var weather in weathers) {
        if (weather.tempMax?.fahrenheit != null) {
          maxTempsF.add(weather.tempMax!.fahrenheit!);
        }
        if (weather.tempMin?.fahrenheit != null) {
          minTempsF.add(weather.tempMin!.fahrenheit!);
        }
        if (weather.weatherIcon != null) icons.add(weather.weatherIcon!);
      }

      // Calculate summary data
      double maxTempF = maxTempsF.isNotEmpty
          ? maxTempsF.reduce((a, b) => a > b ? a : b)
          : 0.0;
      double minTempF = minTempsF.isNotEmpty
          ? minTempsF.reduce((a, b) => a < b ? a : b)
          : 0.0;

      String mostFrequentIcon = icons.isNotEmpty
          ? icons
              .fold<Map<String, int>>({}, (map, icon) {
                map[icon] = (map[icon] ?? 0) + 1;
                return map;
              })
              .entries
              .reduce((a, b) => a.value > b.value ? a : b)
              .key
          : '01d';

      // Change last letter from 'n' to 'd' if applicable
      if (mostFrequentIcon.endsWith('n')) {
        mostFrequentIcon =
            '${mostFrequentIcon.substring(0, mostFrequentIcon.length - 1)}d';
      }

      summaryList.add(WeatherSummaryData(
          date,
          '${maxTempF.toStringAsFixed(0)}°F',
          '${minTempF.toStringAsFixed(0)}°F',
          mostFrequentIcon));
    });

    return summaryList;
  } catch (e) {
    print('[ERROR Getting Weather Summary] - $e');
    return [];
  }
}

class WeatherSummaryData {
  String day;
  String maxTemp;
  String minTemp;
  String icon;
  WeatherSummaryData(this.day, this.maxTemp, this.minTemp, this.icon);

  @override
  String toString() {
    return 'Day: $day, Max Temp: $maxTemp°F, Min Temp: $minTemp°F, Icon: $icon';
  }
}
