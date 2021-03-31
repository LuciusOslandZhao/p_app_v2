import 'dart:convert';

void main(){

List list1 = ["fdafas","fadfa"];

List list2 = [new Obj(id:1,name:"name1"), new Obj(id: 2,name: "name2")];

print(list1.toString());
// List list3 = List.from(jsonDecode(list1.toString()));
List list3 = list1.toString().replaceAll("[", "").replaceAll("]", "").split(",");
print(Map.fromIterable(list1));
print(list2.toString());
print(list3);
// print(Map.fromIterable(list2,key:(el)=>el,value:(el)=>el);


}

class Obj{
  int id;
  String name;
  Obj({
    this.id,
    this.name
  });

  String toString(){
    return {
      "id":id,
      "name":name
    }.toString();
  }
}