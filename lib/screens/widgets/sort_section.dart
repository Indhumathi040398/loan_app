import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SortSection extends StatefulWidget {
  const SortSection({super.key});

  @override
  State<SortSection> createState() => _SortSectionState();
}

class _SortSectionState extends State<SortSection> {
  dynamic selectedValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      color: Colors.blue.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Filter",
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.black26),
                ),
                child: Text(
                  "College, Degree, Tag...",
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.w500,
                    color: Colors.black45,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sort",
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Radio(
                    value: "Sort by A to Z",
                    groupValue: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value;
                      });
                    },
                  ),
                  Text(
                    "Sort by A to Z",
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w500,
                      color: Colors.black45,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: "Sort by Z to A",
                    groupValue: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value;
                      });
                    },
                  ),
                  Text(
                    "Sort by Z to A",
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w500,
                      color: Colors.black45,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: "Interest Low to High",
                    groupValue: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value;
                      });
                    },
                  ),
                  Text(
                    "Interest Low to High",
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w500,
                      color: Colors.black45,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: "Interest High to Low",
                    groupValue: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value;
                      });
                    },
                  ),
                  Text(
                    "Interest High to Low",
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w500,
                      color: Colors.black45,
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
}
