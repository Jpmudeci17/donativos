import 'package:donativos/donativos.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class homePage extends StatefulWidget {
  homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int? currentRadio;
  String dropdownValue = '100';
  double total = 0 ;
  double total100 = 0 ;
  int tarjeta = 0;
  int paypal = 0;
  bool meta = false ;
  var assetsRadioGroup = {
    0:'assets/paypal.png',
    1:'assets/tarjeta-de-credito.png',
  };
  var radioGoup ={
    0:'paypal',
    1: 'tarjeta',
  };

  radioGroupGenerator(){
    return radioGoup.entries.map((radio) => ListTile(
      leading: Image.asset(assetsRadioGroup[radio.key]!, height: 64, width:  64,),
      title: Text('${radio.value}'),
      trailing: Radio(value: radio.key, groupValue: currentRadio, onChanged: (int? selectedRadio){
        currentRadio = selectedRadio;
        setState(() {});
      }),
      )).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('donaciones'),
      ),
      body: 
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListTile(
                title: Text("Es para una buena causa"),
                subtitle: Text('Elija modo de donativo'),
              ),
              Container(
                decoration: 
                  BoxDecoration(border:Border.all(color: Colors.black),borderRadius: BorderRadius.circular(20)),
                  child: Column(children: radioGroupGenerator(),
                  ),
              ),
              ListTile(
                title: Text('cantidad a donar'),
                trailing: DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>['100', '350', '850', '1050','9999']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              LinearProgressIndicator(
                minHeight: 20,
                value: total100/10000,
                
              ),
              Center(child: Text('${total100/100}'),),
              Center(child: TextButton(onPressed: (){
                if(currentRadio == 1){
                  paypal += int.parse(dropdownValue);
                  total += int.parse(dropdownValue);
                  total100 += int.parse(dropdownValue);
                  print(total);
                }
                else{
                  tarjeta += int.parse(dropdownValue);
                  total += int.parse(dropdownValue);
                  total100 += int.parse(dropdownValue);
                  print(total);
                }
                if (total100 >= 10000){
                  total100 = 10000;
                  meta = true;
                }
                  
                setState(() {});

              }, child: Text('donar')))
            ],
          ),
        ),
      
      
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => donativos(donativo: {'paypal':paypal,"tarjeta":tarjeta,'total':total,'meta':meta},)
            )
            );
      }, child: Icon(Icons.arrow_right)),

    );
  }
}