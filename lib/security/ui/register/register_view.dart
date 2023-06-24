import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend_recruitech_flutter_v2/security/data/remote/services/auth_service.dart';
import 'package:intl/intl.dart';
import 'package:frontend_recruitech_flutter_v2/security/data/remote/services/location_service.dart';

import '../../../shared/ui/theme/text_styles.dart';
import '../../../shared/ui/widgets/body_medium.dart';
import '../../../shared/ui/widgets/custom_button.dart';
import '../../../shared/ui/widgets/form_field.dart';
import '../../../shared/ui/widgets/title_large.dart';
import '../../../shared/ui/widgets/title_small.dart';
import '../../../shared/utils/validator.dart';
import '../../data/remote/models/location.dart';
import '../login/login_view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController? firstNameController;
  TextEditingController? lastNameController;
  TextEditingController? emailController;
  TextEditingController? passwordController;
  TextEditingController? dateController;

  LocationService? _locationService;
  AuthService? _authService;

  Validator? validator;
  Location? location;
  String? gender;
  List<Location>? _locations;
  bool _hidePassword = true;

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    dateController = TextEditingController();

    _locationService = LocationService();
    _authService = AuthService();
    validator = Validator();

    initialize();
  }

  @override
  void dispose() {
    super.dispose();
    firstNameController?.dispose();
    lastNameController?.dispose();
    emailController?.dispose();
    passwordController?.dispose();
    validator;
  }

  void initialize() async {
    _locations = List.empty();
    _locations = await _locationService?.fetchAllLocations();
    setState(() {
      _locations = _locations;
    });
  }

  Future<void> registerUsers() async {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Loading data...'),
        ),
      );

      Map<String, dynamic> userData = {
        "firstName": firstNameController!.text,
        "lastName": lastNameController!.text,
        "birthDate": dateController!.text,
        "about": "",
        "photoUrl": "",
        "gender": gender!,
        "location": {"name": location!.city},
        "email": emailController!.text,
        "password": passwordController!.text,
      };

      dynamic res = await _authService?.registerUser(userData);

      if (context.mounted) ScaffoldMessenger.of(context).hideCurrentSnackBar();

      if (res == "success") {
        if (context.mounted) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginView()));
        }
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('ta mal mano u.u'),
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Container(
            padding: const EdgeInsets.only(
              right: 24.0,
              left: 24.0,
              bottom: 24.0,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const TitleLarge(
                    text: "Sign Up",
                  ),
                  const BodyMedium(
                    text: "Create a account for your first job",
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  const TitleSmall(
                    text: "Personal information",
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  CustomTextFormField(
                    controller: firstNameController!,
                    validator: validator!,
                    hintText: "First name",
                    icon: Icons.person,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  CustomTextFormField(
                    controller: lastNameController!,
                    validator: validator!,
                    hintText: "Last name",
                    icon: Icons.person,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width * 0.45,
                        child: TextFormField(
                          controller: dateController,
                          validator: (value) =>
                              Validator.validateDate(value ?? ""),
                          readOnly: true,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Birthdate",
                            hintStyle: CustomTextStyle.inputPlaceHolder,
                            prefixIcon: Icon(Icons.calendar_today),
                            filled: true,
                            fillColor: Color(0xFFF8FAFB),
                            prefixIconColor: Color(0xFF8D8D8D),
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 16.0),
                          ),
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(DateTime.now().year - 100),
                              lastDate: DateTime(DateTime.now().year + 1),
                            );
                            if (pickedDate != null) {
                              String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);

                              setState(() {
                                dateController!.text = formattedDate;
                              });
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.4,
                        child: DropdownSearch<String>(
                          validator: (value) =>
                              Validator.validateDate(value ?? ""),
                          items: ["Male", "Female"],
                          onChanged: (value) {
                            setState(() {
                              gender = value;
                            });
                          },
                          popupProps: const PopupProps.menu(
                            fit: FlexFit.loose,
                            menuProps: MenuProps(
                              elevation: 1,
                              backgroundColor: Colors.white,
                            ),
                          ),
                          dropdownDecoratorProps: const DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Gender",
                              hintStyle: CustomTextStyle.inputPlaceHolder,
                              prefixIcon: Icon(Icons.location_on),
                              filled: true,
                              fillColor: Color(0xFFF8FAFB),
                              prefixIconColor: Color(0xFF8D8D8D),
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 16.0),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  DropdownSearch<Location>(
                    validator: (value) =>
                        Validator.validateLocation(value?.location ?? ""),
                    onChanged: (value) {
                      setState(() {
                        location = value;
                      });
                    },
                    items: _locations!,
                    itemAsString: (Location u) => u.location,
                    popupProps: const PopupProps.menu(
                      fit: FlexFit.loose,
                      menuProps: MenuProps(
                        elevation: 1,
                        backgroundColor: Colors.white,
                      ),
                    ),
                    dropdownDecoratorProps: const DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Location",
                        hintStyle: CustomTextStyle.inputPlaceHolder,
                        prefixIcon: Icon(Icons.location_on),
                        filled: true,
                        fillColor: Color(0xFFF8FAFB),
                        prefixIconColor: Color(0xFF8D8D8D),
                        contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  const TitleSmall(
                    text: "Account information",
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  CustomTextFormField(
                    controller: emailController!,
                    validator: validator!,
                    hintText: "Email",
                    icon: Icons.email,
                  ),
                  const SizedBox(height: 8.0),
                  TextFormField(
                    controller: passwordController,
                    validator: (value) =>
                        Validator.validatePassword(value ?? ""),
                    obscureText: _hidePassword,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password",
                      hintStyle: CustomTextStyle.inputPlaceHolder,
                      filled: true,
                      fillColor: Color(0xFFF8FAFB),
                      prefixIcon: const Icon(Icons.lock),
                      prefixIconColor: const Color(0xFF8D8D8D),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _hidePassword = !_hidePassword;
                          });
                        },
                        child: Icon(
                          _hidePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                      suffixIconColor: Color(0xFF8D8D8D),
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    cursorColor: Colors.indigo,
                  ),
                  const SizedBox(height: 12.0),
                  CustomButton(
                    onPressed: registerUsers,
                    text: "Sign up",
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
