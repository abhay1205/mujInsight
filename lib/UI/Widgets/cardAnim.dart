import 'package:flutter/material.dart';
import 'package:mujinsight/UI/FacultyInfo/Widgets/barGraph.dart';

class AnimatedItem extends StatelessWidget {
  AnimatedItem(
      {Key key,
      double startDelayFraction,
      @required this.controller,
      @required this.child})
      : topPaddingAnimation = Tween(
          begin: 60.0,
          end: 0.0,
        ).animate(CurvedAnimation(
            parent: controller,
            curve: Interval(
                0.000 + startDelayFraction, 0.400 + startDelayFraction))),
        super(key: key);

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
                        Text(
                          widget.categoryBean.title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black87,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w600),
                        ),

                        IconButton(
                          onPressed: () => onTap(),
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