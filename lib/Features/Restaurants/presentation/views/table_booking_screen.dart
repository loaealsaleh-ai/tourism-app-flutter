import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourismapp/Features/Restaurants/presentation/widgets/booking_bottom.dart';
import 'package:tourismapp/core/constants/app_constants.dart';

import '../../../../app/router/app_router.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../widgets/booking_textField.dart';

class TableBookingScreen extends StatefulWidget {
  const TableBookingScreen({super.key});

  @override
  State<TableBookingScreen> createState() => _TableBookingScreenState();
}

class _TableBookingScreenState extends State<TableBookingScreen> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final guestsController = TextEditingController();

  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String? mealType;

  String get formattedDate {
    if (selectedDate == null) {
      return "Choose Date";
    }
    return "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}";
  }

  String get formattedTime {
    if (selectedTime == null) {
      return "Select Time";
    }
    return selectedTime!.format(context);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    guestsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.07,
            vertical: 18,
          ),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    context.go(AppRouter.routRestaurantDetails);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_rounded,
                    color: kPrimaryColor,
                  ),
                ),

                Center(
                  child: Text(
                    "Table Booking",
                    style: TextStyle(
                      fontSize: width * 0.065,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                Text("Booking Details", style: AppTextStyles.title),
                const SizedBox(height: 4),
                Text(
                  "This info is taken from your profile, you can update this",
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                ),
                const SizedBox(height: 18),

                Text("Full Name", style: AppTextStyles.label),
                const SizedBox(height: 10),
                BookingTextField(
                  icon: Icons.person_outline,
                  hint: "Full Name",
                  controller: nameController,
                  validation: (data) {
                    if (data == null || data.trim().isEmpty) {
                      return "please enter your name";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 18),

                Text("Email", style: AppTextStyles.label),
                const SizedBox(height: 10),
                BookingTextField(
                  icon: Icons.email_outlined,
                  hint: "Email",
                  controller: emailController,
                  validation: (data) {
                    if (data == null || data.trim().isEmpty) {
                      return "please enter your Email";
                    }
                    if (!data.contains('@')) {
                      return "please enter a valid Email";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 18),

                Text("Date", style: AppTextStyles.label),
                const SizedBox(height: 10),
                BookingTextField(
                  icon: Icons.calendar_month_outlined,
                  hint: formattedDate,
                  readOnly: true,
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: selectedDate ?? DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                      builder: (context, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: const ColorScheme.light(
                              primary: kPrimaryColor,
                              onPrimary: Colors.white,
                              onSurface: kPrimaryColor,
                            ),
                            textButtonTheme: TextButtonThemeData(
                              style: TextButton.styleFrom(
                                foregroundColor: kPrimaryColor,
                              ),
                            ),
                          ),
                          child: child!,
                        );
                      },
                    );
                    if (date != null) {
                      setState(() {
                        selectedDate = date;
                      });
                    }
                  },
                ),
                const SizedBox(height: 18),

                Text("Time", style: AppTextStyles.label),
                const SizedBox(height: 10),
                BookingTextField(
                  icon: Icons.access_time_outlined,
                  hint: formattedTime,
                  readOnly: true,
                  onTap: () async {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: selectedTime ?? TimeOfDay.now(),
                      builder: (context, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: const ColorScheme.light(
                              primary: kPrimaryColor,
                              onPrimary: Colors.white,
                              onSurface: kPrimaryColor,
                            ),
                            timePickerTheme: const TimePickerThemeData(
                              dialHandColor: kPrimaryColor,
                              dialBackgroundColor: Color(0xffDCEEEB),
                              hourMinuteColor: Color(0xffDCEEEB),
                              hourMinuteTextColor: kPrimaryColor,
                              dayPeriodColor: Color(0xffDCEEEB),
                              dayPeriodTextColor: kPrimaryColor,
                              entryModeIconColor: kPrimaryColor,
                            ),
                            textButtonTheme: TextButtonThemeData(
                              style: TextButton.styleFrom(
                                foregroundColor: kPrimaryColor,
                              ),
                            ),
                          ),
                          child: child!,
                        );
                      },
                    );
                    if (time != null) {
                      setState(() {
                        selectedTime = time;
                      });
                    }
                  },
                ),
                const SizedBox(height: 18),

                Text("Number of Guests", style: AppTextStyles.label),
                const SizedBox(height: 10),
                BookingTextField(
                  icon: Icons.groups_outlined,
                  hint: "e.g, 4 People",
                  controller: guestsController,
                  validation: (data) {
                    if (data == null || data.trim().isEmpty) {
                      return "please enter number of guests";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 18),

                Text("Meal Type", style: AppTextStyles.label),
                const SizedBox(height: 10),
                _MealTypeDropdown(
                  value: mealType,
                  onChanged: (value) {
                    setState(() {
                      mealType = value;
                    });
                  },
                ),
                const SizedBox(height: 24),

                Text("Pay With", style: AppTextStyles.title),
                const SizedBox(height: 14),
                const _PaymentCard(),
                const SizedBox(height: 24),

                Text(
                  "Payment Details",
                  style: TextStyle(
                    fontSize: width * 0.055,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 14),
                const _PaymentDetails(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: BookingBottom(
          label: "Confirm Reservation",
          onTap: () {
            if (selectedDate == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Please select booking date")),
              );
              return;
            }
            if (selectedTime == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Please select booking time")),
              );
              return;
            }
            if (mealType == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Please select a meal type")),
              );
              return;
            }
            if (formKey.currentState!.validate()) {
              GoRouter.of(context).go(AppRouter.routSuccessScreen);
            }
          },
        ),
      ),
    );
  }
}

