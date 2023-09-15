import 'package:flutter/material.dart';
import 'package:messaging_app/core/colors.dart';
import 'package:messaging_app/features/posts/presentation/widgets/regular_text_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
                backgroundColor: AppColors.primaryThemeColor,
                child: ListView(
                  children: [
                    DrawerHeader(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Colors.grey.withOpacity(0.4),
                                  width: 0.5))),
                      child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  radius: 22.0,
                                  backgroundColor: Colors.grey,
                                ),
                                Icon(
                                  Icons.info_outline_rounded,
                                  color: AppColors.whiteThemeColor,
                                  size: 20.0,
                                )
                              ],
                            ),
                            SizedBox(height: 10.0),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RegularTextWidget(
                                    text: 'User Name',
                                    color: AppColors.whiteThemeColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                                RegularTextWidget(
                                    text: '@tag_name',
                                    color: AppColors.whiteThemeColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.0)
                              ],
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    RegularTextWidget(
                                      text: '3003',
                                      fontSize: 15.0,
                                      color: AppColors.whiteThemeColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    const SizedBox(width: 5.0),
                                    RegularTextWidget(
                                      text: 'Following',
                                      color: AppColors.whiteThemeColor,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 10.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    RegularTextWidget(
                                      text: '64',
                                      fontSize: 15.0,
                                      color: AppColors.whiteThemeColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    const SizedBox(width: 5.0),
                                    RegularTextWidget(
                                      text: 'Followers',
                                      color: AppColors.whiteThemeColor,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ],
                                )
                              ],
                            )
                          ]),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.account_circle,
                        color: AppColors.whiteThemeColor,
                        size: 20.0,
                      ),
                      title: RegularTextWidget(
                          text: 'Profile', color: AppColors.whiteThemeColor),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.account_circle,
                        color: AppColors.whiteThemeColor,
                        size: 20.0,
                      ),
                      title: RegularTextWidget(
                          text: 'Premiun', color: AppColors.whiteThemeColor),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.account_circle,
                        color: AppColors.whiteThemeColor,
                        size: 20.0,
                      ),
                      title: RegularTextWidget(
                          text: 'Bookmarks', color: AppColors.whiteThemeColor),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.account_circle,
                        color: AppColors.whiteThemeColor,
                        size: 20.0,
                      ),
                      title: RegularTextWidget(
                          text: 'Spaces', color: AppColors.whiteThemeColor),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.account_circle,
                        color: AppColors.whiteThemeColor,
                        size: 20.0,
                      ),
                      title: RegularTextWidget(
                          text: 'Monetisation', color: AppColors.whiteThemeColor),
                    ),
                    
                  ],
                ),
              );
  }
}