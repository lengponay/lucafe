import 'package:flutter/material.dart';
import 'package:western/pages/notificationDetailPage.dart';

class Notificationpage extends StatelessWidget {
  const Notificationpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final List<Map<String, String>> notifications = [
      {'name': 'Oliva', 'description': 'Your order has been placed. Please be patient; the shop is preparing your order.'},
      {'name': 'Jack', 'description': 'Your order is being processed. We will notify you when it is ready.'},
      {'name': 'Rose', 'description': 'Your order is ready for pickup. Please collect it at your convenience.'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notifications Page",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0, left : 10, right : 10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade300,
              ),
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notifications[index]['name']!,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      notifications[index]['description']!,
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotiDetailPage(orderName: notifications[index]['name']!),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
