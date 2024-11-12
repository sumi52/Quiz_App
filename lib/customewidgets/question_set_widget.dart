import 'package:flutter/material.dart';
import 'package:quiz_app_solution/temp_db.dart';

class QuestionSetView extends StatefulWidget {
  final int index;  //jekhane parameter hisabe index number ta pass kore dichi,index pass korchi karon er numbering ta pass korar jonno
  final Map<String, dynamic> map; //map ta o niye aschi,orthat index e je map ta thakbe seta o pass kore dichi,   1ta map mane
  final Function(String) onAnswered;  //1ta call back function,jeta 1ta string
  const QuestionSetView({super.key, required this.index, required this.map, required this.onAnswered});

  @override
  State<QuestionSetView> createState() => _QuestionSetViewState();
}

class _QuestionSetViewState extends State<QuestionSetView> {
  String groupvalue = '';
  @override
  Widget build(BuildContext context) {
    return Column(  //1ta ques set er jonno column nichi
      children: [
        ListTile(   //1st child
          leading: Text('${widget.index+1}.'),  //jar leading hocche index number +1 ta
          title: Text(widget.map[question]),    //r taitel hocche ques //ei map ta sathe kore niye aschi
          subtitle: Column(      //ei column er children koto gula hobe korteche amr koto gulo options ache,joto gulo column toto gulo radio
                                 // button create hobe
            mainAxisAlignment: MainAxisAlignment.start,
            children: (widget.map[options] as List).map((e) => ListTile(  //e karone children ta dynamically dicchi,orthat jei map ta sathe
                                                 // kore niye aschi er options eta to dynamic chilo,eta k List tag e convert korlam,convert kore
                                                    // tarpor e map (e) ta hocche ek ek ta element(options:'int','float','bool','Function')amdr,
                                               // ek ek ta element er jonno ek ek ta List style generate kortechi,cz niche 1st e leading e redio
                                              // widget/icon dichi,then title e dichi tar ans/text ta

              leading: Radio<String>(    //amra jani radio button gulo te ekta radio group dite hoy,je kono radio grp er value ja hobe r oi radio
                                        // button er value jodi equal hoy tahole seta selected thake
                value: e,        //& oi radior actual value ja hoy(ques er 4ta je options thake o gula)er modhe kono ekta select korle tokhon grp
                                // value & e er man same oita e hobe,
                groupValue: groupvalue,    //radior grp er value ja hoy,2ta jokhon e equal hoy tokhon e selected hoy,& amr 5ta ques set er jonno
                                          // 5ta grp valuer poyojon, but jodi ques onk gula r grp value 1ta e rakhtam tahole jokhon option select
                 //kortam tokhon arekta select korle ager ta unselect hoye jeto,e jonno poti ta ques set er jonno aladha aladha grp value dite hobe
                onChanged: (value){
                  setState(() {
                    groupvalue = value as String;      //click korar sathe sathe setState chane hoye gelo,grp valuer modhe etake assign kore dilam,
                                                    // setState er modhe ei kaj korate amr widget change hocche r ei change ta amr chokhe porteche,
                                                    //but eta seperate widget ami ekhan thske save korbo na,ekhan theke value/grpValue ta nibo,
                  });
                  widget.onAnswered(groupvalue);     //jokhon user kono ekta radio button e click korteche,jeta te click korteche sei grp value ta
                                                    // amra ekhan theke pass kore
                                                    //grpValue ta niye ei onAnswered je method ta ami pass korchi
                },
              ),
              title: Text(e),
            )).toList(), //sb gulo mile ekta toList e convert korlam
          ),
        )
      ],
    );
  }
}
