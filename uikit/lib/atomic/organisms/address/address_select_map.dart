// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:uikit/uikit.dart';

class AddressSelectMap extends StatefulWidget {
  final String currentLocalIcon;

  final String searchHintText;
  final String searchPrefixIcon;
  final String searchSufixIcon;

  final double latitude;
  final double longitude;

  final VoidCallback? onCurrentPosition;
  final void Function(LatLng point)? onTapMap;
  final void Function(String value)? onChangedSearch;
  final VoidCallback sufixOnTapSearch;

  final String urlTemplate;
  final String userAgentPackageName;

  const AddressSelectMap({
    super.key,
    required this.currentLocalIcon,
    required this.searchHintText,
    required this.searchPrefixIcon,
    required this.searchSufixIcon,
    required this.latitude,
    required this.longitude,
    this.onCurrentPosition,
    this.onTapMap,
    this.onChangedSearch,
    required this.sufixOnTapSearch,
    required this.urlTemplate,
    required this.userAgentPackageName,
  });

  @override
  State<AddressSelectMap> createState() => _AddressSelectMapState();
}

class _AddressSelectMapState extends State<AddressSelectMap> {
  final MapController _mapController = MapController();

  @override
  void didUpdateWidget(covariant AddressSelectMap oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.latitude != widget.latitude ||
        oldWidget.longitude != widget.longitude) {
      _mapController.move(
        LatLng(widget.latitude, widget.longitude),
        16,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: SizeToken.sm,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            SizedBox(
              height: 350,
              width: double.infinity,
              child: FlutterMap(
                mapController: _mapController,
                options: MapOptions(
                  initialCenter: LatLng(widget.latitude, widget.longitude),
                  initialZoom: 15.5,
                  onTap: (_, point) => widget.onTapMap?.call(point),
                ),
                children: [
                  TileLayer(
                    urlTemplate: widget.urlTemplate,
                    userAgentPackageName: widget.userAgentPackageName,
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: LatLng(widget.latitude, widget.longitude),
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
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(SizeToken.sm),
                child: InputSearch(
                  hintText: widget.searchHintText,
                  prefixIcon: widget.searchPrefixIcon,
                  sufixIcon: widget.searchSufixIcon,
                  onChanged: widget.onChangedSearch,
                  sufixOnTap: widget.sufixOnTapSearch,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(SizeToken.sm),
                child: InkWell(
                  onTap: widget.onCurrentPosition,
                  child: Container(
                    width: SizeToken.xl3,
                    height: SizeToken.xl3,
                    decoration: BoxDecoration(
                      color: ColorToken.danger,
                      borderRadius: BorderRadius.circular(SizeToken.xs),
                    ),
                    alignment: Alignment.center,
                    child: IconLargeLigth(
                      icon: widget.currentLocalIcon,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
