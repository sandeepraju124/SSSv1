import 'package:flutter/material.dart';
import 'package:sssv1/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomerSupportPopup extends StatelessWidget {
  const CustomerSupportPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 16, top: 64, right: 16, bottom: 16),
          margin: EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "How can we help you?",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 24),
              _buildSupportOption(
                context,
                "Chat with Us",
                Icons.chat_bubble_outline,
                () {
                  // Implement chat functionality
                  print("Open chat");
                },
              ),
              _buildSupportOption(
                context,
                "Call Support",
                Icons.phone_outlined,
                () {
                  // _launchPhone("+911234567890");
                  makePhoneCall("+918074644634");
                },
              ),
              _buildSupportOption(
                context,
                "Email Us",
                Icons.email_outlined,
                () {
                  // _launchEmail("support@yourapp.com");
                  showSnackBar(context, "Feature still in progress");
                },
              ),
              _buildSupportOption(
                context,
                "FAQ",
                Icons.help_outline,
                () {
                  // Navigate to FAQ page
                  print("Open FAQ");
                },
              ),
              SizedBox(height: 16),
              Text(
                "We're here to help 24/7",
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
        Positioned(
          left: 16,
          right: 16,
          child: CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            radius: 40,
            child: Icon(
              Icons.support_agent,
              color: Colors.white,
              size: 40,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSupportOption(
      BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).primaryColor),
      title: Text(title),
      onTap: onTap,
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
    );
  }

  void _launchPhone(String phoneNumber) async {
    final url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchEmail(String email) async {
    final url = 'mailto:$email';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}