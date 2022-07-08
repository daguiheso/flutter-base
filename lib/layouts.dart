import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Layouts')
        ),
        body: const ProfileScreen(),
      ),
      title: 'Pepe',
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                const Image(
                  image: AssetImage('images/image-1.JPG')
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DefaultTextStyle(
                        style: const TextStyle(color: Colors.white, fontSize: 18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            Text("Daniel Hernandez"),
                            Text("Cobre"),
                          ],
                        )
                      ),
                      const CircleAvatar(
                        backgroundImage: AssetImage('images/avatar.png'),
                        radius: 40,
                      ),
                    ],
                  ),
                )
              ]
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: const Text(
                'Lorem ipsum dolor sit amet consectur adipiscing elit. Lorem ipsum dolor sit amet consectur adipiscing elit. Lorem ipsum dolor sit amet consectur adipiscing elit. Lorem ipsum dolor sit amet consectur adipiscing elit.',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,

              )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                children: [
                  const Icon(Icons.book, size: 50),
                  Expanded(child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Libros Leídos"),
                      Text("Numero de libros finalizados ipsum dolor sit amet consectur adipiscing elit.")
                    ],
                  )),
                  const Text("104", style: TextStyle(fontSize: 30))
                ],
              )
            ),
            const ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              title: Text("Libros que quiero"),
              subtitle: Text("Numero de libros en la lista de deseos"),
              leading: Icon(Icons.book, size: 50),
              trailing:  Text("104", style: TextStyle(fontSize: 30)),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  const Text("Redes Sociales", style: TextStyle(fontSize: 20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(onPressed: () {}, icon:  const Icon(Icons.facebook, size: 50)),
                      IconButton(onPressed: () {}, icon:  const Icon(Icons.whatsapp, size: 50)),
                      IconButton(onPressed: () {}, icon:  const Icon(Icons.storage, size: 50)),
                    ]
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    child: const Text("Agregar amigo"),
                  ),
                  ElevatedButton(onPressed: () {}, child: const Text("Enviar mensaje"))
                ]
              ),
            ),
          ],
        )
      ],
    );
  }
}