import 'package:equatable/equatable.dart';

class BookingsEntity extends Equatable {
  final String id;
  final String userId;
  final String doctorId;
  final DateTime date;
  final String time;
  final String status;
  final DateTime createdAt;

  const BookingsEntity({
    required this.id,
    required this.userId,
    required this.doctorId,
    required this.date,
    required this.time,
    required this.status,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        doctorId,
        date,
        time,
        status,
        createdAt,
      ];

  static BookingsEntity empty() {
    return BookingsEntity(
      id: '',
      userId: '',
      doctorId: '',
      date: DateTime.now(),
      time: '',
      status: 'Pending',
      createdAt: DateTime.now(),
    );
  }
}
