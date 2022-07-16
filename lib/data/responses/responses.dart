import 'package:json_annotation/json_annotation.dart';
part 'responses.g.dart';

//veri(data) kısmının ilk girişi
//sunucumuzdan gelecek cevapları nasıl ele alacağımızı belirleyip bu iş için otomatik kod oluşturmayı sağlayacak.
@JsonSerializable()
class BaseResponse {
  @JsonKey(name: 'status')
  int? status;
  @JsonKey(name: 'message')
  String? message;
}

@JsonSerializable()
class CustomerResponse {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'numOfNotifications')
  int? numOfNotifications;
  CustomerResponse(this.id, this.name, this.numOfNotifications);
  factory CustomerResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerResponseToJson(this);
}

@JsonSerializable()
class ContactsResponse {
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'phone')
  String? phone;
  @JsonKey(name: 'link')
  String? link;
  ContactsResponse(this.email, this.link, this.phone);

  factory ContactsResponse.fromJson(Map<String, dynamic> json) =>
      _$ContactsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ContactsResponseToJson(this);
}

@JsonSerializable()
class AuthenticationResponse extends BaseResponse {
  @JsonKey(name: 'customer')
  CustomerResponse? customer;
  @JsonKey(name: 'contacts')
  ContactsResponse? contacts;

  AuthenticationResponse(this.contacts, this.customer);

  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this);
}

// *@JsonSerializable() işaretlemesi sayesinde otomatik kod oluşturmasını sağlıyoruz.
// *class AuthenticationResponse extends BaseResponse { sınıf ismi ve varsa extend ettiği diğer class eklemeleri
//   *@JsonKey(name: 'customer') // Alan(Field)'ın nasıl serialize işlemine tutulacağını belirten işaretleme
//   *CustomerResponse? customer; //Baştaki alanın tipi sonra alanın adı
//   @JsonKey(name: 'contacts')
//   ContactsResponse? contacts;

//   AuthenticationResponse(this.contacts, this.customer);

//   *factory AuthenticationResponse.fromJson(Map<String, dynamic> json) => kalıp kodlar bu kodların karşılıkları ve işleyişleri notasyonlar sayesinde generate edilecek.
//       _$AuthenticationResponseFromJson(json);

//   Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this);
// }
