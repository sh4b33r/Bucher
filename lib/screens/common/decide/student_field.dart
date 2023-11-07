import 'package:flutter/material.dart';

class StudentDescision extends StatelessWidget {
  const StudentDescision({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.all(25.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color.fromARGB(118, 144, 173, 197),
                    border:Border.all(color: const Color.fromARGB(255, 5, 43, 75))
                  ),
                  // color: Color.fromARGB(118, 144, 173, 197),
                  height: 60,
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Students", style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.w500),),
                        
                  
                        Icon(
                          Icons.arrow_right_alt,
                          size: 30,
                        )
                      ],
                    ),
                  ),
                ),
              );
  }
}