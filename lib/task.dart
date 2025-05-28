import 'package:flutter/material.dart';


class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('New Task',
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.w400,
            color:Color(0xffFFFCFC)
        ),
        ) ,
        backgroundColor:Color(0xff181818),
        foregroundColor:Color(0xffFFFCFC) ,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Task Name',style: Theme.of(context).textTheme.displaySmall?.copyWith(
              color: Color(0xffFFFCFC),
              fontSize: 20,
              fontWeight: FontWeight.w400
            ),),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                decoration: InputDecoration(
                  fillColor: Color(0xff282828),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none
                  ),
                  hintText: 'Finish UI design for login screen',
                  hintStyle: TextStyle(
                      fontSize: 22
                  ),
                ),

              ),
            ),
            SizedBox(height: 30,),
            Text('Task Description',style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: Color(0xffFFFCFC),
                fontSize: 20,
                fontWeight: FontWeight.w400
            ),),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                maxLines: 5,
                decoration: InputDecoration(
                  fillColor: Color(0xff282828),
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none
                  ),
                  hintText: 'inish onboarding UI and hand off to devs by Thursday.',
                  hintStyle: TextStyle(
                      fontSize: 22
                  ),
                ),

              ),
            ),
            SizedBox(height: 150,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10

              ),
              child: SizedBox(
                width:double.infinity ,
                height: 40,
                child: ElevatedButton.icon(onPressed: (){},
                   label:Text('Add Task') ,
                  icon: Icon(Icons.add),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff15B86C),
                    foregroundColor: Color(0xffFFFCFC)
                  ),

                ),

              ),
            )
          ],
        ),
      ),
    );
  }
}
