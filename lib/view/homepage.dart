import 'package:countrieslist/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: Get.find<HomeController>()
                  .searchController, // Use a search controller
              decoration: InputDecoration(
                hintText: 'Search Countries...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onChanged: (value) {
                Get.find<HomeController>().searchController =
                    TextEditingController(text: value);
                Get.find<HomeController>().update();
              },
            ),
          ), // Set preferred height
        ),
      ),
      body: GetBuilder<HomeController>(builder: (_) {
        if (_.isLoading) {
          return const Center(
              child: CircularProgressIndicator(color: Colors.blue));
        } else if (_.isError) {
          return Center(child: Text(_.errorMessage!));
        } else {
          final filteredCountries = _.countriesModel!
              .where((country) => country.name!.official!
                  .toLowerCase()
                  .contains(_.searchController.text.toLowerCase()))
              .toList();

          return ListView.builder(
            itemCount: filteredCountries.length,
            itemBuilder: (context, index) {
              final country = filteredCountries[index];
              return ListTile(
                leading: Image.network(
                  country.flag!.png!,
                  width: 50,
                  height: 50,
                ),
                title: Text(country.name!.official!),
                subtitle: Text(country.region!.name),
              );
            },
          );
        }
      }),
    );
  }
}
