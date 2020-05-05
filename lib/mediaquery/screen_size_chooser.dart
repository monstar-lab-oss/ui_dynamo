import 'package:flutter/material.dart';
import 'package:flutter_storybook/mediaquery/mediaquery.dart';

class MediaChooserButton extends StatelessWidget {
  final Function(DeviceInfo) deviceSelected;
  final DeviceInfo selectedDevice;

  const MediaChooserButton({
    Key key,
    @required this.deviceSelected,
    @required this.selectedDevice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      tooltip: 'Choose Preview Window Size',
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(deviceDisplay(context, selectedDevice)),
          Icon(
            selectedDevice.iconForCategory,
            color: Theme.of(context).iconTheme.color,
          ),
        ],
      ),
      onSelected: deviceSelected,
      itemBuilder: (BuildContext context) => [
        ...deviceSizes.values.map(
          (key) => buildDeviceOption(context, key, selectedDevice),
        ),
      ],
    );
  }

  PopupMenuItem<DeviceInfo> buildDeviceOption(
      BuildContext context, DeviceInfo deviceInfo, DeviceInfo selectedDevice) {
    return CheckedPopupMenuItem(
      checked: selectedDevice == deviceInfo,
      value: deviceInfo,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(deviceInfo.iconForCategory),
          SizedBox(
            width: 15,
          ),
          Flexible(
            child: Text(
              deviceDisplay(context, deviceInfo),
              style: TextStyle(fontSize: 12.0),
            ),
          ),
        ],
      ),
    );
  }
}