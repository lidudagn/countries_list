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
      ),
      body: GetBuilder<HomeController>(builder: (_) {
        if (_.isLoading) {
          return const Center(
              child: CircularProgressIndicator(color: Colors.blue));
        } else if (_.isError) {
          return Center(child: Text(_.errorMessage!));
        } else {
          return ListView.builder(
            itemCount: _.countriesModel!.length,
            itemBuilder: (context, index) {
              final country = _.countriesModel![index];
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
