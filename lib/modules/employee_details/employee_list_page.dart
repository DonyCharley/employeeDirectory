
import 'package:cached_network_image/cached_network_image.dart';
import 'package:employee_details/modules/employee_details/employee_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../constants/asset_path.dart';
import '../../constants/color_path.dart';
import '../../utils/common_widgets/common_widgets.dart';
import '../../utils/services/api/api_providers.dart';
import 'loading_error.dart';
import 'employee_details_loading.dart';

class EmployeeListPage extends StatefulWidget {
  const EmployeeListPage({Key? key}) : super(key: key);

  @override
  _EmployeeListPageState createState() => _EmployeeListPageState();
}

class _EmployeeListPageState extends State<EmployeeListPage> {
  String? searchText = '';
  List<dynamic> employeeDetails = List.empty(growable: true);

  @override
  void initState() {
    SchedulerBinding.instance!.addPostFrameCallback((_) async {
      context
          .read(employeeDetailsNotifier.notifier)
          .getEmployeeDetails(init: true);
    });

    super.initState();
  }
  Future<bool> _onAppExit() async {
    // FlutterRingtonePlayer.stop();
    return await showDialog(
        context: context,
        builder: (BuildContext context) => exitDialogWidget(context));
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return WillPopScope(
      onWillPop: _onAppExit,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "Employee Directory",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkTextColor),
            ),
            backgroundColor: Colors.white,
            leading: InkWell(
                onTap: () {
                  _onAppExit();
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: AppColors.darkTextColor,
                )),
          ),
          body: SafeArea(
              child: Column(children: [
            const SizedBox(
              height: 20,
            ),
            buildSearchBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Consumer(builder: (context, watch, child) {
              final state = watch(employeeDetailsNotifier);

              if (state.isLoading) {
                return const EmployeeDetailsLoading();
              } else if (state.isError) {
                return LoadingError(
                  onPressed: (res) {
                    reloadData(init: true, context: res);
                  },
                  message: state.errorMessage.toString(),
                );
              } else {

                employeeDetails = state.response;

                return Column(
                  children: getEmployeeListWidget(context, state.response),
                );
              }
                }),
              ),
            )
          ]))),
    );
  }

  Widget buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      height: MediaQuery.of(context).size.width / 6,
      child: TextFormField(
        textCapitalization: TextCapitalization.sentences,
        onChanged: (String? s) {
          setState(() {
            searchText = s;
          });
        },
        style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 14),

        decoration: InputDecoration(
          //contentPadding:EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.redRestaurantThemeColor,
            size: MediaQuery.of(context).size.width / 20,
          ),
          hintText: "Search by Employee name/e-mail",
          hintStyle: TextStyle(
              fontSize: MediaQuery.of(context).size.width / 26,
              fontWeight: FontWeight.w400,
              color: AppColors.redRestaurantThemeColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          fillColor: const Color(0xffFCE7E5),
          filled: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        ),
      ),
    );
  }

  reloadData({required BuildContext context, bool? init}) {
    return context.read(employeeDetailsNotifier.notifier).getEmployeeDetails();
  }

  List<Widget> getEmployeeListWidget(context, List<dynamic> employee) {
    List<Widget> _widgetFood = [];

    for (int i = 0; i < employee.length; i++) {
      if (employee[i].name.toLowerCase().contains(searchText!.toLowerCase()) ||
          employee[i].email.toLowerCase().contains(searchText!.toLowerCase())) {
        _widgetFood.add(InkWell(
          onTap: () {

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EmployeeDetailPage(
                          employeeDetails: employee[i],
                        )));
          },
          child: Padding(
              padding: const EdgeInsets.only(left: 1, top: 0),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                      // padding: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(0, 3.0),
                              color: Color(0xfff0f0f0),
                              blurRadius: 10.0,
                              spreadRadius: 3.0,
                            )
                          ]),
                      child: Row(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25.0),
                                child: CachedNetworkImage(
                                  imageUrl: employee[i].profileImage ?? '',
                                  width: MediaQuery.of(context).size.width / 4,
                                  height:
                                      MediaQuery.of(context).size.height / 9,
                                  fit: BoxFit.fill,
                                  placeholder: (context, url) => Image.asset(
                                    AppImages.placeHolderImage,
                                    width:
                                        MediaQuery.of(context).size.width / 4,
                                    height:
                                        MediaQuery.of(context).size.height / 7,
                                    fit: BoxFit.contain,
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Image.asset(
                                    AppImages.placeHolderImage,
                                    width:
                                        MediaQuery.of(context).size.width / 4,
                                    height:
                                        MediaQuery.of(context).size.height / 7,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Row(
                                      // mainAxisAlignment: MainAxisAlignment.center,
                                      // crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            employee[i].name ?? "",
                                            style: const TextStyle(
                                                color: AppColors
                                                    .shopAndItemNameColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                            // textAlign: TextAlign.center,
                                            // maxLines: 2,
                                            overflow: TextOverflow.clip,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "e-mail : " + employee[i].email.toString(),
                                    overflow: TextOverflow.clip,
                                    style: const TextStyle(
                                        color: Color(0xff9B9B9B),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Company : " +
                                        employee[i].company.name.toString(),
                                    overflow: TextOverflow.clip,
                                    style: const TextStyle(
                                        color: Color(0xff9B9B9B),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ]))
                          ])))),
        ));
      }
    }

    return _widgetFood;
  }
}


