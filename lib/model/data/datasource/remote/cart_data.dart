import '../../../../core/class/crud.dart';

class CartData {
  Crud crud;
  CartData(this.crud);
  getData(String linkUrl) async {
    var response = await crud.getSingleData(linkUrl);
    return response.fold((l) => l, (r) => r);
  }
}
