import 'package:flutter/material.dart';

void main (){
  runApp(const MaterialApp(
    home: Avaliacao(),
    debugShowCheckedModeBanner: false,
  ));
}

class Avaliacao extends StatefulWidget {
  const Avaliacao({Key? key}) : super(key: key);

  @override
  State<Avaliacao> createState() => _AvaliacaoState();
}

class _AvaliacaoState extends State<Avaliacao> {

  List<String> _list = [];
  List<String> _listStatus = ['A', 'B', 'C', 'D', 'K','P','R','X'];
  List<String> _listAreas = [ 'Administrativo', 'Comercial',  'Desenvolvimento' ];
  Map<int,String> _mapStatus = {};
  String? _areaEscolhida;


  @override
  void initState(){
    super.initState();
    for(int i = 1; i <= 5; i++){
      _list.add("Armadilha $i");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Lista de Armadilhas"),
        actions: [
          InkWell(
            onTap: _mapStatus.isEmpty? null : (){
              print(_mapStatus);
            },
            child: Icon(Icons.save),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            /*decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),*/
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: listWidget(),
            ),
          ),
          DropdownButton(
              value: _areaEscolhida,
              items: _listAreas.map((e){
                return DropdownMenuItem(
                    value: e,
                    child: Text(e)
                );
              }).toList(),
              onChanged: (value){
                setState(() {
                  _areaEscolhida = value.toString();
                });
              }),
          Expanded(
              child: ListView.builder(
                itemCount: _list.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Expanded(
                              child:Text("Armadilha $index")
                          ),
                          DropdownButton(
                              value: _mapStatus[index] ,
                              items: _listStatus.map((e){
                                return DropdownMenuItem(
                                    value: e,
                                    child: Text(e)
                                );
                              }).toList(),
                              onChanged: (value){
                                setState(() {
                                  _mapStatus[index] = value.toString();
                                });
                              })
                        ],
                      ),
                    ),
                  );
                },
              )
          ),
        ],

      ),
    );
  }


  int contarEventos(String armadilha){
    int contador = 0;
    _mapStatus.forEach((key, value) {
      if(value.toString() == armadilha)
        contador++;
    });
    return contador;
  }

  List<Widget> listWidget(){
    List<Widget> l = [];

    _listStatus.forEach((element) {
      int quantidade = contarEventos( element.toString() );
      l.add(Text(' $element:${quantidade} ',style: TextStyle(color: Colors.black),));
    });

    return l;
  }



}
