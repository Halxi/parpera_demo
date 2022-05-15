import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parpera_demo/src/domain/entities/launch.dart';
import 'package:parpera_demo/src/domain/entities/rocket.dart';

import '../../core/utils/datetime_utils.dart';
import '../../core/utils/utlis_helper.dart';
import '../widgets/widget_helper.dart';

class LaunchDetailScreen extends StatefulWidget {
  final Launch launch;

  const LaunchDetailScreen({Key? key, required this.launch}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LaunchDetailState();
}

class LaunchDetailState extends State<LaunchDetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(widget.launch.name,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
              textScaleFactor: 1.0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.launch.largeMissionPatch != null
                  ? Image.network(
                      widget.launch.largeMissionPatch!,
                      fit: BoxFit.fill,
                      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                        return WidgetHelper.imageLoadingBuilder(loadingProgress, child);
                      },
                    )
                  : Container(),
              const SizedBox(height: 10,),
              Text('Mission Name: ${widget.launch.name}'),
              Text('Launch Date: ${DateTimeUtils.getDateTimeBasedOnString(widget.launch.fireUTCDate)}'),
              Text('Launch Site: ${widget.launch.launchPad!.name}'),
              Text(
                'Status: ${UtilsHelper.parseBoolToString(widget.launch.status)}',
                style: TextStyle(
                    color: widget.launch.status == null
                        ? Colors.white
                        : widget.launch.status == true
                            ? Colors.green
                            : Colors.red),
              ),
              Text('Rocket Name: ${widget.launch.rocket!.name}'),
              Text('Rocket Country: ${widget.launch.rocket!.country}'),
              Text('Rocket Manufacturer: ${widget.launch.rocket!.manufacturer}'),
            ],
          ),
        ),
      ),
    );
  }
}
