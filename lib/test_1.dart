// import 'dart:convert';
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:paytm_allinonesdk/paytm_allinonesdk.dart';
//
// class ProductsDetailsView extends StatefulWidget {
//   const ProductsDetailsView({Key? key}) : super(key: key);
//
//   @override
//   State<ProductsDetailsView> createState() => _ProductsDetailsViewState();
// }
//
// class _ProductsDetailsViewState extends State<ProductsDetailsView> {
// /*
//
// HEy everyone , today we are going to seee how to integrate PAYTM payment gateway in flutter
// paytm integration can be divided into 3 parts
// 1 -> txToken generation
// 2 -> checkout
// 3 -> payment status verification
//
// first let's see backend set up
// 1st txtoken generation
//
//
// let's see UI
//
// we got a textfield and a button
// here
// you have to enter amount click button, on click token generation api
// that's all let's see complete code then demo
// before that there are some platform spefici thing
// let's see it in action
// thanks for watching
// */
//
//   final TextEditingController _controller = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Paytm Integration"),
//       ),
//       body: SizedBox(
//         width: double.infinity,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               margin: const EdgeInsets.all(20),
//               child: TextField(
//                 controller: _controller,
//                 decoration: InputDecoration(
//                   prefixIcon: const Icon(Icons.currency_rupee),
//                   hintText: "Enter payable amount",
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12)),
//                 ),
//               ),
//             ),
//             Container(
//               margin: const EdgeInsets.symmetric(horizontal: 20),
//               width: double.infinity,
//               height: 50,
//               child: ElevatedButton(
//                 onPressed: () {
//                   FocusScope.of(context).requestFocus(FocusNode());
//                   String amount = _controller.text.trim();
//                   if (amount.isEmpty) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                         content: Text("Enter amount"),
//                       ),
//                     );
//                     return;
//                   }
//                   initiateTransaction(amount);
//                 },
//                 child: const Text("Pay"),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void savePaymentDetails(Map<String, dynamic> responseBody) async {
//     Map<String, dynamic> paymentDetails = {
//       'BANKTXNID': responseBody['BANKTXNID'],
//       'CHECKSUMHASH': responseBody['CHECKSUMHASH'],
//       'CURRENCY': responseBody['CURRENCY'],
//       'MID': responseBody['MID'],
//       'ORDERID': responseBody['ORDERID'],
//       'RESPCODE': responseBody['RESPCODE'],
//       'RESPMSG': responseBody['RESPMSG'],
//       'STATUS': responseBody['STATUS'],
//       'TXNAMOUNT': responseBody['TXNAMOUNT'],
//       'TXNID': responseBody['TXNID'],
//     };
//
//     // Send the POST request to your server
//
//     var response = await http.post(
//       Uri.parse('https://yourserver.com/save-payment-details'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode(paymentDetails),
//     );
//
//     // Check the response status code
//     if (response.statusCode != 200) {
//       print('Error saving payment details: ${response.statusCode}');
//     }
//   }
//
//   void initiateTransaction(String amount) async {
//     Map<String, dynamic> body = {
//       'amount': amount,
//     };
//
//     var parts = [];
//     body.forEach((key, value) {
//       parts.add('${Uri.encodeQueryComponent(key)}='
//           '${Uri.encodeQueryComponent(value)}');
//     });
//     var formData = parts.join('&');
//     var res = await http.post(
//       Uri.https(
//         "10.0.2.2", // my ip address , localhost
//         "paytmphp/generate_token.php",
//       ),
//       headers: {
//         "Content-Type": "application/x-www-form-urlencoded", // urlencoded
//       },
//       body: formData,
//     );
//
//     // print(res.body);
//     // print(res.statusCode);
//     if (res.statusCode == 200) {
//       var bodyJson = jsonDecode(res.body);
//       var response = AllInOneSdk.startTransaction(
//         bodyJson['mid'], // merchant id  from api
//         bodyJson['orderId'], // order id from api
//         amount, // amount
//         bodyJson['txnToken'],
//         "",
//         true,
//         false,
//       ).then((value) {
//         //  on payment completion we will verify transaction with transaction verify api
//         //  after payment completion we will verify this transaction
//         //  and this will be final verification for payment
//
//         verifyTransaction(bodyJson['orderId']);
//       }).catchError((error, stackTrace) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(error.message),
//           ),
//         );
//       });
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(res.body),
//         ),
//       );
//     }
//   }
//
//   void verifyTransaction(String orderId) async {
//     Map<String, dynamic> body = {
//       'orderId': orderId,
//     };
//
//     var parts = [];
//     body.forEach((key, value) {
//       parts.add('${Uri.encodeQueryComponent(key)}='
//           '${Uri.encodeQueryComponent(value)}');
//     });
//     var formData = parts.join('&');
//     var res = await http.post(
//       Uri.https(
//         "10.0.2.2", // my ip address , localhost
//         "paytmphp/verify_transaction.php", // let's check verifycation code on backend
//       ),
//       headers: {
//         "Content-Type": "application/x-www-form-urlencoded", // urlencoded
//       },
//       body: formData,
//     );
//
//     // print(res.body);
//     // print(res.statusCode);
// // json decode
//     var verifyJson = jsonDecode(res.body);
// //  display result info > result msg
//
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(verifyJson['body']['resultInfo']['resultMsg']),
//       ),
//     );
//   }
// }
//
// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }
