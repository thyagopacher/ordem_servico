import 'package:flutter/material.dart';
import 'package:ordem_servico/models/user.dart';
import 'package:ordem_servico/provider/users.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget{

  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Prestador de Serviço'),
        actions: <Widget>[
          IconButton(
            onPressed: (){

              final isValid = _form.currentState!.validate();

              if(isValid){
                _form.currentState?.save();
                Provider.of<Users>(context, listen: false).put(
                  User(
                    id: _formData['id'],
                    name: _formData['name'],
                    email: _formData['email'],
                    avatarUrl: _formData['avatarUrl'],
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
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if(value == null || value.trim().isEmpty){
                    return 'Nome inválido';
                  }

                  if(value.trim().length < 3){
                    return 'Nome muito pequeno. No minimo 3 letras.';
                  }

                  return null;
                },
                onSaved: (value) => _formData['name'] = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'E-mail'),
                onSaved: (value) => _formData['email'] = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'URL Avatar'),
                onSaved: (value) => _formData['avatarUrl'] = value!,
              ),                            
            ]
          )
        ),
      ),
    );
  }

}