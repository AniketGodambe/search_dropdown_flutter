import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dropdown_cotroller.dart';

class DropDownPage extends StatefulWidget {
  const DropDownPage({Key? key}) : super(key: key);

  @override
  State<DropDownPage> createState() => _DropDownPageState();
}

class _DropDownPageState extends State<DropDownPage> {
  final DropdownDataController c = Get.put(DropdownDataController());

  List<String> countrys = [];
  @override
  void initState() {
    // print(c.countrys);
    countrys = c.countrys;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 100),
            Text(
              "Select Country",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 5),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1, color: Color.fromARGB(255, 111, 103, 223)),
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white),

              //DropdownSearch start
              child: DropdownSearch<String>(
                mode: Mode.DIALOG,
                showSearchBox: true,
                //dropdown button code
                dropdownButtonBuilder: (_) => const Padding(
                  padding: EdgeInsets.all(4),
                  child: Icon(
                    Icons.arrow_drop_down,
                    size: 24,
                    color: Colors.black,
                  ),
                ),
                hint: "Select Country",
                showSelectedItem: true,
                dropdownSearchBaseStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                ),

                //dropdown field decoration here
                dropdownSearchDecoration: const InputDecoration(
                    filled: false, enabledBorder: InputBorder.none),

                //data list here
                items: countrys,
                onChanged: (value) {
                  print(value);
                },
                //popup UI changes here
                popupItemBuilder:
                    (BuildContext context, String? item, bool isSelected) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      item!,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          decorationColor: Colors.blue,
                          color: isSelected ? Colors.blue : Colors.blue),
                    ),
                  );
                },
                //popup search field design
                searchFieldProps: TextFieldProps(
                  autocorrect: true,
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.w600),
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.blue),
                    prefixIcon: const Icon(Icons.search),
                    border: const OutlineInputBorder(gapPadding: 4),
                    contentPadding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                  ),
                ),
                //hint and selected item from dropdown style
                dropdownBuilder: (context, a, b) {
                  return a == null
                      ? const Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            "Select country",
                            style: TextStyle(
                                color: Color(0xffBEBDD0),
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Text(
                            a.toString(),
                            style: const TextStyle(
                                color: Color(0xff37319B),
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                          ),
                        );
                },
                //popup shape custom
                popupShape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                ),
                scrollbarProps: ScrollbarProps(
                  isAlwaysShown: false,
                  thickness: 7,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
