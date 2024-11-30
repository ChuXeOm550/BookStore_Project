import 'package:flutter/material.dart';

class CusBottomAppBar extends StatelessWidget {
  const CusBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, "/home");
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.home, size: 24), // Icon cho Trang chủ
                SizedBox(height: 4),
                Text("Trang chủ"),
              ],
            ),
          ),

          const VerticalDivider(
            color: Colors.black,
            thickness: 1,         // Độ dày của vạch
            width: 20,            // Khoảng cách giữa vạch và các button
            indent: 10,
            endIndent: 10,
          ),

          TextButton(
            onPressed: () {},
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.info, size: 24), // Icon cho Giới thiệu
                SizedBox(height: 4),
                Text("Giới thiệu"),
              ],
            ),
          ),

          const VerticalDivider(
            color: Colors.black, 
            thickness: 1,         // Độ dày của vạch
            width: 20,            // Khoảng cách giữa vạch và các button
            indent: 10,
            endIndent: 10, 
          ),

          TextButton(
            onPressed: () {},
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.account_circle, size: 24), // Icon cho Tài khoản
                SizedBox(height: 4),
                Text("Tài khoản"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
