import 'package:flutter/material.dart';

import '../../../core/app_colors.dart';

import '../../../core/custom_input_fields.dart';
import '../../../core/custom_tool_tip.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  sectionTitle(BuildContext context, String title) {
    return Text(title, style: Theme.of(context).textTheme.titleMedium);
  }

  final _formKey = GlobalKey<FormState>();

  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController landmark = TextEditingController();
  final TextEditingController pincode = TextEditingController();

  String? gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text("Profile", style: Theme.of(context).textTheme.titleLarge),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// PERSONAL INFO
                  sectionTitle(context, "Personal Information"),

                  const SizedBox(height: 15),

                  CustomInputField(
                    controller: firstName,
                    hint: "First Name",
                    validator:
                        (value) => value!.isEmpty ? "Enter first name" : null,
                  ),

                  const SizedBox(height: 15),

                  CustomInputField(
                    controller: lastName,
                    hint: "Last Name",
                    validator:
                        (value) => value!.isEmpty ? "Enter last name" : null,
                  ),

                  const SizedBox(height: 15),

                  CustomInputField(
                    controller: email,
                    hint: "Email",
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) return "Enter email";
                      if (!value.contains("@")) return "Enter valid email";
                      return null;
                    },
                  ),

                  const SizedBox(height: 15),

                  /* CustomDropdownField(
                    value: gender,
                    hint: "Select Gender",
                    items: const ["Male", "Female"],
                    onChanged: (val) => setState(() => gender = val),
                  ),*/
                  const SizedBox(height: 30),

                  /// ADDRESS SECTION
                  Row(
                    children: [
                      sectionTitle(context, "Address"),
                      const SizedBox(width: 6),
                      const CustomInfoTooltip(
                        message:
                            "This address will be used as pickup and delivery address.",
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  CustomInputField(
                    controller: address,
                    hint: "Full Address (max 20 words)",
                    //maxLines: 3,
                    validator: (value) {
                      if (value!.isEmpty) return "Enter address";
                      if (value.split(" ").length > 10) {
                        return "Maximum 10 words allowed";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 15),

                  CustomInputField(
                    controller: landmark,
                    hint: "Nearby / Landmark",
                  ),

                  const SizedBox(height: 15),

                  CustomInputField(
                    controller: pincode,
                    hint: "Pincode",
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.length != 6) {
                        return "Pincode must be exactly 6 digits";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Center(
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: -2,
                          color: AppColors.boxShadowPink,
                        ),
                      ],
                    ),
                    child: TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Call API here
                          print("Profile Updated");
                        }
                      },
                      child: Text(
                        "Update Profile ",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
