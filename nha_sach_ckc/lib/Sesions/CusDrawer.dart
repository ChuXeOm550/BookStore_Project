import 'package:flutter/material.dart';

class CusDrawer extends StatelessWidget {
  const CusDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          //padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 32, 58, 99),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Row(
                    children: [
                      IconButton(
                        onPressed: (){
                          Navigator.pop(context);
                        }, 
                        icon: Icon(Icons.arrow_back_ios,color: Colors.red)
                      ),
                      SizedBox(width: 8), // Khoảng cách giữa icon và text
                      Text(
                        'Danh Mục',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.expand_more, color: Colors.white),
                ]
              )
            ),

            ListTile(
              title: Text('Sách Tiếng Việt'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('English Books'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('VPP & Học Cụ'),
              onTap: () {
                Navigator.pop(context);
                },
              ),
            ListTile(
              title: Text('Đồ Chơi'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Phụ Kiện'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Băng Đĩa'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Ưu Đãi Hot'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Sách Giáo Khoa & Dụng Cụ Các Lớp'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Outlet Sales'),
              onTap: () {},
            ),
          ],
        ),
    );
  }
}
