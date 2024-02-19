import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_6/image_gallary_bloc/image_gallery_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galary'),
        centerTitle: true,
      ),
      body: BlocBuilder<ImageGalleryBloc, ImageGalleryState>(
        builder: (context, state) {
          return _buildImageGallery(context, state);
        },
      ),
    );
  }

  Widget _buildImageGallery(BuildContext context, ImageGalleryState state) {
    if(state is ImageLoadingState){
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    else if(state is ImageLoadedState){
      return GridView.builder(       
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: state.images.length,
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              state.images[index].url,
              fit: BoxFit.cover,
            ),
          );
        },
      );
    }else {
      return Center(
        child: ElevatedButton(
          onPressed: () {
            context.read<ImageGalleryBloc>().add(LoadImageGallery());
          },
          child:  Text('Fetch Images${state.toString()}'),
        ),
      );
    }
    // return GridView.count(
    //   padding: const EdgeInsets.all(20),
    //   crossAxisSpacing: 20,
    //   mainAxisSpacing: 20,
    //   crossAxisCount: 2,
    //   children: [
    //     Container(
    //       padding: const EdgeInsets.all(8),
    //       color: Colors.green[400],
    //       child: const Text('Who scream'),
    //     ),
    //     Container(
    //       padding: const EdgeInsets.all(8),
    //       color: Colors.red,
    //       child: const Text('Who scream'),
    //     ),
    //     Container(
    //       padding: const EdgeInsets.all(8),
    //       color: Colors.blue,
    //       child: const Text('Who scream'),
    //     ),
    //     Container(
    //       padding: const EdgeInsets.all(8),
    //       color: Colors.black,
    //       child: const Text('Who scream'),
    //     ),
    //     Container(
    //       padding: const EdgeInsets.all(8),
    //       color: Colors.grey,
    //       child: const Text('Who scream'),
    //     ),
    //     Container(
    //       padding: const EdgeInsets.all(8),
    //       color: Colors.orange,
    //       child: const Text('Who scream'),
    //     ),
    //     Container(
    //       padding: const EdgeInsets.all(8),
    //       color: Colors.green[400],
    //       child: const Text('Who scream'),
    //     ),
    //     Container(
    //       padding: const EdgeInsets.all(8),
    //       color: Colors.purple,
    //       child: const Text('Who scream'),
    //     ),
    //   ],
    // );
  }
}
