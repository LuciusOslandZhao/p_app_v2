

RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
Function mathFunc = (Match match) => '${match[1]},';

List<String> tests_ = [
  '0',
  '10',
  '123',
  '1230',
  '12300',
  '123040',
  '12k',
  '12 ',
];





  String formatPriceNum(String str) {
    var str_ = str==null?"": str.replaceAll(",", "").replaceAll("\$", "");
    
    RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    Function mathFunc = (Match match) => '${match[1]},';
    var res_ = str_.replaceAllMapped(reg, mathFunc);
    if (res_ == str_) {
      return str_;
    } else {
      return "\$ $res_";
    }
  }


  