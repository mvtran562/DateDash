import 'package:flutter/material.dart';
import 'package:DateDash/model/user.dart';
// import 'package:DateDash/data/users.dart';

class MatchPage extends StatefulWidget {
  final List<User> data;
  const MatchPage({Key? key, required this.data}) : super(key: key);
  @override
  _MatchPageState createState() => _MatchPageState();
}

class _MatchPageState extends State<MatchPage> {
  @override
  Widget build(BuildContext context) {
    print(widget.data.length);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 144, 144, 144),
          title: const Text('Your Matches'),
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView.separated(
              itemCount: widget.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: ListTile(
                    leading: Container(
                        width: 90,
                        height: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(widget.data[index].imgUrl)))),
                    title: Text(widget.data[index].name),
                    subtitle: Text(widget.data[index].phoneNumber),
                    trailing: const Icon(Icons.more_vert),
                    isThreeLine: true,
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ))
          ],
        ));
  }
}
