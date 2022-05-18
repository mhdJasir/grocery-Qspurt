



  import 'package:grocery/Constants/Apis.dart';
import 'package:grocery/models/Api%20Model.dart';

Future<List> getServices()async{
  var url=servicesnew;
  var data=await httpGet(url);
  List list=data['service'] as List;
  return list;
  }