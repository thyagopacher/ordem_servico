import 'package:flutter/material.dart';
import 'package:ordem_servico/models/service.dart';

const DUMMY_SERVICES = {
    '1': Service(
        id: '1',
        name: 'Formatação de computador',
        valor: '105,25',
        avatarUrl: 'https://cdn.pixabay.com/photo/2017/05/09/13/33/laptop-2298286_960_720.png'
    ),
    '2': Service(
        id: '2',
        name: 'Lavagem de carros',
        valor: '60,25',
        avatarUrl: 'https://media.istockphoto.com/photos/worker-washing-red-car-with-sponge-on-a-car-wash-picture-id1287044692?s=612x612'
    ),
    '3': Service(
        id: '3',
        name: 'Pintura de carros',
        valor: '525,25',
        avatarUrl: 'https://media.istockphoto.com/photos/painting-auto-car-picture-id500003302?s=612x612'
    ),
};