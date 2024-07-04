// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nectar/core/utils/enums/enums.dart';
import 'package:nectar/core/widgets/app_text_button.dart';
import 'package:nectar/core/widgets/app_text_form_field.dart';
import 'package:nectar/core/widgets/circular_progress_indicator_widget.dart';
import 'package:nectar/core/widgets/snackbar_message.dart';
import 'package:nectar/core/widgets/spacing.dart';
import 'package:nectar/store/domain/usecases/save_category.dart';
import 'package:nectar/store/presentation/controller/store_cubit.dart';

class LoadCategoriesScreen extends StatefulWidget {
  const LoadCategoriesScreen({super.key});

  @override
  State<LoadCategoriesScreen> createState() => _LoadCategoriesScreenState();
}

class _LoadCategoriesScreenState extends State<LoadCategoriesScreen> {
  var nameArController = TextEditingController();

  var nameEnController = TextEditingController();

  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<StoreCubit, StoreState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                    image = await ImagePicker().pickImage(
                      source: ImageSource.gallery,
                    );
                    setState(() {});
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    height: 150.h,
                    width: 150.h,
                    child: image == null
                        ? Image.asset('assets/images/empty.png')
                        : Image.file(
                            File(
                              image!.path,
                            ),
                          ),
                  ),
                ),
                verticalSpacing(45),
                AppTextFormField(
                    controller: nameArController, hintText: "Name Arabic"),
                verticalSpacing(15),
                AppTextFormField(
                    controller: nameEnController, hintText: "Name English"),
                verticalSpacing(15),
                if (state.savingCategoryState == RequestState.loading)
                  const CircularProgressIndicatorWidget(),
                const Spacer(),
                AppTextButton(
                  onPressed: () {
                    final storeCubit = StoreCubit.get(context);
                    storeCubit.saveCategory(
                      SavingCategoryParams(
                        nameAr: nameArController.text,
                        nameEn: nameEnController.text,
                        image: image!,
                      ),
                    );
                  },
                  title: "Save",
                ),
              ],
            ),
          );
        },
        listener: (context, state) {
          final storeCubit = StoreCubit.get(context);
          if (state.savingCategoryState == RequestState.error ||
              state.savingCategoryState == RequestState.offline) {
            SnackbarMessage.showErrorMessage(
                context, storeCubit.categoriesMessage);
          } else if (state.savingCategoryState == RequestState.loaded) {
            SnackbarMessage.showSuccessMessage(
              context,
              "Category has been uploaded successfully",
            );
          }
        },
      ),
    );
  }
}
