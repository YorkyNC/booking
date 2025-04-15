class EndPoints {
  static const String baseUrl = 'http://45.136.56.65:8000/api';
  // static const String baseUrl =
  //     'http://ae2409f46cbdd4b629bfcefff587fe39-631939517.me-central-1.elb.amazonaws.com/api';
  // Auth
  static const register = "/v1/auth/register";
  static const login = "/v1/auth/authentication";
  static const logout = "/v1/auth/logout";
  static const verify = "/v1/auth/verify";
  static const refreshToken = "/v1/auth/refresh";
  static const forgotPassword = "/v1/auth/forgot-password";
  static const updatePassword = "/v1/auth/update-password";
  static const getUser = "/v1/auth/profile";

  // Attachment
  static const attachment = "/v1/attachment";

  // Post
  static const post = "/v1/post";

  // Feed
  static const feed = "/v1/feed";

  // School
  static const school = "/v1/school";

  // Parent
  static const parent = "/v1/parent";

  // Transcriptions
  static const transcription = "/v1/transcriptions";

  // Process Feedback
  static const processFeedback = "/v1/process-feedback";

  // Teacher
  static const teacher = "/v1/teacher";

  // Student
  static const student = "/v1/student";

  //Report-Record
  static const reportRecord = "/v1/report-record";
}
