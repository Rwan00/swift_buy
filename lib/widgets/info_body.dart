import 'package:flutter/material.dart';

import 'info_container.dart';

class InfoBody extends StatelessWidget {
  const InfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InfoContainer(label: 'UserName',content: "Rwan",),
        InfoContainer(label: 'Email',content: "rwanbdalrhym948@gmail.com",),
        InfoContainer(label: 'Phone',content: "01281834730",),
        InfoContainer(label: 'Location',content: "Alexandria",),
        SizedBox(height: 10,)
      ],
    );
  }
}
