import 'package:get/get.dart';

class HomeController extends GetxController {
  final List<Map<String, String>> imageList = [
    {
      "userName": "User Name",
      "sponsorsName": "RiderPro",
      "imageUrl": "assets/joylukas.jpeg",
      "userImage": "assets/profile_circle.svg",
    },
  ];

  int selectedBottomIndex = 0;
  int noDays = 0;
  List<Map<String, dynamic>> shopItemList = [
    {
      "logo": "assets/pai_img.png",
      "imageUrl": "assets/one_plus_desc.png",
      "time": DateTime.now().millisecondsSinceEpoch +
          15 * 60 * 60 * 1000 +
          8 * 60 * 1000
    },
    {
      "logo": "assets/cmr_logo.png",
      "imageUrl": "assets/cmr_mall_desc.png",
      "time": DateTime.now().millisecondsSinceEpoch + 16 * 60 * 1000
    },
    {
      "logo": "assets/kfc_logo.jpeg",
      "imageUrl": "assets/kfc_desc.png",
      "time": DateTime.now().millisecondsSinceEpoch + 8 * 24 * 60 * 60 * 1000
    }
  ];
  @override
  void onInit() {
    selectedBottomIndex = 0;
    super.onInit();
  }

  void changeBottomNavItem(int index) {
    selectedBottomIndex = index;

    update();
  }

  List<String> formattedDateInTime(int index) {
    int tempSec =
        shopItemList[index]["time"] - DateTime.now().millisecondsSinceEpoch;
    Duration duration = Duration(milliseconds: tempSec);
    String hours = duration.inHours.toString();
    String minutes = (duration.inMinutes % 60).toString();
    if (int.parse(hours) > 23) {
      noDays = int.parse(hours) ~/ 24;
      return [];
    }
    if (hours.length == 1) {
      hours = "0$hours";
    }
    if (minutes.length == 1) {
      minutes = "0$minutes";
    }
    List<String> list = [...hours.split(''), ...minutes.split('')];
    return list;
  }
}
