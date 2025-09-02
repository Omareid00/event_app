import 'package:event_app/cores/appcolors/appcolors.dart';
import 'package:event_app/screens/layout/create_event/widget/eventdata.dart';
import 'package:flutter/material.dart';

class EventDetails extends StatelessWidget {
  const EventDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var eventData = ModalRoute.of(context)?.settings.arguments as EventData;
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.primary,
        centerTitle: true,
        title: Text("Event Details", style: theme.textTheme.bodyLarge?.copyWith(color: AppColors.primary),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.edit,color: AppColors.primary,),),
          IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: Colors.red,),)
        ],
      ),
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}
