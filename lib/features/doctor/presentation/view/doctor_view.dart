import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_application_project/app/di/di.dart';
import 'package:mobile_application_project/features/doctor/presentation/view/doctor_detail_view.dart';
import 'package:mobile_application_project/features/doctor/presentation/view_model/doctor/doctor_bloc.dart';
import 'package:mobile_application_project/features/doctor/presentation/view_model/doctor/doctor_event.dart';
import 'package:mobile_application_project/features/doctor/presentation/view_model/doctor/doctor_state.dart';

class DoctorView extends StatelessWidget {
  final String baseUrl = "http://10.0.2.2:4000/public/uploads/";

  const DoctorView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DoctorBloc>()..add(DoctorLoad()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 142, 89, 233),
          title: const Text("Find Your Doctor", style: TextStyle(color: Colors.white)),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "Search for doctors...",
                  prefixIcon: const Icon(Icons.search, color: Colors.deepPurple),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: BlocBuilder<DoctorBloc, DoctorState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state.error != null) {
                      return Center(
                        child: Text('Error: ${state.error}',
                            style: const TextStyle(color: Colors.red, fontSize: 16)),
                      );
                    } else if (state.doctors.isEmpty) {
                      return const Center(child: Text('No Doctor Available'));
                    } else {
                      return ListView.builder(
                        itemCount: state.doctors.length,
                        itemBuilder: (context, index) {
                          final doctor = state.doctors[index];
                          String fullImageUrl = (doctor.image?.isNotEmpty == true)
                              ? "{doctor.image}"
                              : "https://via.placeholder.com/150";

                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.deepPurple.shade50,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 6,
                                  offset: const Offset(2, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    fullImageUrl,
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) =>
                                        const Icon(Icons.image_not_supported, size: 80),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        doctor.fullname,
                                        style: const TextStyle(
                                            fontSize: 18, fontWeight: FontWeight.bold),
                                      ),
                                      Text("Specialist: ${doctor.specialization ?? "N/A"}",
                                          style: const TextStyle(fontSize: 14, color: Colors.grey)),
                                      Text("Experience: ${doctor.experience ?? "N/A"} years",
                                          style: const TextStyle(fontSize: 14, color: Colors.grey)),
                                      Text("Fees: \$${doctor.fees ?? "N/A"}",
                                          style: const TextStyle(fontSize: 14, color: Colors.grey)),
                                      Text("Available Slots: ${doctor.availableSlots ?? "N/A"}",
                                          style: const TextStyle(fontSize: 14, color: Colors.grey)),
                                    ],
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.deepPurple,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  onPressed: () {
                                    final doctorId = doctor.doctorId;
                                    if (doctorId == null || doctorId.isEmpty) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(content: Text("Doctor ID is missing!")),
                                      );
                                      return;
                                    }

                                    final doctorBloc = context.read<DoctorBloc>();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => BlocProvider.value(
                                          value: doctorBloc,
                                          child: DoctorDetailView(doctorId: doctorId),
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Text("View more..", style: TextStyle(color: Colors.white)),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}