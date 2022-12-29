class RegisterState {
  bool isEmailValid;
  bool isPasswordValid;
  bool isSubmitting;
  bool isSuccess;
  bool isFailure;

  RegisterState({this.isEmailValid, this.isFailure, this.isPasswordValid, this.isSubmitting, this.isSuccess});

  bool get isFormValid => isEmailValid && isPasswordValid;

  factory RegisterState.initial() {
    return RegisterState(
        isEmailValid: true,
        isPasswordValid: true,
        isFailure: false,
        isSubmitting: false,
        isSuccess: false
    );
  }

  factory RegisterState.loading() {
    return RegisterState(
        isEmailValid: true,
        isPasswordValid: true,
        isFailure: false,
        isSubmitting: true,
        isSuccess: false
    );
  }
  factory RegisterState.success() {
    return RegisterState(
        isEmailValid: true,
        isPasswordValid: true,
        isFailure: false,
        isSubmitting: false,
        isSuccess: true
    );
  }

  factory RegisterState.failure() {
    return RegisterState(
        isEmailValid: true,
        isPasswordValid: true,
        isFailure: true,
        isSubmitting: false,
        isSuccess: false
    );
  }

  RegisterState update ({
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

  RegisterState copywith ({
    bool isEmailValid,
    bool isPasswordValid,
    bool isSubmitting,
    bool isFailure,
    bool isSuccess
  }) {
    return RegisterState(
        isEmailValid: isEmailValid ?? this.isEmailValid,
        isPasswordValid: isPasswordValid ?? this.isPasswordValid,
        isSuccess: isSuccess ?? this.isSuccess,
        isFailure: isFailure ?? this.isFailure,
        isSubmitting: isSubmitting ?? this.isSubmitting
    );
  }
}