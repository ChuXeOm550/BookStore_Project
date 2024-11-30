import 'package:flutter/material.dart';
import 'package:nha_sach_ckc/Classes/Book.dart';
import 'package:nha_sach_ckc/Provider/Book_Provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<StatefulWidget> createState() {
    return CartScreenState();
  }
}

class CartScreenState extends State<Cart> {
  var formatter = NumberFormat('#,###');

  @override
  Widget build(BuildContext context) {
    var books = Provider.of<BookProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Giỏ hàng",
          style: TextStyle(
            fontFamily: 'Helvetica',
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.grey,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), 
                  color: Colors.white
                ),
                child: books.totalItems > 0
                    ? Expanded(
                        child: ListView.builder(
                          shrinkWrap: true, // Sử dụng để tránh lỗi cuộn vô hạn
                          //physics: const NeverScrollableScrollPhysics(), // Ngăn ListView tự cuộn
                          itemCount: books.totalItems,
                          itemBuilder: (context, index) {
                            var book = books.booksInCart[index];

                            return Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/Detail', arguments: book);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.white
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: SizedBox(
                                            height: 50,
                                            child: Image.asset(book.image),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                book.title,
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.bold
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                "${formatter.format(book.price)} đ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold, 
                                                    color: Colors.grey),
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(right: 10),
                                                    child: IconButton(
                                                      onPressed: () {
                                                        var bookProvider = Provider.of<BookProvider>(
                                                            context,
                                                            listen: false);
                                                        bookProvider.removeBook(book);
                                                      },
                                                      icon: const Icon(Icons.delete_outline_outlined),
                                                      iconSize: 30,
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                if (index < books.totalItems - 1)
                                  const SizedBox(height: 10),
                              ],
                            );
                          },
                        ),
                      )
                    : Center(
                        child: Text(
                          "Giỏ hàng trống",
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
