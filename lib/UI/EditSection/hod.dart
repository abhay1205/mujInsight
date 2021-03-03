import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mujinsight/UI/Widgets/backTopBar.dart';
import 'package:mujinsight/UI/Widgets/drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:mujinsight/utils/hosting.dart';

class HodSection extends StatefulWidget {
  @override
  _HodSectionState createState() => _HodSectionState();
}

class _HodSectionState extends State<HodSection> {
  String _field, _acdYear, _category='Faculty Information';
  TextEditingController _updateValue;
  Map<String, dynamic> _data;
  String name='', designation='', email='', branch='', depUID;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Map<String, List<String>> _categoryFields = {
    'Faculty Information':[ 'Assistant Professor','Associate Professor','Professor'],
    'Student Information':['Students Admitted','Students Registered','Students Withdrawl','Alumni',],
    'Placement Information':['Students Placed','Students Placed(%)','Companies Visited','Highest Package','Average Package','Lowest Package',],
    'Research Information':['Publications','Conference Publication','Scopus Publication','SCI/SCIE','UGC Care Journals','Funding in (in lacs)','IPR',],
    'Awards and Recognition':[],
    'Functional Units Information':[],
    'Program Information':[],
    'Statutory Meeting Information':[]
  };
  
  Map<String, String> _dataFields ={
     'Assistant Professor':'assistantProfs',
     'Associate Professor':'associateProfessors',
     'Professor':'professors',
     'Students Admitted':'studentsAdmitted',
     'Students Registered':'studentsReg',
     'Students Withdrawl':'studentsWithdraw',
     'Alumni': 'alumniNum',
     'Students Placed':'studentsPlacedNum',
     'Students Placed(%)':'studentsPlacedPer',
     'Companies Visited':'companiesVisit',
     'Highest Package':'highPkg',
     'Average Package':'avgPkg',
     'Lowest Package':'lowPkg',
     'Publications':'publicationsTotal',
     'Conference Publication':'publicationConfTotal',
     'Scopus Publication':'publicatonScopusTotal',
     'SCI/SCIE':'publicatonSCIETotal',
     'UGC Care Journals':'publicatonUGCTotal',
     'Funding in (in lacs)':'funding',
     'IPR':'totalIPR'
  };


