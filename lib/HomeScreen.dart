import 'package:flutter/material.dart';
import 'package:task2/task.dart';

class TaskPage  extends StatelessWidget {
  const TaskPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 70,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Image.asset('assets/images/Thumbnail.png',
                width: 42,
                  height: 42,
                ),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Good Evening ,Usama',
                        style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: Color(0xffFFFCFC)
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text('One task at a time.One step\n closer',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontSize: 16,
                        color: Color(0xffC6C6C6)
                      ),
                      )

                    ],
                  )
              ],),
            ),
            SizedBox(height:50 ,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Yuhuu ,Your work Is',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffFFFCFC)
                  ),
                  ),
                  Row(
                    children: [
                      Text('almost done !',
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: 32,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffFFFCFC))
                      ),
                      SizedBox(width: 5,),
                      Image.asset('assets/images/wave.png')
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton:FloatingActionButton.extended(
        onPressed: (){
          Navigator.push(context,
              MaterialPageRoute(
                  builder: (builder)=>AddTask()));
        },
        backgroundColor: Color(0xff15B86C),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100)
        ),
        label: Text('Add New Task'),
        icon: Icon(Icons.add),
        foregroundColor: Color(0xffFFFCFC),
        
      ) ,

    );
  }
}
