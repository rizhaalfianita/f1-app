import 'package:f1_app/app/data/models/f1circuit_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../controllers/track_map_controller.dart';

class TrackMapView extends GetView<TrackMapController> {
  const TrackMapView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          alignment: Alignment.bottomCenter,
          children: [mapSection(), cardSection()]),
    );
  }

  Widget cardSection() {
    return Obx(() => SizedBox(
          height: 150,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: controller.isLoadingCircuit.value
                ? const [
                    Center(
                      child: CircularProgressIndicator(),
                    )
                  ]
                : controller.circuits.map((e) => cardCircuit(e)).toList(),
          ),
        ));
  }

  Widget cardCircuit(Circuit circuit) {
    return GestureDetector(
      onTap: () {
        controller.mapController.value.move(
            LatLng(double.parse(circuit.lat!), double.parse(circuit.lang!)),
            10);
        // await 3 second
        Future.delayed(const Duration(seconds: 2)).then((value) {
          controller.animatedMapMove(
              LatLng(double.parse(circuit.lat!), double.parse(circuit.lang!)),
              15);
        });
      },
      child: Container(
        width: 300,
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, offset: Offset(0, 2), blurRadius: 6.0)
            ]),
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      child: Image.network(
                        circuit.image!,
                        height: 60,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.error);
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            circuit.name!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            circuit.country!,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Circuit Length",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "${circuit.length!} km",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Lap Record",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                          Row(
                            children: [
                              Text(
                                "${circuit.lapRecord!} ",
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                circuit.lapRecordDriver!,
                                maxLines: 2,
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }

  FlutterMap mapSection() {
    return FlutterMap(
        options: const MapOptions(
          initialCenter: LatLng(51.509364, -0.128928),
          initialZoom: 9.2,
          keepAlive: true,
        ),
        mapController: controller.mapController.value,
        children: [
          TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'dev.fleaflet.flutter_map.example'),
          controller.isLoadingCircuit.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : MarkerLayer(
                  alignment: Alignment.center,
                  markers: controller.circuits
                      .map((e) => Marker(
                          width: 80.0,
                          alignment: Alignment.center,
                          point: LatLng(
                              double.parse(e.lat!), double.parse(e.lang!)),
                          child: Container(
                              child: Image.network(
                            e.image!,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.error);
                            },
                          ))))
                      .toList(),
                )
        ]);
  }
}
