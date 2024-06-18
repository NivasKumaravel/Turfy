import 'package:flutter/material.dart';
import 'package:turfy/Common_Widgets/Text_Form_Field.dart';
class Demo extends StatefulWidget {
  const Demo({super.key});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          textFormField(hintText: 'Turfy', keyboardtype:TextInputType.phone,),
        ],
          ),
    );
  }
}
