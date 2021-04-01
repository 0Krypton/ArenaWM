class UserModel {
  final String userName;
  final String firstName;
  final String lastName;
  final String bio;

  final List<dynamic> following;
  final List<dynamic> followers;

  final String region;

  final String profileImageUrl;
  final String bgImageUrl;

  final List<dynamic> playingGames;

  get isNull =>
      userName.isEmpty || profileImageUrl.isEmpty || bgImageUrl.isEmpty;

  UserModel({
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.bio,
    required this.region,
    required this.profileImageUrl,
    required this.bgImageUrl,
    required this.playingGames,
    required this.following,
    required this.followers,
  });

  UserModel.fromJson(Map<String, dynamic> data)
      : userName = data['userName'].toString(),
        firstName = (data['name'].toString()).split(' ').first,
        lastName = (data['name'].toString()).split(' ').last,
        bio = (data['bio'].toString()),
        following = data['following'] as List<dynamic>,
        followers = data['followers'] as List<dynamic>,
        region = data['region'].toString(),
        profileImageUrl = data['profileImage'].toString(),
        bgImageUrl = data['bgImage'].toString(),
        playingGames = data['playingGames'] as List<dynamic>;
}
