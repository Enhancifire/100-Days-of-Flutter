import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.func,
    required this.value,
    required this.index,
    required this.title,
    required this.desc,
  });
  final Function func;
  final bool value;
  final int index;
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Color(0xFFA7CCED),
        // color: Color(0xFF8789C0),
        child: SizedBox(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 20,
                        decoration: value
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    Text(
                      desc,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Transform.scale(
                  scale: 2,
                  child: Checkbox(
                      value: value,
                      onChanged: (val) {
                        func(index, val);
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
