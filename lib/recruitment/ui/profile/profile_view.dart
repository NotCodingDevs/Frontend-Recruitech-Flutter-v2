import 'package:flutter/material.dart';
import 'package:frontend_recruitech_flutter_v2/shared/ui/widgets/title_large.dart';
import 'package:frontend_recruitech_flutter_v2/shared/ui/widgets/title_small.dart';
import '../profile/profile_view.dart';
import '../../data/services/profile_service.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool showFirstContent = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Container(
        margin: const EdgeInsets.all(30), // Establece el margen deseado
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Profile',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
              ],
            ),
            ContentProfile(),
          ],
        ),
      ),
    );
  }
}

class ContentProfile extends StatefulWidget {
  const ContentProfile({super.key});

  @override
  _ContentProfileState createState() => _ContentProfileState();
}

class _ContentProfileState extends State<ContentProfile> {
  bool showFirstContent = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          backgroundImage(),
          Positioned(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 130),
              child: Container(
                //shadowColor: Colors.grey,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 40),
                    Text(
                      'John Doe',
                      style: TextStyle(color: Colors.blueGrey, fontSize: 18),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Flutter Developer',
                          style:
                              TextStyle(color: Colors.blueGrey, fontSize: 14),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.location_on,
                                color: Colors.blueGrey, size: 17),
                            Text(
                              'São Paulo, Brazil',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 7),
                      child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vulputate molestie turpis fermentum hendrerit. Donec sit amet auctor diam.',
                          softWrap: true,
                          style:
                              TextStyle(color: Colors.blueGrey, fontSize: 13)),
                    ),
                    Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () => setState(() {
                                  showFirstContent = true;
                                }),
                                child: Text('Portafolio'),
                              ),
                              ElevatedButton(
                                onPressed: () => setState(() {
                                  showFirstContent = false;
                                }),
                                child: Text('Experiencia'),
                              ),
                            ]),
                        //mostrar lazyview formato lista scrolleable dependiendo del boton presionado
                        showFirstContent
                            ? Container(
                                height: 200,
                                child: ListView.builder(
                                  itemCount: 10,
                                  itemBuilder: (context, index) {
                                    // foto icono de la empresa y el nombre de su puesto en el trabajo , conjunto las fechas de cuando a cuando trabajo
                                    return ListTile(
                                      leading: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            'https://ep01.epimg.net/verne/imagenes/2015/07/31/articulo/1438353048_228377_1438943170_noticia_normal.jpg'),
                                      ),
                                      title: Text('Programador $index'),
                                      subtitle: Text('Explosivos marca ACME'),
                                    );
                                  },
                                ),
                              )
                            : Container(
                                height: 200,
                                child: ListView.builder(
                                  itemCount: 10,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      leading: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            'https://ep01.epimg.net/verne/imagenes/2015/07/31/articulo/1438353048_228377_1438943170_noticia_normal.jpg'),
                                      ),
                                      title: Text('Experience $index'),
                                      subtitle: Text('Explosivos marca ACME'),
                                    );
                                  },
                                ),
                              ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          PhotoProfile(),
        ],
      ),
    );
  }
}

class backgroundImage extends StatelessWidget {
  const backgroundImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: Image.network(
            'https://picsum.photos/250?image=9',
          ).image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class PhotoProfile extends StatelessWidget {
  const PhotoProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 60,
      left: (MediaQuery.of(context).size.width - 160) / 2,
      child: Container(
        //shadowColor: Colors.grey
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: Image.network(
              'https://th.bing.com/th/id/OIP.Y1KTp5LYTtDFVwsevLuoEgHaJR?pid=ImgDet&rs=1',
            ).image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
