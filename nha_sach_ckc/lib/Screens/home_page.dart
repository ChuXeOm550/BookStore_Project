import 'package:flutter/material.dart';
import 'package:nha_sach_ckc/Classes/Book.dart';
import 'package:nha_sach_ckc/Sesions/CusBottomAppBar.dart';
import 'package:nha_sach_ckc/Sesions/CusDrawer.dart';
import 'package:nha_sach_ckc/main.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget{

  final List<Book> products;
  const HomePage({super.key, required this.products});
  @override
  State<StatefulWidget> createState() => HomePage_State();
}

class HomePage_State extends State<HomePage>{

  var formatter = NumberFormat('#,###');
  @override
  Widget build(BuildContext context) {
    final products=widget.products;
    
    const List<String> listImg=[
      "images/list1.jpg",
      "images/list2.png",
      "images/list3.jpg",
      "images/list4.jpg",
      "images/list5.png"
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Nhà sách CKC",
          style: TextStyle(
            fontFamily: 'Helvetica',
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.grey,
      ),

      drawer: const CusDrawer(),

      body: SafeArea(
        child: Column(
          children: [           
            SizedBox(
              height: 200,
              child: CarouselView(
                itemExtent: MediaQuery.sizeOf(context).width - 80,
                itemSnapping: true,
                elevation: 5, 
                padding: const EdgeInsets.all(8),
                children: List.generate(listImg.length, (int index){
                  return  Image.asset(
                    listImg[index],
                    fit: BoxFit.cover,
                  );
                }),
              ),
            ),

            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Sách mới",
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ) 
              ],
            ),

            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index)
                {
                  return InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, '/detail',arguments: products[index]);
                    },
                    child: Column(
                      children:[
                        //const Divider(),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 100,
                                height: 150,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                      image: AssetImage(products[index].path),
                                      fit: BoxFit.cover
                                    )
                                  )
                                )
                              ),

                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  "${products[index].title}\n${formatter.format(products[index].price)} đ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                    //textAlign: TextAlign.center,
                                ), 
                              )
                            ],
                          ),
                        ) 
                      ] 
                    ),
                  ); 
                },
              ),
            )
          ],  
        ) 
      ),
      bottomNavigationBar: const CusBottomAppBar(),
    );
  }
}