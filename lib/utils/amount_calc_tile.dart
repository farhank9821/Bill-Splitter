import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class AmountCalc extends StatefulWidget {
  // final TextEditingController controller;
  final String name;
  Function(BuildContext)? deleteFunction;

  AmountCalc({
    super.key,
    required this.name,
    required this.deleteFunction,
    // required this.controller,
  });
  @override
  State<AmountCalc> createState() => _AmountCalcState();
}

class _AmountCalcState extends State<AmountCalc> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final _amount = TextEditingController();
    final _gst = TextEditingController();
    final _discount = TextEditingController();
    final _finalAmount = TextEditingController();
    double tax; // used for calculating tax
    double newAmount; // _amount + tax
    double disc; // used for calc discount
    double result; // used for storing final result

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: widget.deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          // height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFF3DEBA),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    height: 69,
                    width: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFE11299),
                    ),
                    child: Text(
                      widget.name,
                      style: GoogleFonts.ubuntu(fontSize: 22),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      height: 70,
                      width: 190,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE11299),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        style:
                            const TextStyle(color: Colors.black, fontSize: 22),
                        controller: _amount,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          // labelText: 'Enter Name',
                          hintText: 'Enter Amount',
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Container(
                      height: 70,
                      width: 190,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE11299),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        style:
                            const TextStyle(color: Colors.black, fontSize: 22),
                        controller: _gst,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          // labelText: 'Enter Name',
                          hintText: 'Enter GST(%)',
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      height: 70,
                      width: 190,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE11299),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        style:
                            const TextStyle(color: Colors.black, fontSize: 22),
                        controller: _discount,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          // labelText: 'Enter Name',
                          hintText: 'Enter Discount(%)',
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Container(
                      height: 70,
                      width: 190,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE11299),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        style:
                            const TextStyle(color: Colors.black, fontSize: 22),
                        controller: _finalAmount,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          // labelText: 'Enter Name',
                          hintText: 'Final Amount',
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 21,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 40),
                    child: SizedBox(
                      width: 110,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFB84C),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onPressed: (() {
                          tax = double.parse(_amount.text) *
                              double.parse(_gst.text) /
                              100;
                          newAmount = double.parse(_amount.text) + tax;
                          disc = double.parse(_discount.text) * newAmount / 100;
                          result = newAmount - disc;
                          _finalAmount.text = result.toString();
                        }),
                        child: Text(
                          'Calculate',
                          style: GoogleFonts.ubuntu(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
