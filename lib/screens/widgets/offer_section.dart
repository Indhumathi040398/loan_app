import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../home_controller.dart';

class OfferSection extends StatelessWidget {
  OfferSection({super.key});

  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade100,
      child: Obx(() {
        return ListView.builder(
          padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
          itemCount:
              controller.isOffersLoading.value ? 5 : controller.offers.length,
          itemBuilder: (context, index) {
            if (controller.isOffersLoading.value) {
              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10).copyWith(right: 20),
                margin: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      height: 50,
                      color: Colors.black12,
                    ),
                    Expanded(child: Container()),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 100,
                          height: 10,
                          color: Colors.black12,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 100,
                          height: 10,
                          color: Colors.black12,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            } else {
              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10).copyWith(right: 20),
                margin: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 50,
                      child: SvgPicture.network(
                        controller.offers[index].bankLogo,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Interest @ ",
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              "${controller.offers[index].interestRate.toStringAsFixed(2)} %",
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "for ",
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              "${controller.offers[index].tenure} months",
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
          },
        );
      }),
    );
  }
}
