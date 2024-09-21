import '../../../../core/class/crud.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);
  getData(String linkUrl) async {
    var response = await crud.getData(linkUrl);
    return response.fold((l) => l, (r) => r);
  }
}
