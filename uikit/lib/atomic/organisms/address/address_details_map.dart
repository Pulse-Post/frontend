// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:uikit/uikit.dart';

class AddressDetailsMap extends StatelessWidget {
  final String fullAddress;
  final double? longitude;
  final double? latitude;
  final String urlTemplate;
  final String userAgentPackageName;
  const AddressDetailsMap(
      {super.key,
      required this.fullAddress,
      this.longitude,
      this.latitude,
      required this.urlTemplate,
      required this.userAgentPackageName});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: SizeToken.sm,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextLabelL4Secondary(
          text: fullAddress,
        ),
        if (latitude != null && longitude != null)
          SizedBox(
            height: 200,
            width: double.infinity,
            child: FlutterMap(
                options: MapOptions(
                    initialCenter: LatLng(latitude!, longitude!),
                    initialZoom: 15.5),
                children: [
                  TileLayer(
                    urlTemplate:
                        urlTemplate,
                    userAgentPackageName: userAgentPackageName,
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: LatLng(latitude!, longitude!),
                        width: SizeToken.xxl,
                        height: SizeToken.xxl,
                        child: const Icon(
                          Icons.location_on,
                          color: ColorToken.danger,
                          size: SizeToken.xxl,
                        ),
                      ),
                    ],
                  ),
                ]),
          )
      ],
    );
  }
}