class _MealTypeDropdown extends StatelessWidget {
  final String? value;
  final ValueChanged<String?> onChanged;

  const _MealTypeDropdown({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: kPrimaryColor.withValues(alpha: 0.3)),
        borderRadius: BorderRadius.circular(14),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down, color: kPrimaryColor),
          hint: const Row(
            children: [
              Icon(Icons.restaurant_menu_outlined, color: kPrimaryColor, size: 20),
              SizedBox(width: 10),
              Text("Select", style: TextStyle(color: Colors.grey)),
            ],
          ),
          selectedItemBuilder: (context) {
            return const ["Breakfast", "Lunch", "Dinner"].map((type) {
              return Row(
                children: [
                  const Icon(Icons.restaurant_menu_outlined, color: kPrimaryColor, size: 20),
                  const SizedBox(width: 10),
                  Text(type, style: const TextStyle(color: kPrimaryColor)),
                ],
              );
            }).toList();
          },
          items: const [
            DropdownMenuItem(value: "Breakfast", child: Text("Breakfast")),
            DropdownMenuItem(value: "Lunch", child: Text("Lunch")),
            DropdownMenuItem(value: "Dinner", child: Text("Dinner")),
          ],
          onChanged: onChanged,
        ),
      ),
    );
  }
}

class _PaymentCard extends StatelessWidget {
  const _PaymentCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.credit_card,
            color: kPrimaryColor,
          ),
          const SizedBox(width: 12),
          const Text(
            "Credit Card",
            style: TextStyle(fontSize: 17),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Edit",
              style: TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PaymentDetails extends StatelessWidget {
  const _PaymentDetails();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xffDCEEEB),
        borderRadius: BorderRadius.circular(18),
      ),
      child: const Column(
        children: [
          _PriceRow(title: "Total: 2 Table", price: "000\$"),
          SizedBox(height: 12),
          _PriceRow(title: "Service Fee", price: "0\$"),
          SizedBox(height: 12),
          Divider(),
          SizedBox(height: 12),
          _PriceRow(
            title: "Total Payment",
            price: "000\$",
            isTotal: true,
          ),
        ],
      ),
    );
  }
}

class _PriceRow extends StatelessWidget {
  final String title;
  final String price;
  final bool isTotal;

  const _PriceRow({
    required this.title,
    required this.price,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: isTotal ? 18 : 16,
            fontWeight: isTotal ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
        const Spacer(),
        Text(
          price,
          style: TextStyle(
            fontSize: isTotal ? 18 : 16,
            fontWeight: isTotal ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ],
    );
  }
}