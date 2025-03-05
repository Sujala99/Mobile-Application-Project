class DoctorDetailView extends StatelessWidget {
  final String doctorId;
  final String baseUrl = "http://10.0.2.2:9000/public/uploads/";

  const DoctorDetailView({Key? key, required this.doctorId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Trigger fetching doctor details when the view opens
    context.read<DoctorBloc>().add(DoctorDetailLoad(doctorId));

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Doctor Details",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: BlocBuilder<DoctorBloc, DoctorState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.error != null) {
            return Center(
              child: Text(
                'Error: ${state.error}',
                style: const TextStyle(color: Colors.red, fontSize: 18),
              ),
            );
          } else if (state.selectedDoctor == null) {
            return const Center(
              child: Text(
                'No doctor details available',
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          final doctor = state.selectedDoctor!;

          // Constructing the full image URL
          String fullImageUrl = doctor.image?.isNotEmpty == true
              ? "$baseUrl${doctor.image}"
              : "https://via.placeholder.com/150"; // Placeholder image

          return SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Doctor Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    fullImageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 200,
                      color: Colors.grey[300],
                      child: const Center(
                        child: Icon(
                          Icons.image_not_supported,
                          size: 50,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                // Doctor Name
                Text(
                  doctor.fullname,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 10),

                // Specialization
                _buildInfoRow(
                  Icons.medical_services,
                  "Specialization: ${doctor.specialization ?? "N/A"}",
                ),

                // Qualification
                _buildInfoRow(
                  Icons.school,
                  "Qualification: ${doctor.qualification ?? "N/A"}",
                ),

                // Experience
                _buildInfoRow(
                  Icons.timeline,
                  "Experience: ${doctor.experience ?? "N/A"} years",
                ),

                // Fees
                _buildInfoRow(
                  Icons.attach_money,
                  "Fees: Rs. ${doctor.fees ?? "N/A"}",
                ),

                const SizedBox(height: 15),

                // Description
                const Text(
                  "About Doctor:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  doctor.description ?? "No description available.",
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),

                const SizedBox(height: 25),

                // Book Appointment Button
                Center(
                  child: ElevatedButton(
                    // onPressed: () {
                    //   // Navigate to booking screen
                    //   Navigator.pushNamed(context, "/booking",
                    //       arguments: doctor);
                    // },
                    onPressed: () {
                      final doctor =
                          state.selectedDoctor!; // Ensure doctor is available
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => AppointmentBookingScreen(
                      //       doctorId: doctor.doctorId!,
                      //       doctorName: doctor.fullname,
                      //       specialization: doctor.specialization ?? 'N/A',
                      //       fees: double.parse(doctor.fees ?? '0'),
                      //     ),
                      //   ),
                      // );
                      // In DoctorDetailView's Book Appointment button onPressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AppointmentBookingScreen(
                            doctorId: doctor.doctorId!,
                            doctorName: doctor.fullname,
                            specialization: doctor.specialization ?? 'N/A',
                            fees: double.parse(doctor.fees ?? '0'), 
                            experience: doctor.experience ?? 0,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 32),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Colors.teal,
                    ),
                    child: const Text(
                      "Book Appointment",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Helper function for info rows
  Widget _buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Icon(icon, color: Colors.teal, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}