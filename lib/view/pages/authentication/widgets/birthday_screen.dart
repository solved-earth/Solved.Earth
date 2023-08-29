// ignore_for_file: empty_constructor_bodies

import 'package:app/view_models/signup_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/constants/sizes.dart';
import 'package:app/constants/gaps.dart';
import 'package:app/view/pages/authentication/widgets/form_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BirthdayScreen extends ConsumerStatefulWidget {
  const BirthdayScreen({super.key});

  @override
  ConsumerState<BirthdayScreen> createState() => _BirthdayScreenState();
}

// Define the state for the BirthdayScreen widget
class _BirthdayScreenState extends ConsumerState<BirthdayScreen> {
  final TextEditingController _birthdayController = TextEditingController();

  DateTime initialDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _setTextFieldDate(initialDate);
  }

  @override
  void dispose() {
    _birthdayController.dispose();
    super.dispose();
  }

  // Handle the action when the "다음" button is tapped
  void _onNextTap() async {
    final state = ref.read(signUpForm.notifier).state;
    ref.read(signUpForm.notifier).state = {
      "birthday": _birthdayController.text,
      ...state
    };
    await ref.read(signUpProvider.notifier).signUp(context);
  }

  // Set the date in the text field
  void _setTextFieldDate(DateTime date) {
    final textDate = date.toString().split(" ").first;
    _birthdayController.value = TextEditingValue(text: textDate);
  }

  @override
  Widget build(BuildContext context) {
    DateTime maximumDate =
        DateTime(initialDate.year - 12, initialDate.month, initialDate.day);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "가입하기",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v40,
            const Text(
              "생일이 언제이신가요?",
              style: TextStyle(
                fontSize: Sizes.size24,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gaps.v8,
            const Text(
              "생일은 유저 구분 목적으로만 사용됩니다.",
              style: TextStyle(
                fontSize: Sizes.size16,
                color: Colors.black54,
              ),
            ),
            Gaps.v16,
            TextField(
              enabled: false,
              controller: _birthdayController,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
              cursorColor: Theme.of(context).primaryColor,
            ),
            Gaps.v16,
            GestureDetector(
              onTap: _onNextTap,
              child: FormButton(
                disabled: ref.watch(signUpProvider).isLoading,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 300,
          child: CupertinoDatePicker(
            maximumDate: maximumDate,
            initialDateTime: maximumDate,
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: _setTextFieldDate,
          ),
        ),
      ),
    );
  }
}
