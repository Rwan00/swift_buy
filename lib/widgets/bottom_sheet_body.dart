import 'package:flutter/material.dart';
import 'package:swift_buy_/theme/body_theme.dart';
import 'package:swift_buy_/theme/fonts.dart';

class BottomSheetBody extends StatelessWidget {
  const BottomSheetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context,index){
        return Container(
          color: Colors.grey[300],
          padding: EdgeInsets.all(8),

          child: Card(
            shadowColor: lightPurple,
            elevation: 10,
            child: Row(

              children: [
                SizedBox(
                  height: 87,
                  width: 137,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: FadeInImage(
                      placeholder: const AssetImage(
                          "assets/images/sign.jpg"),
                      image: NetworkImage(
                          "https://student.valuxapps.com/storage/uploads/categories/1630142480dvQxx.3658058.jpg"
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Text("Electronics",style: titleStyle,),
                Spacer(),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
        );
      },
    );
  }
}