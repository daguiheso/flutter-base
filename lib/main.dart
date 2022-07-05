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
  bool updateShouldNotify(covariant UserData oldWidget) {
    // TODO: debo notificar a mis hijos para que se actualizen?
    return booksIds != oldWidget.booksIds;
  }

}

class UserDataContainerWidget extends StatefulWidget {
  final Widget child;
  const UserDataContainerWidget({Key? key, required this.child}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return UserDataContainerState();
  }
}

class UserDataContainerState extends State<UserDataContainerWidget> {
  List<String> localBooksId = [];

  static UserDataContainerState of(BuildContext context) {
    return context.findAncestorStateOfType<UserDataContainerState>()!;
  }

  @override
  Widget build(BuildContext context) {
    return UserData(booksIds: List.from(localBooksId), child: widget.child);
  }

  void addToLibrary(String bookId) {
    setState(() {
      localBooksId.add(bookId);
    });
  }

  void removeToLibrary(String bookId) {
    setState(() {
      localBooksId.remove(bookId);
    });
  }
}

class Booksy extends StatelessWidget {
  const Booksy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Boosky'),
      ),
      body: const UserDataContainerWidget(
        child: BookScreen()
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

class AddBookButton extends StatelessWidget {
  final String bookId;
  const AddBookButton({Key? key, required this.bookId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userData = UserData.of(context);
    var isSaved = userData.booksIds.contains(bookId);

    var button = isSaved ? ElevatedButton(
      onPressed: () {
        return  removeBookInLibrary(context);
      },
      style: ElevatedButton.styleFrom(primary: Colors.red[200]),
      child: const Text('Remove'),
    ) : ElevatedButton(
      onPressed: () {
        return addBookInLibrary(context);
      },
      style: ElevatedButton.styleFrom(primary: Colors.green[400]),
      child: const Text('Add'),
    );

    return Directionality(
      textDirection: TextDirection.ltr,
      child:  button
    );
  }

  void addBookInLibrary(BuildContext context) {
   // Modificar el state del UserDataContainerWidget
   // nos ayuda a buscar un state en todos los ancestros
   var userDataContainerState = UserDataContainerState.of(context);
   userDataContainerState.addToLibrary(bookId);
  }

  void removeBookInLibrary(BuildContext context) {
   // Modificar el state del UserDataContainerWidget
   // nos ayuda a buscar un state en todos los ancestros
   var userDataContainerState = UserDataContainerState.of(context);
   userDataContainerState.removeToLibrary(bookId);
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