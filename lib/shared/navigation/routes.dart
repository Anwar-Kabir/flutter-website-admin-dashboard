import 'package:dashboard/pages/add_class/add_class.dart';
import 'package:dashboard/pages/aim_objective/aim_objective.dart';
import 'package:dashboard/pages/ataglance/ataglance.dart';
import 'package:dashboard/pages/authentication/register_page.dart';
import 'package:dashboard/pages/authentication/sign_in_page.dart';
import 'package:dashboard/pages/booklist/booklist.dart';
import 'package:dashboard/pages/calender/calender.dart';
import 'package:dashboard/pages/chairman_message/chairman_message.dart';
import 'package:dashboard/pages/dashboard/dashboard_page.dart';
import 'package:dashboard/pages/entry_point.dart';
import 'package:dashboard/pages/governining_body/governining_body.dart';
import 'package:dashboard/pages/guardian_opinion/guardian_opinion.dart';
import 'package:dashboard/pages/history/history.dart';
import 'package:dashboard/pages/laboratory/laboratory.dart';
import 'package:dashboard/pages/library/library.dart';
import 'package:dashboard/pages/magazine/magazine.dart';
import 'package:dashboard/pages/mission_vision/mission_vision.dart';
import 'package:dashboard/pages/physical_activity/physical_activity.dart';
import 'package:dashboard/pages/scholorship/scholorship.dart';
import 'package:dashboard/pages/special_feature/special_feature.dart';
import 'package:dashboard/pages/sport/sport.dart';
import 'package:dashboard/pages/staff/staff.dart';
import 'package:dashboard/pages/student/student.dart';
import 'package:dashboard/pages/teacher/teacher.dart';
import 'package:dashboard/pages/tour/tour.dart';
import 'package:dashboard/pages/why_choose_us/why_choose_us.dart';
import 'package:go_router/go_router.dart';

