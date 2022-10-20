import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:ordem_servico/data/dummy_os.dart';
import 'package:ordem_servico/models/os.dart';

class OrdemServices with ChangeNotifier{

  final Map<int, Os> _items = {...DUMMY_OS};

  List<Os> get all{
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Os byIndex(int i){
    return _items.values.elementAt(i);
  }

  void put(Os ordemService){
    if(ordemService == null){
      return;
    }

    if(ordemService.id > 0
      && _items.containsKey(ordemService.id)){
      _items.update(ordemService.id, (_) => Os(
        id: ordemService.id,
        idService: ordemService.idService,
        idPrestador: ordemService.idPrestador,
        quantidade: ordemService.quantidade,
      ));
    }else{
      final id = Random().nextDouble().toInt();
      _items.putIfAbsent(id, (() => Os(
        id: id, 
        idService: ordemService.idService,
        idPrestador: ordemService.idPrestador,
        quantidade: ordemService.quantidade
      )));
    }

    /**add aou alterar */
    notifyListeners();
  }

  void remove(Os ordemService){
    if(ordemService != null && ordemService.id != null){
      _items.remove(ordemService.id);
      notifyListeners();
    }
  }
}