import 'package:flutter/material.dart';


class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
                spreadRadius: 1.0,
              ),
            ],
          ),
          width: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  'https://storage.googleapis.com/a1aa/image/1rIwv0MSeQgd_QNcLAHLYh_aph7YAFb8hLzFzu3H0V4.jpg',
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Agnes Freeman',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 24.0),
              ContactInfo(
                icon: Icons.phone,
                iconColor: Colors.green,
                text: '(262) 900-5279',
                backgroundColor: Colors.green[100]!,
              ),
              SizedBox(height: 16.0),
              ContactInfo(
                icon: Icons.calendar_today,
                iconColor: Colors.orange,
                text: '03-07-2021',
                backgroundColor: Colors.orange[100]!,
              ),
              SizedBox(height: 16.0),
              ContactInfo(
                icon: Icons.email,
                iconColor: Colors.blue,
                text: 'Freeman@hewufiw.co.uk',
                backgroundColor: Colors.blue[100]!,
              ),
              SizedBox(height: 24.0),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Log out',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactInfo extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String text;
  final Color backgroundColor;

  const ContactInfo({
    required this.icon,
    required this.iconColor,
    required this.text,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
        SizedBox(width: 16.0),
        Text(
          text,
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
