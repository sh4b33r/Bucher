
// ignore_for_file: prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class CustomAppbarAdmin extends StatelessWidget implements PreferredSizeWidget {
   final String title;
    final Widget child;  
   final  onPressed;  
   final Function? onTitleTapped;
   final Widget leadingchild;
   final  leadingchildsearch;
   // const CustomAppbar({Key? key, required this.title}) : super(key: key);
    @override 
   final Size preferredSize;   
  CustomAppbarAdmin( 
    {super.key,
     required this.title, 
    required this.child, 
    required this.leadingchild,
   this.onPressed,
    this.leadingchildsearch, 
    this.onTitleTapped})
    : preferredSize = const Size.fromHeight(60.0);

   @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Hero(
                  tag: 'topBarBtn',
                  child: MaterialButton(
                    height: 50,
                    minWidth: 40,
                    elevation: 10,
                  
                    onPressed:(){
                
           
                    },
                   
                    child: child,
                  ),),
                  
                  Container(
                  decoration: const BoxDecoration( borderRadius:BorderRadius.only(bottomLeft: Radius.circular(20)) ,
                  
                  color:  Color.fromARGB(255, 16, 31, 75)
                  // color:Color.fromARGB(255, 97, 130, 100) 
                  ),
                    
                    child: SizedBox(
                      
                      width: MediaQuery.of(context).size.width / 1.20,
                      height: 50,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            
                            left: 15,
                            right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                title,
                                style: const TextStyle(color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  
                                ),
                              ),
                               Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                 children: [
                                     SizedBox(
                                         child: leadingchildsearch,
                              
                                   ),
                                     const SizedBox(width: 18,),
                  
                                   SizedBox(
                                         child: leadingchild,
                              
                                   ),
                                 ],
                               )
                           
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
 


Widget kBackBtn = const Icon(
  Icons.arrow_back_ios,
  // color: Colors.black54,
);
Widget menuBtton=const InkWell(
  child: Icon(Icons.menu,size: 20,));

  // ==============================================================================
  @override

  Size get preferredSize => const Size.fromHeight(60.0);

