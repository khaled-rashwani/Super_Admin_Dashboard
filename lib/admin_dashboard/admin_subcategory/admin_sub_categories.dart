import 'package:flutter/material.dart';
import 'package:super_admin_dashboard/project_shared/network/dio.dart';
import '../../project_shared/constants.dart';
import '../category_model.dart';


class AdminSubCategoriesScreen extends StatelessWidget {
  Data subcategories = Data();


  AdminSubCategoriesScreen(subcategories) {
    this.subcategories = subcategories;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 100,
                  child: Text(
                    '     Total SubCategories : ' + subcategories.children!.length.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.w300, color: Colors.grey),
                  ),
                ),
              ],
            ),
            subcategories.children!.length !=0 ?
            Container(
              height: 80,
              width: double.infinity,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                        flex: 1,
                        child: Container(
                            alignment: Alignment.center,
                            width: 130,
                            child: Text(
                              '#ID',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ))),
                    Flexible(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.center,
                          width: 130,
                          child: const Text(
                            'Image',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )),
                    Flexible(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.center,
                          width: 160,
                          child: const Text(
                            'SubCategory Name',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )),
                    Flexible(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.center,
                          width: 180,
                          child: const Text(
                            'Products Number',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )),
                    Flexible(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.center,
                          width: 130,
                          child: const Text(
                            'Actions',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )),
                    SizedBox(),
                  ],
                ),
              ),
            )
            :
            Center(child: Text('There is no subcategory here!!')),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    height: 80,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: myLightBG,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                              flex: 1,
                              child: Container(
                                  alignment: Alignment.center,
                                  width: 130,
                                  child: Text(
                                    '#$index',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ))),
                          Flexible(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.center,
                                width: 130,
                                child: Image.asset('assets/images/logo.png',width: 55,),
                                // child: Image.network(
                                //   baseUrl+subcategories.children![index].image.toString(),
                                //   width: 55,
                                // ),
                              )),
                          Flexible(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.center,
                                width: 160,
                                child: Text(
                                  subcategories.children![index].name.toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )),
                          Flexible(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.center,
                                width: 180,
                                child: Text(
                                  subcategories.children![index].products!.length.toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )),
                          Flexible(
                              flex: 1,
                              child: Container(
                                  alignment: Alignment.center,
                                  width: 130,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(onPressed: () {},
                                          icon: Icon(
                                            Icons.edit, color: Colors.grey,)),
                                      SizedBox(width: 20,),
                                      IconButton(onPressed: () {},
                                          icon: Icon(
                                            Icons.delete, color: Colors.red,)),
                                    ],
                                  )
                              )),
                          SizedBox(),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: subcategories.children!.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 10,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
