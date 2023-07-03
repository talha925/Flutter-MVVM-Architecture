import 'package:mvvm/data/response/status.dart'; // Importing the 'status' file from the 'response' directory

class ApiResponse<T> {
  Status?
      status; // Nullable instance variable to store the status of the API response
  T? data; // Nullable instance variable to store the data of the API response
  String?
      message; // Nullable instance variable to store the message of the API response

  ApiResponse(this.status, this.data,
      this.message); // Constructor to initialize the ApiResponse object with status, data, and message

  ApiResponse.loading()
      : status = Status
            .LOADING; // Named constructor to create an ApiResponse object with the loading status

  ApiResponse.completed()
      : status = Status
            .COMPLETD; // Named constructor to create an ApiResponse object with the completed status

  ApiResponse.error()
      : status = Status
            .ERROR; // Named constructor to create an ApiResponse object with the error status

  @override
  String toString() {
    return "Status: $status \n Message: $message\n Data: $data "; // Override the toString() method to provide a string representation of the ApiResponse object
  }
}
