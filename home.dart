import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:login/home_provider.dart';
import 'package:login/product_model.dart';
import 'package:provider/provider.dart';

import 'categories.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override

  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
 //List<ProductModel>products=[

 //ProductModel(image:Image.network('https://i.pinimg.com/736x/e5/cb/66/e5cb66fe655e53d607210abe8015a7b0.jpg')),

 //ProductModel(image: Image.network('https://logo-download.com/wp-content/data/images/png/Oppo-logo.png')),
 
 //ProductModel(image: Image.network('https://blog.huawei.com/wp-content/uploads/2018/08/2018e585ace58fb8logo-e7ab96e78988.png')),
 
//];
void initState (){
  Provider.of<HomeProvider>(context, listen: false).getData();
  super.initState();
}
  @override
  Widget build(BuildContext context) {
    
    return Consumer<HomeProvider>
    (builder: (context, homeProv, child)
    {
      return homeProv.data==null?
      Center(child: CircularProgressIndicator(color: Colors.blue,), ) 
      : SafeArea(
        
          child: Column(
            children: [       
   //Second ListView
            Expanded(
              child: GridView.builder( padding: EdgeInsets.only(top:10, bottom: 10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 2,
               crossAxisSpacing: 5,
               mainAxisSpacing: 10,
               childAspectRatio: .8),
               itemCount: homeProv.data!.data!.products!.length,
                itemBuilder: (context, index) {
                 return homeProv.data!.data!.products!.isEmpty?CircularProgressIndicator():
                 Container(       
                 margin: EdgeInsets.symmetric(horizontal: 5,),            
                   height: MediaQuery.of(context).size.height,
                   width: 500.0,
                   decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(15),
                   boxShadow:[ BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                   blurRadius: 2,
                  offset: Offset(0, 1),                      
                   )
                   ]
                   )
                   ,
              //  padding: EdgeInsets.only(left: 10),
                  child: Column(         
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                //imageeeee
                Container(
                        height: 130.0,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: homeProv.data!.data!.products![index]==null
                            ? NetworkImage('https://media.cnn.com/api/v1/images/stellar/prod/galaxy-tab-s8-ultra-lead.jpg?c=16x9&q=h_720,w_1280,c_fill')
                            : NetworkImage(homeProv.data!.data!.products![index].image.toString()),
                            fit: BoxFit.contain
                            
                            )
                        , color: Colors.white
                        ),
                  
                  
                  
              child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                        Container(
                          alignment: Alignment.topCenter,
                          height: 40,
                          width: 25,
                          margin: EdgeInsets.only(left: 15),
                          decoration: BoxDecoration(
                           color:Colors.blue.shade100,
                           borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5), bottomRight:Radius.circular(5) )
                          ),
                        child: Column(
                          children: [
                               Icon(Icons.bolt_sharp, color: Colors.red,),
                               Text(homeProv.data!.data!.products![index].discount==null
                               ? "0%"
                               : homeProv.data!.data!.products![index].discount.toString() + "%"
                               
                              , style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)
                               ),
                          ],
                        ),
                        )
                     ,Spacer()
                     ,Icon(Icons.favorite_border_sharp, color: Colors.white,)
                 
                   ],                
                  
                   ) 
                   )
               //  , SizedBox(height: 10),
                
                ,ListTile(
                  isThreeLine: false,
                  title: Text((homeProv.data!.data!.products![index].name!.toString()),
                  maxLines: 1,
                ) 
                ,subtitle: Text((homeProv.data!.data!.products![index].name!.toString()),
                maxLines: 1, ),
               // minVerticalPadding: 2,
                ) 
               ,Row(
                 children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      
                     //  crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(homeProv.data!.data!.products![index].price!.toString()+" EGP"),
                        Text(homeProv.data!.data!.products![index].old_price!.toString()+" EGP", 
                          style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey, fontSize: 13),),
                        ],
                        ),
                  )

                    , Spacer()

                    ,Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                      child: Icon(Icons.shopping_cart,color: Colors.white),
                                      
                    ),
                                       
                   ],
                   )
                  ] 
                 ), 
                );
               }
                ),
          
            )
        ]
      )
      );
     
  }  
      
   );
       
 
  }
// //Widget buildListItem(ProductModel product){
//   Widget buildListItem(){
//     return Container(         
//                       height: 45,
//                       width: 45,
//                        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white,
//                        image: DecorationImage(
//                         image: NetworkImage('https://i.pinimg.com/736x/e5/cb/66/e5cb66fe655e53d607210abe8015a7b0.jpg'),
//                         // image: NetworkImage('${product.image}'),
//                        // image: NetworkImage(product.image.toString()),
//                         fit: BoxFit.contain  
//                               )
//                            )
//                          );

//   }
 }
     
// class Model extends ChangeNotifier{
//   final Icon icon;

//   Model(this.icon);
// }









 //First ListView
            // Padding(
            //   padding: EdgeInsets.only(left: 10),
            //   child: SizedBox(
            //     height: 55,
            //     child: ListView.separated(
            //     //   physics: NeverScrollableScrollPhysics(),
            //     scrollDirection: Axis.horizontal,
            //     shrinkWrap: true,
            //     // itemBuilder:((context, index) => buildListItem(products[index]) ) ,
            //     itemBuilder:((context, index) => buildListItem())  ,
               
            //    // itemCount: products.length,
            //    itemCount: 7,
            //     separatorBuilder: (context, index) => SizedBox(width: 15),
            //     ),
            //   ),
            // )