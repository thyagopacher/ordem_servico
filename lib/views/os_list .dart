import 'package:flutter/material.dart';
import 'package:ordem_servico/components/os_tile.dart';
import 'package:ordem_servico/data/dummy_os.dart';
import 'package:ordem_servico/routes/app_routes.dart';

class OsList extends StatelessWidget{

    @override
    Widget build(BuildContext context){

        final services = {...DUMMY_OS};

        return Scaffold(
            appBar: AppBar(
                title: Text('Lista de O.S'),
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
                itemBuilder: (ctx, i) => OsTile(services.values.elementAt(i))
            )
        );
    }
}