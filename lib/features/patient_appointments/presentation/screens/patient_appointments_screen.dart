import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telemedicine/core/theme/color_manger.dart';
import 'package:telemedicine/features/patient_appointments/domain/entities/appointment.dart';
import 'package:telemedicine/features/patient_appointments/presentation/cubit/appointment_cubit.dart';
import '../widgets/appointments_list.dart';
import '../widgets/loading_widget.dart';
import '../widgets/error_widget.dart';
import '../widgets/status_tabs.dart';

class PatientAppointmentsScreen extends StatefulWidget {
  static const String routeName = "PatientAppointmentsScreen";
  const PatientAppointmentsScreen({super.key});

  @override
  State<PatientAppointmentsScreen> createState() =>
      _PatientAppointmentsScreenState();
}

class _PatientAppointmentsScreenState extends State<PatientAppointmentsScreen> {
  String _selectedStatus = 'Pending';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AppointmentCubit>().getMyAppointments(statusNumber: 1);
    });
  }

  List<Appointment> _filterAppointmentsByStatus(
    List<Appointment> appointments,
  ) {
    if (_selectedStatus == 'All') {
      return appointments;
    }
    return appointments
        .where((appointment) => appointment.status == _selectedStatus)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.bookingScaffoldBg,
      appBar: AppBar(
        backgroundColor: ColorManager.bookingScaffoldBg,
        elevation: 0,
        title: const Text(
          'My Appointments',
          style: TextStyle(
            color: ColorManager.bookingTextPrimary,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: ColorManager.bookingTextPrimary,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          StatusTabs(
            selectedStatus: _selectedStatus,
            onStatusChanged: (status) {
              if (status.toLowerCase() == "pending") {
                context.read<AppointmentCubit>().getMyAppointments(
                  statusNumber: 1,
                );
              } else if (status.toLowerCase() == "confirmed") {
                context.read<AppointmentCubit>().getMyAppointments(
                  statusNumber: 2,
                );
              } else if (status.toLowerCase() == "cancelled") {
                context.read<AppointmentCubit>().getMyAppointments(
                  statusNumber: 3,
                );
              } else if (status.toLowerCase() == "completed") {
                context.read<AppointmentCubit>().getMyAppointments(
                  statusNumber: 4,
                );
              }
              setState(() {
                _selectedStatus = status;
              });
            },
          ),
          Expanded(
            child: BlocConsumer<AppointmentCubit, AppointmentState>(
              listener: (context, state) {
                // Handle any side effects if needed
              },
              builder: (context, state) {
                if (state is AppointmentsLoading) {
                  return const AppointmentsLoadingWidget();
                } else if (state is AppointmentsSuccess) {
                  final filteredAppointments = _filterAppointmentsByStatus(
                    state.appointments,
                  );
                  return AppointmentsList(appointments: filteredAppointments);
                } else if (state is AppointmentsError) {
                  return AppointmentsErrorWidget(
                    message: state.message,
                    onRetry: () {},
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
