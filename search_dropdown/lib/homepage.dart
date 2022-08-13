// import 'package:dio/dio.dart';
// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter/material.dart';

// import 'user_model.dart';

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final _formKey = GlobalKey<FormState>();
//   final _openDropDownProgKey = GlobalKey<DropdownSearchState<String>>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("DropdownSearch Demo")),
//       body: Padding(
//         padding: const EdgeInsets.all(25),
//         child: Form(
//           key: _formKey,
//           autovalidateMode: AutovalidateMode.onUserInteraction,
//           child: ListView(
//             padding: const EdgeInsets.all(4),
//             children: <Widget>[
//               ///Menu Mode with no searchBox
//               DropdownSearch<String>(
//                 validator: (v) => v == null ? "required field" : null,
//                 hint: "Select a country",
//                 mode: Mode.MENU,
//                 showSelectedItem: true,
//                 items: const [
//                   "Brazil",
//                   "Italia (Disabled)",
//                   "Tunisia",
//                   'Canada'
//                 ],
//                 label: "Menu mode *",
//                 showClearButton: true,
//                 onChanged: print,
//                 popupItemDisabled: (String s) => s.startsWith('I'),
//                 clearButtonSplashRadius: 20,
//                 selectedItem: "Tunisia",
//                 onBeforeChange: (a, b) {
//                   if (b == null) {
//                     AlertDialog alert = AlertDialog(
//                       title: const Text("Are you sure..."),
//                       content: const Text("...you want to clear the selection"),
//                       actions: [
//                         TextButton(
//                           child: const Text("OK"),
//                           onPressed: () {
//                             Navigator.of(context).pop(true);
//                           },
//                         ),
//                         TextButton(
//                           child: const Text("NOT OK"),
//                           onPressed: () {
//                             Navigator.of(context).pop(false);
//                           },
//                         ),
//                       ],
//                     );

//                     return showDialog<bool>(
//                         context: context,
//                         builder: (BuildContext context) {
//                           return alert;
//                         });
//                   }

//                   return Future.value(true);
//                 },
//               ),
//               const Divider(),

//               ///Menu Mode with overriden icon and dropdown buttons
//               Row(
//                 children: [
//                   Expanded(
//                     flex: 2,
//                     child: DropdownSearch<String>(
//                       validator: (v) => v == null ? "required field" : null,
//                       hint: "Select a country",
//                       mode: Mode.MENU,
//                       dropdownSearchDecoration: const InputDecoration(
//                         filled: true,
//                         border: UnderlineInputBorder(
//                           borderSide: BorderSide(color: Color(0xFF01689A)),
//                         ),
//                       ),
//                       showAsSuffixIcons: true,
//                       clearButtonBuilder: (_) => const Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Icon(
//                           Icons.clear,
//                           size: 24,
//                           color: Colors.black,
//                         ),
//                       ),
//                       dropdownButtonBuilder: (_) => const Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Icon(
//                           Icons.arrow_drop_down,
//                           size: 24,
//                           color: Colors.black,
//                         ),
//                       ),
//                       showSelectedItem: true,
//                       items: const [
//                         "Brazil",
//                         "Italia (Disabled)",
//                         "Tunisia",
//                         'Canada'
//                       ],
//                       label: "Menu mode *",
//                       showClearButton: true,
//                       onChanged: print,
//                       popupItemDisabled: (String s) => s.startsWith('I'),
//                       selectedItem: "Tunisia",
//                     ),
//                   ),
//                   const Expanded(
//                       child: TextField(
//                     decoration: InputDecoration(
//                       filled: true,
//                       labelText: "Menu mode *",
//                       border: UnderlineInputBorder(
//                         borderSide: BorderSide(color: Color(0xFF01689A)),
//                       ),
//                     ),
//                   ))
//                 ],
//               ),
//               const Divider(),
//               DropdownSearch<UserModel>(
//                 searchFieldProps: TextFieldProps(
//                   controller: TextEditingController(text: 'Mrs'),
//                 ),
//                 mode: Mode.BOTTOM_SHEET,
//                 maxHeight: 700,
//                 isFilteredOnline: true,
//                 showClearButton: true,
//                 showSearchBox: true,
//                 label: 'User *',
//                 dropdownSearchDecoration: InputDecoration(
//                   filled: true,
//                   fillColor: Theme.of(context).inputDecorationTheme.fillColor,
//                 ),
//                 autoValidateMode: AutovalidateMode.onUserInteraction,
//                 validator: (u) => u == null ? "user field is required " : null,
//                 onFind: (String filter) => getData(filter),
//                 onChanged: (data) {
//                   print(data);
//                 },
//                 dropdownBuilder: _customDropDownExample,
//                 popupItemBuilder: _customPopupItemBuilderExample,
//                 popupSafeArea: const PopupSafeArea(top: true, bottom: true),
//                 scrollbarProps: ScrollbarProps(
//                   isAlwaysShown: true,
//                   thickness: 7,
//                 ),
//               ),
//               const Divider(),

