import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({super.key});

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _obscureText1 = true;
  bool _obscureText2 = true;
  bool _obscureText3 = true;

  void _toggleOldPasswordVisibility() {
    setState(() {
      _obscureText1 = !_obscureText1;
    });
  }

  void _toggleNewPasswordVisibility() {
    setState(() {
      _obscureText2 = !_obscureText2;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _obscureText3 = !_obscureText3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _backButton(context),
              const SizedBox(height: 20),
              _contentPage(),
              const Spacer(),
              _updateButton(),
            ],
          ),
        ),
      ),
    );
  }

  IconButton _backButton(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.all(0),
      alignment: Alignment.centerLeft,
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(PhosphorIconsBold.arrowLeft),
    );
  }

  Column _contentPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Update Password',
          style: GoogleFonts.dmSans(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 32),
        Text(
          'Old Password',
          style: GoogleFonts.dmSans(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: -1,
                blurRadius: 5,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: TextField(
            obscureText: _obscureText1,
            controller: _oldPasswordController,
            cursorColor: Colors.black,
            style: GoogleFonts.dmSans(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              hintText: 'Enter your old password',
              hintStyle: GoogleFonts.dmSans(
                color: Colors.grey,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText2 ? Icons.visibility_off : Icons.visibility,
                  color: Colors.black,
                ),
                onPressed: _toggleOldPasswordVisibility,
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        Text(
          'New Password',
          style: GoogleFonts.dmSans(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: -1,
                blurRadius: 5,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: TextField(
            obscureText: _obscureText2,
            controller: _newPasswordController,
            cursorColor: Colors.black,
            style: GoogleFonts.dmSans(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              hintText: 'Enter your new password',
              hintStyle: GoogleFonts.dmSans(
                color: Colors.grey,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText2 ? Icons.visibility_off : Icons.visibility,
                  color: Colors.black,
                ),
                onPressed: _toggleNewPasswordVisibility,
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        Text(
          'Confirm Password',
          style: GoogleFonts.dmSans(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: -1,
                blurRadius: 5,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: TextField(
            obscureText: _obscureText3,
            controller: _confirmPasswordController,
            cursorColor: Colors.black,
            style: GoogleFonts.dmSans(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              hintText: 'Confirm your new password',
              hintStyle: GoogleFonts.dmSans(
                color: Colors.grey,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText2 ? Icons.visibility_off : Icons.visibility,
                  color: Colors.black,
                ),
                onPressed: _toggleConfirmPasswordVisibility,
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Container _updateButton() {
    return Container(
      height: 62,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF28A77D),
            Color(0xFF2BD07A),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        onPressed: () {},
        child: const Text(
          'UPDATE',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
