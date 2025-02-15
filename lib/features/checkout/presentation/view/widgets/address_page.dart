import 'package:e_commerce_app/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:e_commerce_app/features/checkout/presentation/view/widgets/save_address_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          CustomTextFormField(
            hintText: 'الاسم كامل',
            textInputType: TextInputType.text,
            onSaved: (value) {
              context.read<OrderEntity>().addressEntity.name = value!;
            },
          ),
          CustomTextFormField(
            hintText: 'البريد الإلكتروني',
            textInputType: TextInputType.emailAddress,
            onSaved: (value) {
              context.read<OrderEntity>().addressEntity.email = value!;
            },
          ),
          CustomTextFormField(
            hintText: 'العنوان',
            textInputType: TextInputType.text,
            onSaved: (value) {
              context.read<OrderEntity>().addressEntity.address = value!;
            },
          ),
          CustomTextFormField(
            hintText: 'رقم الهاتف',
            textInputType: TextInputType.number,
            onSaved: (value) {
              context.read<OrderEntity>().addressEntity.phone = value!;
            },
          ),
          CustomTextFormField(
            hintText: 'المدينه',
            textInputType: TextInputType.text,
            onSaved: (value) {
              context.read<OrderEntity>().addressEntity.city = value!;
            },
          ),
          CustomTextFormField(
            hintText: 'رقم الطابق , رقم الشقه ..',
            textInputType: TextInputType.text,
            onSaved: (value) {
              context.read<OrderEntity>().addressEntity.addressDetails = value!;
            },
          ),
          const SaveAddressSwitch(),
        ],
      ),
    );
  }
}
