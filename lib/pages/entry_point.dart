// import 'package:dashboard/pages/add_class/add_class.dart';
// import 'package:dashboard/pages/aim_objective/aim_objective.dart';
// import 'package:dashboard/pages/ataglance/ataglance.dart';
// import 'package:dashboard/pages/booklist/booklist.dart';
// import 'package:dashboard/pages/calender/calender.dart';
// import 'package:dashboard/pages/chairman_message/chairman_message.dart';
// import 'package:dashboard/pages/contact_us/contact_us.dart';
// import 'package:dashboard/pages/governining_body/governining_body.dart';
// import 'package:dashboard/pages/guardian_opinion/guardian_opinion.dart';
// import 'package:dashboard/pages/history/history.dart';
// import 'package:dashboard/pages/laboratory/laboratory.dart';
// import 'package:dashboard/pages/library/library.dart';
// import 'package:dashboard/pages/magazine/magazine.dart';
// import 'package:dashboard/pages/mission_vision/mission_vision.dart';
// import 'package:dashboard/pages/physical_activity/physical_activity.dart';
// import 'package:dashboard/pages/scholorship/scholorship.dart';
// import 'package:dashboard/pages/special_feature/special_feature.dart';
// import 'package:dashboard/pages/sport/sport.dart';
// import 'package:dashboard/pages/staff/staff.dart';
// import 'package:dashboard/pages/student/student.dart';
// import 'package:dashboard/pages/teacher/teacher.dart';
// import 'package:dashboard/pages/tour/tour.dart';
// import 'package:dashboard/pages/why_choose_us/why_choose_us.dart';
// import 'package:dashboard/responsive.dart';
// import 'package:dashboard/shared/constants/defaults.dart';
// import 'package:dashboard/shared/widgets/sidemenu/sidebar.dart';
// import 'package:dashboard/shared/widgets/sidemenu/tab_sidebar.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:provider/provider.dart';

// import '../controller/side_bar_controller.dart';
// import '../shared/widgets/header.dart';
// import 'dashboard/dashboard_page.dart';

// // import 'dart:html' as html;

// final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

// class EntryPoint extends StatelessWidget {
//   const EntryPoint({super.key,});

  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _drawerKey,
