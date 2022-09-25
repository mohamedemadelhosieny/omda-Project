// ignore_for_file: non_constant_identifier_names



import 'package:flutter/material.dart';
import 'package:login/categories_provider.dart';
import 'package:login/product_model.dart';
import 'package:provider/provider.dart';

class Categories extends StatefulWidget {
   Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _Categories();
}

class _Categories extends State<Categories> {
void initState (){
  Provider.of<CategoryProvider>(context, listen: false).getCategory();
  super.initState();
}
  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>
    (builder: (context, categoryProv, child) {
 
      return categoryProv.category==null?
      Center(child: CircularProgressIndicator(color: Colors.blue,), ) 
      :ListView.builder(
        itemCount: categoryProv.category!.data!.data!.length,
        itemBuilder: ((context, index) {
       return Container(
       height: 200,
       margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
       decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(20)),
       child: Column(
        children: [
         Expanded(
           child: 
           Image.network(categoryProv.category!.data!.data![index].image!
            , fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width,
            ),
         )
        , Text(categoryProv.category!.data!.data![index].name.toString())],
       ),
       );
        }
        )
        );
    }
     );
  }
}