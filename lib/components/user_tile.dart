
import 'package:flutter/material.dart';
import 'package:ordem_servico/models/user.dart';
import 'package:ordem_servico/routes/app_routes.dart';

class UserTile extends StatelessWidget{

    final User user;

    // ignore: use_key_in_widget_constructors
    const UserTile(this.user);

    @override
    Widget build(BuildContext context) {

        final avatar = user.avatarUrl == null || user.avatarUrl.isEmpty
          ? CircleAvatar(child: Icon(Icons.person))
          : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));

        return ListTile(
            leading: avatar,
            title: Text(user.name),
            subtitle: Text(user.email),
            trailing: Container(
                width: 100,
                child: Row(
                    children: <Widget>[
                        IconButton(
                            onPressed: (){
                              Navigator.of(context).pushNamed(
                                AppRoutes.USER_FORM,
                                arguments: user,
                              );                              
                            }, 
                            color: Colors.orange,
                            icon: Icon(Icons.edit)
                        ),
                        IconButton(
                            onPressed: (){}, 
                            color: Colors.red,
                            icon: Icon(Icons.delete)
                        ),              
                    ]
                ),
            )
        );
    }
}