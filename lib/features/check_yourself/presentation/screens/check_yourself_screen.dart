import 'dart:developer';
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
  final int? patientId;
  const CheckYourselfScreen({super.key, this.patientId});

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
    log("=>in check screen patientId ${widget.patientId}");

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CheckYourselfCubit>().deleteHistory(
        recordId: widget.patientId ?? 00,
      );
      context.read<SettingsCubit>().getUserProfile();
    });
  }

  void _sendMessage({required int patientId}) async {
    String text = _messageController.text.trim();
    if (text.isEmpty && _selectedFiles.isEmpty) return;
    final filesToSend = List<File>.from(_selectedFiles);
    if (filesToSend.isNotEmpty) {
      setState(() {
        _currentRoute = "medical_records";
      });
    } else {
      setState(() {
        _currentRoute = "chat";
      });
    }
    setState(() {
      _messages.add(
        ChatMessage(text: text, isUser: true, files: List.from(_selectedFiles)),
      );
      _messageController.clear();
      _selectedFiles.clear();
      _isLoading = true;
    });
    log("3)before sending ...${_selectedFiles.length}");

    await context.read<CheckYourselfCubit>().sendMessage(
      patientId: patientId,
      message: text.isEmpty ? "check this image" : text,
      route: _currentRoute,
      files: filesToSend,
    );
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
                    onSend: () {
                      log("user id =>${user?.patientId}");
                      log(
                        "4)before sending (on send button)...${_selectedFiles.length}",
                      );
                      _sendMessage(patientId: user?.patientId ?? 00);
                    },

                    onFilesSelected: (files) {
                      if (files.isEmpty) return;
                      log("1) on select selected files ");
                      setState(() {
                        _currentRoute = "medical_records";
                        _selectedFiles = files;
                        log("the file selected => * $_selectedFiles");
                      });
                    },
                  ),
                ],
              );
            },
          ),
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
