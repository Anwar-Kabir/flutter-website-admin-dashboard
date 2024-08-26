import 'package:dashboard/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppTextForm extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String assetPath;
  final String? assetPathSuffix;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final void Function()? onTap;
  final bool obscureText;
  final Widget? suffixIcon;
  final int? maxLines;
  final Color? fillColor;
  final Color? hoverColor;

  
  const AppTextForm({
    Key? key,
    required this.controller,
    required this.assetPath,
    required this.hintText,
    this.validator,
    this.keyboardType,
    this.assetPathSuffix,
    this.onTap,
    this.obscureText = false,
    this.suffixIcon,
    bool? readOnly,
    this.maxLines,
    this.fillColor = Colors.white,
    this.hoverColor = Colors.white12, // Default hover color
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: obscureText,
      maxLines: maxLines,
      inputFormatters: keyboardType == TextInputType.number ? [FilteringTextInputFormatter.digitsOnly] : null,
      decoration: InputDecoration(
        filled: true,
        //focusColor: Colors.white,
        fillColor: fillColor ?? Colors.white, // Use fillColor if provided, otherwise default to Colors.white
        hoverColor: hoverColor ?? Colors.white12,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            assetPath,
            height: 16,
            width: 20,
            fit: BoxFit.none,
          ),
        ),
        // Check if suffixIcon is provided, otherwise fall back to assetPathSuffix
        suffixIcon: 
        suffixIcon ??
            (assetPathSuffix != null
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: onTap,
                      child: SvgPicture.asset(
                        assetPathSuffix!,
                        width: 17,
                        height: 11,
                        fit: BoxFit.none,
                        colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                      ),
                    ),
                  )
                : null),
         
        hintText: hintText,
      ),
      readOnly: onTap != null, // Make the field read-only if onTap is provided
       //readOnly: isPdfPicker || onTap != null, 
      onTap: onTap, // Trigger the onTap function if provided
    );
  }
}




 



 