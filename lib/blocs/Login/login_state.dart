class LoginState {
  bool isEmailValid;
  bool isPasswordValid;
  bool isSubmitting;
  bool isSuccess;
  bool isFailure;

  LoginState({this.isEmailValid, this.isFailure, this.isPasswordValid, this.isSubmitting, this.isSuccess});

  bool get isFormValid => isEmailValid && isPasswordValid;

  factory LoginState.initial() {
    return LoginState(
      isEmailValid: true,
      isPasswordValid: true,
      isFailure: false,
      isSubmitting: false,
      isSuccess: false
    );
  }

  factory LoginState.loading() {
    return LoginState(
        isEmailValid: true,
        isPasswordValid: true,
        isFailure: false,
        isSubmitting: true,
        isSuccess: false
    );
  }
  factory LoginState.success() {
    return LoginState(
        isEmailValid: true,
        isPasswordValid: true,
        isFailure: false,
        isSubmitting: false,
        isSuccess: true
    );
  }

  factory LoginState.failure() {
    return LoginState(
        isEmailValid: true,
        isPasswordValid: true,
        isFailure: true,
        isSubmitting: false,
        isSuccess: false
    );
  }

  LoginState update ({
    bool isEmailValid,
    bool isPasswordValid
  }) {
    return copywith(
      isEmailValid: isEmailValid,
      isPasswordValid: isPasswordValid,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false
    );
  }

  LoginState copywith ({
    bool isEmailValid,
    bool isPasswordValid,
    bool isSubmitting,
    bool isFailure,
    bool isSuccess
  }) {
    return LoginState(
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      isSubmitting: isSubmitting ?? this.isSubmitting
    );
  }
}