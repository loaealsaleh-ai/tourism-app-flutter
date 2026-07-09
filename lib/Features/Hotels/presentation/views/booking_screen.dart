import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourismapp/Features/Hotels/presentation/widgets/booking_bottom.dart';
import 'package:tourismapp/Features/Hotels/presentation/widgets/booking_header.dart';
import 'package:tourismapp/core/constants/app_constants.dart';

import '../../../../app/router/app_router.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../widgets/booking_textField.dart';
import '../widgets/custom_date_picker.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final formKey=GlobalKey<FormState>();
  final nameController=TextEditingController();
  final emailController=TextEditingController();

  DateTimeRange? selectedDateRange;
  String get formattedDate{
    if(selectedDateRange==null){
      return "Check Date";
    }
    final start=selectedDateRange!.start;
    final end =selectedDateRange!.end;
    return "${start.day}/${start.month}/${start.year} - ${end.day}/${end.month}/${end.year}";
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
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
                IconButton(onPressed: (){
                  context.go(AppRouter.routRoomDetails);
                }, icon: Icon(Icons.arrow_back_ios_rounded,color: kPrimaryColor,)),
                BookingHeader(),
                const SizedBox(height: 24),
                Text("Date",style: AppTextStyles.label,),
                const SizedBox(height: 10),
                BookingTextField(
                  icon: Icons.calendar_month_outlined,
                  hint: formattedDate,
                  readOnly: true,
                  onTap: () async {
                    final date = await showCustomDateRangePicker(context);
                    if (date != null) {
                      setState(() {
                        selectedDateRange = date;
                      });
                    }
                  },
                ),

                const SizedBox(height: 18),

                Text("Full Name",style: AppTextStyles.label,),
                const SizedBox(height: 10),
                BookingTextField(
                  icon: Icons.person_outline,
                  hint: "Your Name",
                  controller: nameController,
                  validation: (data){
                    if(data==null||data.trim().isEmpty){
                      return "please enter your name ";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 18),
                Text("Email",style: AppTextStyles.label,),
                const SizedBox(height: 10),

                BookingTextField(
                  icon: Icons.email_outlined,
                  hint: "Your Email",
                  controller: emailController,
                  validation: (data){
                    if(data==null || data.trim().isEmpty){
                      return "please enter your Email";
                    }
                    if(!data.contains('@')){
                      return "please enter a valid Email";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 24),

                Text(
                  "Pay With",
                  style: AppTextStyles.title
                ),

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
        child:
        BookingBottom(
          onTap: (){
            if(selectedDateRange==null){
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Please select booking date")),
              );
              return;
            }
            if(formKey.currentState!.validate()){
            GoRouter.of(context).go(AppRouter.routSuccessScreen);}
          },
        )
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
      child: const Row(
        children: [
          Icon(
            Icons.credit_card,
            color: kPrimaryColor,
          ),
          SizedBox(width: 12),
          Text(
            "Credit Card",
            style: TextStyle(fontSize: 17),
          ),
          Spacer(),
          Icon(
            Icons.check_circle,
            color:kPrimaryColor,
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
          _PriceRow(title: "Price", price: "000\$"),
          SizedBox(height: 12),
          _PriceRow(title: "Service Fee", price: "000\$"),
          SizedBox(height: 12),
          Divider(),
          SizedBox(height: 12),
          _PriceRow(
            title: "Total",
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