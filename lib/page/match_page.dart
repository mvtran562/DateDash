import 'package:flutter/material.dart';
import 'package:DateDash/data/users.dart';
import 'package:DateDash/model/user.dart';

class MatchPage extends StatefulWidget {
  const MatchPage({super.key});

  @override
  State<MatchPage> createState() => _MatchPageState();
}

class _MatchPageState extends State<MatchPage> {
  final List<User> matches = dummyUsers;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Matches'),
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView.separated(
              itemCount: matches.length,
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
                                image: AssetImage(matches[index].imgUrl)))),
                    title: Text(matches[index].name),
                    subtitle: Text(matches[index].bio),
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

            
                   

  /*Widget row({required List<User> matches}) {

    itemBuilder:(BuildContext context, int index){

    }
      return Row(
        children: <Widget>[
          Expanded(
            child: FittedBox(
              child: Image(image: AssetImage('${match.imgUrl}')),
            ),
          ),
          Expanded(
            child: Text('${match.name}', textAlign: TextAlign.center),
          ),
          // Expanded( // eventually phone number
          //   child: Text('Craft beautiful UIs', textAlign: TextAlign.center),
          // ),
        ],
      );
    
  }
}*/
