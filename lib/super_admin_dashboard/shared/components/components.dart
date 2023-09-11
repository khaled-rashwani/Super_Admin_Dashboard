import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../project_shared/constants.dart';


class MyCard extends StatelessWidget {
  const MyCard(
      {Key? key, required this.text, required this.icon, required this.Num})
      : super(key: key);
  final String text;
  final IconData icon;
  final String Num;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: myLightBG,
          boxShadow: [BoxShadow(color: primaryColor, blurRadius: 10)]),
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Container(
              //  alignment: Alignment.center,
              child: Text(
                text,
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 30,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  Num,
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



Widget defaultCreatebuttom({required label, required onTap,width,height =45}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                label,
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ),
        onTap: onTap),
  );
}

Widget defaultFormField({
  required label,
  required prefixIcon,
  onChanged,
  onSubmit,
  onTap,
  suffixIcon,
  isPassword = false,
}) {
  return TextFormField(
    obscureText: isPassword,
    onChanged: onChanged,
    onFieldSubmitted: onSubmit,
    decoration: InputDecoration(
        labelText: label,
        prefix: prefixIcon,
        suffix: suffixIcon,
        border: OutlineInputBorder()),
  );
}

// Widget defaultFormField(
//     {required TextEditingController controller,
//       Function? onChanged,
//       Function? onSubmit,
//       Function? onTap1,
//       required Function validator,
//       required String lable,
//       required IconData prefix,
//       IconData? suffix,
//       bool isPassword = false}) =>
//     TextFormField(
//       controller: controller,
//       onFieldSubmitted: (value) {
//         onSubmit;
//       },
//       onChanged: (String? value) {
//         onChanged;
//       },
//       onTap: () {
//         onTap1!();
//       },
//       validator: (value) {
//         validator;
//       },
//       obscureText: isPassword,
//       decoration: InputDecoration(
//         prefixIcon: Icon(
//           prefix,
//         ),
//         suffixIcon: suffix != null
//             ? Icon(
//           suffix,
//         )
//             : null,
//         labelText: lable,
//         border: OutlineInputBorder(),
//       ),
//     );

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));


void NavigateAndFinish(context,screen)
{
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => screen),
          (Route<dynamic> route) => false,
      );
}
