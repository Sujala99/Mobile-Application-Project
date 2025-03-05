// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart'; // For DateFormat
// import 'package:mobile_application_project/features/booking/domain/entity/bookings_entity.dart';
// import 'package:mobile_application_project/features/booking/presentation/view_model/booking/booking_bloc.dart';
// import 'package:mobile_application_project/features/booking/presentation/view_model/booking/booking_event.dart';
// import 'package:mobile_application_project/features/booking/presentation/view_model/booking/booking_state.dart';
// import 'package:mobile_application_project/features/home/presentation/view_model/home_cubit.dart';

// class AppointmentBookingScreen extends StatefulWidget {
//   final String doctorId;
//   final String doctorName;
//   final String specialization;
//   final double fees;

//   const AppointmentBookingScreen({
//     Key? key,
//     required this.doctorId,
//     required this.doctorName,
//     required this.specialization,
//     required this.fees,
//   }) : super(key: key);

//   @override
//   _AppointmentBookingScreenState createState() =>
//       _AppointmentBookingScreenState();
// }

// class _AppointmentBookingScreenState extends State<AppointmentBookingScreen> {
//   DateTime? selectedDate;
//   TimeOfDay? selectedTime;

//   void _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime.now(),
//       lastDate: DateTime(2101),
//     );
//     if (picked != null && picked != selectedDate) {
//       setState(() {
//         selectedDate = picked;
//       });
//     }
//   }

//   void _selectTime(BuildContext context) async {
//     final TimeOfDay? picked = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//     );
//     if (picked != null && picked != selectedTime) {
//       setState(() {
//         selectedTime = picked;
//       });
//     }
//   }

//   void _bookAppointment() {
//     final String userId =
//         context.read<HomeCubit>().userId; // Access user ID from HomeCubit

//     if (selectedDate == null || selectedTime == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Please select both date and time")),
//       );
//       return;
//     }

//     final String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate!);
//     final String formattedTime = selectedTime!.format(context);

//     BookingsEntity booking = BookingsEntity(
//       id: '', // Replace with actual ID from backend if applicable
//       userId: userId, // Use the logged-in user's ID
//       doctorId: widget.doctorId,
//       date: DateTime.now(),
//       time: formattedTime,
//       status: 'Pending',
//       createdAt: DateTime.now(),
//     );

//     BlocProvider.of<BookingBloc>(context)
//         .add(CreateBookingEvent(booking: booking));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Book Appointment")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Doctor: ${widget.doctorName}",
//                 style:
//                     const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             Text("Specialization: ${widget.specialization}",
//                 style: const TextStyle(fontSize: 16)),
//             Text("Fees: \$${widget.fees}",
//                 style: const TextStyle(fontSize: 16)),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () => _selectDate(context),
//               child: Text(selectedDate == null
//                   ? "Select Date"
//                   : DateFormat('yyyy-MM-dd').format(selectedDate!)),
//             ),
//             ElevatedButton(
//               onPressed: () => _selectTime(context),
//               child: Text(selectedTime == null
//                   ? "Select Time"
//                   : selectedTime!.format(context)),
//             ),
//             const SizedBox(height: 20),
//             Center(
//               child: ElevatedButton(
//                 onPressed: _bookAppointment,
//                 child: const Text("Book Appointment"),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';
// import 'package:mobile_application_project/features/booking/domain/entity/bookings_entity.dart';
// import 'package:mobile_application_project/features/booking/presentation/view_model/booking/booking_bloc.dart';
// import 'package:mobile_application_project/features/home/presentation/view_model/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart'; // For DateFormat
import 'package:mobile_application_project/features/booking/domain/entity/bookings_entity.dart';
import 'package:mobile_application_project/features/booking/presentation/view_model/booking/booking_bloc.dart';
import 'package:mobile_application_project/features/booking/presentation/view_model/booking/booking_event.dart';
import 'package:mobile_application_project/features/booking/presentation/view_model/booking/booking_state.dart';
import 'package:mobile_application_project/features/home/presentation/view_model/home_cubit.dart';

class AppointmentBookingScreen extends StatefulWidget {
  final String doctorId;
  final String doctorName;
  final String specialization;
  final double fees;

  const AppointmentBookingScreen({
    Key? key,
    required this.doctorId,
    required this.doctorName,
    required this.specialization,
    required this.fees,
  }) : super(key: key);

  @override
  _AppointmentBookingScreenState createState() => _AppointmentBookingScreenState();
}

class _AppointmentBookingScreenState extends State<AppointmentBookingScreen> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() => selectedDate = picked);
    }
  }

  void _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {
      setState(() => selectedTime = picked);
    }
  }

  void _bookAppointment(BuildContext context) {
    final String userId = context.read<HomeCubit>().userId;

    if (selectedDate == null || selectedTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select date and time")),
      );
      return;
    }

    final formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate!);
    final formattedTime = selectedTime!.format(context);

    final booking = BookingsEntity(
      id: '',
      userId: userId,
      doctorId: widget.doctorId,
      date: selectedDate!,
      time: formattedTime,
      status: 'Pending',
      createdAt: DateTime.now(),
    );

    context.read<BookingBloc>().add(CreateBookingEvent(booking: booking, context: context));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingBloc, BookingState>(
      builder: (context, state) {
        if (state is BookingLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is BookingCreated) {
          // Use addPostFrameCallback to show the SnackBar after the build phase
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Booking successful!")),
            );
          });
          Future.delayed(const Duration(seconds: 2), () {
            Navigator.pop(context);
          });
          return const Center(child: Text("Booking confirmed"));
        } else if (state is BookingError) {
          // Use addPostFrameCallback to show the SnackBar after the build phase
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Error: ${state.message}")),
            );
          });
          return const Center(child: Text("Error"));
        }

        return Scaffold(
          appBar: AppBar(title: const Text("Book Appointment")),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Doctor: ${widget.doctorName}"),
                Text("Specialization: ${widget.specialization}"),
                Text("Fees: \${widget.fees}"),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: Text(selectedDate == null
                      ? "Select Date"
                      : DateFormat('yyyy-MM-dd').format(selectedDate!)),
                ),
                ElevatedButton(
                  onPressed: () => _selectTime(context),
                  child: Text(selectedTime == null
                      ? "Select Time"
                      : selectedTime!.format(context)),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () => _bookAppointment(context),
                    child: const Text("Book Appointment"),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}