import 'package:get/get.dart';
import 'package:task_1/core/class/crud.dart';
import 'package:task_1/core/class/sqldb.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
    Get.put(SqlDb());
    // TODO: implement dependencies
  }
}
