import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});
  @override
  State<StatefulWidget> createState() => SignInState();
}

class SignInState extends State {
  late TextEditingController _username = TextEditingController();
  late TextEditingController _password = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Khởi tạo TextEditingController với dữ liệu mặc định
    _username = TextEditingController();
    _password = TextEditingController();
  }

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }
  

  String? validateUserName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Tên đăng nhập sai';
    }

    final RegExp nameRegex = RegExp(r'^[a-zA-Z]+$');
    if ((!nameRegex.hasMatch(value))) {
      return 'Tên phải là kí tự a-z và A-Z';
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nhập mật khẩu !!!';
    }
    if (value.length < 8) {
      return 'Mật khẩu chỉ từ 8-20 kí tự';
    }
    if (value.length > 20) {
      return 'Mật khẩu chỉ từ 8-20 kí tự';
    }
    return null;
  }

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
        body: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.only(top: 20),  
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "ĐĂNG NHẬP",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(50, 20, 50, 5),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Tên đăng nhập ..."),
                    controller: _username,
                    validator: (value) => validateUserName(value),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(50, 5, 50, 5),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Mật khẩu ..."
                      ),
                    controller: _password,
                    validator: (value) => validatePassword(value),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: SizedBox(
                    width: 130,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {

                        if(_formkey.currentState!.validate()){
                          Navigator.pushNamed(context, '/home');
                        }
                        
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          )),
                      child: const Text(
                        "Đăng nhập",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: ElevatedButton(
                      onPressed: ()async{
                        final data=await Navigator.pushNamed(context, '/signup');

                        if(data != null && data is List<String>){
                          _username.text=data[0];
                          //_password.text=data[1];
                        }
                        
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          overlayColor: Colors.transparent,
                          shadowColor: Colors.transparent),
                      child: const Text(
                        "Đăng ký tài khoản mới",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.blue,
                            color: Colors.blue,
                            fontSize: 15),
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        //Navigator.pushNamed(context, 'home');
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          overlayColor: Colors.transparent,
                          shadowColor: Colors.transparent),
                      child: const Text(
                        "Quên mật khẩu",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.blue,
                            color: Colors.blue,
                            fontSize: 15),
                      ),
                    )),
              ],
            ),
          ),
        ));
  }
}
