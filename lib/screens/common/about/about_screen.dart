import 'package:bucher/widgets/Custom_appbar/custm_adminappbar.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        
          appBar: CustomAppbarAdmin(title: 'About' , onPressed:(){} ,
          
          leadingchild: const SizedBox(), child: const Icon(Icons.keyboard_backspace_outlined),
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
                          Text('''Introducing Bücher , the easiest way to check the availability of books at your college library or any other library! With Bücher, you can quickly and easily search for any book by title, author, or based on Category. The app will then show you whether libraries have the book in stock.
                    ''',style: TextStyle(fontFamily: 'poppins',fontWeight: FontWeight.w400,wordSpacing: 2),),
                        SizedBox(height: 10,),
                                   SizedBox(height: 20,),
                         Text('''
Bücher is the perfect tool for students, researchers, and anyone else who needs to check the availability of books. It's easy to use, convenient, and up-to-date.

                    ''',style: TextStyle(fontFamily: 'poppins',fontWeight: FontWeight.w400,wordSpacing: 2),),
                SizedBox(height: 10,),
                         Text('''Here are some of the benefits of using Our App:

                    ''',style: TextStyle(fontFamily: 'poppins',fontWeight: FontWeight.w500,wordSpacing: 0),),
                           
                                    
                         Text(''' •	Save time and hassle by checking book \n    availability from your phone or tablet. \n •	Hustle free to use 

                    ''',style: TextStyle(fontFamily: 'poppins',fontWeight: FontWeight.w400,wordSpacing: 2),),
                          Text(''' If you have any queires about the App, please \n connect with  us on Instagram .


                    ''',style: TextStyle(fontFamily: 'poppins',fontWeight: FontWeight.w600,wordSpacing: 2),),
                      
                        ],
                      ),
                    )


                  ],
 


          ),
        
      ),
    );
  }
}