import 'dart:developer';

import 'package:app_front_dark_solution/src/models/datos_models.dart';
import 'package:app_front_dark_solution/src/provider/datos_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'ITI',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      // body: const Center(child: Text('home')));
      body: const Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late Future<List<Datos>?> _datos;
  @override
  void initState() {
    super.initState();
    _datos = Provider.of<DatosProvider>(context, listen: false).obtenerGrups();
  }

  @override
  Widget build(BuildContext context) {
    final datosMessage = _datos;

    if (datosMessage == null) {
      print('no hay datos');
    } else {
      print('si hay datos');
    }
    // return Container();
    return FutureBuilder<List<Datos>?>(
      future: datosMessage,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          log('Hola');
          return _PlantelList(datosMessage: snapshot.data);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }
}

class _PlantelList extends StatelessWidget {
  final List<Datos>? datosMessage;

  const _PlantelList({required this.datosMessage});

  @override
  Widget build(BuildContext context) {
    // return ListView();
    return ListView.builder(
      shrinkWrap: true,
      itemCount: datosMessage!.length,
      itemBuilder: (context, index) {
        final delay = index;
        final datos = datosMessage![index];
        return Text(
          datos.message,
        );
      },
    );
  }
}
