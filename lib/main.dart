import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); //instancia do widget MyApp. o const otimiza
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  int count = 0;

  void decrement() {
    setState(() {
      count --;
    });

    print(count);
  }

  void increment() {

    setState(() {
      count ++;
    });

    print(count);
  }
//variaveis abaixo do tipo boleano para validar os cliques dos botões
  bool get isEmpty => count == 0;
  bool get isFull => count == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/image.jpeg'),
                fit: BoxFit.cover
            )
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
             isFull ? 'Lotado' :  'Pode Entrar',
              style: const TextStyle(
                  fontSize: 30, fontWeight: FontWeight.w800, color: Colors.white),
            ),
            const  SizedBox(height: 40),

            Text(
              count.toString(),
              style: const TextStyle(fontSize: 100, color: Colors.white),
            ),

            const  SizedBox(height: 40),  //afastamento dos botões
            Row(
              //Graças a esta Row, o alinhamento solicitado antes, funcionou
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: isEmpty ? null : decrement,
                  style: TextButton.styleFrom(
                    //adicionado uma condição isEmpty com um operador ternário
                    backgroundColor:isEmpty ? Colors.white.withOpacity(0.2) : Colors.white,
                    fixedSize: const Size(100, 100),
                    primary: Colors.black, // cor do toque ao pressionar
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    // padding: const EdgeInsets.all(32)
                  ),



                  child:  Text(
                    'Saiu',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),

                const  SizedBox(width: 32), // afasta os botões

                TextButton(
                  onPressed: isFull ? null : increment,
                  style: TextButton.styleFrom(
                    backgroundColor: isFull ? Colors.white.withOpacity(0.2) : Colors.white,
                    fixedSize: const Size(100, 100),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    //padding: const EdgeInsets.all(32)
                  ),
                  child: const Text(
                    'Entrou',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }




}
