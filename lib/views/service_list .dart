import 'package:flutter/material.dart';
import 'package:ordem_servico/components/service_tile.dart';
import 'package:ordem_servico/data/dummy_services.dart';
import 'package:ordem_servico/routes/app_routes.dart';

class ServiceList extends StatelessWidget{

    @override
    Widget build(BuildContext context){

        final services = {...DUMMY_SERVICES};

        return Scaffold(
            appBar: AppBar(
                title: Text('Lista de Serviços'),
                actions: <Widget>[
                  IconButton(
                    onPressed: (){
                      Navigator.of(context).pushNamed(
                        AppRoutes.SERVICE_FORM
                      );
                    }, 
                    padding: const EdgeInsets.all(10),
                    icon: Icon(Icons.add)
                  )
                ],
            ),//AppBar
            body: ListView.builder(
                itemCount: services.length,
                itemBuilder: (ctx, i) => ServiceTile(services.values.elementAt(i))
            )
        );
    }
}