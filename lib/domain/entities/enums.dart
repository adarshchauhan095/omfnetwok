// coverage:ignore-file

/// A set of enums use all over the

/// RequestType
enum Request {
  get,
  post,
  put,
  patch,
  delete,
}

/// Type of message.
enum MessageType {
  error,
  success,
  information,
}

/// LoginType
/// 
///   email -> 1
/// 
///  facebook -> 2
/// 
///  google -> 3
/// 
///  twitter -> 4
enum LoginType {
  email,
  facebook, 
  google, 
  twitter,
  phoneNumber, 
}

/// UserType
/// 
/// user -> 1
/// 
/// model -> 2
enum UserType {
  user, 
  model, 
}

/// Email Or PhoneNumber Type
/// 
/// phoneNumber -> 1
/// 
/// email -> 2
enum EmailOrPhoneNoType{
  phoneNumber,
  email,
}

/// Type of entry
/// 
/// Login -> 1
/// 
/// Signup -> 2
enum TypeOfEntry{
  login,
  signup,
}

/// Social Trigger
enum SocialTrigger{
  facebook,
  google,
  apple
}

/// Token type guest, auth
enum TokenType{
  guest,
  auth,
}

enum ContentType{
  termsAndConditions,
  privacyPoliciy,
  nsfw
}

/// trigger is For 1-register, 2-forgotpassword, 3-change number
enum VerifyOtpTrigger{
  register,
  forgotPassword,
  changeNumber,
}