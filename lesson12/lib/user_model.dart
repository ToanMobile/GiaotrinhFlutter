/// login : "ToanMobile"
/// id : 6941388
/// node_id : "MDQ6VXNlcjY5NDEzODg="
/// avatar_url : "https://avatars.githubusercontent.com/u/6941388?v=4"
/// gravatar_id : ""
/// url : "https://api.github.com/users/ToanMobile"
/// html_url : "https://github.com/ToanMobile"
/// followers_url : "https://api.github.com/users/ToanMobile/followers"
/// following_url : "https://api.github.com/users/ToanMobile/following{/other_user}"
/// gists_url : "https://api.github.com/users/ToanMobile/gists{/gist_id}"
/// starred_url : "https://api.github.com/users/ToanMobile/starred{/owner}{/repo}"
/// subscriptions_url : "https://api.github.com/users/ToanMobile/subscriptions"
/// organizations_url : "https://api.github.com/users/ToanMobile/orgs"
/// repos_url : "https://api.github.com/users/ToanMobile/repos"
/// events_url : "https://api.github.com/users/ToanMobile/events{/privacy}"
/// received_events_url : "https://api.github.com/users/ToanMobile/received_events"
/// type : "User"
/// site_admin : false
/// name : "Huỳnh Văn Toàn"
/// company : "Netacom"
/// blog : ""
/// location : "HCM, Viet Nam."
/// email : null
/// hireable : null
/// bio : "- Senior Android (Kotlin and Java). \r\n- Cross platform: Flutter (Dart) and React Native (Javascript)."
/// twitter_username : null
/// public_repos : 56
/// public_gists : 5
/// followers : 44
/// following : 34
/// created_at : "2014-03-13T13:32:45Z"
/// updated_at : "2021-11-11T03:15:35Z"

class UserModel {
  UserModel({
      this.login, 
      this.id, 
      this.nodeId, 
      this.avatarUrl, 
      this.gravatarId, 
      this.url, 
      this.htmlUrl, 
      this.followersUrl, 
      this.followingUrl, 
      this.gistsUrl, 
      this.starredUrl, 
      this.subscriptionsUrl, 
      this.organizationsUrl, 
      this.reposUrl, 
      this.eventsUrl, 
      this.receivedEventsUrl, 
      this.type, 
      this.siteAdmin, 
      this.name, 
      this.company, 
      this.blog, 
      this.location, 
      this.email, 
      this.hireable, 
      this.bio, 
      this.twitterUsername, 
      this.publicRepos, 
      this.publicGists, 
      this.followers, 
      this.following, 
      this.createdAt, 
      this.updatedAt,});

  @override
  String toString() {
    return 'UserModel{login: $login, id: $id, nodeId: $nodeId, avatarUrl: $avatarUrl, gravatarId: $gravatarId, url: $url, htmlUrl: $htmlUrl, followersUrl: $followersUrl, followingUrl: $followingUrl, gistsUrl: $gistsUrl, starredUrl: $starredUrl, subscriptionsUrl: $subscriptionsUrl, organizationsUrl: $organizationsUrl, reposUrl: $reposUrl, eventsUrl: $eventsUrl, receivedEventsUrl: $receivedEventsUrl, type: $type, siteAdmin: $siteAdmin, name: $name, company: $company, blog: $blog, location: $location, email: $email, hireable: $hireable, bio: $bio, twitterUsername: $twitterUsername, publicRepos: $publicRepos, publicGists: $publicGists, followers: $followers, following: $following, createdAt: $createdAt, updatedAt: $updatedAt}';
  }

  UserModel.fromJson(dynamic json) {
    login = json['login'];
    id = json['id'];
    nodeId = json['node_id'];
    avatarUrl = json['avatar_url'];
    gravatarId = json['gravatar_id'];
    url = json['url'];
    htmlUrl = json['html_url'];
    followersUrl = json['followers_url'];
    followingUrl = json['following_url'];
    gistsUrl = json['gists_url'];
    starredUrl = json['starred_url'];
    subscriptionsUrl = json['subscriptions_url'];
    organizationsUrl = json['organizations_url'];
    reposUrl = json['repos_url'];
    eventsUrl = json['events_url'];
    receivedEventsUrl = json['received_events_url'];
    type = json['type'];
    siteAdmin = json['site_admin'];
    name = json['name'];
    company = json['company'];
    blog = json['blog'];
    location = json['location'];
    email = json['email'];
    hireable = json['hireable'];
    bio = json['bio'];
    twitterUsername = json['twitter_username'];
    publicRepos = json['public_repos'];
    publicGists = json['public_gists'];
    followers = json['followers'];
    following = json['following'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  String? login;
  int? id;
  String? nodeId;
  String? avatarUrl;
  String? gravatarId;
  String? url;
  String? htmlUrl;
  String? followersUrl;
  String? followingUrl;
  String? gistsUrl;
  String? starredUrl;
  String? subscriptionsUrl;
  String? organizationsUrl;
  String? reposUrl;
  String? eventsUrl;
  String? receivedEventsUrl;
  String? type;
  bool? siteAdmin;
  String? name;
  String? company;
  String? blog;
  String? location;
  dynamic email;
  dynamic hireable;
  String? bio;
  dynamic twitterUsername;
  int? publicRepos;
  int? publicGists;
  int? followers;
  int? following;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['login'] = login;
    map['id'] = id;
    map['node_id'] = nodeId;
    map['avatar_url'] = avatarUrl;
    map['gravatar_id'] = gravatarId;
    map['url'] = url;
    map['html_url'] = htmlUrl;
    map['followers_url'] = followersUrl;
    map['following_url'] = followingUrl;
    map['gists_url'] = gistsUrl;
    map['starred_url'] = starredUrl;
    map['subscriptions_url'] = subscriptionsUrl;
    map['organizations_url'] = organizationsUrl;
    map['repos_url'] = reposUrl;
    map['events_url'] = eventsUrl;
    map['received_events_url'] = receivedEventsUrl;
    map['type'] = type;
    map['site_admin'] = siteAdmin;
    map['name'] = name;
    map['company'] = company;
    map['blog'] = blog;
    map['location'] = location;
    map['email'] = email;
    map['hireable'] = hireable;
    map['bio'] = bio;
    map['twitter_username'] = twitterUsername;
    map['public_repos'] = publicRepos;
    map['public_gists'] = publicGists;
    map['followers'] = followers;
    map['following'] = following;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}