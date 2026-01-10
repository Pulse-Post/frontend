abstract interface class ResultMessageService {
  void showMessageSuccess(String title, String message, String iconLeading);
  void showMessageError(String message);
}
