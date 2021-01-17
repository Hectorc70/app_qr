import 'package:flutter/material.dart';

import 'package:barcode_scan/barcode_scan.dart';

class HomePage extends StatefulWidget {
  
  @override
  createState() => _HomePageState();

  
}




class _HomePageState extends State<HomePage> {
  ScanResult _scanResult;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR'),
        backgroundColor: Color(0xFFFF9000),
      ),
      body: Center(
          child: _scanResult == null
              ? Text('Esperando datos de código')
              : Column(
                  children: [
                    Text('Contenido: ${_scanResult.rawContent}'),
                    Text('Formato: ${_scanResult.format.toString()}'),
                  ],
                )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _scanCode();
        },
      ),
    );
  }

    Future<void> _scanCode() async {
    var result = await BarcodeScanner.scan();
    setState(() {
      _scanResult = result;
    });
  }
}

