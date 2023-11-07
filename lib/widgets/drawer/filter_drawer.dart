import 'package:bucher/db/book_db.dart';
import 'package:bucher/db/category_db.dart';
import 'package:flutter/material.dart';

class FilterDrawerAdmins extends StatefulWidget {
  const FilterDrawerAdmins({super.key});

  @override
  State<FilterDrawerAdmins> createState() => _FilterDrawerAdminsState();
}

bool isSeleceted = false;
int tag = 1;
 int selectedCategoryIndex = 0;

class _FilterDrawerAdminsState extends State<FilterDrawerAdmins> {

  @override
  void initState() {
    super.initState();
  
    
    selectedCategoryIndex=-1;
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(87, 27, 43, 149),
      width: MediaQuery.of(context).size.width / 1.45,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
            child: ValueListenableBuilder(
          valueListenable: categoryadd,
          builder: (context, valuelist, child) {
            return Wrap(
                alignment: WrapAlignment.center,
                runSpacing: 5,
                spacing: 5,
                children: List.generate(
                    valuelist.length,
                    (index) =>
                    ChoiceChip(
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      selectedColor: const Color.fromARGB(255, 128, 123, 123),
                                
                            onSelected: (newBoolvalue) {
                               filterbook(valuelist[index].categoryname);

                              setState(() {

                          selectedCategoryIndex = index;

                              });
                            },

                      label: Text(valuelist[index].categoryname), 
                             selected: selectedCategoryIndex == index,
                      
                      )

                    ));
          },
        )),
      ),
    );
  }
}
