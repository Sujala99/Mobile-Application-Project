// import 'package:equatable/equatable.dart';

// abstract class BookingState extends Equatable {
//   const BookingState(); // Add const constructor for performance optimization

//   @override
//   List<Object?> get props => [];
// }

// class BookingInitial extends BookingState {
//   const BookingInitial();
// }

// class BookingLoading extends BookingState {
//   const BookingLoading();
// }

// class BookingCreated extends BookingState {
//   const BookingCreated();
// }

// class BookingError extends BookingState {
//   final String message;

//   const BookingError(this.message);

//   @override
//   List<Object?> get props => [message]; // Keep Equatable properties
// }
import 'package:equatable/equatable.dart';

abstract class BookingState extends Equatable {
  const BookingState();
  @override
  List<Object?> get props => [];
}

class BookingInitial extends BookingState {
  const BookingInitial();
}

class BookingLoading extends BookingState {
  const BookingLoading();
}

class BookingCreated extends BookingState {  // This is the success state
  const BookingCreated();
}

class BookingError extends BookingState {   // This is the failure state
  final String message;
  const BookingError(this.message);
  @override
  List<Object?> get props => [message];
}
