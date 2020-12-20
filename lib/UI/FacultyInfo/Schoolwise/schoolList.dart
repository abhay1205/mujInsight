import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mujinsight/UI/FacultyInfo/Schoolwise/schoolDetails.dart';
import 'package:mujinsight/UI/Widgets/backTopBar.dart';

class SchoolPage extends StatefulWidget {
  String name;
  int sNum;
  SchoolPage({this.name, this.sNum});
  @override
  _SchoolPageState createState() => _SchoolPageState();
}

class _SchoolPageState extends State<SchoolPage> with TickerProviderStateMixin {
  AnimationController controllerTF, controllerTS, controllerCard;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllerCard =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    controllerCard.forward();
    controllerTF = AnimationController(
        lowerBound: 0,
        upperBound: 180,
        duration: Duration(seconds: 4),
        vsync: this);
    controllerTF.forward();

    controllerTF.addListener(() {
      setState(() {
        // print(controllerTF.value);
      });
    });
    controllerTS = AnimationController(
        lowerBound: 0,
        upperBound: 600,
        duration: Duration(seconds: 4),
        vsync: this);
    controllerTS.forward();

    controllerTS.addListener(() {
      setState(() {
        // print(controllerTF.value);
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controllerCard.dispose();
    controllerTF.dispose();
    controllerTS.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double ht = MediaQuery.of(context).size.height;
    double wt = MediaQuery.of(context).size.width;
    print(widget.name);
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.white, Colors.grey[100]],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.2, 0.4])),
          // margin: EdgeInsets.fromLTRB(wt * 0.01, ht * 0.01, wt * 0.01, 0),
          // padding: EdgeInsets.fromLTRB(wt * 0.02, ht * 0.03, wt * 0.02, 0),
          height: ht,
          child: Column(
            children: [
              BackTopBar(),
              schoolName(ht, wt, widget.name),
              Container(
                height: ht * 0.77,
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: AnimatedItem(
                          startDelayFraction: 0.00,
                          controller: controllerCard,
                          child: AnimCategoryContainer(
                            CategoryBean(
                              Icons.desktop_mac, 
                              'School One', 
                              [
                                CategoryBean(Icons.repeat, 'Item 1', [], (){}),
                                CategoryBean(Icons.repeat, 'Item 2', [], (){}),
                                CategoryBean(Icons.repeat, 'Item 3', [], (){}),
                                
                              ], 
                              (){})
                          ),
                        ),
                      );
                      
                      
                      // Container(
                      //   height: ht * 0.25,
                      //   margin: EdgeInsets.symmetric(
                      //       horizontal: wt * 0.05, vertical: ht * 0.01),
                      //   decoration: BoxDecoration(
                      //       color: Colors.white,
                      //       border: Border.all(color: Colors.white, width: 3),
                      //       borderRadius: BorderRadius.circular(10),
                      //       boxShadow: [
                      //         BoxShadow(blurRadius: 2, color: Colors.grey[600])
                      //       ]),
                      //   child: schoolInfo(ht, wt, index),
                      // );
                    }),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Colors.orange,
            onPressed: () {},
            label: Text('Info-Graphics',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w600))));
  }

  Widget schoolName(double ht, double wt, String name) {
    return Container(
      margin: EdgeInsets.only(top: ht * 0.03, left: wt * 0.02),
      alignment: Alignment.topLeft,
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: 'Faculty of\n',
              style: TextStyle(
                  fontSize: ht * 0.02,
                  letterSpacing: 1,
                  wordSpacing: 2,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600)),
          TextSpan(
              text: widget.name,
              style: TextStyle(
                  fontSize: ht * 0.035,
                  letterSpacing: 1,
                  wordSpacing: 2,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600))
        ]),
      ),
    );
  }

  Widget schoolInfo(double ht, double wt, int i) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: 'School Name ${i + 1}\n',
                          style: TextStyle(
                              fontSize: ht * 0.02,
                              letterSpacing: 1,
                              wordSpacing: 2,
                              color: Colors.black54,
                              fontWeight: FontWeight.w600)),
                      TextSpan(
                          text: 'Programs: 10\n',
                          style: TextStyle(
                              fontSize: ht * 0.02,
                              letterSpacing: 1,
                              wordSpacing: 2,
                              color: Colors.black54,
                              fontWeight: FontWeight.w600)),
                      TextSpan(
                          text: 'Department: 3\n',
                          style: TextStyle(
                              fontSize: ht * 0.02,
                              letterSpacing: 1,
                              wordSpacing: 2,
                              color: Colors.black54,
                              fontWeight: FontWeight.w600)),
                    ]),
                  ),
                  // Container(
                  //   alignment: Alignment.centerLeft,
                  //   child: Text('${controllerTF.value.toStringAsFixed(0)} Faculties'),
                  // ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              // border: Border.all(color: Colors.white, width: 3),
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 3, color: Colors.grey[400])
                              ]),
                          padding: EdgeInsets.only(left: 10),
                          height: ht * 0.05,
                          child: controllerTF.value == 180
                              ? Text(
                                  'Faculties',
                                  style: TextStyle(
                                      color: Colors.white,
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.w600),
                                )
                              : Text(''),
                          // color: Colors.orange,
                          alignment: Alignment.centerLeft,
                          width: controllerTF.value * 0.9,
                        ),
                        Text(
                          ' ${controllerTF.value.toStringAsFixed(0)}',
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 3, color: Colors.grey[400])
                              ]),
                          padding: EdgeInsets.only(left: 10),
                          height: ht * 0.05,
                          child: controllerTS.value == 600
                              ? Text(
                                  'Students',
                                  style: TextStyle(
                                      color: Colors.white,
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.w600),
                                )
                              : Text(''),
                          alignment: Alignment.centerLeft,
                          width: controllerTS.value * 0.4,
                        ),
                        Text(
                          ' ${controllerTS.value.toStringAsFixed(0)}',
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward_ios),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => SchoolDetails(
                      dNum: 3,
                      name: 'BBA',
                    ))),
          )
        ],
      ),
    );
  }
}

  class AnimatedItem extends StatelessWidget {
    AnimatedItem({
      Key key,
      double startDelayFraction,
      @required this.controller,
      @required this.child
    }) : topPaddingAnimation = Tween(
      begin: 60.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
      parent: controller,
      curve: Interval(
        0.000 + startDelayFraction,
        0.400 + startDelayFraction
      )
     )
    ),
    super(key:key);

    final Widget child;
    final AnimationController controller;
    final Animation<double> topPaddingAnimation;
    @override
    Widget build(BuildContext context) {
      return AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Padding(
            padding: EdgeInsets.only(top: topPaddingAnimation.value),
            child: child,
          );
        },
        child: child,
      );
    }
  }

  class AnimCategoryContainer extends StatefulWidget {
    final CategoryBean categoryBean;
    AnimCategoryContainer(this.categoryBean);
    @override
    _AnimCategoryContainerState createState() => _AnimCategoryContainerState();
  }
  
  class _AnimCategoryContainerState extends State<AnimCategoryContainer> with SingleTickerProviderStateMixin{
    bool isExpanded;
    AnimationController controller;
    Animation<EdgeInsetsGeometry> marginAnim;
    Animation<BorderRadius> radiusAnim;

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isExpanded = false;
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    marginAnim = Tween(
      begin: EdgeInsets.symmetric(horizontal: 16.0),
      end: EdgeInsets.symmetric(horizontal: 10.0)
    ).animate(controller);
    radiusAnim = BorderRadiusTween(
      begin: BorderRadius.circular(15),
      end: BorderRadius.circular(15)
    ).animate(controller);
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
              child: InkWell(
                onTap: () => onTap(),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 24),
                            child: Text('School Name'),
                          ),
                          SizedBox(width: 8,),
                           Text(
                              widget.categoryBean.title,
                              overflow: TextOverflow.ellipsis,
                            ),
                          
                          Icon(Icons.keyboard_arrow_down)
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
            ),
          );
        },
        child: isExpanded || controller.isDismissed?
          Column(
            children: [
              for (final demo in widget.categoryBean.categoryItems) 
                AnimCategoryItem(demo),
              const SizedBox(height: 12,)  
              
            ],
          ): null,
      );
    }
    void onTap(){
      isExpanded = !isExpanded;
      if(isExpanded){
        controller.forward();
        setState(() {
          
        });
      }
      else{
        controller.reverse().then<void>((value){
          if(!mounted){
            return;
          }
          setState(() {
            
          });
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
      return ListTile(
        onTap: widget.categoryBeanItem.onTap,
        title: Text(
          widget.categoryBeanItem.title,
          style: TextStyle(color: Colors.black),
        ),
        
      );
    }
  }

  class CategoryBean{
    IconData icon;
    String title;
    List<CategoryBean> categoryItems;
    var onTap;
    CategoryBean(this.icon, this.title, this.categoryItems, this.onTap);
  }
