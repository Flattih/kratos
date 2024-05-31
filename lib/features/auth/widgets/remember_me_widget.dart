import 'package:flutter/material.dart';
import 'package:kratos/core/theme/app_colors.dart';

class RememberMeWidget extends StatelessWidget {
  const RememberMeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: SizedBox(
                  height: 24,
                  width: 24,
                  child: Checkbox(
                    value: true,
                    onChanged: (bool? value) {},
                  ),
                ),
              ),
              const Text(
                'Remember me',
                style: TextStyle(color: AppColors.greyColor, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Forgot password ?',
              style: TextStyle(color: AppColors.secondary.withOpacity(0.9), fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
