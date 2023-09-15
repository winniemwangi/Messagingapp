import 'package:flutter/material.dart';
import 'package:messaging_app/core/colors.dart';
import 'package:messaging_app/features/posts/data/data_source.dart/remote_data_source.dart';
import 'package:messaging_app/features/posts/data/models/post_model.dart';
import 'package:messaging_app/features/posts/domain/repositories/post_repository.dart';
import 'package:messaging_app/features/posts/domain/use_cases/fetch_post_use_cases.dart';
import 'package:messaging_app/features/posts/presentation/widgets/regular_text_widget.dart';
import 'package:page_transition/page_transition.dart';

import 'edit_view.dart';

class HomeView extends StatefulWidget {
  final FetchActualRepository fetchActualRepositoryUseCase;
  const HomeView({super.key, required this.fetchActualRepositoryUseCase});

  @override
  State<HomeView> createState() => _HomeViewState();
}

// class NavigationDrawer extends StatelessWidget{
//   const NavigationDrawer({Key? key}) : super(key: key)
//   @override
//   Widget build(BuildContext context) => const Drawer();
// }
// @override
//   Widget build(BuildContext) => const Scaffold(
//         drawer: NavigationDrawer(),
//       );

// class _MyHomePageState extends State<MyHomePage> {
//   int _selectedIndex = 0;
//   static const TextStyle optionStyle =
//       TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
//   static const List<Widget> _widgetOptions = <Widget>[
//     Text(
//       'Index 0: Profile',
//       style: optionStyle,
//     ),
//     Text(
//       'Index 1: Premium',
//       style: optionStyle,
//     ),
//     Text(
//       'Index 2: Bookmarks',
//       style: optionStyle,
//     ),
//     Text(
//       'Index 2: Lists',
//       style: optionStyle,
//     ),
//     Text(
//       'Index 2: Spaces',
//       style: optionStyle,
//     ),
//     Text(
//       'Index 2: Monetisation',
//       style: optionStyle,
//     ),
//   ];
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(widget.title)),
//       body: Center(
//         child: _widgetOptions[_selectedIndex],
//       ),
//       drawer: Drawer(
//         // Add a ListView to the drawer. This ensures the user can scroll
//         // through the options in the drawer if there isn't enough vertical
//         // space to fit everything.
//         child: ListView(
//           // Important: Remove any padding from the ListView.
//           padding: EdgeInsets.zero,
//           children: [
//             const DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//               ),
//               child: Text('Drawer Header'),
//             ),
//             ListTile(
//               title: const Text('Home'),
//               selected: _selectedIndex == 0,
//               onTap: () {
//                 // Update the state of the app
//                 _onItemTapped(0);
//                 // Then close the drawer
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               title: const Text('Business'),
//               selected: _selectedIndex == 1,
//               onTap: () {
//                 // Update the state of the app
//                 _onItemTapped(1);
//                 // Then close the drawer
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               title: const Text('School'),
//               selected: _selectedIndex == 2,
//               onTap: () {
//                 // Update the state of the app
//                 _onItemTapped(2);
//                 // Then close the drawer
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class _HomeViewState extends State<HomeView> {
  late Future<List<Post>> postListFuture = RemoteDataSource().getPosts();
  
  bool isLoading = false;

  @override
  void initState() {
    postListFuture = widget.fetchActualRepositoryUseCase.execute();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return FutureBuilder<List<Post>>(
        future: postListFuture,
        builder: (context, AsyncSnapshot<List<Post>> asyncSnapshot) {
          if (asyncSnapshot.hasData) {
            const regularTextWidget = RegularTextWidget(
              text: 'Messaging App',
              color: AppColors.whiteThemeColor,
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            );
            return Stack(
              children: [
                Scaffold(
                  backgroundColor: AppColors.primaryThemeColor,
                  drawer: Drawer(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                        text: 'John Doe',
                                        color: AppColors.whiteThemeColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0),
                                    RegularTextWidget(
                                        text: '@john_doe',
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        RegularTextWidget(
                                          text: '3003',
                                          fontSize: 15.0,
                                          color: AppColors.whiteThemeColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        SizedBox(width: 5.0),
                                        RegularTextWidget(
                                          text: 'Following',
                                          color: AppColors.whiteThemeColor,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 10.0),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        RegularTextWidget(
                                          text: '64',
                                          fontSize: 15.0,
                                          color: AppColors.whiteThemeColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        SizedBox(width: 5.0),
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
                        const ListTile(
                          leading: Icon(
                            Icons.account_circle,
                            color: AppColors.whiteThemeColor,
                            size: 20.0,
                          ),
                          title: RegularTextWidget(
                              text: 'Profile',
                              color: AppColors.whiteThemeColor),
                        ),
                        const ListTile(
                          leading: Icon(
                            Icons.close,
                            color: AppColors.whiteThemeColor,
                            size: 20.0,
                          ),
                          title: RegularTextWidget(
                              text: 'Premium',
                              color: AppColors.whiteThemeColor),
                        ),
                        const ListTile(
                          leading: Icon(
                            Icons.bookmark,
                            color: AppColors.whiteThemeColor,
                            size: 20.0,
                          ),
                          title: RegularTextWidget(
                              text: 'Bookmarks',
                              color: AppColors.whiteThemeColor),
                        ),
                        const ListTile(
                          leading: Icon(
                            Icons.list_alt,
                            color: AppColors.whiteThemeColor,
                            size: 20.0,
                          ),
                          title: RegularTextWidget(
                              text: 'Lists',
                              color: AppColors.whiteThemeColor),
                        ),
                        const ListTile(
                          leading: Icon(
                            Icons.keyboard_voice,
                            color: AppColors.whiteThemeColor,
                            size: 20.0,
                          ),
                          title: RegularTextWidget(
                              text: 'Spaces',
                              color: AppColors.whiteThemeColor),
                        ),
                        const ListTile(
                          leading: Icon(
                            Icons.money,
                            color: AppColors.whiteThemeColor,
                            size: 20.0,
                          ),
                          title: RegularTextWidget(
                              text: 'Monetisation',
                              color: AppColors.whiteThemeColor),
                        )
                      ],
                    ),
                  ),
                  appBar: AppBar(
                    backgroundColor: AppColors.primaryThemeColor,
                    iconTheme:
                        const IconThemeData(color: AppColors.whiteThemeColor),
                    // automaticallyImplyLeading: false,
                    elevation: 2.0,
                    centerTitle: true,
                    title: regularTextWidget,
                  ),
                  body: Center(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Column(
                          children: [
                            FutureBuilder<List<Post>>(
                              future: postListFuture,
                              builder: (context,
                                  AsyncSnapshot<List<Post>> snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                      itemCount: snapshot.data!.length,
                                      physics: const ClampingScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder: (context, int index) {
                                        return SizedBox(
                                          height: 150.0,
                                          width: size.width,
                                          child: Column(children: [
                                            const Divider(
                                              color: AppColors.whiteThemeColor,
                                              height: 1.4,
                                            ),
                                            const SizedBox(
                                              height: 10.0,
                                            ),
                                            Flexible(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    width: 200.0,
                                                    child: RegularTextWidget(
                                                      text: snapshot
                                                          .data![index].title
                                                          .toString(),
                                                      color: AppColors
                                                          .whiteThemeColor,
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      showModalBottomSheet(
                                                          context: context,
                                                          isDismissible: true,
                                                          builder: (context) {
                                                            return StatefulBuilder(
                                                                builder: (context,
                                                                    innerState) {
                                                              return SafeArea(
                                                                  child:
                                                                      SizedBox(
                                                                height: 200,
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          10.0),
                                                                  child: Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        const SizedBox(
                                                                          height:
                                                                              8.0,
                                                                        ),
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.end,
                                                                          children: [
                                                                            InkWell(
                                                                                onTap: () {
                                                                                  Navigator.of(context).pop();
                                                                                },
                                                                                child: const Icon(
                                                                                  Icons.cancel_outlined,
                                                                                  color: AppColors.primaryThemeColor,
                                                                                )),
                                                                          ],
                                                                        ),
                                                                        const RegularTextWidget(
                                                                          text:
                                                                              'Manage Post',
                                                                          color:
                                                                              AppColors.primaryThemeColor,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets
                                                                              .only(
                                                                              top: 10.0),
                                                                          child:
                                                                              InkWell(
                                                                            onTap:
                                                                                () {
                                                                              Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                      child: EditView(
                                                                                        snapshot.data![index].title.toString, title:'title',
                                                                                        snapshot.data![index].body.toString, body: 'body',
                                                                                      ),
                                                                                      type: PageTransitionType.bottomToTop));
                                                                            },
                                                                            child:
                                                                                const RegularTextWidget(
                                                                              text: 'Edit post',
                                                                              color: AppColors.primaryThemeColor,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        const Divider(
                                                                            color:
                                                                                AppColors.blackThemeColor),
                                                                        InkWell(
                                                                          onTap:
                                                                              () {
                                                                            print('Deleting data...');
                                                                            RemoteDataSource().deletePost(index.toString()).then((value) {
                                                                              print(value);
                                                                              Navigator.of(context).pop();
                                                                              setState(() {});
                                                                            });
                                                                          },
                                                                          child:
                                                                              const Padding(
                                                                            padding:
                                                                                EdgeInsets.only(top: 10.0),
                                                                            child:
                                                                                RegularTextWidget(
                                                                              text: 'Delete post',
                                                                              color: AppColors.blackThemeColor,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        const Divider(
                                                                            color:
                                                                                AppColors.blackThemeColor),
                                                                      ]),
                                                                ),
                                                              ));
                                                            });
                                                          });
                                                    },
                                                    child: const Icon(
                                                      Icons.more_vert,
                                                      color: AppColors
                                                          .whiteThemeColor,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10.0,
                                            ),
                                            RegularTextWidget(
                                              text: snapshot.data![index].body
                                                  .toString(),
                                              color: AppColors.whiteThemeColor,
                                            ),
                                          ]),
                                        );
                                      });
                                } else if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const CircularProgressIndicator(
                                    color: AppColors.whiteThemeColor,
                                  );
                                } else {
                                  return const Center(
                                      child: RegularTextWidget(
                                          text: 'No Posts Available '));
                                }
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  floatingActionButton: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: AppColors.secondaryThemeColor,
                      child: const Icon(
                        Icons.edit,
                        color: AppColors.whiteThemeColor,
                      ),
                    ),
                  ),
                ),
                isLoading
                    ? const Positioned(
                        left: 50.0,
                        right: 50.0,
                        top: 50.0,
                        bottom: 50.0,
                        child: SizedBox(
                          child: Center(
                              child: CircularProgressIndicator(
                            color: AppColors.whiteThemeColor,
                          )),
                        ),
                      )
                    : const SizedBox()
              ],
            );
          } else {
            return const Scaffold(
              backgroundColor: AppColors.primaryThemeColor,
              body: Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        color: AppColors.whiteThemeColor,
                      )
                    ]),
              ),
            );
          }
        });
  }
}
