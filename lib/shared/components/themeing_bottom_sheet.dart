// // ignore_for_file: deprecated_member_use

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:islami_app/providers/my_provider.dart';
// import 'package:islami_app/shared/theme.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:provider/provider.dart';

// class ThemeingBottomSheet extends StatelessWidget {
//   const ThemeingBottomSheet({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var provider = Provider.of<MyProvider>(context);
//     return Container(
//       color: provider.appMode == ThemeMode.light
//           ? MyThemeData.whiteColor
//           : MyThemeData.secondaryColor,
//       height: MediaQuery.of(context).size.height * .4,
//       child: Column(
//         children: [
//           SvgPicture.asset(
//             'assets/images/minusIcon.svg',
//             color: provider.appMode == ThemeMode.light
//                 ? MyThemeData.blackColor
//                 : MyThemeData.whiteColor,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(18.0),
//             child: InkWell(
//               onTap: () {
//                 provider.changeThemeMode(ThemeMode.light);
//               },
//               child: Row(
//                 children: [
//                   Text(
//                     AppLocalizations.of(context)!.settingsThemeingLight,
//                     style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                           color: provider.appMode == ThemeMode.light
//                               ? MyThemeData.primaryColor
//                               : MyThemeData.whiteColor,
//                         ),
//                   ),
//                   const Spacer(),
//                   provider.appMode == ThemeMode.light
//                       ? SvgPicture.asset(
//                           width: 18.0,
//                           'assets/images/rightCheck.svg',
//                           color: provider.appMode == ThemeMode.light
//                               ? MyThemeData.primaryColor
//                               : MyThemeData.darkYellowColor,
//                         )
//                       : const SizedBox.shrink(),
//                 ],
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(18.0),
//             child: InkWell(
//               onTap: () {
//                 provider.changeThemeMode(ThemeMode.dark);
//               },
//               child: Row(
//                 children: [
//                   Text(
//                     AppLocalizations.of(context)!.settingsThemeingDark,
//                     style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                           color: provider.appMode == ThemeMode.dark
//                               ? MyThemeData.darkYellowColor
//                               : MyThemeData.blackColor,
//                         ),
//                   ),
//                   const Spacer(),
//                   provider.appMode == ThemeMode.dark
//                       ? SvgPicture.asset(
//                           width: 18.0,
//                           'assets/images/rightCheck.svg',
//                           color: provider.appMode == ThemeMode.light
//                               ? MyThemeData.primaryColor
//                               : MyThemeData.darkYellowColor,
//                         )
//                       : const SizedBox.shrink(),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
