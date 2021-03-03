import 'dart:convert';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:mujinsight/UI/Widgets/backTopBar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class SearchFaculty extends StatefulWidget {
  bool check;
  String jwtToken, accessToken;
  SearchFaculty({this.check, this.jwtToken, this.accessToken});
  @override
  _SearchFacultyState createState() => _SearchFacultyState();
}

class _SearchFacultyState extends State<SearchFaculty> {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // List<dynamic> itemList = [];
  List<dynamic> selectedList = [];
  List<dynamic> testList = [];
  List<dynamic> queryResult = [];
  WhyFarther _selection;
  // List<dynamic> fList = [];
  Future<List<dynamic>> labTestFuture;
  // Future<List<dynamic>> labTestProfile;
  // Future<List<dynamic>> labTestParam;
  // Future<List<dynamic>> labTestSugesstion;
  // List<dynamic> suggesstedTest;
  // bool searchBar = true;
  // TextEditingController textEditingController = TextEditingController();
  String accessToken, jwtToken;
  // List<dynamic> popularTest = [
  //   {
  //     'name': 'Diabities Profile',
  //     'mrp': '1520',
  //     'price': '349',
  //     'pid': '118',
  //     'id': 'package_118',
  //     'package_code': 'P0028',
  //     'cost_id': 'package_118_169'
  //   },
  //   {
  //     'name': 'Healthians Full Body Checkup with Iron Studies',
  //     'mrp': '7200',
  //     'price': '2399',
  //     'pid': '105',
  //     'id': 'package_105',
  //     'package_code': 'P0015',
  //     'cost_id': 'package_105_91'
  //   },
  //   {
  //     'name': 'Thyroid Subscription Package',
  //     'mrp': '1350',
  //     'price': '549',
  //     'pid': '117',
  //     'id': 'package_117',
  //     'package_code': 'P0027',
  //     'cost_id': 'package_117_163'
  //   }
  // ];

  @override
  void initState() {
    super.initState();

    // textEditingController.clear();
    // getHealthianToken().then((value) {
    //   labTestFuture = getPopularPackages().then((value) => testList = value);
    // });
  }

  // Future<void> getHealthianToken() async {
  //   var jwtURL = '${apiHost}lab/getHealthianToken';
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String jwtTokenValue = prefs.getString('jwtTokenValue');
  //   print("JWT " + jwtTokenValue);
  //   try {
  //     var tokenres =
  //         await http.get(jwtURL, headers: {'Authorization': jwtTokenValue});
  //     var token = json.decode(tokenres.body)['access_token'];
  //     setState(() {
  //       jwtToken = jwtTokenValue;
  //       accessToken = token;
  //     });
  //     // await prefs.setString('healthianToken', token);
  //     print("HEALTHIAN TOKEN " + token);
  //   } catch (e) {
  //     print('here' + e.toString());
  //   }
  // }

  // FUNC TO GET ALL TEST FROM API

  // Future<List<dynamic>> getPopularPackages() async {
  //   selectedList = [];
  //   var url = HEALTHIAN_API + 'getPopularPackages';
  //   try {
  //     var response = await http
  //         .get(url, headers: {'Authorization': 'Bearer ' + accessToken});
  //     if (response.statusCode == 200) {
  //       var list = json.decode(response.body)['packages'];
  //       // fList = list;
  //       testList = list;
  //       return list;
  //     } else {
  //       await Fluttertoast.showToast(
  //           msg: 'Something went wrong while calling API');
  //       throw Exception('Failed to search the lab test');
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  //   return testList;
  // }

  List<dynamic> searchTest(String query) {
    List<dynamic> qR = [];
    for (var test in testList) {
      if (test.toString().contains(query)) {
        qR.add(test);
      }
    }
    setState(() {
      queryResult = qR;
    });
    // print(queryResult);
    return queryResult;
  }

