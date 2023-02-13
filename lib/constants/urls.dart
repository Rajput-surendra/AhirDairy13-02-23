class Urls {
  static String baseUrl = "https://dairy.developmentalphawizz.com/uapi/";
  static String imageUrl = "https://dairy.developmentalphawizz.com/";
  final Uri signUpApi = Uri.parse(baseUrl + 'registration.php');
  final Uri sendOtpApi = Uri.parse(baseUrl + 'send_otp.php');
}
