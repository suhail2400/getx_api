import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../controller/userController.dart';
import '../service/api_get.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

  final UserController userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Column(
          children: [
            Center(child: ElevatedButton(
              child: Text('data'),
              onPressed: (){
                ApiGet().getData();
              },
              ),),
              SizedBox(
                child: Obx(() {
                  if(userController.isLoading.value)
                    return CircularProgressIndicator();

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: userController.userList.length,
                    itemBuilder: (context,index){
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(userController.userList[index].avatar),
                      ),
                      subtitle: Text(userController.userList[index].email),
                      title:Text(userController.userList[index].firstName)
                    );
                  });
                })
              )
          ],
        )
        
         ),
    );
  }
}