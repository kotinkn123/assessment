class Success {
  int code;
  Object response;
  Success({required this.code, required this.response});
}

class Failure {
  Object errorResponse;
  Failure({required this.errorResponse});
}
