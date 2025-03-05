import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:buddy/pages/home_page.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms & Conditions'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Expanded(
            //   child: NotificationListener<ScrollNotification>(
            //     onNotification: (scrollInfo) {
            //       if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
            //         setState(() => _hasReachedBottom = true);
            //       }
            //       return true;
            //     },
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  'Last Updated: 03/05/2025\n\n'
                  'Welcome to Torque Buddy (the "App"). By downloading, accessing, or using the App, you agree to be bound by these Terms and Conditions (the "Terms"). If you do not agree to these Terms, please do not use the App.\n\n'
                  '1. General Disclaimer\n The App provides torque calculations and related information for reference purposes only. While we strive to ensure accuracy, we do not guarantee that the data provided is error-free, complete, or suitable for any specific purpose. The use of this App is entirely at your own risk.\n\n'
                  '2. No Professional Advice\n The calculations and results provided by the App are for informational purposes only and should not be considered as professional or engineering advice. You are responsible for verifying all results independently before relying on them for any critical applications.\n\n'
                  '3. Limitation of Liability\n To the maximum extent permitted by law, MaizeTech and its affiliates, developers, or licensors shall not be liable for any direct, indirect, incidental, consequential, or punitive damages arising from your use of the App, including but not limited to loss of data, equipment failure, or personal injury.\n\n'
                  '4. User Responsibility\n You acknowledge and agree that you are solely responsible for any decisions made or actions taken based on the information provided by the App. You assume full responsibility for ensuring that any torque values, calculations, or recommendations align with applicable industry standards, regulations, and best practices.\n\n'
                  '5. No Warranties\n The App is provided "as is" without warranties of any kind, whether express or implied, including but not limited to merchantability, fitness for a particular purpose, and non-infringement. We do not warrant that the App will be error-free, uninterrupted, or free of harmful components.\n\n'
                  '6. Updates and Modifications\n We reserve the right to modify, update, or discontinue the App or these Terms at any time without prior notice. Your continued use of the App after such changes constitutes your acceptance of the revised Terms.\n\n'
                  '7. Governing Law\n These Terms shall be governed by and construed in accordance with the laws of the United States, without regard to its conflict of law principles.\n\n'
                  '8. Contact Information\n If you have any questions or concerns about these Terms, please contact us at brownconner15@gmail.com.\n\n'
                  'By selecting "Accept & Continue", you acknowledge that you have read, understood, and agreed to these Terms and Conditions.',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.setBool('isTermsAccepted', true);
                Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyHomePage(title: 'Torque Calculator')),
                        );
              },
              child: const Text('Accept & Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
