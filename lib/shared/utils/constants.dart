class Constants {
  static const BASE_URL =
      "https://backend-recruitech-production.up.railway.app/api/v1";

  static const DEVELOPER_SIGN_UP_ENDPOINT = "/auth/developer/sign-up";

  static DEVELOPER_PROFILE_ENDPOINT(int id) => "/developers/$id/profile";

  static const SIGN_IN_ENDPOINT = "/auth/sign-in";

  static const LOCATIONS = "/locations";
}
