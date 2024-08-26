//  import 'package:dashboard/controller/side_bar_controller.dart';
// import 'package:dashboard/pages/dashboard/widgets/theme_tabs.dart';
// import 'package:dashboard/responsive.dart';
// import 'package:dashboard/shared/constants/config.dart';
// import 'package:dashboard/shared/constants/defaults.dart';
// import 'package:dashboard/shared/constants/ghaps.dart';
// import 'package:dashboard/shared/widgets/sidemenu/customer_info.dart';
// import 'package:dashboard/shared/widgets/sidemenu/menu_tile.dart';
// import 'package:dashboard/theme/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:go_router/go_router.dart';
// import 'package:provider/provider.dart';

// import '../../constants/config.dart';
// import 'menu_tile.dart';

// class Sidebar extends StatelessWidget {
//   const Sidebar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: SafeArea(
//         child: Consumer<SideBarController>(
//           builder: (context, side, child) {
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     if (Responsive.isMobile(context))
//                       Padding(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: AppDefaults.padding,
//                         ),
//                         child: IconButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           icon:
//                               SvgPicture.asset('assets/icons/close_filled.svg'),
//                         ),
//                       ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: AppDefaults.padding,
//                         vertical: AppDefaults.padding * 1.5,
//                       ),
//                       child: SvgPicture.asset(AppConfig.logo),
//                     ),
//                   ],
//                 ),
//                 const Divider(),
//                 gapH16,
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: AppDefaults.padding,
//                     ),
//                     child: ListView(
//                       children: [
//                         MenuTile(
//                           isActive: side.sideBarValue == 'Home',
//                           title: "Home",
//                           activeIconSrc: "assets/icons/home_filled.svg",
//                           inactiveIconSrc: "assets/icons/home_light.svg",
//                           onPressed: () {
//                             side.setBarValue('Home');
//                           },
//                         ),
//                         // Basic
//                         ExpansionTile(
//                           leading: SvgPicture.asset(
//                               "assets/icons/diamond_light.svg"),
//                           title: Text(
//                             "Basic",
//                             style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                               color:
//                                   Theme.of(context).textTheme.bodyMedium!.color,
//                             ),
//                           ),
//                           children: [
//                             MenuTile(
//                               isSubmenu: true,
//                               isActive: side.sideBarValue == 'AtaGlance',
//                               title: "At a Glance",
//                               activeIconSrc: "assets/icons/diamond_filled.svg",
//                               inactiveIconSrc: "assets/icons/diamond_light.svg",
//                               onPressed: () {
//                                 side.setBarValue('AtaGlance');
//                                 // context.go('/ataglance');
//                               },
//                             ),
//                             MenuTile(
//                               isSubmenu: true,
//                               isActive: side.sideBarValue == 'govermentBody',
//                               title: "Goverment Body",
//                               activeIconSrc:
//                                   "assets/icons/goverment_body_filled.svg",
//                               inactiveIconSrc:
//                                   "assets/icons/goverment_body_light.svg",
//                               count: 16,
//                               onPressed: () {
//                                 side.setBarValue('govermentBody');
//                               },
//                             ),
//                             MenuTile(
//                               isSubmenu: true,
//                               isActive: side.sideBarValue == 'chairmanMessage',
//                               title: "Chairman Message",
//                               activeIconSrc: "assets/icons/chairman_filled.svg",
//                               inactiveIconSrc:
//                                   "assets/icons/chairman_light.svg",
//                               onPressed: () {
//                                 side.setBarValue('chairmanMessage');
//                               },
//                             ),
//                             MenuTile(
//                               isSubmenu: true,
//                               isActive: side.sideBarValue == 'missionAndVision',
//                               title: "Mission and Vision",
//                               activeIconSrc: "assets/icons/mission_filled.svg",
//                               inactiveIconSrc: "assets/icons/mission_light.svg",
//                               onPressed: () {
//                                 side.setBarValue('missionAndVision');
//                               },
//                             ),
//                             MenuTile(
//                               isSubmenu: true,
//                               isActive: side.sideBarValue == 'specialFeature',
//                               title: "Special Feature",
//                               activeIconSrc:
//                                   "assets/icons/special_feature_filled.svg",
//                               inactiveIconSrc:
//                                   "assets/icons/special_feature_light.svg",
//                               onPressed: () {
//                                 side.setBarValue('specialFeature');
//                               },
//                             ),
//                             MenuTile(
//                               isSubmenu: true,
//                               isActive: side.sideBarValue == 'History',
//                               title: "History",
//                               activeIconSrc: "assets/icons/history_filled.svg",
//                               inactiveIconSrc: "assets/icons/history_light.svg",
//                               onPressed: () {
//                                 side.setBarValue('History');
//                               },
//                             ),
//                             MenuTile(
//                               isSubmenu: true,
//                               isActive: side.sideBarValue == 'aimAndObjective',
//                               title: "Aim And Objective",
//                               activeIconSrc: "assets/icons/aim_filled.svg",
//                               inactiveIconSrc: "assets/icons/aim_light.svg",
//                               onPressed: () {
//                                 side.setBarValue('aimAndObjective');
//                               },
//                             ),
//                             MenuTile(
//                               isSubmenu: true,
//                               isActive: side.sideBarValue == 'whyChooiseUs',
//                               title: "Why Chooise Us",
//                               activeIconSrc:
//                                   "assets/icons/why_choose_us_filled.svg",
//                               inactiveIconSrc:
//                                   "assets/icons/why_choose_us_light.svg",
//                               onPressed: () {
//                                 side.setBarValue('whyChooiseUs');
//                               },
//                             ),
//                           ],
//                         ),
//                         // Primary
//                         ExpansionTile(
//                           leading: SvgPicture.asset(
//                               "assets/icons/profile_circled_light.svg"),
//                           title: Text(
//                             "Primary",
//                             style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                               color:
//                                   Theme.of(context).textTheme.bodyMedium!.color,
//                             ),
//                           ),
//                           children: [
//                             MenuTile(
//                               isSubmenu: true,
//                               isActive: side.sideBarValue == 'teacherAdd',
//                               title: "Teacher Add",
//                               activeIconSrc:
//                                   "assets/icons/teacher_add_filled.svg",
//                               inactiveIconSrc:
//                                   "assets/icons/teacher_add_light.svg",
//                               onPressed: () {
//                                 side.setBarValue('teacherAdd');
//                               },
//                             ),
//                             MenuTile(
//                               isSubmenu: true,
//                               isActive: side.sideBarValue == 'staffAdd',
//                               title: "Staff Add",
//                               activeIconSrc:
//                                   "assets/icons/staff_add_filled.svg",
//                               inactiveIconSrc:
//                                   "assets/icons/staff_add_light.svg",
//                               count: 16,
//                               onPressed: () {
//                                 side.setBarValue('staffAdd');
//                               },
//                             ),
//                             MenuTile(
//                               isSubmenu: true,
//                               isActive: side.sideBarValue == 'studentAdd',
//                               title: "Student Add",
//                               activeIconSrc:
//                                   "assets/icons/student_add_filled.svg",
//                               inactiveIconSrc:
//                                   "assets/icons/student_add_light.svg",
//                               onPressed: () {
//                                 side.setBarValue('studentAdd');
//                               },
//                             ),
//                             MenuTile(
//                               isSubmenu: true,
//                               isActive: side.sideBarValue == 'classAdd',
//                               title: "Class Add",
//                               activeIconSrc:
//                                   "assets/icons/class_add_filled.svg",
//                               inactiveIconSrc:
//                                   "assets/icons/class_add_light.svg",
//                               onPressed: () {
//                                 side.setBarValue('classAdd');
//                               },
//                             ),
//                             MenuTile(
//                               isSubmenu: true,
//                               isActive: side.sideBarValue == 'booklist',
//                               title: "Book List",
//                               activeIconSrc:
//                                   "assets/icons/book_list_filled.svg",
//                               inactiveIconSrc:
//                                   "assets/icons/book_list_light.svg",
//                               onPressed: () {
//                                 side.setBarValue('booklist');
//                               },
//                             ),
//                             MenuTile(
//                               isSubmenu: true,
//                               isActive: side.sideBarValue == 'calender',
//                               title: "Calendar",
//                               activeIconSrc: "assets/icons/calendar_filled.svg",
//                               inactiveIconSrc:
//                                   "assets/icons/calendar_light.svg",
//                               onPressed: () {
//                                 side.setBarValue('calender');
//                               },
//                             ),
//                             MenuTile(
//                               isSubmenu: true,
//                               isActive: side.sideBarValue == 'routine',
//                               title: "Routine",
//                               activeIconSrc: "assets/icons/routine_filled.svg",
//                               inactiveIconSrc: "assets/icons/routine_light.svg",
//                               onPressed: () {
//                                 side.setBarValue('routine');
//                               },
//                             ),
//                           ],
//                         ),
//                         // Addition
//                         ExpansionTile(
//                           leading: SvgPicture.asset(
//                               "assets/icons/profile_circled_light.svg"),
//                           title: Text(
//                             "Addition",
//                             style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                               color:
//                                   Theme.of(context).textTheme.bodyMedium!.color,
//                             ),
//                           ),
//                           children: [
//                             MenuTile(
//                               isSubmenu: true,
//                               isActive: side.sideBarValue == 'Guardian',
//                               title: "Guardian",
//                               activeIconSrc: "assets/icons/guardian_filled.svg",
//                               inactiveIconSrc:
//                                   "assets/icons/guardian_light.svg",
//                               onPressed: () {
//                                 side.setBarValue('Guardian');
//                               },
//                             ),
//                             MenuTile(
//                               isSubmenu: true,
//                               isActive: side.sideBarValue == 'Magazine',
//                               title: "Magazine",
//                               activeIconSrc: "assets/icons/magazine_filled.svg",
//                               inactiveIconSrc:
//                                   "assets/icons/magazine_light.svg",
//                               onPressed: () {
//                                 side.setBarValue('Magazine');
//                               },
//                             ),
//                             MenuTile(
//                               isSubmenu: true,
//                               isActive: side.sideBarValue == 'Gallery',
//                               title: "Gallery",
//                               activeIconSrc: "assets/icons/gallery_filled.svg",
//                               inactiveIconSrc: "assets/icons/gallery_light.svg",
//                               onPressed: () {
//                                 side.setBarValue('Gallery');
//                               },
//                             ),
//                             MenuTile(
//                               isSubmenu: true,
//                               isActive: side.sideBarValue == 'DigitalLibrary',
//                               title: "Digital Library",
//                               activeIconSrc:
//                                   "assets/icons/digital_library_filled.svg",
//                               inactiveIconSrc:
//                                   "assets/icons/digital_library_light.svg",
//                               onPressed: () {
//                                 side.setBarValue('DigitalLibrary');
//                               },
//                             ),
//                             MenuTile(
//                               isSubmenu: true,
//                               isActive: side.sideBarValue == 'Scholarship',
//                               title: "Scholarship",
//                               activeIconSrc:
//                                   "assets/icons/scholarship_filled.svg",
//                               inactiveIconSrc:
//                                   "assets/icons/scholarship_light.svg",
//                               onPressed: () {
//                                 side.setBarValue('Scholarship');
//                               },
//                             ),
//                             MenuTile(
//                               isSubmenu: true,
//                               isActive: side.sideBarValue == 'Library',
//                               title: "Library",
//                               activeIconSrc: "assets/icons/library_filled.svg",
//                               inactiveIconSrc: "assets/icons/library_light.svg",
//                               onPressed: () {
//                                 side.setBarValue('Library');
//                               },
//                             ),
//                             MenuTile(
//                               isSubmenu: true,
//                               isActive: side.sideBarValue == 'TeachersTraining',
//                               title: "Teachers Training",
//                               activeIconSrc:
//                                   "assets/icons/teacher_training_filled.svg",
//                               inactiveIconSrc:
//                                   "assets/icons/teacher_training_light.svg",
//                               onPressed: () {
//                                 side.setBarValue('TeachersTraining');
//                               },
//                             ),
//                             MenuTile(
//                               isSubmenu: true,
//                               isActive: side.sideBarValue == 'Publication',
//                               title: "Publication",
//                               activeIconSrc:
//                                   "assets/icons/publication_filled.svg",
//                               inactiveIconSrc:
//                                   "assets/icons/publication_light.svg",
//                               onPressed: () {
//                                 side.setBarValue('Publication');
//                               },
//                             ),
//                             MenuTile(
//                               isSubmenu: true,
//                               isActive: side.sideBarValue == 'QuizCompetition',
//                               title: "Quiz Competition",
//                               activeIconSrc:
//                                   "assets/icons/quiz_competition_filled.svg",
//                               inactiveIconSrc:
//                                   "assets/icons/quiz_competition_light.svg",
//                               onPressed: () {
//                                 side.setBarValue('QuizCompetition');
//                               },
//                             ),
//                           ],
//                         ),
//                         // Widget
//                         ExpansionTile(
//                           leading: SvgPicture.asset(
//                               "assets/icons/profile_circled_light.svg"),
//                           title: Text(
//                             "Widget",
//                             style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                               color:
//                                   Theme.of(context).textTheme.bodyMedium!.color,
//                             ),
//                           ),
//                           children: [
//                             MenuTile(
//                               isSubmenu: true,
//                               isActive: side.sideBarValue == 'AdmissionWidget',
//                               title: "Admission Widget",
//                               activeIconSrc:
//                                   "assets/icons/admission_widget_filled.svg",
//                               inactiveIconSrc:
//                                   "assets/icons/admission_widget_light.svg",
//                               onPressed: () {
//                                 side.setBarValue('AdmissionWidget');
//                               },
//                             ),
//                             MenuTile(
//                               isSubmenu: true,
//                               isActive: side.sideBarValue == 'ResultWidget',
//                               title: "Result Widget",
//                               activeIconSrc:
//                                   "assets/icons/result_widget_filled.svg",
//                               inactiveIconSrc:
//                                   "assets/icons/result_widget_light.svg",
//                               onPressed: () {
//                                 side.setBarValue('ResultWidget');
//                               },
//                             ),
//                             MenuTile(
//                               isSubmenu: true,
//                               isActive: side.sideBarValue == 'NoticeWidget',
//                               title: "Notice Widget",
//                               activeIconSrc:
//                                   "assets/icons/notice_widget_filled.svg",
//                               inactiveIconSrc:
//                                   "assets/icons/notice_widget_light.svg",
//                               onPressed: () {
//                                 side.setBarValue('NoticeWidget');
//                               },
//                             ),
//                             MenuTile(
//                               isSubmenu: true,
//                               isActive: side.sideBarValue == 'CircularWidget',
//                               title: "Circular Widget",
//                               activeIconSrc:
//                                   "assets/icons/circular_widget_filled.svg",
//                               inactiveIconSrc:
//                                   "assets/icons/circular_widget_light.svg",
//                               onPressed: () {
//                                 side.setBarValue('CircularWidget');
//                               },
//                             ),
//                             MenuTile(
//                               isSubmenu: true,
//                               isActive: side.sideBarValue == 'ActivityWidget',
//                               title: "Activity Widget",
//                               activeIconSrc:
//                                   "assets/icons/activity_widget_filled.svg",
//                               inactiveIconSrc:
//                                   "assets/icons/activity_widget_light.svg",
//                               onPressed: () {
//                                 side.setBarValue('ActivityWidget');
//                               },
//                             ),
//                             MenuTile(
//                               isSubmenu: true,
//                               isActive: side.sideBarValue == 'ResourceWidget',
//                               title: "Resource Widget",
//                               activeIconSrc:
//                                   "assets/icons/resource_widget_filled.svg",
//                               inactiveIconSrc:
//                                   "assets/icons/resource_widget_light.svg",
//                               onPressed: () {
//                                 side.setBarValue('ResourceWidget');
//                               },
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 //const CustomerInfo(),
//                 const ThemeTabs(),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
