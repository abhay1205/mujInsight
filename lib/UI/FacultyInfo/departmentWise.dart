import 'package:flutter/material.dart';


class DepartmentWise extends StatefulWidget {
  @override
  _DepartmentWiseState createState() => _DepartmentWiseState();
}

class _DepartmentWiseState extends State<DepartmentWise> with TickerProviderStateMixin{
  

  List<String> departments = [
    'Department of Science',
    'Department of Engineering',
    'Department of Arts & Law',
    'Department of Design',
    'Department of Management & Commerce',
  ];

  AnimationController controllerTF, controllerTS, controllerCard;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllerCard =
        AnimationController(duration: Duration(seconds: 1, milliseconds: 500), vsync: this);
    controllerCard.forward();
    controllerTF = AnimationController(
        lowerBound: 0,
        upperBound: 180,
        duration: Duration(seconds: 4),
        vsync: this);
    controllerTF.forward();

    // controllerTF.addListener(() {
    //   setState(() {
    //     // print(controllerTF.value);
    //   });
    // });
    controllerTS = AnimationController(
        lowerBound: 0,
        upperBound: 600,
        duration: Duration(seconds: 4),
        vsync: this);
    controllerTS.forward();

    // controllerTS.addListener(() {
    //   setState(() {
    //     // print(controllerTF.value);
    //   });
    // });
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
    return Container(
      padding: EdgeInsets.only(top:ht*0.03, left: wt*0.02, right: wt*0.02, ),
      height: ht * 0.75,
      width: wt,
      child: ListView.builder(
        itemCount: departments.length,
        itemBuilder: (context, index) {
          return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: AnimatedItem(
                          startDelayFraction: 0.00,
                          controller: controllerCard,
                          child: AnimCategoryContainer(
                            CategoryBean(
                              Icons.desktop_mac, 
                              departments[index], 
                              [
                                CategoryBean(Icons.repeat, 'Item 1', [], (){}),
                                CategoryBean(Icons.repeat, 'Item 2', [], (){}),
                                CategoryBean(Icons.repeat, 'Item 3', [], (){}),
                                
                              ], 
                              (){})
                          ),
                        ),
                      );
        },)
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
                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05,),
                      height: MediaQuery.of(context).size.height*0.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Container(
                          //   margin: EdgeInsets.symmetric(horizontal: 24),
                          //   child: Text('School Name'),
                          // ),
                          // SizedBox(width: 8,),
                           Text(
                              widget.categoryBean.title,
                              overflow: TextOverflow.ellipsis,
                               style: TextStyle(
                                color: Colors.black54,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          
                          Icon(isExpanded?Icons.keyboard_arrow_up:Icons.keyboard_arrow_down)
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
