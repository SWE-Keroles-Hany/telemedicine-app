import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:telemedicine/core/theme/app_text_styles.dart';
import 'package:telemedicine/core/theme/color_manger.dart';
import 'package:telemedicine/core/utils/ui_utils.dart';
import 'package:telemedicine/features/home/presentation/cubit/home_cubit.dart';
import 'package:telemedicine/features/medical_history/domain/entities/medical_history_entity.dart';
import 'package:telemedicine/features/medical_history/presentation/cubit/medical_history_cubit.dart';
import 'package:telemedicine/features/medical_history/presentation/cubit/medical_history_states.dart';
import 'package:telemedicine/features/medical_history/presentation/widgets/image_viewer_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'medical_history_screen.dart';

class MedicalRecordDetailsScreen extends StatefulWidget {
  const MedicalRecordDetailsScreen({required this.record, super.key});
  final MedicalHistoryEntity record;

  @override
  State<MedicalRecordDetailsScreen> createState() =>
      _MedicalRecordDetailsScreenState();
}

class _MedicalRecordDetailsScreenState
    extends State<MedicalRecordDetailsScreen> {
  int _selectedRating = 0;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm');

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.backGroundColor,
        appBar: AppBar(
          foregroundColor: ColorManager.white,
          backgroundColor: ColorManager.backGroundColor,
          title: Text(
            'Medical Record Details',
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(color: ColorManager.white),
          ),
          centerTitle: true,
        ),
        body: BlocListener<MedicalHistoryCubit, MedicalHistoryState>(
          listener: (context, state) {
            if (state is RateDoctorSuccess) {
              UiUtils.showMessage(message: "Rated Successfully");
              Navigator.of(
                context,
              ).popAndPushNamed(MedicalHistoryScreen.routeName);
              context.read<MedicalHistoryCubit>().getMedicalHistory();
              setState(() {
                _selectedRating = 0;
              });
            } else if (state is RateDoctorError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Error: ${state.message}'),
                  backgroundColor: Colors.red,
                ),
              );
              context.read<MedicalHistoryCubit>().getMedicalHistory();
            }
          },
          child: ListView(
            padding: EdgeInsets.all(16.r),
            children: [
              Container(
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  border: Border.all(color: ColorManager.white),
                  borderRadius: BorderRadius.circular(16.r),
                  color: ColorManager.charcoalBlack,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Doctor',
                                style: textTheme.bodySmall!.copyWith(
                                  color: ColorManager.aquaMint,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                widget.record.doctorName,
                                style: textTheme.titleMedium!.copyWith(
                                  color: ColorManager.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 6.h,
                          ),
                          decoration: BoxDecoration(
                            color: ColorManager.darkGray,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(
                            widget.record.doctorSpecialty,
                            style: textTheme.bodySmall!.copyWith(
                              color: ColorManager.yellow,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 16.sp,
                          color: ColorManager.mediumGray,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          dateFormat.format(widget.record.dateCreated),
                          style: textTheme.bodySmall!.copyWith(
                            color: ColorManager.aquaMint,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              _buildInfoSection(
                textTheme,
                'Diagnosis',
                widget.record.diagnosis,
              ),
              SizedBox(height: 16.h),
              _buildInfoSection(
                textTheme,
                'Treatment Plan',
                widget.record.treatmentPlan,
              ),
              SizedBox(height: 24.h),
              if (widget.record.attachments.isNotEmpty) ...[
                Text(
                  'Attachments',
                  style: textTheme.titleMedium!.copyWith(
                    color: ColorManager.aquaMint,
                  ),
                ),
                SizedBox(height: 12.h),
                Wrap(
                  spacing: 8.w,
                  runSpacing: 8.h,
                  children: widget.record.attachments.map((attachment) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ImageViewerScreen(
                              imageUrl: attachment.fileUrl,
                              title: attachment.attachmentType,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: 100.w,
                        height: 100.h,
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorManager.darkGray),
                          borderRadius: BorderRadius.circular(8.r),
                          color: ColorManager.darkGray,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.r),
                          child: Image.network(
                            attachment.fileUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Center(
                                child: Icon(
                                  Icons.broken_image,
                                  size: 32.sp,
                                  color: ColorManager.mediumGray,
                                ),
                              );
                            },
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  value:
                                      loadingProgress.expectedTotalBytes != null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
              SizedBox(height: 32.h),
              widget.record.patientRating == null
                  ? _buildRatingSection(textTheme)
                  : Column(
                      children: [
                        Divider(color: ColorManager.lightGray, thickness: 0.4),
                        SizedBox(height: 5.h),
                        Text(
                          textAlign: TextAlign.center,
                          style: AppTextStyles.s22bold.copyWith(
                            color: ColorManager.aquaMint,
                          ),
                          "Your Rated this doctor with : ${widget.record.patientRating}",
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoSection(TextTheme textTheme, String label, String value) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        border: Border.all(color: ColorManager.white),
        borderRadius: BorderRadius.circular(16.r),
        color: ColorManager.charcoalBlack,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: textTheme.bodySmall!.copyWith(color: ColorManager.aquaMint),
          ),
          SizedBox(height: 8.h),
          Text(
            value,
            style: textTheme.bodyMedium!.copyWith(color: ColorManager.white),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingSection(TextTheme textTheme) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        border: Border.all(color: ColorManager.white),
        borderRadius: BorderRadius.circular(16.r),
        color: ColorManager.charcoalBlack,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Rate Doctor',
            style: textTheme.titleMedium!.copyWith(color: ColorManager.primary),
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(5, (index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    _selectedRating = index + 1;
                  });
                },
                child: Icon(
                  _selectedRating > index ? Icons.star : Icons.star_border,
                  size: 40.sp,
                  color: _selectedRating > index
                      ? ColorManager.yellow
                      : ColorManager.mediumGray,
                ),
              );
            }),
          ),
          SizedBox(height: 16.h),
          if (_selectedRating > 0)
            BlocBuilder<MedicalHistoryCubit, MedicalHistoryState>(
              builder: (context, state) {
                final isLoading = state is RateDoctorLoading;
                return SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: isLoading
                        ? null
                        : () {
                            context.read<MedicalHistoryCubit>().rateDoctor(
                              medicalRecordId: widget.record.recordId,
                              doctorId: widget.record.doctorId,
                              starts: _selectedRating,
                            );
                            final isRated = state is RateDoctorSuccess;
                            if (isRated) {
                              context.read<HomeCubit>().getTopDoctors();
                            }
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.teal,
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: isLoading
                        ? CircularProgressIndicator(color: ColorManager.white)
                        : Text(
                            'Submit Rating',
                            style: textTheme.bodyMedium!.copyWith(
                              color: ColorManager.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
