import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../Data/Model/dorms_model.dart';

class DormImageWidget extends StatelessWidget {
  final DormsModel dorm;
  final double? width;
  final double? height;
  final BoxFit fit;

  const DormImageWidget({
    super.key,
    required this.dorm,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[200],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CachedNetworkImage(
          imageUrl: dorm.firstImage,
          fit: fit,
          placeholder:
              (context, url) => Container(
                color: Colors.grey[200],
                child: const Center(child: CircularProgressIndicator()),
              ),
          errorWidget:
              (context, url, error) => Container(
                color: Colors.grey[200],
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.image_not_supported,
                      size: 50,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'No Image Available',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
        ),
      ),
    );
  }
}

class DormImageCarousel extends StatelessWidget {
  final DormsModel dorm;
  final double height;

  const DormImageCarousel({super.key, required this.dorm, this.height = 200});

  @override
  Widget build(BuildContext context) {
    if (!dorm.hasImages) {
      return Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey[200],
        ),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.image_not_supported, size: 50, color: Colors.grey),
              SizedBox(height: 8),
              Text(
                'No Images Available',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
        ),
      );
    }

    return SizedBox(
      height: height,
      child: PageView.builder(
        itemCount: dorm.images.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: dorm.images[index],
                fit: BoxFit.cover,
                placeholder:
                    (context, url) => Container(
                      color: Colors.grey[200],
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                errorWidget:
                    (context, url, error) => Container(
                      color: Colors.grey[200],
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.broken_image,
                            size: 50,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Failed to load image',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
              ),
            ),
          );
        },
      ),
    );
  }
}
