import 'package:flutter/material.dart';
import 'package:mujinsight/UI/FacultyInfo/Widgets/barGraph.dart';
import 'package:mujinsight/UI/FacultyInfo/facultyYWinfo.dart';
import 'package:mujinsight/UI/StudentInfo/studentYWinfo.dart';
import 'package:mujinsight/UI/StudentInfo/studentsFWinfo.dart';
import 'package:mujinsight/UI/Widgets/backTopBar.dart';
import 'package:mujinsight/UI/Widgets/totalAnim.dart';
import 'package:http/http.dart' as http;
import 'package:mujinsight/utils/hosting.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class FacultyDWinfo extends StatefulWidget {

  @override
  _FacultyDWinfoState createState() => _FacultyDWinfoState();
}

class _FacultyDWinfoState extends State<FacultyDWinfo> {


  @override
  Widget build(BuildContext context) {
    double ht = MediaQuery.of(context).size.height;
    double wt = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.white, Colors.grey[100]],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.2, 0.4])),
            height: ht,
            child: Column(
              children: [
                BackTopBar(),
                SingleChildScrollView(
                  child: FacultyDW()
                 
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: Icon(Icons.camera_alt, color: Colors.white,),
        onPressed: (){},
      ),
    );
  }
}

class FacultyDW extends StatefulWidget {
  @override
  _FacultyDWState createState() => _FacultyDWState();
}

class _FacultyDWState extends State<FacultyDW>
    with TickerProviderStateMixin {
  List<String> faculties = [
    'Department of Computer Science & Engineering',
    'Department of Information Technology',
    'Department of Computer & Communication Engineering',
  ];

  Map<String, String> _map = {
    'Department of Computer Science & Engineering':'CSE',
    'Department of Information Technology':'IT',
    'Department of Computer & Communication Engineering':'CCE',
  };

  AnimationController controllerCard;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllerCard = AnimationController(
        duration: Duration(seconds: 1, milliseconds: 500), vsync: this);
    controllerCard.forward();    
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controllerCard.dispose();
    
    super.dispose();
  }

  var data;

  Future<http.Response> getData(String code)async{
    print('called');
    final _prefs = await SharedPreferences.getInstance();
    String jwt = _prefs.getString('jwt');
    String uid = _prefs.getString('userID');
    String url1 = apihost + 'dep/getDep/$uid?dcode=$code&year=2020';

    http.Response response = await http.get(url1,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $jwt'
      }
    );

    if(response.statusCode==200){
      var dres = json.decode(response.body)['depy'];
      setState(() {
        data = dres;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double ht = MediaQuery.of(context).size.height;
    double wt = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
          child: Container(
          padding: EdgeInsets.only(
            top: ht * 0.03,
            left: wt * 0.02,
            right: wt * 0.02,
          ),
          height: ht * 0.9,
          width: wt,
          child: ListView(
            children: [
              // TotalAnim(title: 'Facultys', totalValue: 7000.0,),
              
              Container(
                padding: EdgeInsets.only(top:20),
                height: ht * 0.75,
                child: ListView.builder(
                  itemCount: faculties.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: AnimatedItem(
                        startDelayFraction: 0.00,
                        controller: controllerCard,
                        child: AnimCategoryContainer(
                          CategoryBean(
                            title: faculties[index],
                            categoryItems: [
                              CategoryBean(
                            quantity: data!=null?double.parse(data['assistantProfs']):0,
                            title: 'Assistant Professor',
                            isGraph: true),
                        CategoryBean(
                            quantity: data!=null?double.parse(data['associateProfessors']):0,
                            title: 'Associatet Professor',
                            isGraph: true),
                        CategoryBean(
                            quantity: data!=null?double.parse(data['professors']):0, title: 'Professor',
                            isGraph: true),
                              CategoryBean(widgget: Container(
                                
                                alignment: Alignment.centerRight,
                                child: FlatButton(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                  color: Colors.orange,
                                  onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => FacultyYWinfo())),
                                  child: Text('View Year Wise', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),))), isGraph: false),
                            ],
                            onTap: () {}
                            ),
                            getData,
                            _map[faculties[index]]),
                      ),
                    );
                  },
                ),
              ),
            ],
          )),
    );
  }
}

