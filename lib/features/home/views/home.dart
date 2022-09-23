import 'package:cached_network_image/cached_network_image.dart';
import 'package:deip/features/home/models/home_model.dart';
import 'package:deip/features/payment/payment_details.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.data});
  final List data;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<HomeModel> collectionData = [];
  @override
  void initState() {
    super.initState();

    //Configure list
    configureList();
  }

  configureList() {
    collectionData =
        widget.data.map((tagJson) => HomeModel.fromJson(tagJson)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Collections',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.grey[50],
        elevation: 0,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: collectionData.length,
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Card(
              elevation: 2,
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PaymentDetails(
                              selectedModel: collectionData[index],
                            )),
                  );
                },
                leading: CachedNetworkImage(
                  imageUrl: collectionData[index].logoUrl.toString(),
                  height: 10.h,
                  imageBuilder: (context, imageProvider) => Container(
                    width: 15.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.contain),
                    ),
                  ),
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                contentPadding: EdgeInsets.all(1.h),
                title: Text(
                  '${collectionData[index].name}',
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 1.8.h,
                  ),
                ),
                subtitle: Text('${collectionData[index].description}'),
              ),
            );
          },
        ),
      ),
    );
  }
}
