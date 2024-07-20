// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:flutter/material.dart';

// class TermsAndConditions extends StatelessWidget {
//   const TermsAndConditions({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Terms and Conditions'),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               'Introduction',
//               style: TextStyle(
//                 fontSize: 18.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 12.0),
//             Text(
//               'Welcome to [Your App Name]! Our mission is to provide users with a platform where they can discover, review, and share their experiences with different local businesses in India.',
//               textAlign: TextAlign.justify,
//               style: TextStyle(fontSize: 16.0),
//             ),
//             SizedBox(height: 24.0),
//             Text(
//               'Acceptance of Terms',
//               style: TextStyle(
//                 fontSize: 18.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 12.0),
//             Text(
//               'By using [Your App Name], you agree to these terms and conditions and any future updates.',
//               textAlign: TextAlign.justify,
//               style: TextStyle(fontSize: 16.0),
//             ),
//             SizedBox(height: 24.0),
//             Text(
//               'User Conduct',
//               style: TextStyle(
//                 fontSize: 18.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 12.0),
//             Text(
//               'You agree to use [Your App Name] only for lawful purposes and in a manner that does not infringe on the rights of others. You also agree not to:\n\n- Post content that is defamatory, harassing, or discriminatory\n- Use [Your App Name] to engage in any illegal activities\n- Attempt to bypass any security measures put in place to protect [Your App Name] and its users',
//               textAlign: TextAlign.justify,
//               style: TextStyle(fontSize: 16.0),
//             ),
//             SizedBox(height: 24.0),
//             Text(
//               'Intellectual Property',
//               style: TextStyle(
//                 fontSize: 18.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 12.0),
//             Text(
//               '[Your App Name] and its associated trademarks, logos, and content are owned by [Your Company Name] and are protected under applicable laws. You agree not to use any of [Your App Name]\'s intellectual property without our express written consent.',
//               textAlign: TextAlign.justify,
//               style: TextStyle(fontSize: 16.0),
//             ),
//             SizedBox(height: 24.0),
//             Text(
//               'Privacy',
//               style: TextStyle(
//                 fontSize: 18.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 12.0),
//             Text(
//               'We take the privacy of our users seriously. Our Privacy Policy outlines how we collect, use, and store user data, which includes information such as:\n\n- Name and contact information\n- Business reviews and ratings\n- Location data\n\nBy using [Your App Name], you agree to the terms of our Privacy Policy.',
//               textAlign: TextAlign.justify,
//               style: TextStyle(fontSize: 16.0),
//             ),
//             SizedBox(height: 24.0),
//             Text(
//               'Limitations of Liability',
//               style: TextStyle(
//                 fontSize: 18.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 12.0),
//             Text(
//               'You agree that [Your Company Name] will not be liable for any damages or losses resulting from your use of [Your App Name], including but not limited to:\n\n- Loss of profits, revenue, or data\n- Intangible losses such as reputation or goodwill\n- Any unauthorized access to or use of our servers or personal information\n\nThis limitation of liability applies even if [Your Company Name] has been advised of the possibility of such damages.',
//               textAlign: TextAlign.justify,
//               style: TextStyle(fontSize: 16.0),
//             ),
//             SizedBox(height: 24.0),
//             Text(
//               'Changes to Terms',
//               style: TextStyle(
//                 fontSize: 18.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 12.0),
//             Text(
//               '[Your Company Name] reserves the right to modify these terms and conditions at any time. We will notify you of any changes by posting an updated version on our website. By continuing to use [Your App Name] after the changes have been made, you agree to be bound by the updated terms and conditions.',
//               textAlign: TextAlign.justify,
//               style: TextStyle(fontSize: 16.0),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// // ();
// //   }
// // }



import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms and Conditions', style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        color: Colors.grey[100],
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildSection('Introduction', 
                      'Welcome to [Your App Name]! Our mission is to provide users with a platform where they can discover, review, and share their experiences with different local businesses in India.'),
                    _buildSection('Acceptance of Terms', 
                      'By using [Your App Name], you agree to these terms and conditions and any future updates.'),
                    _buildSection('User Conduct', 
                      'You agree to use [Your App Name] only for lawful purposes and in a manner that does not infringe on the rights of others. You also agree not to:\n\n• Post content that is defamatory, harassing, or discriminatory\n• Use [Your App Name] to engage in any illegal activities\n• Attempt to bypass any security measures put in place to protect [Your App Name] and its users'),
                    _buildSection('Intellectual Property', 
                      '[Your App Name] and its associated trademarks, logos, and content are owned by [Your Company Name] and are protected under applicable laws. You agree not to use any of [Your App Name]\'s intellectual property without our express written consent.'),
                    _buildSection('Privacy', 
                      'We take the privacy of our users seriously. Our Privacy Policy outlines how we collect, use, and store user data, which includes information such as:\n\n• Name and contact information\n• Business reviews and ratings\n• Location data\n\nBy using [Your App Name], you agree to the terms of our Privacy Policy.'),
                    _buildSection('Limitations of Liability', 
                      'You agree that [Your Company Name] will not be liable for any damages or losses resulting from your use of [Your App Name], including but not limited to:\n\n• Loss of profits, revenue, or data\n• Intangible losses such as reputation or goodwill\n• Any unauthorized access to or use of our servers or personal information\n\nThis limitation of liability applies even if [Your Company Name] has been advised of the possibility of such damages.'),
                    _buildSection('Changes to Terms', 
                      '[Your Company Name] reserves the right to modify these terms and conditions at any time. We will notify you of any changes by posting an updated version on our website. By continuing to use [Your App Name] after the changes have been made, you agree to be bound by the updated terms and conditions.'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.blue[800],
          ),
        ),
        SizedBox(height: 12.0),
        Text(
          content,
          style: TextStyle(fontSize: 16.0, height: 1.5),
        ),
        SizedBox(height: 24.0),
        Divider(thickness: 1),
        SizedBox(height: 24.0),
      ],
    );
  }
}