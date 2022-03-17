import 'package:cached_network_image/cached_network_image.dart';
import 'package:employee_details/constants/color_path.dart';
import 'package:employee_details/modules/employee_details/employee_details_model.dart';
import 'package:flutter/material.dart';
import '../../constants/asset_path.dart';

class EmployeeDetailPage extends StatefulWidget {
  const EmployeeDetailPage({Key? key, this.employeeDetails}) : super(key: key);
  static const routeName = '/employee';
  final EmployeeDetails? employeeDetails;

  @override
  _EmployeeDetailPageState createState() => _EmployeeDetailPageState();
}

class _EmployeeDetailPageState extends State<EmployeeDetailPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Employee Details",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.darkTextColor),
          ),
          backgroundColor: Colors.white,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: AppColors.darkTextColor,
              )),
        ),
        body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 200),
              child: getEmployeeDetails()),
        ));
  }

  Widget getEmployeeDetails() {
    return Container(
        height: 450,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
        ),
        child: Card(
          // borderOnForeground: true,
          elevation: 10,
          child: Stack(
            clipBehavior: Clip.none,
            overflow: Overflow.visible,
            alignment: Alignment.center,
            children: [
              Positioned(
                top: -120,
                left: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 80.0,
                  backgroundColor: AppColors.lightBlue,
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: widget.employeeDetails!.profileImage ?? '',
                      width: MediaQuery.of(context).size.width /2.6,
                      height: MediaQuery.of(context).size.height / 5.75,
                      fit: BoxFit.fill,
                      placeholder: (context, url) => Image.asset(
                        AppImages.placeHolderImage,
                        width: MediaQuery.of(context).size.width / 4,
                        height: MediaQuery.of(context).size.height / 7,
                        fit: BoxFit.contain,
                      ),
                      errorWidget: (context, url, error) => Image.asset(
                        AppImages.placeHolderImage,
                        width: MediaQuery.of(context).size.width / 4,
                        height: MediaQuery.of(context).size.height / 7,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 50,
                right: 50,
                left: 50,
                child: Text(
                  widget.employeeDetails!.name.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 19,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Positioned(
                top: 70,
                right: 50,
                left: 50,
                child: Divider(color: Colors.black),
              ),
              Positioned(
                top: 90,
                right: 50,
                left: 50,
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "User name: ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        widget.employeeDetails!.username.toString(),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "E-mail: ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        widget.employeeDetails!.email.toString(),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Website: ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        widget.employeeDetails!.website.toString(),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Phone: ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        widget.employeeDetails!.phone.toString(),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "City: ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        widget.employeeDetails!.address!.city.toString(),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Suite: ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        widget.employeeDetails!.address!.suite.toString(),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Street: ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        widget.employeeDetails!.address!.street.toString(),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Zipcode: ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        widget.employeeDetails!.address!.zipcode.toString(),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Company: ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        widget.employeeDetails!.company!.name == null
                            ? "Not Available"
                            : widget.employeeDetails!.company!.name.toString(),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Text(
                          "Company phrase: ",
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          widget.employeeDetails!.company!.catchPhrase == null
                              ? "Not Available"
                              : widget.employeeDetails!.company!.catchPhrase
                                  .toString(),
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Text(
                          "Company bs: ",
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          widget.employeeDetails!.company!.bs == null
                              ? "Not Available"
                              : widget.employeeDetails!.company!.bs.toString(),
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Divider(color: Colors.black),
                ]),
              ),
            ],
          ),
        ));
  }
}
