import 'package:easy_localization/easy_localization.dart';
import 'package:event_app/cores/appcolors/appcolors.dart';
import 'package:flutter/material.dart';

class DateTimeCard extends StatelessWidget {
  DateTimeCard({super.key, required this.dateTime});
  DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    String formatedDate = DateFormat.yMMMd().format(dateTime);
    String formatedTime = DateFormat.jm().format(dateTime);
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.primary),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.primary),
                color: AppColors.primary,
              ),
              child: Icon(
                Icons.calendar_month,
                color: AppColors.white,
                size: 30,
              ),
            ),
            SizedBox(width: 16,),
            Expanded(
                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(formatedDate,style:theme.textTheme.titleMedium ,),
                Text(formatedTime,style:theme.textTheme.titleMedium ,)
              ],
            ),
            ),
          ],
        ),
      ),
    );
  }
}
