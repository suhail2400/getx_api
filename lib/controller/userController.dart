



import 'package:get/get.dart';
import 'package:getx_api/model/user_model.dart';

import '../service/api_get.dart';

class UserController extends GetxController {
  var userList = <Users>[].obs;
  var isLoading = true.obs;

  @override 
  void onInit(){
    getData();
    super.onInit();
  }

  void getData() async {
    isLoading(true);
    if(userList !=null){
      var user = await ApiGet().getData();
      userList.value = user;
    }
    isLoading(false);
  }
}