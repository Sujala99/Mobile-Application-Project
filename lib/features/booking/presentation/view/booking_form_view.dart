import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mobile_application_project/features/appointment/presentation/view/appointment_view.dart';
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
  final int experience;

  const AppointmentBookingScreen({
    Key? key,
    required this.doctorId,
    required this.doctorName,
    required this.specialization,
    required this.fees,
    required this.experience,
  }) : super(key: key);

  @override
  _AppointmentBookingScreenState createState() => _AppointmentBookingScreenState();
}

class _AppointmentBookingScreenState extends State<AppointmentBookingScreen> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  void _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() => selectedDate = picked);
    }
  }

  void _selectTime(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() => selectedTime = picked);
    }
  }

  void _bookAppointment(BuildContext context) {
    final userId = context.read<HomeCubit>().userId;

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
    return BlocListener<BookingBloc, BookingState>(
  listener: (context, state) {
    if (state is BookingCreated) {  // ✅ SUCCESS
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Appointment booked successfully!')),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AppointmentView()),
      );
    } else if (state is BookingError) {  // ✅ FAILURE
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to book appointment: ${state.message}')),
      );
    }
  },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Book Appointment"),
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              elevation: 5,
              color: Colors.deepPurple.shade50,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Doctor: ${widget.doctorName}",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
                    Text("Specialist: ${widget.specialization}",
                        style: const TextStyle(fontSize: 16, color: Colors.black54)),
                    Text("Experience: ${widget.experience} years",
                        style: const TextStyle(fontSize: 16, color: Colors.black54)),
                    Text("Fees: \$${widget.fees}",
                        style: const TextStyle(fontSize: 16, color: Colors.black54)),
                    const Divider(height: 20, thickness: 1, color: Colors.deepPurple),
                    ListTile(
                      title: Text(selectedDate == null
                          ? "Select Date"
                          : DateFormat('yyyy-MM-dd').format(selectedDate!)),
                      trailing: const Icon(Icons.calendar_today, color: Colors.deepPurple),
                      onTap: () => _selectDate(context),
                    ),
                    ListTile(
                      title: Text(selectedTime == null
                          ? "Select Time"
                          : selectedTime!.format(context)),
                      trailing: const Icon(Icons.access_time, color: Colors.deepPurple),
                      onTap: () => _selectTime(context),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: () => _bookAppointment(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: const Text("Book Appointment", style: TextStyle(color: Colors.white, fontSize: 16)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