final routerConfig = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const EntryPoint(child: DashboardPage()),
    ),
    GoRoute(
      path: '/sign-in',
      builder: (context, state) => const SignInPage(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterPage(),
    ),

    GoRoute(
      path: '/at-a-glance',
      builder: (context, state) => const EntryPoint(child: AtaGlance()),
    ),
    GoRoute(
      path: '/governing-body',
      builder: (context, state) => const EntryPoint(child: GoverniningBody()),
    ),
    GoRoute(
      path: '/chairmanMessage',
      builder: (context, state) => const EntryPoint(child: ChairmanMessage()),
    ),
    GoRoute(
      path: '/missionAndVision',
      builder: (context, state) => const EntryPoint(child: MissionVision()),
    ),
    GoRoute(
      path: '/specialFeature',
      builder: (context, state) => const EntryPoint(child: SpecialFeature()),
    ),
    GoRoute(
      path: '/History',
      builder: (context, state) => const EntryPoint(child: History()),
    ),
    GoRoute(
      path: '/aimAndObjective',
      builder: (context, state) => const EntryPoint(child: AimObjective()),
    ),
    GoRoute(
      path: '/whyChooiseUs',
      builder: (context, state) => const EntryPoint(child: WhyChooseUs()),
    ),
    GoRoute(
      path: '/teacherAdd',
      builder: (context, state) => const EntryPoint(child: Teacher()),
    ),
    GoRoute(
      path: '/staffAdd',
      builder: (context, state) => const EntryPoint(child: Staff()),
    ),
    GoRoute(
      path: '/studentAdd',
      builder: (context, state) => const EntryPoint(child: Student()),
    ),
    GoRoute(
      path: '/classAdd',
      builder: (context, state) => const EntryPoint(child: ClassAdd()),
    ),
    GoRoute(
      path: '/booklist',
      builder: (context, state) => const EntryPoint(child: BookList()),
    ),
    GoRoute(
      path: '/calender',
      builder: (context, state) => const EntryPoint(child: Calender()),
    ),
    GoRoute(
      path: '/routine',
      builder: (context, state) => const EntryPoint(child: Calender()),
    ),
    GoRoute(
      path: '/Guardian',
      builder: (context, state) => const EntryPoint(child: GuardianOpinion()),
    ),
    GoRoute(
      path: '/Magazine',
      builder: (context, state) => const EntryPoint(child: Magazine()),
    ),
    GoRoute(
      path: '/library',
      builder: (context, state) => const EntryPoint(child: Library()),
    ),
    GoRoute(
      path: '/laboratory',
      builder: (context, state) => const EntryPoint(child: Laboratory()),
    ),
    GoRoute(
      path: '/tour',
      builder: (context, state) => const EntryPoint(child: Tour()),
    ),
    GoRoute(
      path: '/sports',
      builder: (context, state) => const EntryPoint(child: Sport()),
    ),
    GoRoute(
      path: '/physicalActivity',
      builder: (context, state) => const EntryPoint(child: PhysicalActivity()),
    ),
    GoRoute(
      path: '/scholorship',
      builder: (context, state) => const EntryPoint(child: Scholorship()),
    ),
    GoRoute(
      path: '/waiver',
      builder: (context, state) => const EntryPoint(child: Scholorship()),
    ),
    GoRoute(
      path: '/debet',
      builder: (context, state) => const EntryPoint(child: Scholorship()),
    ),
    GoRoute(
      path: '/infrastructure',
      builder: (context, state) => const EntryPoint(child: Scholorship()),
    ),
    GoRoute(
      path: '/hotel',
      builder: (context, state) => const EntryPoint(child: Scholorship()),
    ),
    GoRoute(
      path: '/trasport',
      builder: (context, state) => const EntryPoint(child: Scholorship()),
    ),
    GoRoute(
      path: '/video',
      builder: (context, state) => const EntryPoint(child: Scholorship()),
    ),
    GoRoute(
      path: '/imageGrallery',
      builder: (context, state) => const EntryPoint(child: Scholorship()),
    ),
    GoRoute(
      path: '/alumni',
      builder: (context, state) => const EntryPoint(child: Scholorship()),
    ),
    GoRoute(
      path: '/artsandCulture',
      builder: (context, state) => const EntryPoint(child: Scholorship()),
    ),
    GoRoute(
      path: '/canteen',
      builder: (context, state) => const EntryPoint(child: Scholorship()),
    ),
    GoRoute(
      path: '/internet',
      builder: (context, state) => const EntryPoint(child: Scholorship()),
    ),
    GoRoute(
      path: '/contactUs',
      builder: (context, state) => const EntryPoint(child: Scholorship()),
    ),
    GoRoute(
      path: '/setting',
      builder: (context, state) => const EntryPoint(child: Scholorship()),
    ),

    // GoRoute(
    //   path: '/ataglance',
    //   builder: (context, state) => const AtaGlance(),
    // ),

    // GoRoute(
    //   path: '/entry-point',
    //   builder: (context, state) => const EntryPoint(),
    // ),

    // GoRoute(
    //   path: '/forgot-password',
    //   builder: (context, state) => const ForgotPasswordScreen(),
    // ),
    // GoRoute(
    //   path: '/password-confirmation/:email',
    //   builder: (context, state) {
    //     final email = state.pathParameters['email'];
    //     if (email == null) {
    //       throw Exception('Recipe ID is missing');
    //     }
    //     return PasswordConfirmationForm(email: email);
    //   },
    // ),
    // GoRoute(
    //   path: '/resend-email-verification',
    //   builder: (context, state) => const EmailResendScreen(),
    // ),
    // GoRoute(
    //   path: '/user-confirmation/:email',
    //   builder: (context, state) {
    //     final email = state.pathParameters['email'];
    //     if (email == null) {
    //       throw Exception('Recipe ID is missing');
    //     }
    //     return UserConfirmationForm(email: email);
    //   },
    // ),
    // GoRoute(
    //   path: '/favorite',
    //   builder: (context, state) => const FavoriteScreen(),
    // ),
    // GoRoute(
    //   path: '/recipe/:id',
    //   builder: (context, state) {
    //     final id = state.pathParameters['id'];
    //     if (id == null) {
    //       throw Exception('Recipe ID or Favorite state is missing');
    //     }
    //     return RecipeDetailsScreen(
    //       id: id,
    //     );
    //   },
    // ),
    // GoRoute(
    //   path: '/profile',
    //   builder: (context, state) => const ProfileScreen(),
    // ),
    // GoRoute(
    //   path: '/edit-profile',
    //   builder: (context, state) => const EditProfileScreen(),
    // ),
    // GoRoute(
    //   path: '/all-recipes',
    //   builder: (context, state) => const AllRecipesScreen(),
    // ),
    // GoRoute(
    //   path: '/search-recipes',
    //   builder: (context, state) => const SearchScreen(),
    // ),
    // GoRoute(
    //   path: '/notifications',
    //   builder: (context, state) => const NotificationsScreen(),
    // ),
  ],
);


// import 'package:dashboard/pages/entry_point.dart';
// import 'package:dashboard/pages/ataglance/ataglance.dart';
// import 'package:dashboard/pages/governining_body/governining_body.dart';
// import 'package:dashboard/pages/dashboard/dashboard_page.dart';
// import 'package:go_router/go_router.dart';

// final routerConfig = GoRouter(
//   initialLocation: '/',
//   routes: [
//     GoRoute(
//       path: '/',
//       builder: (context, state) => const EntryPoint(child: DashboardPage()),
//     ),
//     GoRoute(
//       path: '/at-a-glance',
//       builder: (context, state) => const EntryPoint(child: AtaGlance()),
//     ),
//     GoRoute(
//       path: '/governing-body',
//       builder: (context, state) => const EntryPoint(child: GoverniningBody()),
//     ),
//     // Add more routes as needed
//   ],
// );