//               ///custom itemBuilder and dropDownBuilder
//               DropdownSearch<UserModel>(
//                 showSelectedItem: true,
//                 compareFn: (i, s) => i.isEqual(s),
//                 label: "Person",
//                 onFind: (String filter) => getData(filter),
//                 onChanged: (data) {
//                   print(data);
//                 },
//                 dropdownBuilder: _customDropDownExample,
//                 popupItemBuilder: _customPopupItemBuilderExample2,
//               ),
//               const Divider(),

//               ///BottomSheet Mode with no searchBox
//               DropdownSearch<String>(
//                 mode: Mode.BOTTOM_SHEET,
//                 items: const [
//                   "Brazil",
//                   "Italia",
//                   "Tunisia",
//                   'Canada',
//                   'Zraoua',
//                   'France',
//                   'Belgique'
//                 ],
//                 label: "Custom BottomShet mode",
//                 onChanged: print,
//                 selectedItem: "Brazil",
//                 showSearchBox: true,
//                 searchFieldProps: TextFieldProps(
//                   decoration: const InputDecoration(
//                     border: OutlineInputBorder(),
//                     contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
//                     labelText: "Search a country1",
//                   ),
//                 ),
//                 popupTitle: Container(
//                   height: 50,
//                   decoration: BoxDecoration(
//                     color: Theme.of(context).primaryColorDark,
//                     borderRadius: const BorderRadius.only(
//                       topLeft: Radius.circular(20),
//                       topRight: Radius.circular(20),
//                     ),
//                   ),
//                   child: const Center(
//                     child: Text(
//                       'Country',
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//                 popupShape: const RoundedRectangleBorder(
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(24),
//                     topRight: Radius.circular(24),
//                   ),
//                 ),
//               ),
//               const Divider(),

//               ///show favorites on top list
//               DropdownSearch<UserModel>(
//                 showSelectedItem: true,
//                 showSearchBox: true,
//                 compareFn: (i, s) => i.isEqual(s),
//                 label: "Person with favorite option",
//                 onFind: (filter) => getData(filter),
//                 onChanged: (data) {
//                   print(data);
//                 },
//                 dropdownBuilder: _customDropDownExample,
//                 popupItemBuilder: _customPopupItemBuilderExample2,
//                 showFavoriteItems: true,
//                 favoriteItemsAlignment: MainAxisAlignment.start,
//                 favoriteItems: (items) {
//                   return items.where((e) => e.name.contains("Mrs")).toList();
//                 },
//                 favoriteItemBuilder: (context, item) {
//                   return Container(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
//                     decoration: BoxDecoration(
//                         border: Border.all(color: Colors.grey),
//                         borderRadius: BorderRadius.circular(10),
//                         color: Colors.grey[100]),
//                     child: Text(
//                       item.name,
//                       textAlign: TextAlign.center,
//                       style: const TextStyle(color: Colors.indigo),
//                     ),
//                   );
//                 },
//               ),
//               const Divider(),

//               ///merge online and offline data in the same list and set custom max Height
//               DropdownSearch<UserModel>(
//                 items: [
//                   UserModel(name: "Offline name1", id: "999"),
//                   UserModel(name: "Offline name2", id: "0101")
//                 ],
//                 maxHeight: 300,
//                 onFind: (String filter) => getData(filter),
//                 label: "choose a user",
//                 onChanged: print,
//                 showSearchBox: true,
//               ),
//               const Divider(),

