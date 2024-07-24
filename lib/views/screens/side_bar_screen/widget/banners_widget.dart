import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BannersWidget extends StatelessWidget {
  const BannersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> bannersStream =
        FirebaseFirestore.instance.collection('banners').snapshots();
    return StreamBuilder<QuerySnapshot>(
      stream: bannersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.cyan,
            ),
          );
        }

        return GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6, crossAxisSpacing: 8, mainAxisSpacing: 8),
            itemCount: snapshot.data!.size,
            itemBuilder: (BuildContext context, int index) {
              final bannersData = snapshot.data!.docs[index];
              return Column(
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.network(bannersData['image']),
                  ),
                 
                ],
              );
            });
      },
    );
  }
}
