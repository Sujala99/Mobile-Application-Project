import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mobile_application_project/features/doctor/presentation/view/doctor_view.dart';
import 'package:mobile_application_project/features/doctor/presentation/view_model/doctor/doctor_bloc.dart';
import 'package:mobile_application_project/features/doctor/presentation/view_model/doctor/doctor_state.dart';
import 'package:mobile_application_project/features/doctor/domain/entity/doctor_entity.dart';

class MockDoctorBloc extends Mock implements DoctorBloc {}

void main() {
  late MockDoctorBloc mockDoctorBloc;

  setUp(() {
    mockDoctorBloc = MockDoctorBloc();
  });

  Widget buildTestableWidget() {
    return MaterialApp(
      home: BlocProvider<DoctorBloc>.value(
        value: mockDoctorBloc,
        child: const DoctorView(),
      ),
    );
  }

  testWidgets('renders loading indicator when loading', (tester) async {
    when(() => mockDoctorBloc.state).thenReturn(
      const DoctorState(isLoading: true, doctors: [], error: null),
    );

    await tester.pumpWidget(buildTestableWidget());

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('renders error message when error occurs', (tester) async {
    when(() => mockDoctorBloc.state).thenReturn(
      const DoctorState(isLoading: false, doctors: [], error: 'Failed to fetch doctors'),
    );

    await tester.pumpWidget(buildTestableWidget());

    expect(find.text('Error: Failed to fetch doctors'), findsOneWidget);
  });

  testWidgets('renders doctor list when data is available', (tester) async {
    final doctor = DoctorEntity(
      doctorId: '1',
      fullname: 'Dr. John Doe',
      specialization: 'Cardiologist',
      experience: 10,
      fees: 100,
      availableSlots: '10:00 AM - 5:00 PM',
      image: 'doctor1.jpg',
    );

    when(() => mockDoctorBloc.state).thenReturn(
      DoctorState(isLoading: false, doctors: [doctor], error: null),
    );

    await tester.pumpWidget(buildTestableWidget());

    expect(find.text('Dr. John Doe'), findsOneWidget);
    expect(find.text('Specialist: Cardiologist'), findsOneWidget);
    expect(find.text('Experience: 10 years'), findsOneWidget);
    expect(find.text('Fees: \$100'), findsOneWidget);
    expect(find.text('Available Slots: 10:00 AM - 5:00 PM'), findsOneWidget);
  });

  testWidgets('navigates to DoctorDetailView when Detail button is tapped', (tester) async {
    final doctor = DoctorEntity(
      doctorId: '1',
      fullname: 'Dr. John Doe',
      specialization: 'Cardiologist',
      experience: 10,
      fees: 100,
      availableSlots: '10:00 AM - 5:00 PM',
      image: 'doctor1.jpg',
    );

    when(() => mockDoctorBloc.state).thenReturn(
      DoctorState(isLoading: false, doctors: [doctor], error: null),
    );

    await tester.pumpWidget(buildTestableWidget());

    final detailButton = find.text('Detail');
    expect(detailButton, findsOneWidget);

    await tester.tap(detailButton);
    await tester.pumpAndSettle();

    // Since DoctorDetailView is navigated to, you can check something from that view
    expect(find.text('Doctor Details'), findsOneWidget); // Assuming DoctorDetailView has a title like this
  });
}
