import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  @override
  State<StatefulWidget> createState() => SignUpState();
}

class SignUpState extends State {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  String? validateUserName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập tên';
    }

    final RegExp nameRegex = RegExp(r'^[a-zA-Z]+$');
    if (!nameRegex.hasMatch(value)) {
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

  String? validateConfirmPass(String? value) {
    if (value == null || value.isEmpty) {
      return 'Xác nhận mật khẩu !!!';
    }
    if (_password.text != value) {
      return 'Mật khẩu không khớp';
    }
    return null;
  }

    String? validatePhone(String? value){
    if (value == null || value.isEmpty) {
      return 'Nhập số điện thoại !!!';
    }

    if(value.length!=10){
      return 'Số điện thoại chỉ chứa 10 số';
    }
    final RegExp phoneRegex = RegExp(r'^(03|05|07|08|09)\d{8}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Số điện thoại chỉ chứa số và bắt đầu từ 03, 05, 07, 08, hoặc 09';
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
                    "ĐĂNG KÝ THÀNH VIÊN",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 20, 50, 5),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Họ tên"
                      ),
                      validator: (value) => validateUserName(value),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 5, 50, 5),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Số điện thoại"
                      ),
                      validator: (value)=>validatePhone(value),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 5, 50, 5),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Tên đăng nhập ..."
                      ),
                      validator: (value)=>validateUserName(value),
                      controller: _username,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 5, 50, 5),
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(), 
                        labelText: "Mật khẩu ...",
                      ),
                      validator: (value)=>validatePassword(value),
                      controller: _password,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 5, 50, 5),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Xác nhận lại mật khẩu ..."
                      ),
                      validator: (value) => validateConfirmPass(value),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: SizedBox(
                      width: 130,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          final args =[_username.text,_password.text];
                          if(_formkey.currentState!.validate()){
                            Navigator.pop(context,args);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        )),
                        child: const Text(
                          "Đăng ký",
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          overlayColor: Colors.transparent,
                          shadowColor: Colors.transparent),
                      child: const Text(
                        "Đăng nhập",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.blue,
                          color: Colors.blue,
                          fontSize: 15),
                      ),
                    )
                  ),
                ],
              ),
            )
        )
    );
  }
}
