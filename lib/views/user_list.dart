import 'package:flutter/material.dart';
import 'package:ordem_servico/components/user_tile.dart';
import 'package:ordem_servico/data/dummy_users.dart';
import 'package:ordem_servico/routes/app_routes.dart';

class UserList extends StatelessWidget{

    @override
    Widget build(BuildContext context){

        final users = {...DUMMY_USERS};

        return Scaffold(
            appBar: AppBar(
                title: Text('Lista de Prestadores'),
                actions: <Widget>[
                  IconButton(
                    onPressed: (){
                      Navigator.of(context).pushNamed(
                        AppRoutes.USER_FORM
                      );
                    }, 
                    padding: const EdgeInsets.all(10),
                    icon: Icon(Icons.add)
                  )
                ],
            ),//AppBar
            body: ListView.builder(
                itemCount: users.length,
                itemBuilder: (ctx, i) => UserTile(users.values.elementAt(i))
            )
        );
    }
}