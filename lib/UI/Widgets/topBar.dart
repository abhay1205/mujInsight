// import 'package:flutter/material.dart';
// enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

// class TopBar extends StatefulWidget {
//   GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
//   TopBar({this.scaffoldKey});
//   @override
//   _TopBarState createState() => _TopBarState();
// }

// class _TopBarState extends State<TopBar> {
  
  
  
//   @override
//   Widget build(BuildContext context) {
//     double ht = MediaQuery.of(context).size.height;
//     double wt = MediaQuery.of(context).size.width;
//     return Container(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Container(
//             decoration: BoxDecoration(
//                 color: Colors.orange,
//                 border: Border.all(color: Colors.white, width: 3),
//                 borderRadius: BorderRadius.circular(10),
//                 boxShadow: [BoxShadow(blurRadius: 2, color: Colors.grey[600])]),
//             child: IconButton(
//               icon: Icon(
//                 Icons.sort,
//                 color: Colors.black87,
//               ),
//               onPressed: () {
//                 scaffoldKey.currentState.openDrawer();
//               },
//             ),
//           ),
//           Text('MUJ Insights', style: TextStyle(fontSize: ht*0.025, fontWeight: FontWeight.w600, color: Colors.black87),),
//           Container(
//             decoration: BoxDecoration(
//                 color: Colors.orange,
//                 border: Border.all(color: Colors.white, width: 3),
//                 borderRadius: BorderRadius.circular(10),
//                 boxShadow: [BoxShadow(blurRadius: 2, color: Colors.grey[600])]),
//             child: PopupMenuButton<WhyFarther>(
//   onSelected: (WhyFarther result) { setState(() { _selection = result; }); },
//   itemBuilder: (BuildContext context) => <PopupMenuEntry<WhyFarther>>[
//     const PopupMenuItem<WhyFarther>(
//       value: WhyFarther.harder,
//       child: Text('Working a lot harder'),
//     ),
//     const PopupMenuItem<WhyFarther>(
//       value: WhyFarther.smarter,
//       child: Text('Being a lot smarter'),
//     ),
//     const PopupMenuItem<WhyFarther>(
//       value: WhyFarther.selfStarter,
//       child: Text('Being a self-starter'),
//     ),
//     const PopupMenuItem<WhyFarther>(
//       value: WhyFarther.tradingCharter,
//       child: Text('Placed in charge of trading charter'),
//     ),
//   ],
// )
//           )
//         ],
//       ),
//     );
  
//   }
// }