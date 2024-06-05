import 'package:calculadorafinanceira/my_textfild.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}
// um statelessWidhget é uma classe flutter que representa uma classe
// widget sem estado. ou seja uma widget que nao guarda informação enquanto
// esta em execução. uma vez criada ela nao pode ser alterada, a menos que
// seja reconstruido
class MyApp extends StatelessWidget {
   MyApp({super.key});
// "class MyApp extends StatelessWidget" indica que MyApp é uma subclasse de StatelessWidget
// oq significa que "myApp" esta herdando toda propriedade e método dele
// "const MyApp({super.Key}); indica que o "MyApp" é um construtor constante
// a key serve para identificar as Widgets de forma única na árvore de widget, passando o o key para a superclasse(pai)

  // Este widget é a raiz da sua aplicação.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // Este é o tema da sua aplicação.
        //
        // TENTE ISSO: Tente executar sua aplicação com "flutter run". Você verá
        // que a aplicação tem uma barra de ferramentas azul. Então, sem sair do app,
        // tente mudar a seedColor no esquema de cores abaixo para Colors.green
        // e depois invoque o "hot reload" (salve suas mudanças ou pressione o botão de "hot
        // reload" em um IDE que suporte Flutter, ou pressione "r" se você iniciou
        // o app pela linha de comando).
        //
        // Note que o contador não reiniciou para zero; o estado da aplicação
        // não é perdido durante o reload. Para reiniciar o estado, use o hot
        // restart.
        //
        // Isto funciona para código também, não apenas valores: A maioria das mudanças no código pode ser
        // testada com apenas um hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home:  MyHomePage(title: 'Calculo de Juros Compostos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
   MyHomePage({super.key, required this.title});

  // Este widget é a página inicial da sua aplicação. Ele é stateful, o que significa
  // que ele tem um objeto de estado (definido abaixo) que contém campos que afetam
  // como ele se parece.

  // Esta classe é a configuração para o estado. Ela mantém os valores (neste
  // caso o título) fornecidos pelo pai (neste caso o widget App) e
  // utilizados pelo método build do State. Camimport 'package:flutter/cupertino.dart';
  // import 'package:flutter/material.dart';
  //
  // void main() {
  //   runApp(const MyApp());
  // }
  //
  // class MyApp extends StatelessWidget {
  //   const MyApp({Key? key}) : super(key: key);
  //
  //   @override
  //   Widget build(BuildContext context) {
  //     return CupertinoApp(
  //       title: 'Flutter Demo',
  //       home: const MyHomePage(title: 'Flutter Demo Home Page'),
  //     );
  //   }
  // }
  //
  // class MyHomePage extends StatelessWidget {
  //   const MyHomePage({Key? key, required this.title}) : super(key: key);
  //
  //   final String title;
  //
  //   @override
  //   Widget build(BuildContext context) {
  //     return CupertinoPageScaffold(
  //       navigationBar: CupertinoNavigationBar(
  //         middle: Text(title),
  //       ),
  //       child: Center(
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: const <Widget>[
  //             Text(
  //               'You have pushed the button this many times:',
  //             ),
  //             Text(
  //               '0',
  //               style: TextStyle(fontSize: 24),
  //             ),
  //           ],
  //         ),
  //       ),
  //     );
  //   }
  // }pos em uma subclasse de Widget são
  // sempre marcados como "final".

  final String title;
  final valorfuturoController = TextEditingController();
  final valorinicialController = TextEditingController();
  final taxadejurosanualController = TextEditingController();
  final tempoController = TextEditingController();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
//State<MyHomePage> especifica o estado que será gerenciado pelo widget
//_MyHomePageState é uma classe que extende do State<MyHomePage>
// ou seja o _MyhomePageState é responsavel pelo estado interno das widgets do MyHoemPage
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // Esta chamada para setState informa ao framework Flutter que algo mudou
      // neste State, o que faz com que ele rode novamente o método build abaixo
      // para que a exibição possa refletir os valores atualizados. Se mudássemos
      // _counter sem chamar setState(), então o método build não seria
      // chamado novamente, e nada pareceria acontecer.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Este método é executado novamente toda vez que setState é chamado, por exemplo, como feito
    // pelo método _incrementCounter acima.
    //
    // O framework Flutter foi otimizado para tornar a execução de métodos build
    // rápida, para que você possa simplesmente reconstruir qualquer coisa que precise ser atualizada
    // ao invés de ter que mudar instâncias individuais de widgets.
    return Scaffold(
      appBar: AppBar(
        // TENTE ISSO: Tente mudar a cor aqui para uma cor específica (para
        // Colors.amber, talvez?) e acione um hot reload para ver a AppBar
        // mudar de cor enquanto as outras cores permanecem as mesmas.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Aqui pegamos o valor do objeto MyHomePage que foi criado pelo
        // método App.build, e usamos para definir o título da nossa AppBar.
        title: Text(widget.title),
      ),
      body: Center(
        // Center é um widget de layout. Ele pega um único filho e o posiciona
        // no meio do pai.
        child: Column(
          // Column também é um widget de layout. Ele pega uma lista de filhos e
          // os organiza verticalmente. Por padrão, ele se dimensiona para caber
          // seus filhos horizontalmente, e tenta ser tão alto quanto seu pai.
          //
          // Column tem várias propriedades para controlar como ele se dimensiona e
          // como ele posiciona seus filhos. Aqui usamos mainAxisAlignment para
          // centralizar os filhos verticalmente; o eixo principal aqui é o eixo vertical
          // porque Column é vertical (o eixo cruzado seria o
          // horizontal).
          //
          // TENTE ISSO: Invoque "debug painting" (escolha a ação "Toggle Debug Paint"
          // no IDE, ou pressione "p" no console), para ver o
          // wireframe de cada widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            const SizedBox(height: 25),
            MyTextFild(
              controller: widget.valorfuturoController,
              hintText: "Valor Futuro",
              obscureText: false,
            ),
            const SizedBox(height: 10),
            MyTextFild(
              controller: widget.valorinicialController,
              hintText: "Valor Inicial",
              obscureText: false,
            ),
           const SizedBox(height:10),
           MyTextFild(
               controller: widget.taxadejurosanualController,
               hintText: "Taxa de juros anual em decimal",
               obscureText: false
           ),
            const SizedBox(height: 10),
            MyTextFild(controller: widget.tempoController,
                hintText:"Tempo em Meses" , obscureText: false
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Incrementar',
        child: const Icon(Icons.add),
        //No Flutter, o atributo child é usado para definir o conteúdo interno de um widget.
        // No caso do FloatingActionButton,
        //const Icon(Icons.add): Dentro do atributo child, temos um Icon widget que exibe um ícone. O ícone específico é determinado pelo parâmetro Icons.add, que representa um ícone de adição (+).
        //
        // Icons.add: É uma constante do Flutter que representa o ícone de adição.
        // É um dos muitos ícones disponíveis na biblioteca de ícones padrão do Flutter.

        // o child é o elemento que será exibido dentro do botão.
      ), // Esta vírgula à direita torna a formatação automática mais agradável para métodos build.
    );
  }
}
