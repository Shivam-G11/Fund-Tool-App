/// status : 200
/// message : "Login successfully"
/// data : {"id":20,"name":"Trivedi Vaibhav","first_name":"Trivedi","last_name":"Vaibhav","email":"trivedivaibhav2@mailinator.com","country_code":"+91","mobile":"9876543212","profile_image":"https://hexeros.com/dev/fund-tool/uploads/user/user.png","guide_tour":"1","fund_guide_tour":"1","hear_about_us":"Other","unique_id":"CSPEU7","step":0,"referral_code":"","is_fundraiser":1,"my_referral_code_used":0,"last_fundraiser_name":"gg","last_fundraiser_url":"https://hexeros.com/dev/fund-tool/fundraiser-details?fundraiser=17U20","is_join":1,"skip_image":"0","skip_social":"0","share_fundraiser_image":"","instagram_username":"","twitter_username":"","token":"XgXxFbnrcj3VYNJsMRF2TVEoSz9S6V9l1FXismOC1O4L5ROBf2FnajVNj3eGo9B3TU0Bc8TEFM0v9e1fChi92dulj5xYz3VfU4Bt"}

class LoginResponseWrapper {
  LoginResponseWrapper({
    num? status,
    String? message,
    Data? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  LoginResponseWrapper.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  num? _status;
  String? _message;
  Data? _data;

  LoginResponseWrapper copyWith({
    num? status,
    String? message,
    Data? data,
  }) =>
      LoginResponseWrapper(
        status: status ?? _status,
        message: message ?? _message,
        data: data ?? _data,
      );

  num? get status => _status;

  String? get message => _message;

  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

/// id : 20
/// name : "Trivedi Vaibhav"
/// first_name : "Trivedi"
/// last_name : "Vaibhav"
/// email : "trivedivaibhav2@mailinator.com"
/// country_code : "+91"
/// mobile : "9876543212"
/// profile_image : "https://hexeros.com/dev/fund-tool/uploads/user/user.png"
/// guide_tour : "1"
/// fund_guide_tour : "1"
/// hear_about_us : "Other"
/// unique_id : "CSPEU7"
/// step : 0
/// referral_code : ""
/// is_fundraiser : 1
/// my_referral_code_used : 0
/// last_fundraiser_name : "gg"
/// last_fundraiser_url : "https://hexeros.com/dev/fund-tool/fundraiser-details?fundraiser=17U20"
/// is_join : 1
/// skip_image : "0"
/// skip_social : "0"
/// share_fundraiser_image : ""
/// instagram_username : ""
/// twitter_username : ""
/// token : "XgXxFbnrcj3VYNJsMRF2TVEoSz9S6V9l1FXismOC1O4L5ROBf2FnajVNj3eGo9B3TU0Bc8TEFM0v9e1fChi92dulj5xYz3VfU4Bt"

class Data {
  Data({
    num? id,
    String? name,
    String? firstName,
    String? lastName,
    String? email,
    String? countryCode,
    String? mobile,
    String? profileImage,
    String? guideTour,
    String? fundGuideTour,
    String? hearAboutUs,
    String? uniqueId,
    num? step,
    String? referralCode,
    num? isFundraiser,
    num? myReferralCodeUsed,
    String? lastFundraiserName,
    String? lastFundraiserUrl,
    num? isJoin,
    String? skipImage,
    String? skipSocial,
    String? shareFundraiserImage,
    String? instagramUsername,
    String? twitterUsername,
    String? token,
  }) {
    _id = id;
    _name = name;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _countryCode = countryCode;
    _mobile = mobile;
    _profileImage = profileImage;
    _guideTour = guideTour;
    _fundGuideTour = fundGuideTour;
    _hearAboutUs = hearAboutUs;
    _uniqueId = uniqueId;
    _step = step;
    _referralCode = referralCode;
    _isFundraiser = isFundraiser;
    _myReferralCodeUsed = myReferralCodeUsed;
    _lastFundraiserName = lastFundraiserName;
    _lastFundraiserUrl = lastFundraiserUrl;
    _isJoin = isJoin;
    _skipImage = skipImage;
    _skipSocial = skipSocial;
    _shareFundraiserImage = shareFundraiserImage;
    _instagramUsername = instagramUsername;
    _twitterUsername = twitterUsername;
    _token = token;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _email = json['email'];
    _countryCode = json['country_code'];
    _mobile = json['mobile'];
    _profileImage = json['profile_image'];
    _guideTour = json['guide_tour'];
    _fundGuideTour = json['fund_guide_tour'];
    _hearAboutUs = json['hear_about_us'];
    _uniqueId = json['unique_id'];
    _step = json['step'];
    _referralCode = json['referral_code'];
    _isFundraiser = json['is_fundraiser'];
    _myReferralCodeUsed = json['my_referral_code_used'];
    _lastFundraiserName = json['last_fundraiser_name'];
    _lastFundraiserUrl = json['last_fundraiser_url'];
    _isJoin = json['is_join'];
    _skipImage = json['skip_image'];
    _skipSocial = json['skip_social'];
    _shareFundraiserImage = json['share_fundraiser_image'];
    _instagramUsername = json['instagram_username'];
    _twitterUsername = json['twitter_username'];
    _token = json['token'];
  }

  num? _id;
  String? _name;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _countryCode;
  String? _mobile;
  String? _profileImage;
  String? _guideTour;
  String? _fundGuideTour;
  String? _hearAboutUs;
  String? _uniqueId;
  num? _step;
  String? _referralCode;
  num? _isFundraiser;
  num? _myReferralCodeUsed;
  String? _lastFundraiserName;
  String? _lastFundraiserUrl;
  num? _isJoin;
  String? _skipImage;
  String? _skipSocial;
  String? _shareFundraiserImage;
  String? _instagramUsername;
  String? _twitterUsername;
  String? _token;

  Data copyWith({
    num? id,
    String? name,
    String? firstName,
    String? lastName,
    String? email,
    String? countryCode,
    String? mobile,
    String? profileImage,
    String? guideTour,
    String? fundGuideTour,
    String? hearAboutUs,
    String? uniqueId,
    num? step,
    String? referralCode,
    num? isFundraiser,
    num? myReferralCodeUsed,
    String? lastFundraiserName,
    String? lastFundraiserUrl,
    num? isJoin,
    String? skipImage,
    String? skipSocial,
    String? shareFundraiserImage,
    String? instagramUsername,
    String? twitterUsername,
    String? token,
  }) =>
      Data(
        id: id ?? _id,
        name: name ?? _name,
        firstName: firstName ?? _firstName,
        lastName: lastName ?? _lastName,
        email: email ?? _email,
        countryCode: countryCode ?? _countryCode,
        mobile: mobile ?? _mobile,
        profileImage: profileImage ?? _profileImage,
        guideTour: guideTour ?? _guideTour,
        fundGuideTour: fundGuideTour ?? _fundGuideTour,
        hearAboutUs: hearAboutUs ?? _hearAboutUs,
        uniqueId: uniqueId ?? _uniqueId,
        step: step ?? _step,
        referralCode: referralCode ?? _referralCode,
        isFundraiser: isFundraiser ?? _isFundraiser,
        myReferralCodeUsed: myReferralCodeUsed ?? _myReferralCodeUsed,
        lastFundraiserName: lastFundraiserName ?? _lastFundraiserName,
        lastFundraiserUrl: lastFundraiserUrl ?? _lastFundraiserUrl,
        isJoin: isJoin ?? _isJoin,
        skipImage: skipImage ?? _skipImage,
        skipSocial: skipSocial ?? _skipSocial,
        shareFundraiserImage: shareFundraiserImage ?? _shareFundraiserImage,
        instagramUsername: instagramUsername ?? _instagramUsername,
        twitterUsername: twitterUsername ?? _twitterUsername,
        token: token ?? _token,
      );

  num? get id => _id;

  String? get name => _name;

  String? get firstName => _firstName;

  String? get lastName => _lastName;

  String? get email => _email;

  String? get countryCode => _countryCode;

  String? get mobile => _mobile;

  String? get profileImage => _profileImage;

  String? get guideTour => _guideTour;

  String? get fundGuideTour => _fundGuideTour;

  String? get hearAboutUs => _hearAboutUs;

  String? get uniqueId => _uniqueId;

  num? get step => _step;

  String? get referralCode => _referralCode;

  num? get isFundraiser => _isFundraiser;

  num? get myReferralCodeUsed => _myReferralCodeUsed;

  String? get lastFundraiserName => _lastFundraiserName;

  String? get lastFundraiserUrl => _lastFundraiserUrl;

  num? get isJoin => _isJoin;

  String? get skipImage => _skipImage;

  String? get skipSocial => _skipSocial;

  String? get shareFundraiserImage => _shareFundraiserImage;

  String? get instagramUsername => _instagramUsername;

  String? get twitterUsername => _twitterUsername;

  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['email'] = _email;
    map['country_code'] = _countryCode;
    map['mobile'] = _mobile;
    map['profile_image'] = _profileImage;
    map['guide_tour'] = _guideTour;
    map['fund_guide_tour'] = _fundGuideTour;
    map['hear_about_us'] = _hearAboutUs;
    map['unique_id'] = _uniqueId;
    map['step'] = _step;
    map['referral_code'] = _referralCode;
    map['is_fundraiser'] = _isFundraiser;
    map['my_referral_code_used'] = _myReferralCodeUsed;
    map['last_fundraiser_name'] = _lastFundraiserName;
    map['last_fundraiser_url'] = _lastFundraiserUrl;
    map['is_join'] = _isJoin;
    map['skip_image'] = _skipImage;
    map['skip_social'] = _skipSocial;
    map['share_fundraiser_image'] = _shareFundraiserImage;
    map['instagram_username'] = _instagramUsername;
    map['twitter_username'] = _twitterUsername;
    map['token'] = _token;
    return map;
  }
}
