// import 'package:flutter/material.dart';

// class SideBarController extends ChangeNotifier {

//   String sideBarValue = '';

//   Future<void> setBarValue (String newValue) async {
//     sideBarValue = newValue;
//     notifyListeners();
//   }
// }

// import 'package:flutter/material.dart';

// class SideBarController extends ChangeNotifier {
//   String _sideBarValue = 'Home';

//   String get sideBarValue => _sideBarValue;

//   Future<void> setBarValue(String newValue) async {
//     _sideBarValue = newValue;
//     notifyListeners();
//   }
// }

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SideBarController extends ChangeNotifier {
  String _sideBarValue = 'Home';

  String get sideBarValue => _sideBarValue;

  Future<void> setBarValue(BuildContext context, String newValue) async {
    _sideBarValue = newValue;
    notifyListeners();

    // Navigate to the new route and update the URL
    switch (newValue) {
      case 'Dashboard':
        context.go('/');
        break;
      case 'Home':
        context.go('/');
        break;
      case 'atAGlancet':
        context.go('/at-a-glance');
        break;
      case 'govermentBody':
        context.go('/governing-body');
        break;
      case 'chairmanMessage':
        context.go('/chairmanMessage');
        break;
      case 'missionAndVision':
        context.go('/missionAndVision');
        break;
      case 'specialFeature':
        context.go('/specialFeature');
        break;
      case 'History':
        context.go('/History');
        break;
      case 'aimAndObjective':
        context.go('/aimAndObjective');
        break;
      case 'whyChooiseUs':
        context.go('/whyChooiseUs');
        break;
      case 'teacherAdd':
        context.go('/teacherAdd');
        break;
      case 'staffAdd':
        context.go('/staffAdd');
        break;
      case 'studentAdd':
        context.go('/studentAdd');
        break;
      case 'classAdd':
        context.go('/classAdd');
        break;
      case 'booklist':
        context.go('/booklist');
        break;
      case 'calender':
        context.go('/calender');
        break;
      case 'routine':
        context.go('/routine');
        break;
      case 'Guardian':
        context.go('/Guardian');
        break;
      case 'Magazine':
        context.go('/Magazine');
        break;
      case 'library':
        context.go('/library');
        break;
      case 'laboratory':
        context.go('/laboratory');
        break;
      case 'tour':
        context.go('/tour');
        break;

      case 'sports':
        context.go('/sports');
        break;
      case 'physicalActivity':
        context.go('/physicalActivity');
        break;
      case 'scholorship':
        context.go('/scholorship');
        break;
      case 'waiver':
        context.go('/waiver');
        break;
      case 'debet':
        context.go('/debet');
        break;
      case 'infrastructure':
        context.go('/infrastructure');
        break;
      case 'hotel':
        context.go('/hotel');
        break;
      case 'trasport':
        context.go('/trasport');
        break;
      case 'video':
        context.go('/video');
        break;
      case 'imageGrallery':
        context.go('/imageGrallery');
        break;
      case 'alumni':
        context.go('/alumni');
        break;
      case 'artsandCulture':
        context.go('/artsandCulture');
        break;
      case 'canteen':
        context.go('/canteen');
        break;
      case 'internet':
        context.go('/internet');
        break;
      case 'contactUs':
        context.go('/contactUs');
        break;
      case 'setting':
        context.go('/setting');
        break;

      // Add more cases for other pages as needed
      default:
        context.go('/');
    }
  }
}
