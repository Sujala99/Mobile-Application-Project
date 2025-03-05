import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_application_project/app/di/di.dart';
import 'package:mobile_application_project/features/doctor/presentation/view/doctor_detail_view.dart';
import 'package:mobile_application_project/features/doctor/presentation/view_model/doctor/doctor_bloc.dart';
import 'package:mobile_application_project/features/doctor/presentation/view_model/doctor/doctor_event.dart';
import 'package:mobile_application_project/features/doctor/presentation/view_model/doctor/doctor_state.dart';

class DoctorView extends StatelessWidget {
  final String baseUrl = "http://10.0.2.2:9000/public/uploads/";

  const DoctorView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<DoctorBloc>()..add(DoctorLoad()), // ✅ Ensures Bloc is provided
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16), // ✅ Added padding
          child: BlocBuilder<DoctorBloc, DoctorState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.error != null) {
                return Center(
                  child: Text(
                    'Error: ${state.error}',
                    style: const TextStyle(color: Colors.red, fontSize: 16),
                  ),
                );
              } else if (state.doctors.isEmpty) {
                return const Center(child: Text('No Doctor Available'));
              } else {
                return SizedBox(
                  height: 270, // ✅ Fixed height for horizontal scrolling
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal, // ✅ Horizontal scrolling
                    itemCount: state.doctors.length,
                    itemBuilder: (context, index) {
                      final doctor = state.doctors[index];

                      // ✅ Ensure proper URL formation for images (handle null)
                      String fullImageUrl = (doctor.image?.isNotEmpty == true)
                          ? "$baseUrl${doctor.image}"
                          : "https://via.placeholder.com/150"; // Placeholder Image

                      return Container(
                        width: 200, // ✅ Fixed width for each course card
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 6,
                              spreadRadius: 2,
                              offset: const Offset(2, 2),
                            ),
                          ],
                        ),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize:
                                MainAxisSize.min, // ✅ Prevent Overflow
                            children: [
                              // ✅ Course Image
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(12)),
                                child: Image.network(
                                  fullImageUrl,
                                  height: 100,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Icon(Icons.image_not_supported,
                                          size: 100),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize:
                                        MainAxisSize.min, // ✅ Prevent Overflow
                                    children: [
                                      // ✅ Course Name
                                      Text(
                                        doctor.fullname,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 2),
                                      // ✅ Instructor Name
                                      Text(
                                        "Username: ${doctor.username}",
                                        style: const TextStyle(
                                            fontSize: 14, color: Colors.grey),
                                      ),
                                      const SizedBox(height: 2),
                                      // ✅ Course Duration
                                      // Text(
                                      //   doctor.,
                                      //   style: const TextStyle(
                                      //       fontSize: 14,
                                      //       color: Colors.blueAccent),
                                      // ),

                                      // ✅ "Add to Schedule" Button
                                      SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                Colors.amber.shade700,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                          // onPressed: () {
                                          //   final courseBloc =
                                          //       context.read<DoctorBloc>();

                                          //   // ✅ Navigate to Course Detail Page
                                          //   Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //       builder: (context) =>
                                          //           BlocProvider.value(
                                          //         value:
                                          //             courseBloc, // ✅ Pass existing Bloc instance
                                          //         child: DoctorDetailView(
                                          //             doctorId:
                                          //                 doctor.doctorId ??
                                          //                     ''),
                                          //       ),
                                          //     ),
                                          //   );
                                          // },

                                          onPressed: () {
                                            final doctorId = doctor.doctorId;
                                            if (doctorId == null ||
                                                doctorId.isEmpty) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                    content: Text(
                                                        "Doctor ID is missing!")),
                                              );
                                              return;
                                            }

                                            final doctorBloc =
                                                context.read<DoctorBloc>();

                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    BlocProvider.value(
                                                  value:
                                                      doctorBloc, // ✅ Pass existing Bloc instance
                                                  child: DoctorDetailView(
                                                      doctorId: doctorId),
                                                ),
                                              ),
                                            );
                                          },

                                          child: const Text(
                                            "Book Appointment",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
