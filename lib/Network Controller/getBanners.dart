


import 'package:grocery/Constants/Apis.dart';
import 'package:grocery/models/Api%20Model.dart';

Future<List> getBannerList1()async{
  var url= bannerList1;
  var data=await httpGet(url);
  List images=[];
  List list= data['service'];
 for(int i=0; i<list.length; i++){
   images.add(list[i]['photo']);
 }
  return images;
}

Future<List> getBannerList2()async{
  var url= bannerList2;
  var data=await httpGet(url);
  List images=[];
  List list= data['service'];
  for(int i=0; i<list.length; i++){
    images.add(list[i]['photo']);
  }
  return images;
}