import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/user_model.dart';
import '../../services/api_service.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      margin: const EdgeInsets.only(bottom: 5),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 3,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const NavBar(),
          Expanded(
            flex: 2,
            child: Container(),
          ),
          Text(
            "Find Your Dream College's Loan Here",
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w700,
              color: Colors.black,
              fontSize: 30,
            ),
          ),
          Expanded(child: Container()),
          const SearchBox(),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int selectedPage = 0;
  UserModel? _userModel;
  List<String> navBarStrings = ["Home", "Colleges", "Students", "About us"];
  @override
  void initState() {
    _getData();
    super.initState();
  }

  void _getData() async {
    _userModel = await ApiService().getUser();
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const FlutterLogo(
            size: 40,
          ),
          const SizedBox(
            width: 30,
          ),
          Row(
            children: List.generate(
              navBarStrings.length,
              (index) => InkWell(
                onTap: () {
                  setState(() {
                    selectedPage = index;
                  });
                },
                child: NavBarItem(
                  title: navBarStrings[index],
                  isSelected: selectedPage == index,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(),
          ),
          _userModel != null
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          _userModel!.name ?? "",
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          _userModel!.email ?? "",
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w700,
                            color: Colors.black45,
                            fontSize: 13,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80",
                      ),
                      // radius: 10,
                    ),
                  ],
                )
              : const SizedBox()
        ],
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  const NavBarItem({
    super.key,
    required this.title,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              color: isSelected ? Colors.black : Colors.transparent,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            height: 5,
            width: 100,
          ),
          Text(
            title,
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w700,
              color: isSelected ? Colors.black : Colors.black45,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10).copyWith(left: 30),
      margin: const EdgeInsets.all(5),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            spreadRadius: 1,
            blurRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.search,
                size: 20,
                color: Colors.black45,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "College or keyword...",
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.w400,
                  color: Colors.black45,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 30,
          ),
          Container(
            color: Colors.black26,
            width: 1.5,
            height: 30,
          ),
          const SizedBox(
            width: 30,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 20,
                color: Colors.black45,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "Add country or city...",
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.w400,
                  color: Colors.black45,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(15),
              width: 130,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                  child: Text(
                "Search",
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  fontSize: 13,
                ),
              )),
            ),
          )
        ],
      ),
    );
  }
}
