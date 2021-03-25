

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




String formatPriceNum (String str){
  RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
Function mathFunc = (Match match) => '${match[1]},';
  var res_ =  str.replaceAllMapped(reg, mathFunc);
  if(res_ == str){
    return str;
  }
  else{
    return "\$ $res_";
  }
}