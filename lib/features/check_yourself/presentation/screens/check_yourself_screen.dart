import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telemedicine/core/shared_models/user/entities/user_entity.dart';
import 'package:telemedicine/core/theme/color_manger.dart';
import 'package:telemedicine/features/check_yourself/presentation/cubit/check_yourself_cubit.dart';
import 'package:telemedicine/features/check_yourself/presentation/cubit/check_yourself_states.dart';
import 'package:telemedicine/features/check_yourself/presentation/widgets/chat_input_field.dart';
import 'package:telemedicine/features/check_yourself/presentation/widgets/chat_message_bubble.dart';
import 'package:telemedicine/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:telemedicine/features/settings/presentation/cubit/settings_states.dart';

class CheckYourselfScreen extends StatefulWidget {
  static const String routeName = "CheckYourselfScreen";
  const CheckYourselfScreen({super.key});

  @override
  State<CheckYourselfScreen> createState() => _CheckYourselfScreenState();
}

class _CheckYourselfScreenState extends State<CheckYourselfScreen> {
  final List<ChatMessage> _messages = [];
  final TextEditingController _messageController = TextEditingController();
  List<File> _selectedFiles = [];
  String _currentRoute = "chat";
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SettingsCubit>().getUserProfile();
    });
  }

  void _sendMessage({required int patientId}) async {
    final text = _messageController.text.trim();
    if (text.isEmpty && _selectedFiles.isEmpty) return;

    setState(() {
      _messages.add(
        ChatMessage(text: text, isUser: true, files: List.from(_selectedFiles)),
      );
      _messageController.clear();
      _selectedFiles.clear();
      _isLoading = true;
    });

    await context.read<CheckYourselfCubit>().sendMessage(
      patientId: patientId,
      message: text,
      route: _currentRoute,
      files: _selectedFiles.isEmpty ? null : List.from(_selectedFiles),
    );
  }

  void _onFilesSelected(List<File> files) {
    setState(() {
      _selectedFiles = files;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocListener<CheckYourselfCubit, CheckYourselfState>(
      listener: (context, state) {
        if (state is CheckYourselfSuccess) {
          setState(() {
            _isLoading = false;
            _messages.add(
              ChatMessage(
                text: state.chatResponse.response ?? "",
                isUser: false,
              ),
            );
          });
        } else if (state is CheckYourselfError) {
          setState(() {
            _isLoading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
        }
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            foregroundColor: ColorManager.white,
            centerTitle: true,
            title: Text(
              'Check Yourself',
              style: textTheme.titleLarge?.copyWith(color: ColorManager.white),
            ),
          ),
          body: BlocBuilder<SettingsCubit, SettingsState>(
            builder: (context, settingsState) {
              UserEntity? user;
              if (settingsState is GetUserProfileSuccess) {
                user = settingsState.userProfile;
              }

              return Column(
                children: [
                  Expanded(
                    child: _messages.isEmpty
                        ? Center(
                            child: Text(
                              'Start a conversation',
                              style: textTheme.titleLarge!.copyWith(
                                color: ColorManager.white,
                              ),
                            ),
                          )
                        : ListView.separated(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 12.h,
                            ),
                            itemCount: _messages.length + (_isLoading ? 1 : 0),
                            separatorBuilder: (ctx, idx) =>
                                SizedBox(height: 8.h),
                            itemBuilder: (ctx, index) {
                              if (index == _messages.length && _isLoading) {
                                return Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 12.h,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(
                                          width: 20.w,
                                          height: 20.h,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            color: ColorManager.aquaMint,
                                          ),
                                        ),
                                        SizedBox(width: 8.w),
                                        Text(
                                          'Typing...',
                                          style: textTheme.bodyMedium!.copyWith(
                                            color: ColorManager.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                              final message = _messages[index];
                              return ChatMessageBubble(
                                text: message.text,
                                isUser: message.isUser,
                                files: message.files,
                              );
                            },
                          ),
                  ),
                  ChatInputField(
                    controller: _messageController,
                    selectedFiles: _selectedFiles,
                    onSend: () => _sendMessage(patientId: 11),
                    onFilesSelected: _onFilesSelected,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildRouteChip(String label, String route) {
    bool isSelected = _currentRoute == route;
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentRoute = route;
        });
      },
      child: Chip(
        label: Text(label),
        backgroundColor: isSelected
            ? ColorManager.aquaMint
            : ColorManager.white,
        labelStyle: TextStyle(
          color: isSelected ? ColorManager.white : ColorManager.black,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
    );
  }
}

class ChatMessage {
  final String text;
  final bool isUser;
  final List<File>? files;

  ChatMessage({required this.text, required this.isUser, this.files});
}
