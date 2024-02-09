import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String b2cSellerAppId = "241de56a-24ab-4a50-b74b-1aed39d4a913";
  String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIyNDFkZTU2YS0yNGFiLTRhNTAtYjc0Yi0xYWVkMzlkNGE5MTMiLCJleHAiOjE3MjUxNjA4MjR9.d6jeeiCMiH8rFpY711dDCNN5AblXLejdEjnf4xXxqgM";
  String companyOrIndividualName =
      "1DiJ3dSRk/59TZ7dr6/vVcsAEJ6pCq78jgT9K7SXbRLnedWWYOup8ZSH2Vxttxk3WWZuTK+dcy9HXflrSu4aRw==";
  String gstinOrPanTanAnyGovtId =
      "kznJcYmNbZSp/t0VWouV2LTIj01u0iUquXnqTGDb88bTFA3KA3sGd0xgBaIfNbKZMU7mLVA8L7qGQZti9VT+/Q==";
  String city = "Mumbai";
  String state = "Maharashtra";
  String countryNameOrIsnCode = "India";
  String pincode = "456543";
  String contactPersonName =
      "LJ6oKX0E8TkYBZ735+u8mhnKRmre0u1qT49ajfitf3REZZDKY5yg3iU8110p7ZnsT+Dp2ki3K/j6UIKZT4B46Q==";
  String contactPersonMobile =
      "KVqKh3JBE8ptnxlKC1GSxdqeHsiy9gBCippxB0mZQDV9HFLKGMZMUbxbTEHSccnOZ8/a8f9XL0iGzh/1OOVMxA==";
  String operation = "procurement";
  String redirectUrl = "https://ondcseller.rapidor.co/";
  String localhost = "";
  bool preprod = true;
  _onSubmit() async {
    if (b2cSellerAppId.isEmpty ||
        token.isEmpty ||
        companyOrIndividualName.isEmpty ||
        gstinOrPanTanAnyGovtId.isEmpty ||
        city.isEmpty ||
        state.isEmpty ||
        countryNameOrIsnCode.isEmpty ||
        pincode.isEmpty ||
        contactPersonName.isEmpty ||
        contactPersonMobile.isEmpty ||
        operation.isEmpty ||
        redirectUrl.isEmpty) {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          message: "Please fill in all the required fields",
        ),
      );

      return;
    }
    String fullUrl = "";
    localhost.isNotEmpty
        ? fullUrl = "http://localhost:$localhost/v1/partner"
        : "";
    if (fullUrl.isEmpty) {
      if (preprod) {
        fullUrl = "https://ondcseller.rapidor.co/v1/partner";
      } else {
        fullUrl = "https://placeorder.rapidor.co/v1/partner";
      }
    }

    Uri uri = Uri.parse(fullUrl);

