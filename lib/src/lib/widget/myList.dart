import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../detail_page/detail.dart';
import '../home_screen/logic.dart';
import '../model/current_weather_data.dart';

class MyList extends GetView<HomeController> {
  const MyList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const VerticalDivider(
          color: Colors.transparent,
          width: 5,
        ),
        itemCount: controller.dataList.length,
        itemBuilder: (context, index) {
          CurrentWeatherData? data;
          (controller.dataList.isNotEmpty)
              ? data = controller.dataList[index]
              : data = null;
          return GestureDetector(
            onTap: () {
              Get.to(() => DetailsPage(cityWeather: data));
            },
            child: SizedBox(
              width: 140,
              height: 150,
              child: Card(
                color: Colors.blue.shade300,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      (data != null) ? '${data.name}' : '',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      (data != null)
                          ? '${(data.main!.temp! - 273.15).round().toString()}\u2103'
                          : '',
                    ),
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: LottieBuilder.asset('assets/anims/cloudy.json'),
                    ),
                    Text(
                      (data != null)
                          ? '${data.weather![0].description?.toUpperCase()}'
                          : '',
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
