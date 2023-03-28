import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loan_app/screens/home_controller.dart';

class BodySection extends StatelessWidget {
  BodySection({super.key});

  final HomeController controller = Get.put<HomeController>(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
        padding: const EdgeInsets.only(top: 10),
        itemCount: controller.isLoading.value
            ? 10
            : controller.userApplications.length,
        itemBuilder: (context, index) {
          if (controller.isLoading.value) {
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(10).copyWith(right: 20),
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 3),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: Container(
                      color: Colors.black12,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
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
                        width: 50,
                        height: 10,
                        color: Colors.black12,
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 100,
                          height: 10,
                          color: Colors.black12,
                        ),
                        Container(
                          width: 60,
                          height: 10,
                          color: Colors.black12,
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          color: Colors.black12,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return InkWell(
              onTap: () {
                controller.onUserApplicationTapped(
                    controller.userApplications[index]);
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10).copyWith(right: 20),
                margin: const EdgeInsets.only(left: 20, right: 20, bottom: 3),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                   
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          controller.userApplications[index].university,
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "Amount required ",
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.w700,
                                color: Colors.black45,
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              "Rs. ${controller.currencyFormat.format(controller.userApplications[index].loanAmount)}",
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
                    Expanded(
                      child: Container(),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "California, CA",
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            "1 hour ago",
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.w500,
                              color: Colors.black45,
                              fontSize: 13,
                            ),
                          ),
                          const Icon(
                            Icons.bookmark_outline,
                            size: 20,
                            color: Colors.black45,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      );
    });
  }
}
