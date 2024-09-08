import 'package:countrieslist/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(builder: (_) {
        if (_.isLoading) {
          return const Center(
              child: CircularProgressIndicator(color: Colors.blue));
        } else if (_.isError) {
          return Center(child: Text(_.errorMessage!));
        } else {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (_.countryModel!.first.flags != null)
                  Container(
                    width: double.infinity,
                    height: 320,
                    color: Colors.grey,
                    child: Image.network(
                      _.countryModel!.first.flags!.png!,
                      fit: BoxFit.cover,
                    ),
                  ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    _.countryModel!.first.name!.common!,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    _.countryModel!.first.name!.official!,
                    style: const TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                if (_.countryModel!.first.capital != null) ...{
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text:
                              "The capital city of ${_.countryModel!.first.name!.common!} : ",
                          style: const TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: "${_.countryModel!.first.capital!.first}",
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w700),
                        ),
                      ]),
                    ),
                  ),
                  const SizedBox(height: 10),
                },
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: RichText(
                    text: TextSpan(children: [
                      const TextSpan(
                        text: "Population size: ",
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: "${_.countryModel!.first.population!}",
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w700),
                      ),
                    ]),
                  ),
                ),
                const SizedBox(height: 10),
                if (_.countryModel!.first.currencies != null &&
                    _.countryModel!.first.currencies!.chf != null) ...{
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: RichText(
                      text: TextSpan(children: [
                        const TextSpan(
                          text: "Currency: ",
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text:
                              "${_.countryModel!.first.currencies!.chf!.name}",
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w700),
                        ),
                      ]),
                    ),
                  ),
                  const SizedBox(height: 10),
                },
                if (_.countryModel!.first.languages != null) ...{
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: RichText(
                      text: TextSpan(children: [
                        const TextSpan(
                          text: "Language: ",
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text:
                              _.countryModel!.first.languages!.keys.join(', '),
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w700),
                        ),
                      ]),
                    ),
                  ),
                  const SizedBox(height: 10),
                },
                if (_.countryModel!.first.borders != null &&
                    _.countryModel!.first.borders!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Borders: ",
                          style: TextStyle(color: Colors.black),
                        ),
                        const SizedBox(height: 5),
                        Wrap(
                            children: List.generate(
                                _.countryModel!.first.borders!.length,
                                (index) => Container(
                                      margin: const EdgeInsets.only(
                                          right: 5, bottom: 10),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 204, 204, 204),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Text(
                                        _.countryModel!.first.borders![index],
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                    ))),
                      ],
                    ),
                  )
              ],
            ),
          );
        }
      }),
    );
  }
}
