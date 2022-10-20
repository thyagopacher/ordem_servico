import 'package:flutter/material.dart';
import 'package:ordem_servico/models/os.dart';
import 'package:ordem_servico/provider/os.dart';
import 'package:provider/provider.dart';

class OrdemServiceForm extends StatelessWidget{

  final _form = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Ordem Serviço'),
        actions: <Widget>[
          IconButton(
            onPressed: (){

              final isValid = _form.currentState!.validate();

              if(isValid){
                _form.currentState?.save();
                Provider.of<OrdemServices>(context, listen: false).put(
                  Os(
                    id: _formData['id'],
                    idService: _formData['idService'],
                    idPrestador: _formData['idPrestador'],
                    quantidade: _formData['quantidade'],
                  ),
                );
                Navigator.of(context).pop();
              }
            }, 
            icon: Icon(Icons.save)
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'idService'),
                validator: (value) {
                  if(value == null || value.trim().isEmpty){
                    return 'idService inválido';
                  }

                  return null;
                },
                onSaved: (value) => _formData['idService'] = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'idPrestador'),
                onSaved: (value) => _formData['idPrestador'] = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'quantidade'),
                onSaved: (value) => _formData['quantidade'] = value!,
              ),                            
            ]
          )
        ),
      ),
    );
  }

}