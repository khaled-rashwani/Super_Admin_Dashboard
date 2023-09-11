import 'package:flutter/material.dart';

import '../create_categories/create_categories.dart';
import '../shared/components/components.dart';
import '../../project_shared/constants.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  '     Total Categories : 105',
                  style: TextStyle(
                      fontWeight: FontWeight.w300, color: Colors.grey),
                ),
              ),
              defaultCreatebuttom(label: 'Create New Category', onTap: () {
                navigateTo(context, CreateCategoriesScreen());
              }),
            ],
          ),
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
                        width: 130,
                        child: const Text(
                          'Category Name',
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
                          'SubCategories Number',
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
          ),
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
                              child: Image.asset(
                                'assets/images/logo.png',
                                width: 55,
                              ),
                            )),
                        Flexible(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.center,
                              width: 130,
                              child: Text(
                                'T-shirt',
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
                                '5',
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
              itemCount: 10,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 10,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
