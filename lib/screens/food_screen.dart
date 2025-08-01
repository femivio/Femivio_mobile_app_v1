import 'package:flutter/material.dart';
import '../models/food.dart';
import '../services/api_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen>
    with AutomaticKeepAliveClientMixin {
  List<Food> foods = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchAndPreloadFoods();
  }

  Future<void> fetchAndPreloadFoods() async {
    setState(() => isLoading = true);
    try {
      foods = await ApiService.getFoodItems();

      // Preload all images using DefaultCacheManager
      await Future.wait(
        foods.map((food) async {
          try {
            await DefaultCacheManager().getSingleFile(food.imageUrl);
          } catch (e) {
            debugPrint("Image preload failed for ${food.imageUrl}: $e");
          }
        }),
      );
    } catch (e) {
      debugPrint('❌ Error fetching or preloading foods: $e');
      foods = [];
    } finally {
      setState(() => isLoading = false);
    }
  }

  Future<void> _onRefresh() async {
    await fetchAndPreloadFoods();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text('Food Items'),
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(
        child: CircularProgressIndicator(
          strokeWidth: 4,
          color: Colors.deepPurpleAccent,
        ),
      )
          : RefreshIndicator(
        onRefresh: _onRefresh,
        child: foods.isEmpty
            ? ListView(
          children: const [
            SizedBox(height: 300),
            Center(
              child: Text(
                'No food items found.',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        )
            : GridView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: foods.length,
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 16,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            final food = foods[index];
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16)),
                    child: CachedNetworkImage(
                      imageUrl: food.imageUrl,
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      fadeInDuration:
                      const Duration(milliseconds: 300),
                      placeholder: (context, url) => Container(
                        height: 100,
                        color: Colors.grey.shade200,
                        child: const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          Container(
                            height: 100,
                            color: Colors.grey.shade200,
                            child: const Center(
                              child: Icon(Icons.broken_image,
                                  size: 40, color: Colors.grey),
                            ),
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          food.name,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text('₹${food.price.toStringAsFixed(2)}'),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
