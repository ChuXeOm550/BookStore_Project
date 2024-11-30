

class Account{
  final String FullName;
  final String Phone;
  final String Username;
  final String Password;

  Account({
    required this.FullName,
    required this.Phone,
    required this.Username,
    required this.Password
  });

  Map<String, Object?> toMap(){
    return{
      'fullname': FullName,
      'phone': Phone,
      'username': Username,
      'password': Password
    };
  }
}