import 'package:flutter/material.dart';
import 'package:interview_task/utils/constants/color_constants.dart';
import 'package:interview_task/utils/styles/string_styles.dart';



class TextfeildWidget extends StatelessWidget {
  const TextfeildWidget({
    super.key,
    required this.controller,
    required this.label,
    this.validation,
    this.wantObscure = false,
    this.keyboardType = TextInputType.text,
    this.heading,
    this.wantHeading = false,
    this.historyController,
    this.wantSuffix = false,
    this.suffIcon,
  });

  final TextEditingController controller;
  final String label;
  final bool wantSuffix;
  final String? Function(String?)? validation;
  final bool wantObscure;
  final TextInputType keyboardType;
  final bool wantHeading;
  final String? heading;
  final UndoHistoryController? historyController;
  final IconButton? suffIcon;

  @override
  Widget build(BuildContext context) {

    return  wantHeading
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                heading.toString(),
                style: StringStyles.subHeadingStyle(),
              ),
              const SizedBox(height: 5),
              TextFormField(
                onFieldSubmitted: (value) {},
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: keyboardType,
                cursorColor: Colors.black,
                controller: controller,
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ColorConstants.primaryColor)),
                
                  labelText: label,
                  labelStyle: const TextStyle(color: ColorConstants.primaryColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: ColorConstants.primaryColor),
                  ),
                ),
                validator: validation,
              )
            ],
          )
        : TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: keyboardType,
            onTapOutside: (event) =>
                FocusManager.instance.primaryFocus!.unfocus(),
            cursorColor: Colors.black,
            controller: controller,
         
            decoration: InputDecoration(
              suffix: wantSuffix ? suffIcon : null,
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: ColorConstants.primaryColor)),
         
              labelText: label,
              labelStyle: const TextStyle(color: ColorConstants.primaryColor),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: ColorConstants.primaryColor),
              ),
              contentPadding: const EdgeInsets.symmetric(
                  vertical: 10, horizontal: 15), 
            ),
            validator: validation,
          );
  }
}
