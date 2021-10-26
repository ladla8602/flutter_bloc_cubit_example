import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern/screens/home/models/m_users.dart';

class UserListItemWidget extends StatelessWidget {
  final User user;
  const UserListItemWidget({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          leading: Container(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
            decoration: const BoxDecoration(
              border: Border(right: BorderSide(width: 1.0)),
            ),
            child: ClipOval(
              child: Image.network(
                user.avatar!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text("${user.firstName} ${user.lastName}"),
          subtitle: Text(
            user.email,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
          dense: true,
          onTap: () {
            //
          },
          trailing: Container(padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 12.0), child: const Icon(Icons.keyboard_arrow_right))),
    );
  }
}
