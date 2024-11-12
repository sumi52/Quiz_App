import 'package:flutter/material.dart';
import 'package:quiz_app_solution/temp_db.dart';

class QuestionSetView extends StatefulWidget {
  final int index; 
  final Map<String, dynamic> map; 
  final Function(String) onAnswered; 
  const QuestionSetView({super.key, required this.index, required this.map, required this.onAnswered});

  @override
  State<QuestionSetView> createState() => _QuestionSetViewState();
}

class _QuestionSetViewState extends State<QuestionSetView> {
  String groupvalue = '';
  @override
  Widget build(BuildContext context) {
    return Column(  
      children: [
        ListTile(   
          leading: Text('${widget.index+1}.'),  
          title: Text(widget.map[question]),    
          subtitle: Column(      
            mainAxisAlignment: MainAxisAlignment.start,
            children: (widget.map[options] as List).map((e) => ListTile(  

              leading: Radio<String>(    
                value: e,        
                groupValue: groupvalue,    
                onChanged: (value){
                  setState(() {
                    groupvalue = value as String;     
                  });
                  widget.onAnswered(groupvalue);     
                },
              ),
              title: Text(e),
            )).toList(), 
          ),
        )
      ],
    );
  }
}
