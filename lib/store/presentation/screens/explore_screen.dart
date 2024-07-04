import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/core/utils/enums/enums.dart';
import 'package:nectar/core/utils/text_styles/text_styles.dart';
import 'package:nectar/core/widgets/circular_progress_indicator_widget.dart';
import 'package:nectar/core/widgets/spacing.dart';
import 'package:nectar/store/presentation/controller/store_cubit.dart';
import 'package:nectar/store/presentation/widgets/categories_gridview_widget.dart';
import 'package:nectar/store/presentation/widgets/search_widget.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final storeCubit = StoreCubit.get(context);
    return BlocBuilder<StoreCubit, StoreState>(builder: (context, state) {
      if (state.gettingCategoriesState == RequestState.loading) {
        return const CircularProgressIndicatorWidget();
      } else if (state.gettingCategoriesState == RequestState.error ||
          state.gettingCategoriesState == RequestState.offline) {
        return const Text('Error');
      } else if (state.gettingCategoriesState == RequestState.loaded) {
        if (storeCubit.categoriesList.isEmpty) {
          return const Center(
            child: Text(
              'No Categories',
            ),
          );
        } else {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  verticalSpacing(20),
                  Text(
                    "Find Products",
                    style: TextStyles.font16CanvasBoldGilroy(context).copyWith(
                      fontSize: 20.sp,
                    ),
                  ),
                  verticalSpacing(20),
                  SearchWidget(
                    onTap: () {},
                    marginWidth: 0,
                  ),
                  verticalSpacing(20),
                  CategoriesGridViewWidget(
                    categoriesList: storeCubit.categoriesList,
                  ),
                  verticalSpacing(20),
                ],
              ),
            ),
          );
        }
      } else {
        return const SizedBox();
      }
    });
  }
}