  checkAccess()async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String access = _prefs.getString('access');
    if(!access.contains("HOD")){
      Navigator.pop(context);
    }
  }

   
  
  Future<http.Response> getProfile()async{
    print('called');
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String uid = _prefs.getString('userID');
    String jwt = _prefs.getString('jwt');
    String url = apihost + 'auth/getUser?uid=$uid';
    try{
        http.Response response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $jwt'
    });
    if(response.statusCode==200){
      var decodedResponse = json.decode(response.body)['data'];
      setState(() {
      name = decodedResponse['name'];
      designation = decodedResponse['access'];
      email = decodedResponse['email'];
      branch = decodedResponse['branch'];
    });
    }
    else{
      print('Error');
    }
    }catch(e){
      print('Error');
    }   
  }

  Future<http.Response> getDepData(String year)async{
    final _prefs = await SharedPreferences.getInstance();
    String dcode =  _prefs.getString('access').toString().substring(4);
    String uid = _prefs.getString('userID');
    String jwt = _prefs.getString('jwt');

    String url = apihost + 'dep/getDep/'+uid+ '?dcode=$dcode&year=$year';

    http.Response response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $jwt'
    });

    if(response.statusCode==200){
       var decodedResponse = json.decode(response.body)['depy'];
      setState(() {
        depUID = json.decode(response.body)['depy']['_id'];
        _data = decodedResponse;
      });
      print(_data);
    }
  }

  Future<http.Response> updateData()async{
    final _prefs = await SharedPreferences.getInstance();
    String dcode =  _prefs.getString('access').toString().substring(4);
    String uid = _prefs.getString('userID');
    String jwt = _prefs.getString('jwt');

    String url = apihost + 'dep/updateDep/' + uid + '?designation=$dcode&uid=$depUID';
    try{
      http.Response response = await http.put(url, 
      headers: {
        'Authorization': 'Bearer $jwt'
      },
      body: {    
            "assistantProfs": _data[_dataFields['Assistant Professor']].toString(),
            "associateProfessors":  _data[_dataFields['Associate Professor']].toString(),
            "professors": _data[_dataFields['Professor']].toString(),
            "studentsAdmitted": _data[_dataFields['Students Admitted']].toString(),
            "studentsReg": _data[_dataFields['Students Registered']].toString(),
            "studentsWithdraw": _data[_dataFields['Students Withdrawl']].toString(),
            "alumniNum": _data[_dataFields['Alumni']].toString(),
            "studentsPlacedNum": _data[_dataFields['Students Placed']].toString(),
            "studentsPlacedPer": _data[_dataFields['Students Placed(%)']].toString(),
            "companiesVisit": _data[_dataFields['Companies Visited']].toString(),
            "highPkg": _data[_dataFields['Highest Package']].toString(),
            "avgPkg": _data[_dataFields['Average Package']].toString(),
            "publicatonTotal": _data[_dataFields['Publications']].toString(),
            "publicatonScopusTotal": _data[_dataFields['Scopus Publication']].toString(),
            "publicatonSCIETotal": _data[_dataFields['SCI/SCIE']].toString(),
            "publicatonUGCTotal": _data[_dataFields['UGC Care Journals']].toString(),
            "funding": _data[_dataFields['Funding in (in lacs)']].toString(),
            "totalIPR": _data[_dataFields['IPR']].toString(),
            "lowPkg": _data[_dataFields['Lowest Package']].toString(),
            "publicatonConfTotal": _data[_dataFields['Conference Publication']].toString()
        
      }
    );
    if(response.statusCode==200){
      var decodedResponse = json.decode(response.body)['dep']['data'];
      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Data updated Successfully', style: TextStyle(color: Colors.white),), backgroundColor: Colors.orange,));
    }else{
      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Failed to Update Data', style: TextStyle(color: Colors.white),), backgroundColor: Colors.orange,));
    }
    }catch(e){
      print('ERROR: '+ e.toString());
    }
    
  }
  @override
  void initState() {
    // TODO: implement initState
    checkAccess();
    getProfile();
    _updateValue = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _updateValue.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double ht = MediaQuery.of(context).size.height;
    double wt = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: Container(
          decoration: BoxDecoration(

              gradient: LinearGradient(
                  colors: [Colors.white, Colors.grey[100]],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.2, 0.8])),
          margin: EdgeInsets.fromLTRB(wt * 0.01, ht * 0.01, wt * 0.01, 0),
          padding: EdgeInsets.fromLTRB(wt * 0.02, ht * 0.01, wt * 0.02, 0),
          height: ht,
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(child: BackTopBar()),
              // introLine(ht, wt),
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [branch!=''?editCard():Center(child: Padding(
                    padding: EdgeInsets.all(20),
                    child: LinearProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),backgroundColor: Colors.orange[100],),
                  ),),],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  Widget editCard() {
    return Container(
      height: MediaQuery.of(context).size.height*0.75,
      child: Theme(
        data: ThemeData(
            primaryColor: Colors.white,
            textTheme: TextTheme(bodyText1: TextStyle(letterSpacing: 1))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child:  Text(
                    '$branch',
                    maxLines: 3,
                    style: TextStyle(fontSize: 25),
                  ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)]
              ),
              
              child: DropdownButton(
                underline: Container(),
                hint: Text(
                  "Academic Year",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
                ),
                isExpanded: true,
                isDense: false,
                value: _acdYear,
                icon: Icon(
                  Icons.arrow_downward,
                  color: Colors.orange,
                ),
                iconSize: 30,
                elevation: 10,
                style: TextStyle(color: Colors.black),
                onChanged: (String newValue) {
                  setState(() {
                    _acdYear = newValue;
                  });
                },
                dropdownColor: Colors.white,
                items: <String>[
                  'Academic Year 2020-21',
                  'Academic Year 2019-20',
                  'Academic Year 2018-19',
                  'Academic Year 2017-18',
                  'Academic Year 2016-17',
                  'Academic Year 2015-16',
                  'Academic Year 2014-15',
                  'Academic Year 2013-14',
                  'Academic Year 2012-13',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    onTap: () {
                      getDepData(value.substring(14,18));
                    },
                    value: value,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: MediaQuery.of(context).size.height*0.05,
                      width: MediaQuery.of(context).size.width * 0.99,
                      color: Colors.grey[100],
                      child: Text(
                        value,
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)]
              ),
              
              child: DropdownButton(
                underline: Container(),
                hint: Text(
                  "Select Category",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
                ),
                isExpanded: true,
                isDense: false,
                value: _category,
                icon: Icon(
                  Icons.arrow_downward,
                  color: Colors.orange,
                ),
                iconSize: 30,
                elevation: 10,
                style: TextStyle(color: Colors.black),
                onChanged: (String newValue) {
                  setState(() {
                    _category = newValue;
                  });
                },
                dropdownColor: Colors.white,
                items: <String>[
                  'Faculty Information',
                  'Student Information',
                  'Placement Information',
                  'Research Information',
                  'Awards and Recognition',
                  'Functional Units Information',
                  'Program Information',
                  'Statutory Meeting Information',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: MediaQuery.of(context).size.height*0.05,
                      width: MediaQuery.of(context).size.width * 0.99,
                      color: Colors.grey[100],
                      child: Text(
                        value,
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)]
              ),
              child: DropdownButton(
                underline: Container(),
                hint: Text(
                  "Select Field",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
                ),
                isExpanded: true,
                isDense: false,
                value: _field,
                icon: Icon(
                  Icons.arrow_downward,
                  color: Colors.orange,
                ),
                iconSize: 30,
                elevation: 10,
                style: TextStyle(color: Colors.black),
                onChanged: (String newValue) {
                  setState(() {
                    _field = newValue;
                  });
                },
                dropdownColor: Colors.white,
                items: _categoryFields[_category].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    onTap: () {
                      
                    },
                    value: value,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: MediaQuery.of(context).size.height*0.05,
                      width: MediaQuery.of(context).size.width * 0.99,
                      color: Colors.grey[100],
                      child: Text(
                        value,
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
        Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child:  _field!=null?Text(
                    " " + _field + ":  " + _data[_dataFields[_field]].toString(),
                    maxLines: 3,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ):Text('Current Data: -', style: TextStyle(fontSize: 20)),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)]
              ),
              child:  TextField(
                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.black54,
                  controller: _updateValue,
                  onChanged: (value) {
                    setState(() {
                      _data[_dataFields[_field]] = _updateValue.text;
                    });
                  },
                  decoration: InputDecoration(
                    // prefixIcon: Icon(
                    //   Icons.lock_outline,
                    //   color: Colors.black54,
                    // ),
                    filled: true,
                    fillColor: Colors.white,
                    hintStyle: TextStyle(color: Colors.grey[600], fontSize: 20),
                    hintText: 'New Value',
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            
      
            Container(
              height: 55,
              width: MediaQuery.of(context).size.width * 0.9,
              child: RaisedButton(
                onPressed: () async {
                 updateData();
                },
                child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Update',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    )),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
