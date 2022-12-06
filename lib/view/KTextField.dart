
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../controller/userdetailscontroller.dart';

class KTextField extends StatelessWidget {
   KTextField({required this.textcontroller});
 TextEditingController textcontroller;
  @override
  Widget build(BuildContext context) {
    return Consumer(
            builder: (context,UserDetailsController controller,_) {
              return  
     TextFormField(
              controller:textcontroller,
              onChanged: ((value) {
                 controller.build();
              }),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Search Users",
                  prefixIcon: Padding(
                    padding:
                      const   EdgeInsets.symmetric(vertical: 16 * 0.75),
                    child: SvgPicture.asset(
                      "assets/Search.svg",
                      height: 24,
                      width: 24,
                      color: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .color!
                          .withOpacity(0.3),
                    ),
                  ),
                ),
              );
            });}
}
