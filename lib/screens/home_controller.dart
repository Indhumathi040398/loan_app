import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loan_app/models/user_offer_model.dart';

import '../models/user_application.dart';
import '../services/api_service.dart';

class HomeController extends GetxController {
  RxList<UserApplication> userApplications = <UserApplication>[].obs;
  RxList<Offers> offers = <Offers>[].obs;
  RxBool isLoading = true.obs;
  RxBool isOffersLoading = false.obs;
  Rxn<UserApplication> selectedUserApplication = Rxn();
  final currencyFormat = NumberFormat("#,##0.00", "en_US");

  @override
  void onInit() {
    _getUserApplications();
    super.onInit();
  }

  void _getUserApplications() async {
    isLoading.value = true;

    var userApplications = await ApiService().getUsersApplication();
    this.userApplications.value = userApplications!;

    isLoading.value = false;
    update();
  }

  void onUserApplicationTapped(UserApplication userApplication) {
    selectedUserApplication.value = userApplication;
    _getApplicationOffers();
  }

  void _getApplicationOffers() async {
    isOffersLoading.value = true;

    var offers = await ApiService()
        .getUsersOffers(selectedUserApplication.value!.offersUrl);
    this.offers.value = offers!;

    isOffersLoading.value = false;
    update();
  }
}
