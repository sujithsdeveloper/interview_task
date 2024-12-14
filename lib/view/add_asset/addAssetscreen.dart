import 'package:flutter/material.dart';
import 'package:interview_task/utils/constants/color_constants.dart';
import 'package:interview_task/utils/functions/validations.dart';
import 'package:interview_task/view/add_asset/addAssetController.dart';
import 'package:interview_task/widgets/buttonWidget.dart';
import 'package:interview_task/widgets/textfeildWidget.dart';
import 'package:provider/provider.dart';

class Addassetview extends StatelessWidget {
  const Addassetview(
      {super.key,
      this.isEdit = false,
      this.index,
      this.Name,
      this.Description,
      this.type});

  final bool isEdit;
  final int? index;
  final String? type;
  final String? Name;
  final String? Description;

  @override
  Widget build(BuildContext context) {
    final assetTypeController = TextEditingController();
    final assetNameController = TextEditingController();
    final descriptionController = TextEditingController();
    final proWatch = context.watch<Addassetcontroller>();
    final proRead = context.read<Addassetcontroller>();

    final _formKey = GlobalKey<FormState>();

    if (isEdit) {
      assetNameController.text = Name!;
      assetTypeController.text = type!;
      descriptionController.text = Description!;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.secondaryColor,
        title: Text(isEdit ? 'Edit Asset' : 'Add Asset'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextfeildWidget(
                controller: assetTypeController,
                label: 'Eg.. Motor, vehicle, laptop',
                wantHeading: true,
                heading: 'Asset Type',
                validation: (p0) => Validations.textvalidation(p0),
              ),
              SizedBox(height: 20),
              TextfeildWidget(
                controller: assetNameController,
                label: 'Eg.. Acer laptop',
                wantHeading: true,
                heading: 'Asset Name',
                validation: (p0) => Validations.textvalidation(p0),
              ),
              SizedBox(height: 20),
              TextfeildWidget(
                controller: descriptionController,
                label: 'Eg.. a used Acer laptop',
                wantHeading: true,
                heading: 'Description',
                validation: (p0) => Validations.textvalidation(p0),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Is Available',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              DropdownButtonFormField(
                hint: Text('Select one'),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                ),
                elevation: 3,
                items: const [
                  DropdownMenuItem(value: 'Yes', child: Text('Yes')),
                  DropdownMenuItem(value: 'No', child: Text('No')),
                ],
                onChanged: (value) {},
                validator: (value) {
                  if (value == null) {
                    return 'Please select an option';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: ButtonWidget(
                  label: isEdit ? 'Save' : 'Add',
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      Map<String, dynamic> assetData = {
                        'assetType': assetTypeController.text,
                        'assetName': assetNameController.text,
                        'assetDescription': descriptionController.text,
                      };

                      if (isEdit) {
                        proRead.updateData(index: index!, newData: assetData);
                      } else {
                        proRead.addData(data: assetData);
                      }
                      Navigator.pop(context);
                    }
                  },
                  width: 90,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