//       drawer: Responsive.isMobile(context) ? const Sidebar() : null,
//       body: Row(
//         children: [
//           if (Responsive.isDesktop(context)) const Sidebar(),
//           if (Responsive.isTablet(context)) const TabSidebar(),
//           Expanded(
//             child: Column(
//               children: [
//                 Header(drawerKey: _drawerKey),
//                 Expanded(
//                   child: ConstrainedBox(
//                     constraints: const BoxConstraints(maxWidth: 1360),
//                     child: ListView(
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.symmetric(
//                             horizontal: AppDefaults.padding *
//                                 (Responsive.isMobile(context) ? 1 : 1.5),
//                           ),
//                           child: Consumer<SideBarController>(
//                               builder: (context, side, child) {
//                             Widget content;

//                             ///basic
//                             if (side.sideBarValue == 'Dashboard') {
//                               content = const DashboardPage();
//                             } else if (side.sideBarValue == 'Home') {
//                               content = const DashboardPage();
//                             } else if (side.sideBarValue == 'atAGlancet') {
//                               content = const AtaGlance();
                               
//                             } else if (side.sideBarValue == 'govermentBody') {
//                               content = const GoverniningBody();
//                             } else if (side.sideBarValue == 'chairmanMessage') {
//                               content = const ChairmanMessage();
//                             } else if (side.sideBarValue ==
//                                 'missionAndVision') {
//                               content = const MissionVision();
//                             } else if (side.sideBarValue == 'specialFeature') {
//                               content = const SpecialFeature();
//                             } else if (side.sideBarValue == 'History') {
//                               content = const History();
//                             } else if (side.sideBarValue == 'aimAndObjective') {
//                               content = const AimObjective();
//                             } else if (side.sideBarValue == 'whyChooiseUs') {
//                               content = const WhyChooseUs();
//                             }

//                             ///primary
//                             else if (side.sideBarValue == 'teacherAdd') {
//                               content = const Teacher();
//                             } else if (side.sideBarValue == 'staffAdd') {
//                               content = const Staff();
//                             } else if (side.sideBarValue == 'studentAdd') {
//                               content = const Student();
//                             } else if (side.sideBarValue == 'classAdd') {
//                               content = const ClassAdd();
//                             } else if (side.sideBarValue == 'booklist') {
//                               content = const BookList();
//                             } else if (side.sideBarValue == 'calender') {
//                               content = const Calender();
//                             } else if (side.sideBarValue == 'routine') {
//                               content = const Center(child: Text('routine'));
//                             }

//                             ///Addition
//                             else if (side.sideBarValue == 'Guardian') {
//                               content = const GuardianOpinion();
//                             } else if (side.sideBarValue == 'Magazine') {
//                               content = const Magazine();
//                             } else if (side.sideBarValue == 'library') {
//                               content = const Library();
//                             } else if (side.sideBarValue == 'laboratory') {
//                               content = const Laboratory();
//                             } else if (side.sideBarValue == 'tour') {
//                               content = const Tour();
//                             } else if (side.sideBarValue == 'sports') {
//                               content = const Sport();
//                             } else if (side.sideBarValue ==
//                                 'physicalActivity') {
//                               content = const PhysicalActivity();
//                             } else if (side.sideBarValue == 'scholorship') {
//                               content = const Scholorship();
//                             } else if (side.sideBarValue == 'waiver') {
//                               content = const Center(child: Text('waiver'));
//                             } else if (side.sideBarValue == 'debet') {
//                               content = const Center(child: Text('debet'));
//                             } else if (side.sideBarValue == 'infrastructure') {
//                               content =
//                                   const Center(child: Text('infrastructure'));
//                             } else if (side.sideBarValue == 'hotel') {
//                               content = const Center(child: Text('hotel'));
//                             } else if (side.sideBarValue == 'trasport') {
//                               content = const Center(child: Text('trasport'));
//                             } else if (side.sideBarValue == 'video') {
//                               content = const Center(child: Text('video'));
//                             } else if (side.sideBarValue == 'imageGrallery') {
//                               content =
//                                   const Center(child: Text('imageGrallery'));
//                             } else if (side.sideBarValue == 'alumni') {
//                               content = const Center(child: Text('alumni'));
//                             } else if (side.sideBarValue == 'artsandCulture') {
//                               content =
//                                   const Center(child: Text('artsandCulture'));
//                             } else if (side.sideBarValue == 'canteen') {
//                               content = const Center(child: Text('canteen'));
//                             } else if (side.sideBarValue == 'internet') {
//                               content = const Center(child: Text('internet'));
//                             } else if (side.sideBarValue == 'contactUs') {
//                               content = const ContactUs();
//                             } else if (side.sideBarValue == 'setting') {
//                               content = const Center(child: Text('setting'));
//                             } else {
//                               content = const DashboardPage();
//                             }

//                             return SafeArea(
//                               child: content,
//                             );
//                           }),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }



import 'package:dashboard/responsive.dart';
import 'package:dashboard/shared/constants/defaults.dart';
import 'package:dashboard/shared/widgets/sidemenu/sidebar.dart';
import 'package:dashboard/shared/widgets/sidemenu/tab_sidebar.dart';
import 'package:flutter/material.dart';

import '../shared/widgets/header.dart';

final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

class EntryPoint extends StatelessWidget {
  final Widget child;

  const EntryPoint({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: Responsive.isMobile(context) ? const Sidebar() : null,
      body: Row(
        children: [
          if (Responsive.isDesktop(context)) const Sidebar(),
          if (Responsive.isTablet(context)) const TabSidebar(),
          Expanded(
            child: Column(
              children: [
                Header(drawerKey: _drawerKey),
                Expanded(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1360),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppDefaults.padding *
                            (Responsive.isMobile(context) ? 1 : 1.5),
                      ),
                      child: SafeArea(
                        child: child,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




 