   Widget profileMenuBtn() {
    return PopupMenuButton<WhyFarther>(
      icon: Icon(Icons.person_outline),
      onSelected: (WhyFarther result) {
        setState(() {
          _selection = result;
        });
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<WhyFarther>>[
        const PopupMenuItem<WhyFarther>(
          value: WhyFarther.harder,
          child: Text('Profile'),
        ),
        const PopupMenuItem<WhyFarther>(
          value: WhyFarther.smarter,
          child: Text('Log Out'),
        ),
        const PopupMenuItem<WhyFarther>(
          value: WhyFarther.selfStarter,
          child: Text('Help'),
        ),
        const PopupMenuItem<WhyFarther>(
          value: WhyFarther.tradingCharter,
          child: Text('Rate us'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double ht = MediaQuery.of(context).size.height;
    double wt = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        // This is handled by the search bar itself.
        resizeToAvoidBottomInset: false,
      //   appBar: AppBar(
      //     centerTitle: true,
      //   elevation: 0,
      //   backgroundColor: Colors.grey[100],
      //   title: Text(
      //                 'MUJ Insights',
      //                 style: TextStyle(
      //                     fontFamily: 'Playfair',
      //                     fontSize: ht * 0.03,
      //                     fontWeight: FontWeight.w600,
      //                     color: Colors.black87),
      //               ),
       
      // ),
        body: Container(
          height: ht * 0.99,
          child: ListView(
            children: [
              BackTopBar(),
              Container(
                height: ht * 0.9,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // buildMap(),
                    // buildBottomNavigationBar()
                    Positioned(top: 5, child: testListView()),
                    buildFloatingSearchBar(),
                  ],
                ),
              ),
            ],
          ),
        ),
        // floatingActionButton: FloatingActionButton.extended(
        //     splashColor: Colors.white,
        //     backgroundColor: labTestFuture != null ? Colors.orange : Colors.grey,
        //     onPressed: () {
        //       // print(selectedList.length);

        //       // selectedList.length != 0
        //       //     ? Navigator.of(context).push(MaterialPageRoute(
        //       //         builder: (BuildContext context) => BookingPage(
        //       //               labTest: selectedList,
        //       //               check: widget.check,
        //       //               jwtToken: jwtToken,
        //       //             )))
        //       //     : showDialog(context: context, child: onNoTestSelectDialog());
        //     },
        //     label: Text(
        //       'Next',
        //       style: TextStyle(color: Colors.white),
        //     )),
      ),
    );
  }

  

  

  Widget testListView() {
    return Container(
      child: SingleChildScrollView(
        child: FutureBuilder<List<dynamic>>(
          future: labTestFuture,
          builder: (context, snapshot) {
            Widget response;
            if (selectedList.length != 0) {
              testList.remove(selectedList.last);
              testList.insert(0, selectedList.last);
            }

            if (snapshot.hasData) {
              response = ListView.builder(
                  itemCount: testList.length,
                  itemBuilder: (context, i) {
                    String labTestName, labTestMrp, labTestDisc;
                    bool selected = false;
                    labTestName = testList[i]['name'];
                    labTestMrp = testList[i]['mrp'];
                    labTestDisc = testList[i]['price'].toString();
                    if (selectedList.length != 0) {
                      selected = selectedList.contains(testList[i]);
                    }
                    return AnimatedContainer(
                      height: MediaQuery.of(context).size.height * 0.1,
                      duration: Duration(seconds: 1),
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: selected ? Colors.yellow[400] : Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(color: Colors.grey[700], blurRadius: 1)
                          ]),
                      child: ListTile(
                        title: Text(labTestName),
                        trailing: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: labTestMrp != null
                                  ? 'Rs. ${labTestMrp}\n'
                                  : '',
                              style: TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.lineThrough)),
                          TextSpan(
                              text: labTestDisc != null
                                  ? 'Rs. ${labTestDisc}'
                                  : '',
                              style: TextStyle(color: Colors.orange))
                        ])),
                        onTap: () {
                          setState(() {
                            if (selected) {
                              selectedList.remove(testList[i]);
                            } else {
                              setState(() {
                                selectedList.add(testList[i]);
                                selected = true;
                              });
                            }
                          });
                        },
                        enabled: true,
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              print(snapshot.error.toString());
              response = Text('Error loading the data');
            } else if (snapshot.data == null) {
              response = Container(
               
                child: Text('Search Faculty', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.w600, fontSize: 18)),
              );
            } else {
              response = Container(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                ),
              );
            }
            return Container(
                height: MediaQuery.of(context).size.height * 0.95,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: response);
          },
        ),
      ),
    );
  }

  Widget buildFloatingSearchBar() {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    List<dynamic> searchResult = [];
    return FloatingSearchBar(
      borderRadius: BorderRadius.circular(30),
      hint: 'Search Faculty',
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 500),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      maxWidth: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) {
        // Call your model, bloc, controller here.
        print(query);
        setState(() {
          queryResult.clear();
          searchTest(query[0].toUpperCase()+query.substring(1));
          // print(searchResult);
        });
      },
      backdropColor: Colors.white,
      automaticallyImplyBackButton: false,
      // body: Container(

      //   margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.15, left: MediaQuery.of(context).size.width*0.1) ,
      //   height: MediaQuery.of(context).size.height*0.1,
      //   child: ListView.builder(
      //     itemCount: queryResult.length,
      //     itemBuilder: (context, index) {
      //       print(queryResult);
      //     return Container(
      //       alignment: Alignment.center,
      //       decoration: BoxDecoration(
      //         color: Colors.white,
      //         borderRadius: BorderRadius.circular(20)
      //       ),
      //       height: MediaQuery.of(context).size.height*0.05,
      //       margin: EdgeInsets.all(15),

      //       child: Text(queryResult[index]['name'], style: TextStyle(fontSize: 20),),
      //     );
      //   },),
      // ),
      // Specify a custom transition to be used for
      // animating between opened and closed stated.
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        // FloatingSearchBarAction(
        //   showIfOpened: false,
        //   child: CircularButton(
        //     icon: const Icon(Icons.place),
        //     onPressed: () {},
        //   ),
        // ),
        FloatingSearchBarAction.back(
          color: Colors.orange,
          showIfClosed: false,
        ),
        FloatingSearchBarAction.searchToClear(

          color: Colors.orange,
          showIfClosed: true,
        ),
      ],
      builder: (context, transition) {
      

        return ClipRRect(
          child: Material(

              // type: MaterialType.transparency,
              color: Colors.white,
              elevation: 4.0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.9,
                child: ListView.builder(
                  itemCount: queryResult.length,
                  itemBuilder: (context, index) {
                    bool selected = false;
                    if (selectedList.length != 0) {
                      selected = selectedList.contains(queryResult[index]);
                    }
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (selected) {
                            selectedList.remove(queryResult[index]);
                          } else {
                            setState(() {
                              // print(testList[index]['name']);
                              selectedList.add(queryResult[index]);
                              selected = true;
                            });
                          }
                        });
                      },
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 38, vertical: 10),
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: selected?Colors.yellow[400]: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(blurRadius: 2, color: Colors.grey)
                            ]),
                        height: 60,
                        width: 300,
                        // color: Colors.white,
                        child: Text(
                          queryResult[index]['name'],
                          maxLines: 3,
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    );
                  },
                ),
              )

              // Column(
              //   // mainAxisSize: MainAxisSize.min,
              //   children: queryResult.map((test) {
              //     // print(searchResult);
              //     // print('visible');
              //     bool selected = false;
              //     if (selectedList.length != 0) {
              //                 selected = selectedList.contains(testList[i]);
              //               }
              //     return GestureDetector(
              //       onTap: (){
              //         setState(() {
              //                       if (selected) {
              //                         selectedList.remove(testList[i]);
              //                       } else {
              //                         setState(() {
              //                           selectedList.add(testList[i]);
              //                           selected = true;
              //                         });
              //                       }
              //                     });
              //       },
              //       child: Container(
              //         margin: EdgeInsets.symmetric(horizontal:38, vertical: 10),
              //         padding: EdgeInsets.all(10),
              //         alignment: Alignment.center,
              //         decoration: BoxDecoration(
              //           color: Colors.white,
              //           borderRadius: BorderRadius.circular(20),
              //           boxShadow: [

              //             BoxShadow(blurRadius: 2, color: Colors.grey)
              //           ]
              //         ),
              //         height: 60,
              //         width: 300,
              //         // color: Colors.white,
              //         child: Text(test['name'], maxLines: 3, style: TextStyle(fontSize: 15),),
              //       ),
              //     );
              //   }).toList(),
              // ),
              ),
        );
      },
    );
  }

  Widget onNoTestSelectDialog() {
    return Dialog(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        child: Container(
            alignment: Alignment.center,
            child: Text(
              'Please select atleast one test',
              style: TextStyle(
                  color: Colors.grey[600], fontWeight: FontWeight.w600),
            )),
      ),
    );
  }
}
