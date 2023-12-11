import 'package:flutter/material.dart';

import '../services/api_service.dart';
import '../widgets/full_image_screen.dart';
import '../widgets/loading_effect.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ApiService apiService = ApiService();

    void showFullImage(String imagePath, String imageTag) {
      Navigator.of(context).push(
        PageRouteBuilder(
          opaque: false,
          pageBuilder: (BuildContext context, _, __) => FullImageScreen(
            imagePath: imagePath,
            imageTag: imageTag,
            backgroundOpacity: 200,
          ),
        ),
      );
    }

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 20),
        physics: const ClampingScrollPhysics(),
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: const Text(
              'Pexels',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 26,
                letterSpacing: 0,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 8.0,
            ),
            child: FutureBuilder(
              future: apiService.fetchImages(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const LoadingEffect();
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  final List<String> imageUrls = snapshot.data as List<String>;
                  return SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                      ),
                      itemCount: imageUrls.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            showFullImage(imageUrls[index], imageUrls[index]);
                          },
                          child: Hero(
                            tag: imageUrls[index],
                            transitionOnUserGestures: true,
                            child: Image(
                              image: NetworkImage(imageUrls[index]),
                              height: 52,
                              width: 52,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
