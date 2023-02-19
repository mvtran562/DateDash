import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:DateDash/data/users.dart' as users;
import 'package:DateDash/model/user.dart';
import 'package:DateDash/provider/feedback_position_provider.dart';
import 'package:DateDash/widget/bottom_buttons_widget.dart';
import 'package:DateDash/widget/user_card_widget.dart';
import 'package:DateDash/page/update_profile.dart';
import 'package:DateDash/page/match_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final currentUsers = users.dummyUsers;
  List<User> matchedUsers = [];
  //final toSend = users.dummyUsers.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: buildAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            currentUsers.isEmpty
                ? TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 0, 131, 20)),
                      foregroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 255, 255, 255)),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MatchPage(
                              data: matchedUsers,
                            ),
                          ));
                    },
                    child: Text('View Your Matches'),
                  )
                : Stack(children: currentUsers.map(buildUser).toList()),
            Expanded(child: Container()),
            BottomButtonsWidget()
          ],
        ),
      ),
    );
  }

  Widget buildAppBar() => AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Icon(Icons.chat, color: Colors.grey),
          SizedBox(width: 16),
        ],
        leading: IconButton(
            icon: Icon(Icons.person),
            onPressed: () async {
              User returned = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => profileUpdate()),
              );
              log("User: ${returned.name}");
              currentUsers.add(returned);
            },
            color: Colors.grey),
        title: Image.asset('assets/DateDash.png', height: 100),
      );

  Widget buildUser(User user) {
    final userIndex = currentUsers.indexOf(user);
    final isUserInFocus = userIndex == currentUsers.length - 1;

    return Listener(
      onPointerMove: (pointerEvent) {
        final provider =
            Provider.of<FeedbackPositionProvider>(context, listen: false);
        provider.updatePosition(pointerEvent.localDelta.dx);
      },
      onPointerCancel: (_) {
        final provider =
            Provider.of<FeedbackPositionProvider>(context, listen: false);
        provider.resetPosition();
      },
      onPointerUp: (_) {
        final provider =
            Provider.of<FeedbackPositionProvider>(context, listen: false);
        provider.resetPosition();
      },
      child: Draggable(
        child: UserCardWidget(user: user, isUserInFocus: isUserInFocus),
        feedback: Material(
          type: MaterialType.transparency,
          child: UserCardWidget(user: user, isUserInFocus: isUserInFocus),
        ),
        childWhenDragging: Container(),
        onDragEnd: (details) => onDragEnd(details, user),
      ),
    );
  }

  void onDragEnd(DraggableDetails details, User user) {
    final minimumDrag = 100;
    if (details.offset.dx > minimumDrag) {
      user.isLiked = true;
      matchedUsers.add(user);
    } else if (details.offset.dx < -minimumDrag) {
      user.isSwipedOff = true;
      //matchedUsers.add(user);
    }

    setState(() => currentUsers.remove(user));
  }
}
