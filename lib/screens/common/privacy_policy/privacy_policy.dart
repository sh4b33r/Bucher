import 'package:bucher/widgets/Custom_appbar/custm_adminappbar.dart';
import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     appBar:CustomAppbarAdmin(title: 'Privacy Policy', onPressed: (){},
     
     leadingchild: const SizedBox(), child: const Icon(Icons.arrow_back_rounded),
     ) ,
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
                          Text('''This Privacy Policy explains how the provider collects, uses, and discloses information about users of the Data that allows users to view the availability of books in a library.

                    ''',style: TextStyle(fontFamily: 'poppins',fontWeight: FontWeight.w400,wordSpacing: 2),),
                      
                         Text('''How We Disclose Your Information:
                    ''',style: TextStyle(fontFamily: 'poppins',fontWeight: FontWeight.w500,wordSpacing: 0),),
                     
                        
                         Text('''The Provider does not share your information with any third parties without your consent. However, the Provider may disclose your information to third-party service providers that assist the Provider in providing the App's services. These service providers are bound by contract to keep your information confidential and to use it only for the purpose of providing the App's services.

                    ''',style: TextStyle(fontFamily: 'poppins',fontWeight: FontWeight.w400,wordSpacing: 2),),
                  
                                  Text('''Security:
                    ''',style: TextStyle(fontFamily: 'poppins',fontWeight: FontWeight.w500,wordSpacing: 0),),
                     
 Text('''The Provider takes reasonable precautions to protect your information from unauthorized access, use, or disclosure. However, no method of transmission over the internet or electronic storage is 100% secure, and the Provider cannot guarantee the absolute security of your information.
                    ''',style: TextStyle(fontFamily: 'poppins',fontWeight: FontWeight.w400,wordSpacing: 2),),
                  
            Text('''Changes to the Policy:
                    ''',style: TextStyle(fontFamily: 'poppins',fontWeight: FontWeight.w500,wordSpacing: 0),),
                     

                  Text('''
The Provider may update this Policy from time to time. If the Provider makes any material changes to the Policy, it will notify you by posting the updated Policy on the App.

                    ''',style: TextStyle(fontFamily: 'poppins',fontWeight: FontWeight.w400,wordSpacing: 2),),
                  
    Text('''If you have any questions about these Terms, please contact us at bucherapp@gmail.com.
                    ''',style: TextStyle(fontFamily: 'poppins',fontWeight: FontWeight.w500,wordSpacing: 0),),
      
    
                            ],
                      ),
                    )


                  ],
 


          ),
         






    );
  }
}