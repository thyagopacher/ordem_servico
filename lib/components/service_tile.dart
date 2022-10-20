
import 'package:flutter/material.dart';
import 'package:ordem_servico/models/service.dart';
import 'package:ordem_servico/routes/app_routes.dart';

class ServiceTile extends StatelessWidget{

    final Service service;

    // ignore: use_key_in_widget_constructors
    const ServiceTile(this.service);

    @override
    Widget build(BuildContext context) {

        final avatar = service.avatarUrl == null || service.avatarUrl.isEmpty
          ? CircleAvatar(child: Icon(Icons.person))
          : CircleAvatar(backgroundImage: NetworkImage(service.avatarUrl));

        return ListTile(
            leading: avatar,
            title: Text(service.name),
            subtitle: Text(service.valor),
            trailing: Container(
                width: 100,
                child: Row(
                    children: <Widget>[
                        IconButton(
                            onPressed: (){
                              Navigator.of(context).pushNamed(
                                AppRoutes.SERVICE_FORM,
                                arguments: service,
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