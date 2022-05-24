class CategoryRepo {
  List listData = ['Overweight', 'Normal', 'Underweight'];

  String getResult(int result) {
    return listData[result];
  }
}
