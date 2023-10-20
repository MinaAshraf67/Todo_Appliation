// // ignore_for_file: use_key_in_widget_constructors

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:islami_app/providers/my_provider.dart';
// import 'package:islami_app/shared/theme.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// // ignore: must_be_immutable
// class LanguageBottomSheet extends StatelessWidget {
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
//             // ignore: deprecated_member_use
//             color: provider.appMode == ThemeMode.light
//                 ? MyThemeData.blackColor
//                 : MyThemeData.whiteColor,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(18.0),
//             child: InkWell(
//               onTap: () {
//                 provider.changeLanguage("en");
//               },
//               child: Row(
//                 children: [
//                   Text(
//                     AppLocalizations.of(context)!.settingsLanguageEn,
//                     style: provider.appMode == ThemeMode.light
//                         ? Theme.of(context).textTheme.bodySmall?.copyWith(
//                               color: provider.isoCode == 'en'
//                                   ? MyThemeData.primaryColor
//                                   : MyThemeData.blackColor,
//                             )
//                         : Theme.of(context).textTheme.bodySmall?.copyWith(
//                               color: provider.isoCode == 'en'
//                                   ? MyThemeData.darkYellowColor
//                                   : MyThemeData.whiteColor,
//                             ),
//                   ),
//                   const Spacer(),
//                   provider.isoCode == "en"
//                       ? SvgPicture.asset(
//                           width: 18.0,
//                           'assets/images/rightCheck.svg',
//                           // ignore: deprecated_member_use
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
//                 provider.changeLanguage("ar");
//               },
//               child: Row(
//                 children: [
//                   Text(
//                     AppLocalizations.of(context)!.settingsLanguageAr,
//                     style: provider.appMode == ThemeMode.light
//                         ? Theme.of(context).textTheme.bodySmall?.copyWith(
//                               color: provider.isoCode == 'ar'
//                                   ? MyThemeData.primaryColor
//                                   : MyThemeData.blackColor,
//                             )
//                         : Theme.of(context).textTheme.bodySmall?.copyWith(
//                               color: provider.isoCode == 'ar'
//                                   ? MyThemeData.darkYellowColor
//                                   : MyThemeData.whiteColor,
//                             ),
//                   ),
//                   const Spacer(),
//                   provider.isoCode == "en"
//                       ? const SizedBox.shrink()
//                       : SvgPicture.asset(
//                           width: 18.0,
//                           'assets/images/rightCheck.svg',
//                           // ignore: deprecated_member_use
//                           color: provider.appMode == ThemeMode.light
//                               ? MyThemeData.primaryColor
//                               : MyThemeData.darkYellowColor,
//                         )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
