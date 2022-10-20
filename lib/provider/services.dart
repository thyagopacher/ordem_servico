import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:ordem_servico/data/dummy_services.dart';
import 'package:ordem_servico/models/service.dart';

class Services with ChangeNotifier{

  final Map<String, Service> _items = {...DUMMY_SERVICES};

  List<Service> get all{
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Service byIndex(int i){
    return _items.values.elementAt(i);
  }

  void put(Service service){
    if(service == null){
      return;
    }

    if(service.id != null 
      && service.id.trim().isNotEmpty 
      && _items.containsKey(service.id)){
      _items.update(service.id, (_) => Service(
        id: service.id,
        name: service.name,
        valor: service.valor,
        avatarUrl: service.avatarUrl,
      ));
    }else{
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(id, (() => Service(
        id: id, 
        name: service.name, 
        valor: service.valor, 
        avatarUrl: service.avatarUrl,
      )));
    }

    /**add aou alterar */
    notifyListeners();
  }

  void remove(Service service){
    if(service != null && service.id != null){
      _items.remove(service.id);
      notifyListeners();
    }
  }
}