// Add query parameters directly to the URI
    preprod = !preprod;
    uri = uri.replace(queryParameters: {
      "b2c-seller-app-id": b2cSellerAppId,
      "token": token,
      "company-or-individual-name": companyOrIndividualName,
      "gstin-or-pan-tan-any-govt-id": gstinOrPanTanAnyGovtId,
      "city": city,
      "state": state,
      "country-name-or-isn-code": countryNameOrIsnCode,
      "pincodes": pincode,
      "contact-person-name": contactPersonName,
      "contact-person-mobile": contactPersonMobile,
      "operation": operation,
      "redirect_url": redirectUrl,
      "isProd": preprod.toString()
    });

    debugPrint("Z1===>$uri");
    _launchUrl(uri);
  }

  Future<void> _launchUrl(Uri uri) async {
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Integration Testing'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10),
        child: Center(
          child: SizedBox(
            width: 500,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Text("PreProd"),
                      Switch(
                        value: preprod,
                        onChanged: (value) {
                          setState(() {
                            preprod = value;
                          });
                        },
                      ),
                    ],
                  ),
                  TextFieldWidget(
                    labelText: 'Local Host',
                    hintText: 'Local Host',
                    value: "",
                    onChanged: (value) {
                      setState(() {
                        localhost = value;
                      });
                    },
                  ),
                  TextFieldWidget(
                    labelText: 'B2C Seller App ID',
                    hintText: 'Enter B2C Seller App ID',
                    value: b2cSellerAppId,
                    onChanged: (value) {
                      setState(() {
                        b2cSellerAppId = value;
                      });
                    },
                  ),
                  TextFieldWidget(
                    labelText: 'Token',
                    hintText: 'Enter Token',
                    value: token,
                    onChanged: (value) {
                      setState(() {
                        token = value;
                      });
                    },
                  ),
                  TextFieldWidget(
                    labelText: 'Company or Individual Name',
                    hintText: 'Enter Name',
                    value: companyOrIndividualName,
                    onChanged: (value) {
                      setState(() {
                        companyOrIndividualName = value;
                      });
                    },
                  ),
                  TextFieldWidget(
                    labelText: 'GSTIN or PAN/TAN/Any Govt ID',
                    hintText: 'Enter ID',
                    value: gstinOrPanTanAnyGovtId,
                    onChanged: (value) {
                      setState(() {
                        gstinOrPanTanAnyGovtId = value;
                      });
                    },
                  ),
                  TextFieldWidget(
                    labelText: 'City',
                    hintText: 'Enter City',
                    value: city,
                    onChanged: (value) {
                      setState(() {
                        city = value;
                      });
                    },
                  ),
                  TextFieldWidget(
                    labelText: 'State',
                    hintText: 'Enter State',
                    value: city,
                    onChanged: (value) {
                      setState(() {
                        state = value;
                      });
                    },
                  ),
                  TextFieldWidget(
                    labelText: 'Country Name or ISN Code',
                    hintText: 'Enter Country Name or ISN Code',
                    value: countryNameOrIsnCode,
                    onChanged: (value) {
                      setState(() {
                        countryNameOrIsnCode = value;
                      });
                    },
                  ),
                  TextFieldWidget(
                    labelText: 'Pin Codes',
                    hintText: 'Enter Pin Codes',
                    value: pincode, // Assuming pincodes is a List<String>
                    onChanged: (value) {
                      setState(() {
                        pincode = value; // Assuming pincodes is a List<String>
                      });
                    },
                  ),
                  TextFieldWidget(
                    labelText: 'Contact Person Name',
                    hintText: 'Enter Contact Person Name',
                    value: contactPersonName,
                    onChanged: (value) {
                      setState(() {
                        contactPersonName = value;
                      });
                    },
                  ),
                  TextFieldWidget(
                    labelText: 'Contact Person Mobile',
                    hintText: 'Enter Contact Person Mobile',
                    value: contactPersonMobile,
                    onChanged: (value) {
                      setState(() {
                        contactPersonMobile = value;
                      });
                    },
                  ),
                  TextFieldWidget(
                    labelText: 'Operation',
                    hintText: 'Enter Operation',
                    value: operation,
                    onChanged: (value) {
                      setState(() {
                        operation = value;
                      });
                    },
                  ),
                  TextFieldWidget(
                    labelText: 'Redirect URL',
                    hintText: 'Enter Redirect URL',
                    value: redirectUrl,
                    onChanged: (value) {
                      setState(() {
                        redirectUrl = value;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Background color
                      foregroundColor: Colors.white, // Text color
                      elevation: 5, // Elevation (shadow)
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // Border radius
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10), // Padding
                    ),
                    onPressed: () {
                      _onSubmit();
                    },
                    child: const Text("Submit"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  final String labelText;
  final String hintText;
  final String value;
  final Function(String) onChanged;

  const TextFieldWidget({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          initialValue: value,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            labelStyle: const TextStyle(color: Colors.black),
            hintStyle: const TextStyle(color: Colors.grey),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
          onChanged: onChanged,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
