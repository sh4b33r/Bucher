import 'package:bucher/widgets/Custom_appbar/custm_adminappbar.dart';
import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppbarAdmin(title:'Terms and Conditions', onPressed: (){},
      
      leadingchild: const SizedBox(), child: const Icon(Icons.keyboard_backspace_rounded),
      ),

     body: ListView(
                  children: [
                      
                              Image.asset('assets/image/logo.jpg' ,height: 140),


                    const Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Introduction :",style: TextStyle(fontFamily: 'Inter',fontWeight: FontWeight.w600,fontSize: 16),),
                          SizedBox(height: 10,),
                          Text('''This is a mobile application that allows users to view the availability of books in a library. The App is provided by Bücher
                    ''',style: TextStyle(fontFamily: 'poppins',fontWeight: FontWeight.w400,wordSpacing: 2),),
                        SizedBox(height: 10,),
                                   SizedBox(height: 5,),
                         Text('''
Acceptance of Terms and Conditions
By using the App, you agree to be bound by these terms and conditions (the "Terms"). If you do not agree to the Terms, you should not use the App

                    ''',style: TextStyle(fontFamily: 'poppins',fontWeight: FontWeight.w400,wordSpacing: 2),),
               Text("Use of the App :",style: TextStyle(fontFamily: 'Inter',fontWeight: FontWeight.w600,fontSize: 15),),
               SizedBox(height: 10,),
               Text('''The App is for your personal use only. You may not use the App for any commercial purpose or for any purpose that is unlawful or otherwise prohibited by these Terms.
You are responsible for ensuring that your use of the App complies with all applicable laws and regulations.

                    ''',style: TextStyle(fontFamily: 'poppins',fontWeight: FontWeight.w400,wordSpacing: 2),),
               
               Text('''The App is provided on an "as is" and "as available" basis. The Provider does not make any warranties, express or implied, with respect to the App, including but not limited to any warranties of merchantability, fitness for a particular purpose, or non-infringement
                    ''',style: TextStyle(fontFamily: 'poppins',fontWeight: FontWeight.w400,wordSpacing: 2),),
                          Text("Contact Us",style: TextStyle(fontFamily: 'Inter',fontWeight: FontWeight.w600,fontSize: 15),),
                             SizedBox(height: 10,),
                       Text('''If you have any questions about these Terms, please contact us at bucherapp@gmail.com ''',style: TextStyle(fontFamily: 'poppins',fontWeight: FontWeight.w400,wordSpacing: 2),),
                     
                        ],
                      ),
                    )


                  ],
 


          ),


    );
  }
}

Text mail=const Text('bucherapp@gmail.com',style: TextStyle(color: Colors.blue),);