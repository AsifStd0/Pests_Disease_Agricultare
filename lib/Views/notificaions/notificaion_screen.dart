// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
    final RemoteMessage? message;

  NotificationsScreen({
    Key? key,
    this.message,
  }) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    print('${widget.message?.data}');
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        ),
      body:  Card(
              elevation: 5,
              child: ListTile(
                leading: const Icon(Icons.notifications_active),
                title:
                    Text(widget.message!.notification!.title.toString() ?? ''),
                subtitle: Text(widget.message!.notification!.body.toString()),
                trailing: Text(widget.message!.data['screen'].toString()),
              ),
            ),
    );
  }
}