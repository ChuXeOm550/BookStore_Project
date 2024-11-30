import 'package:flutter/material.dart';
import 'package:nha_sach_ckc/Classes/Book.dart';
import 'package:nha_sach_ckc/Classes/BookInCart.dart';
import 'package:nha_sach_ckc/Provider/Book_Provider.dart';
import 'package:nha_sach_ckc/Sesions/CusBottomAppBar.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Detail extends StatefulWidget{
  const Detail({super.key});
  @override
  State<StatefulWidget> createState() => Detail_State();
}

class Detail_State extends State<Detail>{

  var formatter = NumberFormat('#,###');

  @override
  Widget build(BuildContext context) {

    final Book book= ModalRoute.of(context)!.settings.arguments as Book;

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

      //drawer: const CusDrawer(),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 15),
              child: Text(
                book.title,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 200,
                      width: 150,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: AssetImage(book.path),
                            fit: BoxFit.cover
                          )
                        )
                      )
                    ),

                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Loại sản phẩm..........",
                            style: TextStyle(
                              color: Colors.grey
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Kích thước................",
                            style: TextStyle(
                              color: Colors.grey
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Năm xuất bản...........",
                            style: TextStyle(
                              color: Colors.grey
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Số trang....................",
                            style: TextStyle(
                              color: Colors.grey
                            ),
                          ),
                          SizedBox(height: 25),
                          Text(
                            "${formatter.format(book.price)} đ",
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                          SizedBox(height: 5,),
                          ElevatedButton(
                            onPressed: (){
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('${book.title} đã được thêm vào giỏ hàng.'))
                              );
                              BookInCart bookIsAdded = BookInCart(
                                id: book.id,
                                title: book.title,
                                price: book.price,
                                image: book.path,
                                status: true,
                              );
                              var bookProvider=Provider.of<BookProvider>(context,listen: false);
                              bookProvider.addBook(bookIsAdded);
                              print(bookProvider.totalItems);

                              Navigator.pushNamed(context, '/cart');
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.black, width: 2),
                                borderRadius: BorderRadius.circular(5),
                              )
                            ),
                            child: Text(
                              "Chọn mua",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.black
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tác giả..........",
                            style: TextStyle(
                              color: Colors.grey
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Dịch giả................",
                            style: TextStyle(
                              color: Colors.grey
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Nhà xuất bản...........",
                            style: TextStyle(
                              color: Colors.grey
                            ),
                          ),
                          // SizedBox(height: 10),
                          // Text(
                          //   "Số trang....................",
                          //   style: TextStyle(
                          //     color: Colors.grey
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 10,bottom: 5),
              child: Text(
                "Mô tả",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.descriptionOfBook,
                    style: TextStyle(
                      fontSize: 15
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Thông tin tác giả",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      decoration: TextDecoration.underline
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    book.descriptionOfAuthor,
                    style: TextStyle(
                      fontSize: 15
                    ),
                  ),
                ],
              )  
            )
          ],
        ),
      ),
      
      bottomNavigationBar: const CusBottomAppBar(),
    );
  }
}