import 'package:flutter/material.dart';
import 'package:untitled/constants/app_constants.dart';
import 'package:untitled/utils/app_styles.dart';
import 'package:untitled/utils/base_state.dart';

import '../utils/app_utils.dart';
import '../widgets/app_text_field.dart';

class InspectionApplication extends StatefulWidget {
  const InspectionApplication({Key? key}) : super(key: key);

  @override
  State<InspectionApplication> createState() => _InspectionApplicationState();
}

class _InspectionApplicationState extends BaseState<InspectionApplication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(AppConstants.DEFAULT_CONTAINER_PADDING),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Inspection List",
            style: TextStyle(
                color: AppStyles.primary500Color,
                fontSize: 24,
                fontWeight: FontWeight.w500),
          ),
          Row(
            children: [
              Padding(
                  padding: const EdgeInsets.all(AppConstants.PADDING),
                  child: ElevatedButton(
                    onPressed: () {
                      debugPrint('ElevatedButton Clicked');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppStyles.white,
                      shape: const StadiumBorder(),
                      side: const BorderSide(
                          color: AppStyles.primary500Color, width: 2),
                    ),
                    child: const Text(
                      'Compliance Document',
                      style: TextStyle(
                          color: AppStyles.primary500Color,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.all(AppConstants.PADDING),
                  child: ElevatedButton(
                    onPressed: () {
                      debugPrint('ElevatedButton Clicked');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppStyles.white,
                      shape: const StadiumBorder(),
                      side: const BorderSide(
                          color: AppStyles.primary500Color, width: 2),
                    ),
                    child: const Text(
                      'Clear',
                      style: TextStyle(
                          color: AppStyles.primary500Color,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.all(AppConstants.PADDING),
                  child: ElevatedButton(
                    onPressed: () {
                      debugPrint('ElevatedButton Clicked');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppStyles.white,
                      shape: const StadiumBorder(),
                      side: const BorderSide(
                          color: AppStyles.primary500Color, width: 2),
                    ),
                    child: const Text(
                      'Add New',
                      style: TextStyle(
                          color: AppStyles.primary500Color,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
            ],
          ),
          const SizedBox(
            height: AppConstants.CORNER_RADIUS,
          ),
          Row(
            children: [
              const Text(
                "Search:",
                style: TextStyle(fontSize: 18, color: AppStyles.grey900Color),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(AppConstants.PADDING),
                  child: AppTextField(
                    titleTextStyle:
                        AppStyles.normalTextStyle.copyWith(fontSize: 10),
                    title: "",
                    textInputType: TextInputType.text,
                    // controller: _mobileController,
                    validator: (text) {
                      if (!(AppUtils.checkRequired(text))) {
                        return translate('required');
                      }
                      return null;
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: AppConstants.CORNER_RADIUS,
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (ctx, int) {
                return Card(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: AppStyles.primary500Color,
                    ),
                    borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                  ),
                  elevation: 5,
                  child: ListTile(
                      title: Text(
                        'Inspection $int',
                        style: const TextStyle(
                            fontSize: 18,
                            color: AppStyles.primary500Color,
                            fontWeight: FontWeight.w500),
                      ),
                      subtitle: const Text(
                          'this is a description of the Inspection List')),
                );
              },
            ),
          ),
        ],
      ),
    ));
  }
}
