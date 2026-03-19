import 'package:flutter/material.dart';
import 'package:think_and_wash_admin/core/app_colors.dart';
import 'package:think_and_wash_admin/features/route/app_routes.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: AppColors.background,
      title: Text(
        "Think & Wash Admin",
        style: Theme.of(context).textTheme.titleLarge,
      ),
      leading: InkWell(
        onTap: () => Navigator.pushNamed(context, AppRoutes.profile),
        child: Container(
          height: 60,
          width: 60,
          margin: const EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.background,
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                spreadRadius: -4,
                color: AppColors.boxShadowPink,
                offset: const Offset(5, 5),
              ),
            ],
          ),
          child: Image.asset(
            "assets/vendor-profile.png",
            fit: BoxFit.contain,
            height: 60,
            width: 60,
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () => Navigator.pushNamed(context, AppRoutes.slot),
          icon: Icon(
            Icons.calendar_month,
            color: AppColors.boxShadowblue,
            size: 25,
          ),
        ),
      ],
    );
  }
}
