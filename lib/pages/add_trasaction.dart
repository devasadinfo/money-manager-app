import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({Key? key}) : super(key: key);

  @override
  State<AddTransaction> createState() => _HomePageState();
}

//some logical state and variable
int? ammount;
String note = "some cost";
String type = "Income";
DateTime selectedDate = DateTime.now();

List<String> months = [
  "Jan",
  "Feb",
  "Mar",
  "Apr",
  "May",
  "Jun",
  "Jul",
  "Aug",
  "Sep",
  "Nov",
  "Dec"
];

Future<void> _selectDate(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: selectedDate,
    firstDate: DateTime(2010, 12),
    lastDate: DateTime(2030, 01),
  );
  if (picked != null && picked != selectedDate) {
    selectedDate = picked;
  }
}

class _HomePageState extends State<AddTransaction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Text(
            "Add Transaction",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.blue,
                ),
                padding: EdgeInsets.all(12),
                child: Icon(
                  Icons.attach_money,
                  size: 24,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: '0',
                    border: InputBorder.none,
                  ),
                  style: TextStyle(
                    fontSize: 24,
                  ),
                  onChanged: (value) {
                    try {
                      ammount = int.parse(value);
                    } catch (e) {}
                  },
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          //row part two
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.blue,
                ),
                padding: EdgeInsets.all(12),
                child: Icon(
                  Icons.description,
                  size: 24,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Transaction Note',
                    border: InputBorder.none,
                  ),
                  style: TextStyle(
                    fontSize: 24,
                  ),
                  onChanged: (value) {
                    note = value;
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.blue,
                ),
                padding: EdgeInsets.all(12),
                child: Icon(
                  Icons.moving_sharp,
                  size: 24,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 12,
              ),
              ChoiceChip(
                label: Text(
                  "Income",
                  style: TextStyle(
                    color: type == "Income" ? Colors.white : Colors.black,
                  ),
                ),
                selectedColor: Colors.blue,
                selected: type == "Income" ? true : false,
                onSelected: (value) {
                  if (value) {
                    setState(() {
                      type = "Income";
                    });
                  }
                },
              ),
              SizedBox(
                width: 12,
              ),
              ChoiceChip(
                label: Text(
                  "Expense",
                  style: TextStyle(
                    color: type == "Expense" ? Colors.white : Colors.black,
                  ),
                ),
                selectedColor: Colors.blue,
                selected: type == "Expense" ? true : false,
                onSelected: (value) {
                  if (value) {
                    setState(() {
                      type = "Expense";
                    });
                  }
                },
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 50,
            child: TextButton(
              onPressed: () {
                _selectDate(context);
              },
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.blue,
                    ),
                    padding: EdgeInsets.all(12),
                    child: Icon(
                      Icons.date_range,
                      size: 24,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text("${selectedDate.day} ${months[selectedDate.month - 1]}"),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                print(ammount);
                print(note);
                print(type);
                print(selectedDate);
              },
              child: Text(
                "Add",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
