import 'package:dashboard/controller/side_bar_controller.dart';
import 'package:dashboard/pages/dashboard/widgets/theme_tabs.dart';
import 'package:dashboard/responsive.dart';
import 'package:dashboard/shared/constants/defaults.dart';
import 'package:dashboard/shared/constants/ghaps.dart';
import 'package:dashboard/shared/widgets/sidemenu/customer_info.dart';
import 'package:dashboard/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../constants/config.dart';
import 'menu_tile.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // width: Responsive.isMobile(context) ? double.infinity : null,
      // width: MediaQuery.of(context).size.width < 1300 ? 260 : null,
      child: SafeArea(
        child: Consumer<SideBarController>(builder: (context, side, child) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (Responsive.isMobile(context))
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppDefaults.padding,
                        ),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon:
                              SvgPicture.asset('assets/icons/close_filled.svg'),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppDefaults.padding,
                        vertical: AppDefaults.padding * 1.5,
                      ),
                      child: SvgPicture.asset(AppConfig.logo),
                    ),
                  ],
                ),
                const Divider(),
                gapH16,
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDefaults.padding,
                    ),
                    child: ListView(
                      children: [
                        MenuTile(
                          isActive: true,
                          title: "Home",
                          activeIconSrc: "assets/icons/home_filled.svg",
                          inactiveIconSrc: "assets/icons/home_light.svg",
                          onPressed: () {
                            //side.setBarValue('Home');
                            Provider.of<SideBarController>(context,
                                    listen: false)
                                .setBarValue(context, 'Dashboard');
                          },
                        ),
                        //basic
                        ExpansionTile(
                          leading: SvgPicture.asset(
                              "assets/icons/diamond_light.svg"),
                          title: Text(
                            "Basic",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color:
                                  Theme.of(context).textTheme.bodyMedium!.color,
                            ),
                          ),
                          children: [
                            MenuTile(
                              isSubmenu: true,
                              title: "At a Glance",
                              isActive: side.sideBarValue == 'atAGlancet',
                              activeIconSrc: "assets/icons/diamond_filled.svg",
                              inactiveIconSrc: "assets/icons/diamond_light.svg",
                              onPressed: () {
                                //side.setBarValue('atAGlancet');
                                Provider.of<SideBarController>(context,
                                        listen: false)
                                    .setBarValue(context, 'atAGlancet');
                              },
                            ),
                            MenuTile(
                              isSubmenu: true,
                              title: "Goverment Body",
                              isActive: side.sideBarValue == 'govermentBody',
                              activeIconSrc:
                                  "assets/icons/goverment_body_filled.svg",
                              inactiveIconSrc:
                                  "assets/icons/goverment_body_light.svg",
                              count: 16,
                              onPressed: () {
                                //side.setBarValue('govermentBody');
                                Provider.of<SideBarController>(context,
                                        listen: false)
                                    .setBarValue(context, 'govermentBody');
                              },
                            ),
                            MenuTile(
                              isSubmenu: true,
                              title: "Chairman Message",
                              isActive: side.sideBarValue == 'chairmanMessage',
                              activeIconSrc: "assets/icons/chairman_filled.svg",
                              inactiveIconSrc:
                                  "assets/icons/chairman_light.svg",
                              onPressed: () {
                                // side.setBarValue('chairmanMessage');
                                Provider.of<SideBarController>(context,
                                        listen: false)
                                    .setBarValue(context, 'chairmanMessage');
                              },
                            ),
                            MenuTile(
                              isSubmenu: true,
                              title: "Mission and Vision",
                              isActive: side.sideBarValue == 'missionAndVision',
                              activeIconSrc: "assets/icons/mission_filled.svg",
                              inactiveIconSrc: "assets/icons/mission_light.svg",
                              onPressed: () {
                                //side.setBarValue('missionAndVision');
                                Provider.of<SideBarController>(context,
                                        listen: false)
                                    .setBarValue(context, 'missionAndVision');
                              },
                            ),
                            MenuTile(
                              isSubmenu: true,
                              title: "Special Feature",
                              isActive: side.sideBarValue == 'specialFeature',
                              activeIconSrc:
                                  "assets/icons/special_feature_filled.svg",
                              inactiveIconSrc:
                                  "assets/icons/special_feature_light.svg",
                              onPressed: () {
                                //side.setBarValue('specialFeature');
                                Provider.of<SideBarController>(context,
                                        listen: false)
                                    .setBarValue(context, 'specialFeature');
                              },
                            ),
                            MenuTile(
                              isSubmenu: true,
                              title: "History",
                              isActive: side.sideBarValue == 'History',
                              activeIconSrc: "assets/icons/history_filled.svg",
                              inactiveIconSrc: "assets/icons/history_light.svg",
                              onPressed: () {
                                //side.setBarValue('History');
                                Provider.of<SideBarController>(context,
                                        listen: false)
                                    .setBarValue(context, 'History');
                              },
                            ),
                            MenuTile(
                              isSubmenu: true,
                              title: "Aim And Objective",
                              isActive: side.sideBarValue == 'aimAndObjective',
                              activeIconSrc: "assets/icons/aim_filled.svg",
                              inactiveIconSrc: "assets/icons/aim_light.svg",
                              onPressed: () {
                                //side.setBarValue('aimAndObjective');
                                Provider.of<SideBarController>(context,
                                        listen: false)
                                    .setBarValue(context, 'aimAndObjective');
                              },
                            ),
                            MenuTile(
                              isSubmenu: true,
                              title: "Why Chooise us",
                              isActive: side.sideBarValue == 'whyChooiseUs',
                              activeIconSrc:
                                  "assets/icons/why_choose_us_filled.svg",
                              inactiveIconSrc:
                                  "assets/icons/why_choose_us_light.svg",
                              onPressed: () {
                                //side.setBarValue('whyChooiseUs');
                                Provider.of<SideBarController>(context,
                                        listen: false)
                                    .setBarValue(context, 'whyChooiseUs');
                              },
                            ),
                          ],
                        ),

                        // primary
                        ExpansionTile(
                          leading: SvgPicture.asset(
                              "assets/icons/profile_circled_light.svg"),
                          title: Text(
                            "Primary",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color:
                                  Theme.of(context).textTheme.bodyMedium!.color,
                            ),
                          ),
                          children: [
                            MenuTile(
                              isSubmenu: true,
                              title: "Teacher Add",
                              isActive: side.sideBarValue == 'teacherAdd',
                              activeIconSrc:
                                  "assets/icons/teacher_add_filled.svg",
                              inactiveIconSrc:
                                  "assets/icons/teacher_add_light.svg",
                              onPressed: () {
                                //side.setBarValue('teacherAdd');
                                Provider.of<SideBarController>(context,
                                        listen: false)
                                    .setBarValue(context, 'teacherAdd');
                              },
                            ),
                            MenuTile(
                              isSubmenu: true,
                              title: "Staff Add",
                              isActive: side.sideBarValue == 'staffAdd',
                              activeIconSrc:
                                  "assets/icons/staff_add_filled.svg",
                              inactiveIconSrc:
                                  "assets/icons/staff_add_light.svg",
                              count: 16,
                              onPressed: () {
                                // side.setBarValue('staffAdd');
                                Provider.of<SideBarController>(context,
                                        listen: false)
                                    .setBarValue(context, 'staffAdd');
                              },
                            ),
                            MenuTile(
                              isSubmenu: true,
                              title: "Student Add",
                              isActive: side.sideBarValue == 'studentAdd',
                              activeIconSrc:
                                  "assets/icons/student_add_filled.svg",
                              inactiveIconSrc:
                                  "assets/icons/student_add_light.svg",
                              onPressed: () {
                                //side.setBarValue('studentAdd');
                                Provider.of<SideBarController>(context,
                                        listen: false)
                                    .setBarValue(context, 'studentAdd');
                              },
                            ),
                            MenuTile(
                              isSubmenu: true,
                              title: "Class Add",
                              isActive: side.sideBarValue == 'classAdd',
                              activeIconSrc:
                                  "assets/icons/class_add_filled.svg",
                              inactiveIconSrc:
                                  "assets/icons/class_add_light.svg",
                              onPressed: () {
                                // side.setBarValue('classAdd');
                                Provider.of<SideBarController>(context,
                                        listen: false)
                                    .setBarValue(context, 'classAdd');
                              },
                            ),
                            MenuTile(
                              isSubmenu: true,
                              title: "Book list",
                              isActive: side.sideBarValue == 'booklist',
                              activeIconSrc:
                                  "assets/icons/book_list_filled.svg",
                              inactiveIconSrc:
                                  "assets/icons/book_list_light.svg",
                              onPressed: () {
                                //side.setBarValue('booklist');
                                Provider.of<SideBarController>(context,
                                        listen: false)
                                    .setBarValue(context, 'booklist');
                              },
                            ),
                            MenuTile(
                              isSubmenu: true,
                              title: "Calender",
                              isActive: side.sideBarValue == 'calender',
                              activeIconSrc: "assets/icons/calendar_filled.svg",
                              inactiveIconSrc:
                                  "assets/icons/calendar_light.svg",
                              onPressed: () {
                                //side.setBarValue('calender');
                                Provider.of<SideBarController>(context,
                                        listen: false)
                                    .setBarValue(context, 'calender');
                              },
                            ),
                            MenuTile(
                              isSubmenu: true,
                              title: "Routine",
                              isActive: side.sideBarValue == 'routine',
                              activeIconSrc: "assets/icons/routine_filled.svg",
                              inactiveIconSrc: "assets/icons/routine_light.svg",
                              onPressed: () {
                                //side.setBarValue('routine');
                                Provider.of<SideBarController>(context,
                                        listen: false)
                                    .setBarValue(context, 'routine');
                              },
                            ),
                          ],
                        ),
                        //addition
                        ExpansionTile(
                          leading: SvgPicture.asset(
                              "assets/icons/profile_circled_light.svg"),
                          title: Text(
                            "Addition",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color:
                                  Theme.of(context).textTheme.bodyMedium!.color,
                            ),
                          ),
                          children: [
                            MenuTile(
                              isSubmenu: true,
                              title: "Guardian",
                              isActive: side.sideBarValue == 'Guardian',
                              activeIconSrc: "assets/icons/guardian_filled.svg",
                              inactiveIconSrc:
                                  "assets/icons/guardian_light.svg",
                              onPressed: () {
                                // side.setBarValue('Guardian');
                                Provider.of<SideBarController>(context,
                                        listen: false)
                                    .setBarValue(context, 'Guardian');
                              },
                            ),
                            MenuTile(
                              isSubmenu: true,
                              title: "Magazine",
                              isActive: side.sideBarValue == 'Magazine',
                              activeIconSrc: "assets/icons/magazine_filled.svg",
                              inactiveIconSrc:
                                  "assets/icons/magazine_light.svg",
                              onPressed: () {
                                // side.setBarValue('Magazine');
                                Provider.of<SideBarController>(context,
                                        listen: false)
                                    .setBarValue(context, 'Magazine');
                              },
                            ),
                            MenuTile(
                              isSubmenu: true,
                              title: "Library",
                              isActive: side.sideBarValue == 'library',
                              activeIconSrc: "assets/icons/magazine_filled.svg",
                              inactiveIconSrc:
                                  "assets/icons/magazine_light.svg",
                              count: 16,
                              onPressed: () {
                                // side.setBarValue('library');
                                Provider.of<SideBarController>(context,
                                        listen: false)
                                    .setBarValue(context, 'library');
                              },
                            ),
                            MenuTile(
                              isSubmenu: true,
                              title: "Laboratory",
                              isActive: side.sideBarValue == 'laboratory',
                              activeIconSrc: "assets/icons/magazine_filled.svg",
                              inactiveIconSrc:
                                  "assets/icons/magazine_light.svg",
                              onPressed: () {
                                // side.setBarValue('laboratory');
                                Provider.of<SideBarController>(context,
                                        listen: false)
                                    .setBarValue(context, 'laboratory');
                              },
                            ),
                            MenuTile(
                              isSubmenu: true,
                              title: "Tour",
                              isActive: side.sideBarValue == 'tour',
                              activeIconSrc: "assets/icons/magazine_filled.svg",
                              inactiveIconSrc:
                                  "assets/icons/magazine_light.svg",
                              onPressed: () {
                                // side.setBarValue('tour');
                                Provider.of<SideBarController>(context,
                                        listen: false)
                                    .setBarValue(context, 'tour');
                              },
                            ),
                            MenuTile(
                              isSubmenu: true,
                              title: "Sports",
                              isActive: side.sideBarValue == 'sports',
                              activeIconSrc: "assets/icons/magazine_filled.svg",
                              inactiveIconSrc:
                                  "assets/icons/magazine_light.svg",
                              onPressed: () {
                                // side.setBarValue('sports');
                                Provider.of<SideBarController>(context,
                                        listen: false)
                                    .setBarValue(context, 'sports');
                              },
                            ),
                            MenuTile(
                              isSubmenu: true,
                              title: "Physical Activity",
                              isActive: side.sideBarValue == 'physicalActivity',
                              activeIconSrc: "assets/icons/magazine_filled.svg",
                              inactiveIconSrc:
                                  "assets/icons/magazine_light.svg",
                              onPressed: () {
                                // side.setBarValue('physicalActivity');
                                Provider.of<SideBarController>(context,
                                        listen: false)
                                    .setBarValue(context, 'physicalActivity');
                              },
                            ),
                            MenuTile(
                              isSubmenu: true,
                              title: "Scholorship",
                              isActive: side.sideBarValue == 'scholorship',
                              activeIconSrc: "assets/icons/magazine_filled.svg",
                              inactiveIconSrc:
                                  "assets/icons/magazine_light.svg",
                              onPressed: () {
                                // side.setBarValue('scholorship');
                                Provider.of<SideBarController>(context,
                                        listen: false)
                                    .setBarValue(context, 'scholorship');
                              },
                            ),
                            MenuTile(
                              isSubmenu: true,
                              title: "Waiver",
                              isActive: side.sideBarValue == 'waiver',
                              activeIconSrc: "assets/icons/magazine_filled.svg",
                              inactiveIconSrc:
                                  "assets/icons/magazine_light.svg",
                              onPressed: () {
                                // side.setBarValue('waiver');
                                Provider.of<SideBarController>(context,
                                        listen: false)
                                    .setBarValue(context, 'waiver');
                              },
                            ),
                            MenuTile(
                              isSubmenu: true,
                              title: "Debet",
                              isActive: side.sideBarValue == 'debet',
                              activeIconSrc: "assets/icons/magazine_filled.svg",
                              inactiveIconSrc:
                                  "assets/icons/magazine_light.svg",
                              onPressed: () {
                                // side.setBarValue('debet');
                                Provider.of<SideBarController>(context,
                                        listen: false)
                                    .setBarValue(context, 'debet');
                              },
                            ),
                            MenuTile(
                              isSubmenu: true,
                              title: "infrastructure",
                              isActive: side.sideBarValue == 'infrastructure',
                              activeIconSrc: "assets/icons/magazine_filled.svg",
                              inactiveIconSrc:
                                  "assets/icons/magazine_light.svg",
                              onPressed: () {
                                // side.setBarValue('infrastructure');
                                Provider.of<SideBarController>(context,
                                        listen: false)
                                    .setBarValue(context, 'infrastructure');
                              },
                            ),
                            MenuTile(
                              isSubmenu: true,
                              title: "Hotel",
                              isActive: side.sideBarValue == 'hotel',
                              activeIconSrc: "assets/icons/magazine_filled.svg",
                              inactiveIconSrc:
                                  "assets/icons/magazine_light.svg",
                              onPressed: () {
                                // side.setBarValue('hotel');
                                Provider.of<SideBarController>(context,
                                        listen: false)
                                    .setBarValue(context, 'hotel');
                              },
                            ),
                            MenuTile(
                              isSubmenu: true,
                              title: "Trasport",
                              isActive: side.sideBarValue == 'trasport',
                              activeIconSrc: "assets/icons/magazine_filled.svg",
                              inactiveIconSrc:
                                  "assets/icons/magazine_light.svg",
                              onPressed: () {
                                //side.setBarValue('trasport');
                                Provider.of<SideBarController>(context,
                                        listen: false)
                                    .setBarValue(context, 'trasport');
                              },
                            ),
                            MenuTile(
                              isSubmenu: true,
                              title: "Video",
                              isActive: side.sideBarValue == 'video',
                              activeIconSrc: "assets/icons/magazine_filled.svg",
                              inactiveIconSrc:
                                  "assets/icons/magazine_light.svg",
                              onPressed: () {
                                // side.setBarValue('video');
                                Provider.of<SideBarController>(context,
                                        listen: false)
                                    .setBarValue(context, 'video');
                              },
                            ),
                            MenuTile(
                              isSubmenu: true,
                              title: "Image Grallery",
                              isActive: side.sideBarValue == 'imageGrallery',
                              activeIconSrc: "assets/icons/magazine_filled.svg",
                              inactiveIconSrc:
                                  "assets/icons/magazine_light.svg",
                              onPressed: () {
                                // side.setBarValue('imageGrallery');
                                Provider.of<SideBarController>(context,
                                        listen: false)
                                    .setBarValue(context, 'imageGrallery');
                              },
                            ),
                            MenuTile(
                              isSubmenu: true,
                              title: "Alumni",
                              isActive: side.sideBarValue == 'alumni',
                              activeIconSrc: "assets/icons/magazine_filled.svg",
                              inactiveIconSrc:
                                  "assets/icons/magazine_light.svg",
                              onPressed: () {
                                //side.setBarValue('alumni');
                                Provider.of<SideBarController>(context,
                                        listen: false)
                                    .setBarValue(context, 'alumni');
                              },
                            ),
                            MenuTile(
                              isSubmenu: true,
                              title: "Arts and Culture",
                              isActive: side.sideBarValue == 'artsandCulture',
                              activeIconSrc: "assets/icons/magazine_filled.svg",
                              inactiveIconSrc:
                                  "assets/icons/magazine_light.svg",
                              onPressed: () {
                                // side.setBarValue('artsandCulture');
                                Provider.of<SideBarController>(context,
                                        listen: false)
                                    .setBarValue(context, 'artsandCulture');
                              },
                            ),
                            MenuTile(
                              isSubmenu: true,
                              title: "Canteen",
                              isActive: side.sideBarValue == 'canteen',
                              activeIconSrc: "assets/icons/magazine_filled.svg",
                              inactiveIconSrc:
                                  "assets/icons/magazine_light.svg",
                              onPressed: () {
                                // side.setBarValue('canteen');
                                Provider.of<SideBarController>(context,
                                        listen: false)
                                    .setBarValue(context, 'canteen');
                              },
                            ),
                            MenuTile(
                              isSubmenu: true,
                              title: "Internet",
                              isActive: side.sideBarValue == 'internet',
                              activeIconSrc: "assets/icons/magazine_filled.svg",
                              inactiveIconSrc:
                                  "assets/icons/magazine_light.svg",
                              onPressed: () {
                                // side.setBarValue('internet');
                                Provider.of<SideBarController>(context,
                                        listen: false)
                                    .setBarValue(context, 'internet');
                              },
                            ),
                          ],
                        ),
                        MenuTile(
                          title: "Contact us",
                          isActive: side.sideBarValue == 'contactUs',
                          activeIconSrc: "assets/icons/store_light.svg",
                          inactiveIconSrc: "assets/icons/store_filled.svg",
                          onPressed: () {
                            // side.setBarValue('contactUs');
                            Provider.of<SideBarController>(context,
                                    listen: false)
                                .setBarValue(context, 'contactUs');
                          },
                        ),
                        MenuTile(
                          title: "Setting",
                          isActive: side.sideBarValue == 'setting',
                          activeIconSrc: "assets/icons/store_light.svg",
                          inactiveIconSrc: "assets/icons/store_filled.svg",
                          onPressed: () {
                            // side.setBarValue('setting');
                            Provider.of<SideBarController>(context,
                                    listen: false)
                                .setBarValue(context, 'setting');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(AppDefaults.padding),
                  child: Column(
                    children: [
                      if (Responsive.isMobile(context))
                        const CustomerInfo(
                          name: 'Tran Mau Tri Tam',
                          designation: 'Visual Designer',
                          imageSrc:
                              'https://cdn.create.vista.com/api/media/small/339818716/stock-photo-doubtful-hispanic-man-looking-with-disbelief-expression',
                        ),
                      gapH8,
                      const Divider(),
                      gapH8,
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/help_light.svg',
                            height: 24,
                            width: 24,
                            colorFilter: const ColorFilter.mode(
                              AppColors.textLight,
                              BlendMode.srcIn,
                            ),
                          ),
                          gapW8,
                          Text(
                            'Help & getting started',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                          const Spacer(),
                          Chip(
                            backgroundColor: AppColors.secondaryLavender,
                            side: BorderSide.none,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 0.5),
                            label: Text(
                              "8",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                      gapH20,
                      const ThemeTabs(),
                      gapH8,
                    ],
                  ),
                )
              ]);
        }),
      ),
    );
  }
}
        
  
 











// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:dashboard/controller/side_bar_controller.dart';

// class Sidebar extends StatelessWidget {
//   const Sidebar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         children: [
//           ListTile(
//             title: const Text('Dashboard'),
//             onTap: () {
//               Provider.of<SideBarController>(context, listen: false)
//                   .setBarValue(context, 'Dashboard');
//             },
//           ),
//           ListTile(
//             title: const Text('At a Glance'),
//             onTap: () {
//               Provider.of<SideBarController>(context, listen: false)
//                   .setBarValue(context, 'atAGlancet');
//             },
//           ),
//           ListTile(
//             title: const Text('Governing Body'),
//             onTap: () {
//               Provider.of<SideBarController>(context, listen: false)
//                   .setBarValue(context, 'govermentBody');
//             },
//           ),
//           // Add more navigation items as needed
//         ],
//       ),
//     );
//   }
// }


 
 