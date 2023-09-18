import 'package:flutter/material.dart';

void main() {
  runApp(PhotoGalleryApp());
}

class PhotoGalleryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Photo Gallery",
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
        ),
        body: PhotoGalleryScreen(),
      ),
    );
  }
}

class PhotoGalleryScreen extends StatelessWidget {
  final List<String> imageUrls = [
    //image URLs
    'https://www.cat-lovers-only.com/images/tiger-tabby-face-488.jpg',
    'https://www.cat-lovers-only.com/images/tiger-tabby-face-488.jpg',
    'https://www.cat-lovers-only.com/images/tiger-tabby-face-488.jpg',
    'https://www.cat-lovers-only.com/images/tiger-tabby-face-488.jpg',
    'https://www.cat-lovers-only.com/images/tiger-tabby-face-488.jpg',
    'https://images.unsplash.com/photo-1615796153287-98eacf0abb13?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80',
    'https://images.unsplash.com/photo-1571988840298-3b5301d5109b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80',
    'https://images.unsplash.com/photo-1608848461950-0fe51dfc41cb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80',
    'https://images.unsplash.com/photo-1615678815958-5910c6811c25?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80',
    'https://images.unsplash.com/photo-1583083527882-4bee9aba2eea?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1977&q=80'
  ];

  String generateCaption(int index) {
    return "Caption ${index}";
  }

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Feature 2: Welcome message
          Text(
            "Welcome to My Photo Gallery!",
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 16.0),

          // Feature 3: Search Box
          TextField(
            decoration: InputDecoration(
              labelText: "Search",
              hintText: "Search for photos...",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16.0),

          // Feature 4: Grid of Network Images
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Three columns
              childAspectRatio: 1.0, // Square aspect ratio
            ),
            itemCount: imageUrls.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  showSnackbar(context, "Image ${index} Clicked");
                },
                child: Column(
                  children: [
                    Image.network(
                      imageUrls[index],
                      height: 100.0,
                      width: 100.0,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      generateCaption(index),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),
          SizedBox(height: 16.0),

          // Feature 5: Sample Photos with Titles and Subtitles using ListTile with CircleAvatar and ListView.builder
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 3, // Display three sample photos
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  radius: 30.0, // Adjust the radius as needed
                  backgroundImage: NetworkImage(
                      imageUrls[index]), // Use the same image URLs as the grid
                ),
                title: Text(
                  "Photo ${index + 1}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("Description of photo ${index + 1}"),
              );
            },
          ),

          SizedBox(height: 20.0),

          // Feature 6: Upload Button
          ElevatedButton(
            onPressed: () {
              showSnackbar(context, "Photos Uploaded Successfully!");
            },
            child: Icon(Icons.upload),
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(16.0),
            ),
          ),
        ],
      ),
    );
  }
}
