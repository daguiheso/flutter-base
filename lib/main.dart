import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Booksy(), title: 'Boosky'));
}

class UserData extends InheritedWidget {
  final List<String> booksIds;

  const UserData({Key? key, required this.booksIds, required Widget child}) : super(key: key, child: child);

  static UserData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserData>()!;
  }
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // TODO: debo notificar a mis hijos para que se actualizen?
    return true;
  }

}

class Booksy extends StatelessWidget {
  const Booksy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var booksIds = ['douglas-hitch'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Boosky'),
      ),
      body: UserData(
        booksIds: booksIds,
        child: const BookScreen()
      )
    );
  }
}

class BookScreen extends StatelessWidget {
  const BookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      color: Colors.white,
      child: SafeArea(child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 40.0, bottom: 30.0),
                decoration: const BoxDecoration(
                  boxShadow: [BoxShadow(blurRadius: 8)]
                ),
                child: const Image(
                  image: AssetImage('images/cover.JPG'),
                  width: 260,
                )
              ),
              const BookDescription(
                title: 'The Hitchhiker´s Guide to the Galaxy',
                author: 'Douglas Adams',
                description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
              const Padding(padding: EdgeInsets.only(top: 10, bottom: 40)),
              const AddBookButton(bookId: 'douglas-hitch',),
            ],
          )
        )
      ))
    );
  }

}

class AddBookButton extends StatefulWidget {
  final String bookId;
  const AddBookButton({Key? key, required this.bookId}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
   return AddBookButtonState();
  }

}

class AddBookButtonState extends State<AddBookButton> {
  @override
  Widget build(BuildContext context) {
    var userData = UserData.of(context);

    // widget es para obtener la data del widget asociado a este state
    var isSaved = userData.booksIds.contains(widget.bookId);

    var button = isSaved ? ElevatedButton(
      onPressed: manageBookInLibrary,
      style: ElevatedButton.styleFrom(primary: Colors.red[200]),
      child: const Text('Remove'),
    ) : ElevatedButton(
      onPressed: manageBookInLibrary,
      style: ElevatedButton.styleFrom(primary: Colors.green[400]),
      child: const Text('Add'),
    );

    return Directionality(
      textDirection: TextDirection.ltr,
      child:  button
    );
  }

  void manageBookInLibrary() {
   // TODO: LLamar al backend y actualizar bbdd del usuario  (metodo async)
   // TODO:Actualizar la data del Inherited Widget
  }

}

class BookDescription extends StatelessWidget {
  final String title;
  final String author;
  final String description;
  const BookDescription({Key? key, required this.title, required this.author, this.description = 'pepe' }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      Text(
          title,
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 30
          )
        ),
        const Padding(padding: EdgeInsets.only(top: 30)),
        Text(
          author,
          textDirection: TextDirection.ltr,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 25
          )
        ),
        const Padding(padding: EdgeInsets.only(top: 10)),
        Text(
          description,
          textDirection: TextDirection.ltr,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 18,
          )
        ),
      ],
    );
  }

}