//               ///open dropdown programmatically
//               DropdownSearch<String>(
//                 items: const ["no action", "confirm in the next dropdown"],
//                 label: "open another dropdown programmatically",
//                 onChanged: (v) {
//                   if (v == "confirm in the next dropdown") {
//                     _openDropDownProgKey.currentState?.openDropDownSearch();
//                   }
//                 },
//               ),
//               const Padding(padding: EdgeInsets.all(4)),
//               DropdownSearch<String>(
//                 key: _openDropDownProgKey,
//                 items: const ["Yes", "No"],
//                 label: "confirm",
//                 showSelectedItem: true,
//                 dropdownButtonSplashRadius: 20,
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   ElevatedButton(
//                       onPressed: () {
//                         _openDropDownProgKey.currentState?.openDropDownSearch();
//                       },
//                       child: const Text("Open dropdownSearch")),
//                   ElevatedButton(
//                       onPressed: () {
//                         _openDropDownProgKey.currentState
//                             ?.changeSelectedItem("No");
//                       },
//                       child: const Text("set to 'NO'")),
//                   Material(
//                     child: ElevatedButton(
//                         onPressed: () {
//                           _openDropDownProgKey.currentState
//                               ?.changeSelectedItem("Yes");
//                         },
//                         child: const Text("set to 'YES'")),
//                   ),
//                   ElevatedButton(
//                       onPressed: () {
//                         _openDropDownProgKey.currentState
//                             ?.changeSelectedItem("Blabla");
//                       },
//                       child: const Text("set to 'Blabla'")),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _customDropDownExample(
//       BuildContext context, UserModel? item, String itemDesignation) {
//     if (item == null) {
//       return Container();
//     }

//     return Container(
//       child: (item.avatar == null)
//           ? const ListTile(
//               contentPadding: EdgeInsets.all(0),
//               leading: CircleAvatar(),
//               title: Text("No item selected"),
//             )
//           : ListTile(
//               contentPadding: const EdgeInsets.all(0),
//               leading: const CircleAvatar(
//                   // this does not work - throws 404 error
//                   // backgroundImage: NetworkImage(item.avatar ?? ''),
//                   ),
//               title: Text(item.name),
//               subtitle: Text(
//                 item.createdAt.toString(),
//               ),
//             ),
//     );
//   }

//   Widget _customPopupItemBuilderExample(
//       BuildContext context, UserModel item, bool isSelected) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 8),
//       decoration: !isSelected
//           ? null
//           : BoxDecoration(
//               border: Border.all(color: Theme.of(context).primaryColor),
//               borderRadius: BorderRadius.circular(5),
//               color: Colors.white,
//             ),
//       child: ListTile(
//         selected: isSelected,
//         title: Text(item.name),
//         subtitle: Text(item.createdAt.toString()),
//         leading: const CircleAvatar(
//             // this does not work - throws 404 error
//             // backgroundImage: NetworkImage(item.avatar ?? ''),
//             ),
//       ),
//     );
//   }

//   Widget _customPopupItemBuilderExample2(
//       BuildContext context, UserModel item, bool isSelected) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 8),
//       decoration: !isSelected
//           ? null
//           : BoxDecoration(
//               border: Border.all(color: Theme.of(context).primaryColor),
//               borderRadius: BorderRadius.circular(5),
//               color: Colors.white,
//             ),
//       child: ListTile(
//         selected: isSelected,
//         title: Text(item.name),
//         subtitle: Text(item.createdAt.toString()),
//         leading: const CircleAvatar(
//             // this does not work - throws 404 error
//             // backgroundImage: NetworkImage(item.avatar ?? ''),
//             ),
//       ),
//     );
//   }

//   Future<List<UserModel>> getData(filter) async {
//     var response = await Dio().get(
//       "https://5d85ccfb1e61af001471bf60.mockapi.io/user",
//       queryParameters: {"filter": filter},
//     );

//     final data = response.data;
//     if (data != null) {
//       return UserModel.fromJsonList(data);
//     }

//     return [];
//   }
// }
