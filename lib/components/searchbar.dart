import 'package:flutter/material.dart';
import '../api/locapi.dart';
import '../api/weatherapi.dart';

class SearchBars extends StatefulWidget {
  const SearchBars({Key? key}) : super(key: key);

  static TextEditingController searchController =
      TextEditingController(text: '');

  @override
  _SearchBarsState createState() => _SearchBarsState();
}

class _SearchBarsState extends State<SearchBars> {
  void handleSearch() async {
    // await fetchlocation();
    await fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width - 80,
          height: 50,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: SearchBars.searchController,
                    decoration: const InputDecoration(
                      hintText: 'Search Allahabad',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: handleSearch,
          child: Container(
            width: 45,
            height: 45,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
