import 'package:flutter/material.dart';
import 'package:task2/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: Color(0xff181818),
        textTheme: TextTheme(
          displaySmall: TextStyle(
            color: Color(0xffffffff),
            fontSize: 28,
            fontWeight: FontWeight.w400
          ),
          bodyLarge:TextStyle(
            color: Color(0xffffffff),
          fontSize: 28,
          fontWeight: FontWeight.w400,
      ),
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height:70 ,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/Vector.png',
                    width: 42,
                      height: 42,
                    ),
                    SizedBox(width: 10,),
                    Text('Tasky',style:Theme.of(context).textTheme.displaySmall ,),
                  ],
                ),
                SizedBox(height: 100,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Welcome To Tasky',style: Theme.of(context).textTheme.bodyLarge,),
                    SizedBox(width: 10,),
                    Image.asset('assets/images/wave.png')
                  ],
                ),
                SizedBox(height: 20,),
                Text('Your productivity journey starts here',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 3
                ),
                ),
                SizedBox(height: 20,),
                Image.asset("assets/images/pana.png",
                width: 215,
                  height: 204.39,
                ),
                SizedBox(height: 30,),

              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0), // عشان يكون في مسافة من الطرف
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Full Name',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    decoration: InputDecoration(
                      fillColor: Color(0xff282828),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none
                      ),
                      hintText: 'e.g Mahmoud Shrief',
                      hintStyle: TextStyle(
                        fontSize: 25
                      ),
                    ),

                  ),
                )
              ],
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width:double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(context,MaterialPageRoute(
                        builder: (context)=>TaskPage()
                      
                    ));
                  },
                style:ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff15B86C),
                ),
                  child: Text('Let’s Get Started',
                  style: TextStyle(
                    color: Color(0xffFFFCFC),
                    fontWeight: FontWeight.w500
                  ),
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
