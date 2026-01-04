import 'package:expance_tracker/main.dart';
import 'package:expance_tracker/models/expance.dart';
import 'package:flutter/material.dart';

class Newexpance extends StatefulWidget {
  const Newexpance({
    
    super.key,
   required this.newdata,
    
    });
    
  final void Function(Expance expance)newdata;
  @override
  State<Newexpance> createState() => _NewexpanceState();
}

class _NewexpanceState extends State<Newexpance> {
  final titlecontroler = TextEditingController();
  final amountcontroler = TextEditingController();
  DateTime? _showedate;
  Category selectedCategory=Category.Chill;


  void checkData(){
  final amount=double.tryParse(amountcontroler.text);
  final invalidamount=amount==null||amount<=0;
  if(titlecontroler.text.trim().isEmpty||invalidamount||_showedate==null){
    showDialog(context: context, builder:(ctx)=>AlertDialog(
          title: Text("Invalid Datainput",style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: selected_color.error,
          ),),
          content: Text("Please enter all the data correctly !!",style: Theme.of(context).textTheme.bodyMedium,),
          actions: [
            TextButton(onPressed: (){
               Navigator.pop(ctx);
            }, child:Text("Okay"))
          ],



    )
    
    
    
    
    
    );
    return;
  }else{
    final assigndate=DateTime.parse(_showedate.toString());
    final Newexpance=Expance(title: titlecontroler.text,amount: amount,category: selectedCategory,date:assigndate);
    widget.newdata(Newexpance);
    Navigator.pop(context);
  }
  
  
  return;
  }

  void Showing_Calender() async {
    final now = DateTime.now();
    final first = DateTime(now.year - 1, now.month, now.day);
    final _Pickeddate = await showDatePicker(
      context: context,
      firstDate: first,
      lastDate: now,
    );
    setState(() {
      _showedate = _Pickeddate;
    });
  }

  @override
  void dispose() {
    titlecontroler.dispose();
    amountcontroler.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(20),
      child: Column(
        children: [
          TextField(
            controller: titlecontroler,
            maxLength: 50,
            decoration: InputDecoration(label: Text("Title")),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: amountcontroler,
                  keyboardType: TextInputType.number,

                  maxLength: 10,
                  decoration: InputDecoration(
                    prefixText: "\$",
                    label: Text("Amount"),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _showedate == null
                          ? "No Selected date"
                          : dateformat.format(_showedate!),
                    ),
                    IconButton(
                      onPressed: Showing_Calender,
                      icon: Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Row(
            children: [
              DropdownButton(
                value: selectedCategory,
                items: Category.values.map(
                  (category)=> DropdownMenuItem(
                    value:category,
                    child:Text(category.name.toUpperCase())
                    ),
                ).toList(),
                onChanged: (value) {
                  if(value==null){
                    return;
                  }
                  setState(() {
                    selectedCategory=value;
                  });
                },
              ),
               Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              ),
              SizedBox(width: 20),
          
            ],
          ),
         // Spacer(),
              ElevatedButton(
                onPressed: checkData,
                child: Text("save changes"),
              ),
        ],
      ),
    );
  }
}
