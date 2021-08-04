import 'package:farnsworth/Menu/menu_principal.dart';
import 'package:farnsworth/provider/config_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfigurationToolBar extends StatefulWidget {
  const ConfigurationToolBar({Key? key}) : super(key: key);

  @override
  _ConfigurationToolBarState createState() => _ConfigurationToolBarState();
}

class _ConfigurationToolBarState extends State<ConfigurationToolBar> {
  bool chipForma = false;
  bool chipContorno = false;
  bool objectiveForma = false;
  bool objectiveContorno = false;
  bool caja = false;
  bool cajaForma = false;
  bool cajaContorno = false;
  @override
  Widget build(BuildContext context) {
    final configuration = Provider.of<ConfigProvider>(context);
    TextStyle Titulo = TextStyle(
        fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white);
    TextStyle SubTitulo = TextStyle(
        fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black);
    TextStyle Accion = TextStyle(
        fontSize: 13, fontWeight: FontWeight.bold, color: Colors.white);

    Container BotonFlecha = Container(
      height: MediaQuery.of(context).size.width / 35,
      width: MediaQuery.of(context).size.width / 35,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(
              MediaQuery.of(context).size.width / 50,
            ),
          ),
          border: Border.all(color: Colors.green, width: 4)),
      child: Center(
        child: Icon(
          Icons.done,
          color: Colors.green,
          size: 30,
        ),
      ),
    );
    Container BotonX = Container(
      height: MediaQuery.of(context).size.width / 35,
      width: MediaQuery.of(context).size.width / 35,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(
              MediaQuery.of(context).size.width / 50,
            ),
          ),
          border: Border.all(color: Colors.red, width: 4)),
      child: Center(
        child: Icon(
          Icons.close,
          color: Colors.red,
          size: 30,
        ),
      ),
    );

    Container BotonFlechaGrey = Container(
      height: MediaQuery.of(context).size.width / 35,
      width: MediaQuery.of(context).size.width / 35,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(
              MediaQuery.of(context).size.width / 50,
            ),
          ),
          border: Border.all(color: Colors.grey, width: 4)),
      child: Center(
        child: Icon(
          Icons.done,
          color: Colors.grey,
          size: 30,
        ),
      ),
    );
    Container BotonXGrey = Container(
      height: MediaQuery.of(context).size.width / 35,
      width: MediaQuery.of(context).size.width / 35,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(
              MediaQuery.of(context).size.width / 50,
            ),
          ),
          border: Border.all(color: Colors.grey, width: 4)),
      child: Center(
        child: Icon(
          Icons.close,
          color: Colors.grey,
          size: 30,
        ),
      ),
    );

    void chipFormaOn() {
      setState(() {
        chipForma = true;
        configuration.setChipForma = chipForma;
      });
    }

    void chipFormaOff() {
      setState(() {
        chipForma = false;
        configuration.setChipForma = chipForma;
      });
    }

    void chipContornoOn() {
      setState(() {
        chipContorno = true;
        configuration.setChipContorno = chipContorno;
      });
    }

    void chipContornoOff() {
      setState(() {
        chipContorno = false;
        configuration.setChipContorno = chipContorno;
      });
    }

    Container Configuracion = Container(
        height: MediaQuery.of(context).size.height / 25,
        width: MediaQuery.of(context).size.width / 11,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Center(
          child: Text(
            'CONFIGURACIÓN',
            style: Titulo,
          ),
        ));

    Text FichaText = Text('FICHA', style: SubTitulo);
    Container FichaStack = Container(
      height: MediaQuery.of(context).size.height * 2.5 / 10,
      width: MediaQuery.of(context).size.width / 11,
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(children: [
        Container(
            height: MediaQuery.of(context).size.height / 25,
            width: MediaQuery.of(context).size.width / 10,
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Center(
              child: Text(
                'FORMA',
                style: Accion,
              ),
            )),
        Spacer(),
        Container(
          height: MediaQuery.of(context).size.width / 29,
          width: MediaQuery.of(context).size.width / 12,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Row(
            children: [
              Spacer(),
              InkWell(
                child: (chipForma ? BotonFlecha : BotonFlechaGrey),
                onTap: chipFormaOn,
              ),
              Spacer(),
              InkWell(
                child: (!chipForma ? BotonX : BotonXGrey),
                onTap: chipFormaOff,
              ),
              Spacer(),
            ],
          ),
        ),
        Spacer(),
        Container(
            height: MediaQuery.of(context).size.height / 25,
            width: MediaQuery.of(context).size.width / 10,
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Center(
              child: Text(
                'CONTORNO',
                style: Accion,
              ),
            )),
        Spacer(),
        Row(
          children: [
            Spacer(),
            InkWell(
              child: (chipContorno ? BotonFlecha : BotonFlechaGrey),
              onTap: chipContornoOn,
            ),
            Spacer(),
            InkWell(
              child: (!chipContorno ? BotonX : BotonXGrey),
              onTap: chipContornoOff,
            ),
            Spacer(),
          ],
        ),
        Spacer(),
      ]),
    );

    void objectiveFormaOn() {
      setState(() {
        objectiveForma = true;
        configuration.setObjectiveForma = objectiveForma;
      });
    }

    void objectiveFormaOff() {
      setState(() {
        objectiveForma = false;
        configuration.setObjectiveForma = objectiveForma;
      });
    }

    void objectiveContornoOn() {
      setState(() {
        objectiveContorno = true;
        configuration.setObjectiveContorno = objectiveContorno;
      });
    }

    void objectiveContornoOff() {
      setState(() {
        objectiveContorno = false;
        configuration.setObjectiveContorno = objectiveContorno;
      });
    }

    Text ObjetivoText = Text('OBJETIVO', style: SubTitulo);
    Container ObjetivoStack = Container(
      height: MediaQuery.of(context).size.height * 2.5 / 10,
      width: MediaQuery.of(context).size.width / 11,
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(children: [
        Container(
            height: MediaQuery.of(context).size.height / 25,
            width: MediaQuery.of(context).size.width / 10,
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Center(
              child: Text(
                'FORMA',
                style: Accion,
              ),
            )),
        Spacer(),
        Container(
          height: MediaQuery.of(context).size.width / 29,
          width: MediaQuery.of(context).size.width / 12,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Row(
            children: [
              Spacer(),
              InkWell(
                child: (objectiveForma ? BotonFlecha : BotonFlechaGrey),
                onTap: objectiveFormaOn,
              ),
              Spacer(),
              InkWell(
                child: (!objectiveForma ? BotonX : BotonXGrey),
                onTap: objectiveFormaOff,
              ),
              Spacer(),
            ],
          ),
        ),
        Spacer(),
        Container(
            height: MediaQuery.of(context).size.height / 25,
            width: MediaQuery.of(context).size.width / 10,
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Center(
              child: Text(
                'CONTORNO',
                style: Accion,
              ),
            )),
        Spacer(),
        Row(
          children: [
            Spacer(),
            InkWell(
              child: (objectiveContorno ? BotonFlecha : BotonFlechaGrey),
              onTap: objectiveContornoOn,
            ),
            Spacer(),
            InkWell(
              child: (!objectiveContorno ? BotonX : BotonXGrey),
              onTap: objectiveContornoOff,
            ),
            Spacer(),
          ],
        ),
        Spacer(),
      ]),
    );

    void cajaOn() {
      setState(() {
        caja = true;
        configuration.setCaja = caja;
      });
    }

    void cajaOff() {
      setState(() {
        caja = false;
        configuration.setCaja = caja;
      });
    }

    void cajaFormaOn() {
      setState(() {
        cajaForma = true;
        configuration.setCajaForma = cajaForma;
      });
    }

    void cajaFormaOff() {
      setState(() {
        cajaForma = false;
        configuration.setCajaForma = cajaForma;
      });
    }

    void cajaContornoOn() {
      setState(() {
        cajaContorno = true;
        configuration.setCajaContorno = cajaContorno;
      });
    }

    void cajaContornoOff() {
      setState(() {
        cajaContorno = false;
        configuration.setCajaContorno = cajaContorno;
      });
    }

    Text CajaText = Text('CAJA', style: SubTitulo);
    Container Caja = Container(
      child: Row(
        children: [
          Spacer(),
          InkWell(
            child: (caja ? BotonFlecha : BotonFlechaGrey),
            onTap: cajaOn,
          ),
          Spacer(),
          InkWell(
            child: (!caja ? BotonX : BotonXGrey),
            onTap: cajaOff,
          ),
          Spacer(),
        ],
      ),
    );
    Container CajaStack = Container(
      height: MediaQuery.of(context).size.height * 2.5 / 10,
      width: MediaQuery.of(context).size.width / 11,
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(children: [
        Container(
            height: MediaQuery.of(context).size.height / 25,
            width: MediaQuery.of(context).size.width / 10,
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Center(
              child: Text(
                'FORMA',
                style: Accion,
              ),
            )),
        Spacer(),
        Container(
          height: MediaQuery.of(context).size.width / 29,
          width: MediaQuery.of(context).size.width / 12,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Row(
            children: [
              Spacer(),
              InkWell(
                child: (cajaForma ? BotonFlecha : BotonFlechaGrey),
                onTap: cajaFormaOn,
              ),
              Spacer(),
              InkWell(
                child: (!cajaForma ? BotonX : BotonXGrey),
                onTap: cajaFormaOff,
              ),
              Spacer(),
            ],
          ),
        ),
        Spacer(),
        Container(
            height: MediaQuery.of(context).size.height / 25,
            width: MediaQuery.of(context).size.width / 10,
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Center(
              child: Text(
                'CONTORNO',
                style: Accion,
              ),
            )),
        Spacer(),
        Row(
          children: [
            Spacer(),
            InkWell(
              child: (cajaContorno ? BotonFlecha : BotonFlechaGrey),
              onTap: cajaContornoOn,
            ),
            Spacer(),
            InkWell(
              child: (!cajaContorno ? BotonX : BotonXGrey),
              onTap: cajaContornoOff,
            ),
            Spacer(),
          ],
        ),
        Spacer(),
      ]),
    );

    return Container(
      height: MediaQuery.of(context).size.height * 9.6 / 10,
      width: MediaQuery.of(context).size.width / 10,
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        children: [
          Spacer(),
          Configuracion,
          Spacer(),
          FichaText,
          FichaStack,
          Spacer(
            flex: 2,
          ),
          ObjetivoText,
          ObjetivoStack,
          Spacer(
            flex: 10,
          ),
          CajaText,
          Caja,
          (caja ? CajaStack : Container()),
          Spacer(
            flex: 10,
          ),
        ],
      ),
    );
  }
}
