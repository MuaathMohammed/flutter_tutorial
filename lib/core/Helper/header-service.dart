class HeaderServices{
  static getHeadersMapWithoutToken(){
    Map<String, String> headersMap = {
      'Accept':'*/*',
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    return headersMap;
  }
  static getHeadersApplicationJson(){
    Map<String, String> headersMap = {
      'Accept':'*/*',
      'Content-Type': 'application/json'
    };
    return headersMap;
  }
  static getHeadersMapWithToken(token){
    Map<String, String> headersMap = {
      'Accept':'*/*',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    return headersMap;
  }
}
 getheadersApplicatipnJson(){
  Map<String, String> headersMap = {
    'Accept':'*/*',
    'Content-Type': 'application/json'
  };
  return headersMap;
}