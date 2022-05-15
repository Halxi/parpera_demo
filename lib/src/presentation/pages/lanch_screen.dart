import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parpera_demo/src/core/utils/constants.dart';
import 'package:parpera_demo/src/core/utils/datetime_utils.dart';
import 'package:parpera_demo/src/core/utils/utlis_helper.dart';
import 'package:parpera_demo/src/core/utils/widget_keys.dart';
import 'package:parpera_demo/src/domain/entities/launch.dart';
import 'package:parpera_demo/src/presentation/bloc/launch_list_bloc.dart';
import 'package:parpera_demo/src/presentation/pages/launch_detail_screen.dart';

import '../widgets/widget_helper.dart';

class LaunchScreenView extends StatefulWidget {
  const LaunchScreenView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LaunchScreenState();
}

class LaunchScreenState extends State<LaunchScreenView> {
  late final LaunchListBloc _launchListBloc;

  List<Launch> _launchList = [];
  List<Launch> _filteredLaunchList = [];
  TextEditingController controller = TextEditingController();

  bool _isLoading = true;
  String _searchResult = '';

  @override
  void initState() {
    _launchListBloc = BlocProvider.of<LaunchListBloc>(context);
    _launchListBloc.add(GetData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LaunchListBloc, LaunchListState>(listener: (context, state) async {
      if (state is LoadingErrorState) {
        WidgetHelper.displaySnackBar(context, state.errorMsg, true);
      }
      if (state is DisplayLaunchDetailState) {
        _isLoading = false;

        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => LaunchDetailScreen(launch: state.launch),
        ));
      }
    }, builder: (context, state) {
      if (state is DataLoadingState) {
        _isLoading = true;
      }
      if (state is LoadingSuccessState) {
        _isLoading = false;
        _filteredLaunchList = _launchList = state.launchList;
      }
      if (state is LoadingErrorState) {
        return Center(
          child: Text(state.errorMsg, textScaleFactor: 1.0),
        );
      }

      return Scaffold(
        resizeToAvoidBottomInset: true,
        key: const Key(WidgetKeys.homeScreenScaffoldKey),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          titleSpacing: 0,
          automaticallyImplyLeading: true,
          title: const Center(
            child: Text('Parpera Demo',
                key: Key(WidgetKeys.homeScreenTitleTextKey),
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
                textScaleFactor: 1.0),
          ),
        ),
        body: SafeArea(
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    _searchBar(),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        showCheckboxColumn: false,
                        columns: _getDataColumn(),
                        rows: _buildRowsList(),
                      ),
                    ),
                  ],
                ),
              ),
              if (_isLoading)
                const Center(
                  heightFactor: 1.0,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ),
            ],
          ),
        ),
      );
    });
  }

  List<DataColumn> _getDataColumn() {
    List<DataColumn> list = [];
    list.addAll(kLaunchCategories.map((e) => DataColumn(
            label: Center(
          child: Text(e.toString(), style: TextStyle(color: Theme.of(context).primaryColor), textScaleFactor: 1.0),
        ))));
    return list;
  }

  List<DataRow> _buildRowsList() {
    List<DataRow> rowsList = [];
    rowsList.addAll(_filteredLaunchList.map((e) => _buildLaunchRows(e)).toList());
    return rowsList;
  }

  DataRow _buildLaunchRows(Launch launch) {
    return DataRow(
        cells: [
          DataCell(launch.smallMissionPatch != null
              ? Center(
                  child: Image.network(
                    launch.smallMissionPatch!,
                    width: 50,
                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                      return WidgetHelper.imageLoadingBuilder(loadingProgress, child);
                    },
                  ),
                )
              : Container()),
          DataCell(_buildRowValue(launch.name)),
          DataCell(_buildRowValue(DateTimeUtils.getDateTimeBasedOnString(launch.fireUTCDate).toString())),
          DataCell(_buildRowValue(UtilsHelper.parseBoolToString(launch.status))),
        ],
        color: MaterialStateColor.resolveWith((states) => launch.status == null
            ? Colors.white
            : launch.status == true
                ? Colors.green
                : Colors.red),
        onSelectChanged: (_) {
          _launchListBloc.add(OnLaunchSelectedEvent(launch));
        });
  }

  Widget _buildRowValue(String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Text(value,
          maxLines: 1, textAlign: TextAlign.left, style: const TextStyle(fontSize: 12), textScaleFactor: 1.0),
    );
  }

  Widget _searchBar() {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.search),
        title: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Search By Rocket Name', border: InputBorder.none),
            onChanged: (value) {
              setState(() {
                _searchResult = value;
                _filteredLaunchList = _launchList
                    .where((launch) =>
                        launch.rocket != null &&
                        launch.rocket!.name.toUpperCase().contains(_searchResult.toUpperCase()))
                    .toList();
              });
            }),
        trailing: IconButton(
          icon: const Icon(Icons.cancel),
          onPressed: () {
            setState(() {
              controller.clear();
              _searchResult = '';
              _filteredLaunchList = _launchList;
            });
          },
        ),
      ),
    );
  }
}
