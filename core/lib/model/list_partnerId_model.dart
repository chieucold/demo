import 'package:api/api/learn_api.dart';

class ListPartnerIdModel{
   int courseStyleId;
   List<int>? partnerId;
   int timeValueId;
   FilterTimeValue? timeValue;

  ListPartnerIdModel({this.courseStyleId = 0 , this.partnerId, this.timeValueId = 0, this.timeValue});
}
