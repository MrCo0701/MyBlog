import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_blog/app/widgets/custom_snack_bar.dart';

import '../cubits/setting_cubit.dart';
import '../cubits/setting_state.dart';

Future<void> showUpdateProfileDialog(
  BuildContext context, {
  required String currentName,
  required String? imageUrl,
  required File? currentAvatar,
  required VoidCallback onSave,
}) async {
  final nameController = TextEditingController(text: currentName);

  await showDialog(
    context: context,
    barrierDismissible: true,
    builder: (_) {
      final settingCubit = context.read<SettingCubit>();

      return BlocProvider.value(
        value: settingCubit,
        child: StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: BlocBuilder<SettingCubit, SettingState>(
                  builder: (context, state) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Update Profile",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 20),

                        GestureDetector(
                          onTap: () => context
                              .read<SettingCubit>()
                              .pickImageFromGallery(),
                          child: Stack(
                            children: [
                              CircleAvatar(
                                radius: 45,
                                backgroundImage: state.fileImage != null
                                    ? FileImage(state.fileImage!)
                                    : (imageUrl != null && imageUrl.isNotEmpty)
                                    ? NetworkImage(imageUrl)
                                    : const AssetImage(
                                            'assets/fake_data/user_image.png',
                                          )
                                          as ImageProvider,
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.15),
                                        blurRadius: 4,
                                      ),
                                    ],
                                  ),
                                  child: const Icon(Icons.edit, size: 18),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),

                        TextField(
                          controller: nameController,
                          decoration: InputDecoration(labelText: "Full Name"),
                        ),

                        const SizedBox(height: 20),

                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.lightGreen,
                            ),
                            onPressed: () {
                              context.read<SettingCubit>().changeUserInfo(
                                state.fileImage,
                                state.userInfo.fullName,
                              );

                              //! Bug Here
                              if (state.isSettingSuccess) {
                                AppSnackBar.success(
                                  context,
                                  'Change Info of User Success',
                                );
                              } else {
                                AppSnackBar.error(
                                  context,
                                  'Change Info of User Fail',
                                );
                              }

                              Navigator.pop(context);
                            },
                            child: Text(
                              "Save",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            );
          },
        ),
      );
    },
  );
}
