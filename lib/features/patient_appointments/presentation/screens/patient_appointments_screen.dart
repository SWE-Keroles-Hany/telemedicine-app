import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
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

  void _handleCancelAppointment(int appointmentId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Cancel Appointment'),
          content: const Text(
            'Are you sure you want to cancel this appointment?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                context.read<AppointmentCubit>().cancelAppointment(
                  appointmentId: appointmentId,
                );
              },
              child: const Text('Yes', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  int _getStatusNumber(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return 1;
      case 'confirmed':
        return 2;
      case 'cancelled':
        return 4;
      case 'completed':
        return 3;
      default:
        return 1;
    }
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
        title: Text(
          'appointments.my_appointments'.tr(),
          style: const TextStyle(
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
              context.read<AppointmentCubit>().getMyAppointments(
                statusNumber: _getStatusNumber(status),
              );
              setState(() {
                _selectedStatus = status;
              });
            },
          ),
          Expanded(
            child: BlocConsumer<AppointmentCubit, AppointmentState>(
              listener: (context, state) {
                if (state is CancelAppointmentSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Appointment cancelled successfully'),
                      backgroundColor: Colors.green,
                    ),
                  );
                } else if (state is CancelAppointmentError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is AppointmentsLoading ||
                    state is CancelAppointmentLoading) {
                  return const AppointmentsLoadingWidget();
                } else if (state is AppointmentsSuccess) {
                  final filteredAppointments = _filterAppointmentsByStatus(
                    state.appointments,
                  );
                  return AppointmentsList(
                    appointments: filteredAppointments,
                    onCancel: _handleCancelAppointment,
                  );
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
