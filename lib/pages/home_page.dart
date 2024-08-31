import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/consts.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  final WeatherFactory _wf = WeatherFactory(OPENWEATHER_API_KEY);
  Weather? _weather;
  String _cityName = "Casablanca";
  List<String> _cities = [
  "Abuja", "Adelaide", "Ahmedabad", "Aix-en-Provence", "Auckland",
  "Amsterdam", "Antwerp", "Athens", "Austin", "Bangkok",
  "Barcelona", "Bari", "Baku", "Baltimore", "Bamako",
  "Bangkok", "Barcelona", "Bari", "Baku", "Bandung",
  "Beijing", "Belfast", "Belgrade", "Belo Horizonte", "Berlin",
  "Birmingham", "Bologna", "Bordeaux", "Brisbane", "Bristol",
  "Brno", "Bucharest", "Budapest", "Buenos Aires", "Cairo",
  "Calgary", "Cali", "Cape Town", "Cardiff", "Caracas",
  "Casablanca", "Chengdu", "Chennai", "Chisinau", "Cleveland",
  "Cologne", "Colombo", "Conakry", "Copenhagen", "Curitiba",
  "Da Nang", "Dallas", "Dakar", "Dubai", "Durban",
  "Dusseldorf", "Edinburgh", "Eindhoven", "Geneva", "Glasgow",
  "Gothenburg", "Guangzhou", "Haarlem", "Hamburg", "Hangzhou",
  "Hanoi", "Harare", "Helsinki", "Hong Kong", "Houston",
  "Hyderabad", "Ibagué", "Istanbul", "Izmir", "Jaipur",
  "Jakarta", "Jeddah", "Jinan", "Johannesburg", "Kaohsiung",
  "Karachi", "Kazan", "Kolkata", "Kuala Lumpur", "Kuwait City",
  "Kyoto", "Lagos", "Lima", "Lisbon", "Liverpool",
  "Ljubljana", "London", "Londrina", "Luanda", "Lyon",
  "Macau", "Madison", "Malmo", "Manama", "Manila",
  "Maputo", "Marseille", "Minsk", "Mexico City", "Milan",
  "Minneapolis", "Montevideo", "Montreal", "Moscow", "Mumbai",
  "Munich", "Mysore", "Nairobi", "Nagoya", "Nashville",
  "Nizhny Novgorod", "Osaka", "Oaxaca", "Odessa", "Oslo",
  "Panama City", "Paris", "Porto", "Porto Alegre", "Prague",
  "Puebla", "Qingdao", "Quebec City", "Rabat", "Riga",
  "Riyadh", "Rome", "San Diego", "San Juan", "San Paulo",
  "Santiago", "Sao Paulo", "Sapporo", "Seoul", "Shanghai",
  "Singapore", "Stockholm", "Surabaya", "Sydney", "Taipei",
  "Tianjin", "Tokyo", "Toronto", "Toulouse", "Ulaanbaatar",
  "Vancouver", "Varna", "Vienna", "Vilnius", "Warsaw",
  "Washington", "Wellington", "Yokohama", "Zagreb", "Zurich",
  "Addis Ababa", "Amman", "Andorra la Vella", "Angers", "Antananarivo",
  "Auckland", "Augsburg", "Bamako", "Banjul", "Basel",
  "Batumi", "Belfast", "Belo Horizonte", "Bilbao", "Bissau",
  "Bogotá", "Bordeaux", "Bucharest", "Budapest", "Bujumbura",
  "Cali", "Cairo", "Calais", "Campinas", "Cape Town",
  "Chengdu", "Chennai", "Chisinau", "Cleveland", "Colombo",
  "Copenhagen", "Curitiba", "Dakar", "Dallas", "Darmstadt",
  "Darwin", "Dresden", "Durban", "Dusseldorf", "Edinburgh",
  "Faisalabad", "Frankfurt", "Gaborone", "Geneva", "Glasgow",
  "Gothenburg", "Guanajuato", "Guangzhou", "Haarlem", "Hamburg",
  "Hanoi", "Harare", "Helsinki", "Hong Kong", "Houston",
  "Hyderabad", "Ibagué", "Istanbul", "Izmir", "Jakarta",
  "Jeddah", "Jinan", "Johannesburg", "Kabul", "Kagoshima",
  "Kaohsiung", "Karachi", "Kazan", "Kolkata", "Kuala Lumpur",
  "Kyoto", "Lagos", "Lima", "Lisbon", "Liverpool",
  "Ljubljana", "London", "Londrina", "Luanda", "Lyon",
  "Macau", "Madrid", "Malmo", "Manama", "Manila",
  "Maputo", "Marseille", "Minsk", "Mexico City", "Milan",
  "Minneapolis", "Montevideo", "Montreal", "Moscow", "Mumbai",
  "Munich", "Mysore", "Nairobi", "Nagoya", "Nashville",
  "Nizhny Novgorod", "Osaka", "Oaxaca", "Odessa", "Oslo",
  "Panama City", "Paris", "Porto", "Porto Alegre", "Prague",
  "Puebla", "Qingdao", "Quebec City", "Rabat", "Riga",
  "Riyadh", "Rome", "San Diego", "San Juan", "San Paulo",
  "Santiago", "Sao Paulo", "Sapporo", "Seoul", "Shanghai",
  "Singapore", "Stockholm", "Surabaya", "Sydney", "Taipei",
  "Tianjin", "Tokyo", "Toronto", "Toulouse", "Ulaanbaatar",
  "Vancouver", "Varna", "Vienna", "Vilnius", "Warsaw",
  "Washington", "Wellington", "Yokohama", "Zagreb", "Zurich",
  "Adelaide", "Ahmedabad", "Aix-en-Provence", "Auckland", "Baku",
  "Bandung", "Barcelona", "Beirut", "Belfast", "Belo Horizonte",
  "Belgrade", "Bogotá", "Bucharest", "Bujumbura", "Cali",
  "Calais", "Cape Town", "Caracas", "Chengdu", "Chennai",
  "Chisinau", "Cleveland", "Colombo", "Copenhagen", "Curitiba",
  "Darwin", "Darmstadt", "Dresden", "Durban", "Dusseldorf",
  "Edinburgh", "Faisalabad", "Frankfurt", "Gaborone", "Geneva",
  "Glasgow", "Gothenburg", "Guangzhou", "Haarlem", "Hamburg",
  "Hanoi", "Harare", "Helsinki", "Hong Kong", "Houston",
  "Hyderabad", "Ibagué", "Istanbul", "Izmir", "Jakarta",
  "Jeddah", "Jinan", "Johannesburg", "Kabul", "Kagoshima",
  "Kaohsiung", "Karachi", "Kazan", "Kolkata", "Kuala Lumpur",
  "Kyoto", "Lagos", "Lima", "Lisbon", "Liverpool",
  "Ljubljana", "London", "Londrina", "Luanda", "Lyon",
  "Macau", "Madrid", "Malmo", "Manama", "Manila",
  "Maputo", "Marseille", "Minsk", "Mexico City", "Milan",
  "Minneapolis", "Montevideo", "Montreal", "Moscow", "Mumbai",
  "Munich", "Mysore", "Nairobi", "Nagoya", "Nashville",
  "Nizhny Novgorod", "Osaka", "Oaxaca", "Odessa", "Oslo",
  "Panama City", "Paris", "Porto", "Porto Alegre", "Prague",
  "Puebla", "Qingdao", "Quebec City", "Rabat", "Riga",
  "Riyadh", "Rome", "San Diego", "San Juan", "San Paulo",
  "Santiago", "Sao Paulo", "Sapporo", "Seoul", "Shanghai",
  "Singapore", "Stockholm", "Surabaya", "Sydney", "Taipei",
  "Tianjin", "Tokyo", "Toronto", "Toulouse", "Ulaanbaatar",
  "Vancouver", "Varna", "Vienna", "Vilnius", "Warsaw",
  "Washington", "Wellington", "Yokohama", "Zagreb", "Zurich", "Agadir", "Ait Melloul", "Al Hoceima", "Azilal", "Beni Mellal",
  "Berrechid", "Casablanca", "Chefchaouen", "El Jadida", "El Kelaa des Sraghna",
  "Fes", "Guelmim", "Ifrane", "Khemisset", "Khenifra",
  "Ksar el-Kebir", "Laayoune", "Marrakech", "Meknes", "Ouarzazate",
  "Oujda", "Rabat", "Sale", "Tangier", "Taroudant",
  "Tetouan", "Tiznit", "Taza", "Sefrou", "Nador",
  "Khouribga", "Tinghir", "Midelt", "Ouezzane", "Tétouan",
  "Rissani", "Fkih Ben Salah", "Ksar es-S'id", "Khenifra", "Tiznit",
  "Assilah", "Tifelt", "El Hajeb", "Mohammedia", "Sidi Ifni",
  "Sidi Kacem", "Errachidia", "Azrou", "Oulad Teima", "Moulay Idriss",
  "Bouderbala", "Khemis Zemamra", "Sidi Slimane", "Kelaa des Sraghna", "Tiflet",
  "Taourirt", "Sidi Yahya el Gharb", "Lahraouyine", "Ben Guerir", "Khemis Miliana",
  ];
  Map<String, Weather> _cityWeather = {};
  late ScrollController _scrollController;
  late AnimationController _animationController;
  double _scrollPosition = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    )..repeat();
    _fetchAllWeather();
    _animationController.addListener(() {
      setState(() {
        _scrollPosition += 1;
        if (_scrollPosition > _scrollController.position.maxScrollExtent) {
          _scrollPosition = 0;
        }
        _scrollController.jumpTo(_scrollPosition);
      });
    });
  }

  void _fetchAllWeather() async {
    for (var city in _cities) {
      var weather = await _wf.currentWeatherByCityName(city);
      setState(() {
        _cityWeather[city] = weather!;
      });
    }
  }

  void _fetchWeather() {
    _wf.currentWeatherByCityName(_cityName).then((w) {
      setState(() {
        _weather = w;
      });
    });
  }

  void _selectCity() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Select City"),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _cities.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(_cities[index]),
                  onTap: () {
                    setState(() {
                      _cityName = _cities[index];
                    });
                    _fetchWeather();
                    Navigator.of(context).pop();
                  },
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather"),
        actions: [
          IconButton(
            icon: const Icon(Icons.location_city),
            onPressed: _selectCity,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: _buildScrollingBar(),
        ),
      ),
      body: _buildUi(),
    );
  }

  Widget _buildScrollingBar() {
    return Container(
      height: 40.0,
      color: Colors.blueAccent,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        itemCount: _cities.length,
        itemBuilder: (context, index) {
          String city = _cities[index];
          Weather? weather = _cityWeather[city];
          String temperature = weather != null
              ? "${weather.temperature?.celsius?.toStringAsFixed(0)}° C"
              : "Loading...";
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Center(
              child: Text(
                "$city: $temperature",
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildUi() {
    if (_weather == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _locationHeader(),
          const SizedBox(height: 15),
          dateTimeInfo(),
          const SizedBox(height: 25),
          _weatherIcon(),
          const SizedBox(height: 15),
          _currentTemp(),
          const SizedBox(height: 15),
          _extraInfo(),
        ],
      ),
    );
  }

  Widget _locationHeader() {
    return Text(
      _weather?.areaName ?? "",
      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
    );
  }

  Widget dateTimeInfo() {
    DateTime now = _weather!.date!;
    return Column(
      children: [
        Text(
          DateFormat("h:mm a🕗").format(now),
          style: const TextStyle(fontSize: 32),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              DateFormat("EEEE").format(now),
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            ),
            Text(
              " ${DateFormat('d.M.y').format(now)}",
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            ),
          ],
        ),
      ],
    );
  }

  Widget _weatherIcon() {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.18,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                "https://www.pngall.com/wp-content/uploads/11/Weather-PNG-Background.png",
              ),
            ),
          ),
        ),
        Text(
          _weather?.weatherDescription ?? "",
          style: const TextStyle(color: Colors.black, fontSize: 20),
        ),
      ],
    );
  }

  Widget _currentTemp() {
    return Text(
      "${_weather?.temperature?.celsius?.toStringAsFixed(0)}° C",
      style: const TextStyle(
          color: Colors.black, fontSize: 55, fontWeight: FontWeight.w600),
    );
  }

  Widget _extraInfo() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.deepPurpleAccent,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _infoText("Max↗: ${_weather?.tempMax?.celsius?.toStringAsFixed(0)}° C"),
              _infoText("Min↘: ${_weather?.tempMin?.celsius?.toStringAsFixed(0)}° C"),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _infoText("Wind: ${_weather?.windSpeed?.toStringAsFixed(0)} m/s💨"),
              _infoText("Humidity: ${_weather?.humidity?.toStringAsFixed(0)}%"),
            ],
          )
        ],
      ),
    );
  }

  Widget _infoText(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.white, fontSize: 16),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }
}
