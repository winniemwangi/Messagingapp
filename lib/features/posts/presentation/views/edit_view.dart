import 'package:flutter/material.dart';
import 'package:messaging_app/core/colors.dart';
import 'package:messaging_app/features/posts/presentation/widgets/regular_text_widget.dart';

class EditView extends StatefulWidget {
  final String title;
  final String body;
  const EditView(String Function() toString, String Function(), {super.key, required this.title, required this.body});

  @override
  State<EditView> createState() => _EditViewState();
}

class _EditViewState extends State<EditView> {
  final TextEditingController titleEditController = TextEditingController();
  final TextEditingController bodyEditController = TextEditingController();

  @override
  void dispose() {
    titleEditController.dispose();
    bodyEditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: RegularTextWidget(text: 'Edit ${widget.title}'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                const RegularTextWidget(
                  text: 'Title',
                  color: AppColors.blackThemeColor,
                ),
                SizedBox(
                  height: 50.0,
                  child: TextField(
                    controller:  titleEditController,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const RegularTextWidget(
                  text: 'Body',
                  color: AppColors.blackThemeColor,
                ),
                SizedBox(
                  height: 60.0,
                  child: TextField(
                    controller:  bodyEditController,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  // style: ButtonStyle(elevation: MaterialStateProperty(12.0 )),
                  style: ElevatedButton.styleFrom(
                      elevation: 15.0,
                      textStyle: const TextStyle(color: AppColors.whiteThemeColor)),
                  child: const Text('Post'),
                )
              ],
              
            )),
      ),
    );
  }
}
