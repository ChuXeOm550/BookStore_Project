

import 'package:flutter/material.dart';
import 'package:nha_sach_ckc/Classes/Book.dart';
import 'package:nha_sach_ckc/Classes/BookInCart.dart';

class BookProvider with ChangeNotifier{


  List<BookInCart> booksAreAddedThis=[];
  List<BookInCart> get booksInCart => booksAreAddedThis;

  List<Book> books = [
    Book(id: "H1", title: "Đắc Nhân Tâm", price: 45000, path: "images/DNT.jpg",
      descriptionOfBook: "Đắc Nhân Tâm của tác giả Dale Carnegie là một trong những cuốn sách kinh điển nhất trong lĩnh vực phát triển bản thân và kỹ năng giao tiếp. Cuốn sách này đã được viết và xuất bản lần đầu tiên vào năm 1936. Cho đến nay, Đắc Nhân Tâm vẫn được đánh giá là một trong những tác phẩm quan trọng nhất trong lịch sử văn học thế giới.\nCuốn sách này tổng hợp một loạt các nguyên tắc và kỹ năng giúp độc giả nâng cao khả năng giao tiếp, xây dựng mối quan hệ tốt hơn và trở thành một người lãnh đạo toàn diện. Điểm hấp dẫn nhất ở Đắc Nhân Tâm chính là việc tác giả đã sử dụng các ví dụ cụ thể từ cuộc sống hàng ngày để đưa ra dẫn chứng, giải thích cho từng nguyên tắc. Nhờ vậy, người đọc sẽ dễ dàng hiểu được cách áp dụng những nguyên tắc này vào cuộc sống thường nhật.",
      descriptionOfAuthor: "Dale Carnegie (Dale Breckenridge Carnegie) sinh năm 1888 tại vùng Maryville, Missouri, Mỹ. Sau khi tốt nghiệp trường State Teachers College ở Warrensburg, Dale Carnegie đã phải làm nhiều công việc khác nhau để kiếm sống và phụ giúp gia đình.\nNăm 1911, Dale Carnegie đã quyết định sử dụng toàn bộ số tiền mình có lúc đó là 500 USD để theo đuổi giấc mơ trở thành một nhà diễn thuyết. Tuy nhiên, sau nhiều sự kiện biến động trong cuộc sống, ông lại trở thành sinh viên tại trường American Academy of Dramatic Arts ở New York. Trong thời gian khó khăn này, Dale Carnegie bắt đầu dạy kỹ năng giao tiếp và thuyết trình trước công chúng. Các lớp học của ông được mọi người đón nhận nồng nhiệt, số lượng học viên tăng đều qua mỗi tuần và Dale đã dần trở thành diễn giả được yêu thích nhất trong thời kỳ đó.",
    ),
    Book(id: "H2", title: "Hoàng tử bé", price: 45000, path: "images/HTB.jpg"),
    Book(id: "H3", title: "Nhà giả kim", price: 45000, path: "images/NGK.png"),
    Book(id: "H4", title: "Phù thủy xứ OZ", price: 45000, path: "images/PTXO.jpg"),
    Book(id: "H5", title: "Tôi đi học", price: 45000, path: "images/TDH.jpg"),
    Book(id: "H6", title: "Trái tim của mẹ", price: 45000, path: "images/TTCM.jpg"),
    Book(id: "H7", title: "Tuổi trẻ đáng giá bao nhiêu", price: 45000, path: "images/TTDGBN.jpg"),
    Book(id: "H8", title: "Tôi thấy hoa vàng trên cỏ xanh", price: 45000, path: "images/TTHVTCX.jpg"),
  ];

  List<Book> get booksInHome => books;

  void addBook(BookInCart book){
    booksInCart.add(book);
    notifyListeners();
  }
  
   void removeBook(BookInCart book){
    booksInCart.remove(book);
    notifyListeners();
  }
    
   void clearCart() {
    booksInCart.clear();
    notifyListeners();
  }

  int get totalItems => booksAreAddedThis.length;
}