class AnimCategoryContainer extends StatefulWidget {
  final CategoryBean categoryBean;
  final Function _function;
  final String code;
  AnimCategoryContainer(this.categoryBean, this._function, this.code);
  @override
  _AnimCategoryContainerState createState() => _AnimCategoryContainerState();
}

class _AnimCategoryContainerState extends State<AnimCategoryContainer>
    with SingleTickerProviderStateMixin {
  bool isExpanded;
  AnimationController controller;
  Animation<EdgeInsetsGeometry> marginAnim;
  Animation<BorderRadius> radiusAnim;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isExpanded = false;
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    marginAnim = Tween(
            begin: EdgeInsets.symmetric(horizontal: 16.0),
            end: EdgeInsets.symmetric(horizontal: 10.0))
        .animate(controller);
    radiusAnim = BorderRadiusTween(
            begin: BorderRadius.circular(15), end: BorderRadius.circular(15))
        .animate(controller);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Container(
          margin: marginAnim.value,
          child: Material(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: radiusAnim.value,
            ),
            color: Colors.white,
            clipBehavior: Clip.antiAlias,
            child:  Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                    ),
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Container(
                        //   margin: EdgeInsets.symmetric(horizontal: 24),
                        //   child: Text('School Name'),
                        // ),
                        // SizedBox(width: 8,),
                        Container(
                          width:MediaQuery.of(context).size.width*0.6,
                          child: Text(
                            widget.categoryBean.title,
                            // overflow: TextOverflow.clip,
                            maxLines: 3,
                            style: TextStyle(
                                
                                color: Colors.black87,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w600),
                          ),
                        ),

                        IconButton(
                          onPressed: () async{
                            await widget._function(widget.code);
                            onTap();
                          } ,
                          icon:isExpanded
                            ? Icon(Icons.keyboard_arrow_up)
                            : Icon(Icons.keyboard_arrow_down))
                      ],
                    ),
                  ),
                  ClipRect(
                    child: Align(
                      heightFactor: controller.value,
                      child: child,
                    ),
                  )
                ],
              ),
            
          ),
        );
      },
      child: isExpanded || controller.isDismissed
          ? Column(
              children: [
                for (final demo in widget.categoryBean.categoryItems)
                  AnimCategoryItem(demo),
                const SizedBox(
                  height: 12,
                )
              ],
            )
          : null,
    );
  }

  void onTap() {
    isExpanded = !isExpanded;
    if (isExpanded) {
      controller.forward();
      setState(() {});
    } else {
      controller.reverse().then<void>((value) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    }
  }
}

class AnimCategoryItem extends StatefulWidget {
  final CategoryBean categoryBeanItem;

  AnimCategoryItem(this.categoryBeanItem);
  @override
  _AnimCategoryItemState createState() => _AnimCategoryItemState();
}

class _AnimCategoryItemState extends State<AnimCategoryItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: widget.categoryBeanItem.isGraph?
      BarGraph(title: widget.categoryBeanItem.title, prof: widget.categoryBeanItem.quantity,)
      :widget.categoryBeanItem.widgget,
    );

    // ListTile(
    //   onTap: widget.categoryBeanItem.onTap,
    //   title: Text(
    //     widget.categoryBeanItem.title,
    //     style: TextStyle(color: Colors.black),
    //   ),

    // );
  }
}

class CategoryBean {
  double quantity;
  String title;
  Widget widgget;
  List<CategoryBean> categoryItems;
  bool isGraph;
  var onTap;
  CategoryBean(
      {this.quantity,
      this.title,
      this.widgget,
      this.categoryItems,
      this.onTap,
      this.isGraph});
}