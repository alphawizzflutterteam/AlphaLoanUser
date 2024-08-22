import 'package:eggrow/Utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  List<String> cities = ['Indore', 'Bhopal', 'Delhi', 'Mumbai'];
  List<String?> selectedCities = ['Indore']; // List to store selected dropdown values for each row
  List<String> enteredAmounts = ['']; // List to store text field values for each row

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    DateTime currentDate = DateTime.now();
    DateTime lastDate = currentDate.add(Duration(days: 6));

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: currentDate,
      lastDate: lastDate,
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                selectedCities.add('Indore'); // Add a new row with default city 'Indore'
                enteredAmounts.add(''); // Add a new row with empty text field
              }
              );
            },
            child: InkWell(
                onTap: (){
                  setState(() {
                    selectedCities.add('Indore'); // Add a new row with default city 'Indore'
                    enteredAmounts.add(''); // Add a
                  });

                },
                child: Icon(Icons.add,size: 28,)),
          ),
          SizedBox(width: 10,),
          FloatingActionButton(
            onPressed: () {
              // setState(() {
              //   selectedCities.add('Indore'); // Add a new row with default city 'Indore'
              //   enteredAmounts.add(''); // Add a new row with empty text field
              // }
              // );
            },
            child: InkWell(
                onTap: (){
                  if(selectedCities.length>1)
                  setState(() {
                    selectedCities.removeLast();// Add a new row with default city 'Indore'
                    enteredAmounts.removeLast();// Add a
                  });

                },
                child: Icon(Icons.remove,size: 28,)),
          ),
        ],
      ),
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Add Product",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                _selectDate(context);
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.primary.withOpacity(.4),
                ),
                child: Center(
                  child: Text(
                    DateFormat("dd MMM yyyy hh:mm a")
                        .format(DateTime.parse(selectedDate.toString())),
                    style: TextStyle(color: AppColors.primary.withOpacity(.8),fontWeight: FontWeight.bold,fontSize: 20),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              itemCount: selectedCities.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: _buildRow(index),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(int index) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            height: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.primary),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 2),
              child: Center(
                child: DropdownButton<String>(
                  underline: SizedBox(),
                  value: selectedCities[index],
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCities[index] = newValue ?? selectedCities[index];
                    });
                  },
                  items: cities.map<DropdownMenuItem<String>>(
                        (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    },
                  ).toList(),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          flex: 5,
          child: Container(
            height: 55,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primary),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
              initialValue: enteredAmounts[index],
              onChanged: (value) {
                setState(() {
                  enteredAmounts[index] = value; // Store the entered amount for the specific index
                });
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10, bottom: 3),
                border: InputBorder.none,
                hintText: 'Enter Amount',
              ),
            ),
          ),
        ),
      ],
    );
  }
}


// import 'package:eggrow/Utils/Colors.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// class AddProductScreen extends StatefulWidget {
//   const AddProductScreen({Key? key}) : super(key: key);
//
//   @override
//   State<AddProductScreen> createState() => _AddProductScreenState();
// }
//
// class _AddProductScreenState extends State<AddProductScreen> {
//   String selectedCity="Indore";
//   List<String> cities = ['Indore', 'Bhopal', 'Delhi', 'Mumbai'];
//
//   DateTime selectedDateselectedDate = DateTime.now();
//   DateTime selectedDate = DateTime.now();
//
//   Future<void> _selectDate(BuildContext context) async {
//     DateTime currentDate = DateTime.now();
//     DateTime lastDate = currentDate.add(Duration(days: 6));
//
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: selectedDate,
//       firstDate: currentDate,
//       lastDate: lastDate,
//     );
//     if (picked != null && picked != selectedDate) {
//       setState(() {
//         selectedDate = picked;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: Icon(Icons.add,size: 50,),
//       appBar: AppBar(
//         foregroundColor: Colors.white,
//         centerTitle: true,
//         title: Text("Add Product",style: TextStyle(color: Colors.white),),
//         backgroundColor: AppColors.primary,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           children: [
//             InkWell(
//                 onTap: (){
//                   _selectDate(context);
//                 },
//                 child: Container(
//                   // width: 250,
//                   height: 50,
//                   decoration: BoxDecoration(
//
//                       borderRadius: BorderRadius.circular(10),
//                       color: Colors.grey.withOpacity(.3)
//                   ),
//                   child: Center(
//                     child: Text( DateFormat("dd MMM yyyy hh:mm a")
//                         .format(DateTime.parse(selectedDate.toString())),style: TextStyle(color:AppColors.primary),),
//                   ),
//                 )),
//             SizedBox(height: 20,),
//             Row(
//               children: [
//                 Expanded(
//                   flex: 2,
//                   child: Container(
//                     height: 55,
//                     //width: 100,
//                     // width: double.infinity,
//                     decoration: BoxDecoration(
//
//                         borderRadius: BorderRadius.circular(10),
//                         border: Border.all(color: AppColors.primary)
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 2),
//                       child: Center(
//                         child: DropdownButton<String>(
//
//                           //elevation: 0,
//                           underline: SizedBox(),
//                           value: selectedCity,
//                           onChanged: (String? newValue) { // Update type to accept nullable String?
//                             setState(() {
//                               selectedCity = newValue ?? selectedCity; // Use null-aware operator (??) to handle null case
//                             });
//                           },
//                           items: cities.map<DropdownMenuItem<String>>((String value) {
//                             return DropdownMenuItem<String>(
//
//                               value: value,
//                               child: Text(value),
//                             );
//                           }).toList(),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 10,),
//
//                 Expanded(
//                   flex: 5,
//                   child: Container(
//                     height: 55,
//
//                     decoration: BoxDecoration(
//                       border: Border.all(color: AppColors.primary),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: TextFormField(
//
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return '   Enter Amount';
//                         }
//
//                         return null;
//                       },
//
//                       decoration: InputDecoration(
//                         contentPadding: EdgeInsets.only(left: 10,bottom: 3),
//
//                         // isDense: true,
//                         border: InputBorder.none,
//                         hintText: '  Enter Amount',
//                       ),
//                     ),
//                   ),
//                 ),
//
//               ],
//             ),
//
//
//
//
//
//
//
//
//           ],
//         ),
//       ) ,
//     );
//   }
// }
