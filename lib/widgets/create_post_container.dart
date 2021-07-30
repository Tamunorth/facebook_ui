import 'package:facebook_ui_clone/models/models.dart';

import 'package:facebook_ui_clone/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CreatePostContainer extends StatelessWidget {
  const CreatePostContainer({
    Key key,
    @required this.currentUser,
  }) : super(key: key);

  final User currentUser;

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0.0),
      elevation: isDesktop ? 1.0 : 0.0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(1.0))
          : null,
      child: Container(
        padding: EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                ProfileAvatar(imageUrl: currentUser.imageUrl),
                const SizedBox(width: 8.0),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                      hintText: 'What\'s on your mind?',
                    ),
                  ),
                )
              ],
            ),
            const Divider(height: 10.0, thickness: 0.5),
            Container(
              height: 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildTextButton(
                      icon: Icons.videocam,
                      label: 'Live',
                      iconColor: Colors.green),
                  const VerticalDivider(
                    width: 8.0,
                  ),
                  buildTextButton(
                      icon: Icons.photo_library,
                      label: 'Photo',
                      iconColor: Colors.red),
                  const VerticalDivider(
                    width: 8.0,
                  ),
                  buildTextButton(
                      icon: Icons.video_call,
                      label: 'Room',
                      iconColor: Colors.purpleAccent),
                  const VerticalDivider(
                    width: 8.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextButton buildTextButton({String label, IconData icon, Color iconColor}) {
    return TextButton.icon(
      onPressed: () => print(label),
      icon: Icon(
        icon,
        color: iconColor,
      ),
      label: Text(label),
      style: TextButton.styleFrom(
        primary: Colors.black,
      ),
    );
  }
}
