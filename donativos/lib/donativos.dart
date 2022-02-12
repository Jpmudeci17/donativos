import 'package:flutter/material.dart';

class donativos extends StatefulWidget {
  final donativo;
  donativos({Key? key, required this.donativo}) : super(key: key);

  @override
  State<donativos> createState() => _donativosState();
}

class _donativosState extends State<donativos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Donativos Obtenidos'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListTile(
                leading: Image.asset('assets/paypal.png'),
                trailing: Text('${widget.donativo['paypal']}',style: TextStyle(fontSize: 32),),
              ),
              SizedBox(height: 24,),
              ListTile(
                leading: Image.asset('assets/tarjeta-de-credito.png'),
                trailing: Text('${widget.donativo['tarjeta']}',style: TextStyle(fontSize: 32),),
              ),
              SizedBox(height: 24,),
              Divider(),
              ListTile(
                leading: Image.asset('assets/dolar.png'),
                trailing: Text('${widget.donativo['total']}',style: TextStyle(fontSize: 32),),
              ),
              Divider(),

              Container(
                child: widget.donativo['meta'] ? Image.asset('assets/gracias.png') : Text(''),
            
              )],
          ),
        ),
      );
  }
}