
import 'package:flutter/material.dart';
import 'package:ordem_servico/models/os.dart';
import 'package:ordem_servico/routes/app_routes.dart';

class OsTile extends StatelessWidget{

    final Os ordemService;

    // ignore: use_key_in_widget_constructors
    const OsTile(this.ordemService);

    @override
    Widget build(BuildContext context) {

        return ListTile(
            title: Text(ordemService.idService.toString()),
            subtitle: Text(ordemService.idPrestador.toString()),
            trailing: Container(
                width: 100,
                child: Row(
                    children: <Widget>[
                        IconButton(
                            onPressed: (){
                              Navigator.of(context).pushNamed(
                                AppRoutes.SERVICE_FORM,
                                arguments: ordemService,
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