// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:my_portfolio/constants/consts.dart';
// import 'package:weather/weather.dart';
// class WeatherPage extends StatefulWidget {
//   const WeatherPage({super.key});

//   @override
//   State<WeatherPage> createState() => _WeatherPageState();
// }

// class _WeatherPageState extends State<WeatherPage> {
//   final WeatherFactory _wf = WeatherFactory(OPENWEATHER_API_KEY);

//   Weather? _weather;

//   @override
//   void initState() {
//     super.initState();
//     _wf.currentWeatherByCityName("Dhaka").then((w) {
//       setState(() {
//         _weather = w;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _buildUI(),
//     );
//   }

//   Widget _buildUI() {
//     if (_weather == null) {
//       return const Center(
//         child: CircularProgressIndicator(),
//       );
//     }
//     return SizedBox(
//       width: MediaQuery.sizeOf(context).width,
//       height: MediaQuery.sizeOf(context).height,
//       child: Column(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           _locationHeader(),
//           SizedBox(
//             height: MediaQuery.sizeOf(context).height * 0.08,
//           ),
//           _dateTimeInfo(),
//           SizedBox(
//             height: MediaQuery.sizeOf(context).height * 0.05,
//           ),
//           _weatherIcon(),
//           SizedBox(
//             height: MediaQuery.sizeOf(context).height * 0.02,
//           ),
//           _currentTemp(),
//           SizedBox(
//             height: MediaQuery.sizeOf(context).height * 0.02,
//           ),
//           _extraInfo(),
//         ],
//       ),
//     );
//   }

//   Widget _locationHeader() {
//     return Text(
//       _weather?.areaName ?? "",
//       style: const TextStyle(
//         fontSize: 20,
//         fontWeight: FontWeight.w500,
//       ),
//     );
//   }

//   Widget _dateTimeInfo() {
//     DateTime now = _weather!.date!;
//     return Column(
//       children: [
//         Text(
//           DateFormat("h:mm a").format(now),
//           style: const TextStyle(
//             fontSize: 35,
//           ),
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         Row(
//           mainAxisSize: MainAxisSize.max,
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text(
//               DateFormat("EEEE").format(now),
//               style: const TextStyle(
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//             Text(
//               "  ${DateFormat("d.m.y").format(now)}",
//               style: const TextStyle(
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _weatherIcon() {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Container(
//           height: MediaQuery.sizeOf(context).height * 0.20,
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: NetworkImage(
//                   "http://openweathermap.org/img/wn/${_weather?.weatherIcon}@4x.png"),
//             ),
//           ),
//         ),
//         Text(
//           _weather?.weatherDescription ?? "",
//           style: const TextStyle(
//             color: Color.fromARGB(255, 205, 201, 201),
//             fontSize: 20,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _currentTemp() {
//     return Text(
//       "${_weather?.temperature?.celsius?.toStringAsFixed(0)}° C",
//       style: const TextStyle(
//         color: Color.fromARGB(255, 184, 38, 38),
//         fontSize: 90,
//         fontWeight: FontWeight.w500,
//       ),
//     );
//   }

//   Widget _extraInfo() {
//     return Container(
//       height: MediaQuery.sizeOf(context).height * 0.15,
//       width: MediaQuery.sizeOf(context).width * 0.80,
//       decoration: BoxDecoration(
//         color: Colors.deepPurpleAccent,
//         borderRadius: BorderRadius.circular(
//           20,
//         ),
//       ),
//       padding: const EdgeInsets.all(
//         8.0,
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Row(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(
//                 "Max: ${_weather?.tempMax?.celsius?.toStringAsFixed(0)}° C",
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 15,
//                 ),
//               ),
//               Text(
//                 "Min: ${_weather?.tempMin?.celsius?.toStringAsFixed(0)}° C",
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 15,
//                 ),
//               )
//             ],
//           ),
//           Row(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(
//                 "Wind: ${_weather?.windSpeed?.toStringAsFixed(0)}m/s",
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 15,
//                 ),
//               ),
//               Text(
//                 "Humidity: ${_weather?.humidity?.toStringAsFixed(0)}%",
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 15,
//                 ),
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_portfolio/constants/consts.dart';
import 'package:weather/weather.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final WeatherFactory _wf = WeatherFactory(OPENWEATHER_API_KEY);

  Weather? _weather;
  List<Weather>? _forecast;

  @override
  void initState() {
    super.initState();
    _fetchWeatherData();
  }

  Future<void> _fetchWeatherData() async {
    Weather currentWeather = await _wf.currentWeatherByCityName("Dhaka");
    List<Weather> forecast = await _wf.fiveDayForecastByCityName("Dhaka");
    setState(() {
      _weather = currentWeather;
      _forecast = forecast;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    if (_weather == null || _forecast == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _locationHeader(),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.08,
            ),
            _dateTimeInfo(),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.05,
            ),
            _weatherIcon(),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.02,
            ),
            _currentTemp(),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.02,
            ),
            _extraInfo(),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.02,
            ),
            _forecastCards(),
          ],
        ),
      ),
    );
  }

  Widget _locationHeader() {
    return Text(
      _weather?.areaName ?? "",
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _dateTimeInfo() {
    DateTime now = _weather!.date!;
    return Column(
      children: [
        Text(
          DateFormat("h:mm a").format(now),
          style: const TextStyle(
            fontSize: 35,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              DateFormat("EEEE").format(now),
              style: const TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "  ${DateFormat("d.M.y").format(now)}",
              style: const TextStyle(
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _weatherIcon() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height * 0.20,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "http://openweathermap.org/img/wn/${_weather?.weatherIcon}@4x.png"),
            ),
          ),
        ),
        Text(
          _weather?.weatherDescription ?? "",
          style: const TextStyle(
            color: Color.fromARGB(255, 205, 201, 201),
            fontSize: 20,
          ),
        ),
      ],
    );
  }

  Widget _currentTemp() {
    return Text(
      "${_weather?.temperature?.celsius?.toStringAsFixed(0)}° C",
      style: const TextStyle(
        color: Color.fromARGB(255, 184, 38, 38),
        fontSize: 90,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _extraInfo() {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.15,
      width: MediaQuery.sizeOf(context).width * 0.80,
      decoration: BoxDecoration(
        color: Colors.deepPurpleAccent,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Max: ${_weather?.tempMax?.celsius?.toStringAsFixed(0)}° C",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              Text(
                "Min: ${_weather?.tempMin?.celsius?.toStringAsFixed(0)}° C",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              )
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Wind: ${_weather?.windSpeed?.toStringAsFixed(0)}m/s",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              Text(
                "Humidity: ${_weather?.humidity?.toStringAsFixed(0)}%",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _forecastCards() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      height: MediaQuery.sizeOf(context).height * 0.35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _forecast?.length,
        itemBuilder: (context, index) {
          Weather weather = _forecast![index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.25,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    DateFormat("E").format(weather.date!),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Image.network(
                    "http://openweathermap.org/img/wn/${weather.weatherIcon}@2x.png",
                    width: 50,
                    height: 50,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "${weather.temperature?.celsius?.toStringAsFixed(0)}° C",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    weather.weatherDescription ?? "",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    DateFormat("h:mm a").format(weather.date!),
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
