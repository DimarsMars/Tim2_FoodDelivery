import 'package:flutter/material.dart';

class RestaurantsPage extends StatefulWidget {
  const RestaurantsPage({super.key});

  @override
  State<RestaurantsPage> createState() => _RestaurantsPageState();
}

class _RestaurantsPageState extends State<RestaurantsPage> {
  String selectedCategory = 'All';
  final TextEditingController _searchController = TextEditingController();
  int _selectedIndex = 1; // Set to 1 for Search tab

  final List<String> categories = [
    'All',
    'Indonesian',
    'Chinese',
    'Japanese',
    'Western',
    'Fast Food',
    'Seafood',
  ];

  final List<Map<String, dynamic>> restaurants = [
    {
      'name': 'Warung Wardani',
      'image':
          'https://images.unsplash.com/photo-1552566626-52f8b828add9?ixlib=rb-4.0.3',
      'category': 'Indonesian',
      'rating': 4.8,
      'priceRange': '\$\$',
      'estimatedTime': '20-30 min',
      'description': 'Famous for traditional Balinese cuisine'
    },
    {
      'name': 'Golden Dragon',
      'image':
          'https://images.unsplash.com/photo-1526318896980-cf78c088247c?ixlib=rb-4.0.3',
      'category': 'Chinese',
      'rating': 4.6,
      'priceRange': '\$\$\$',
      'estimatedTime': '25-35 min',
      'description': 'Authentic Chinese dishes and dim sum'
    },
    {
      'name': 'Sakura Japanese',
      'image':
          'https://images.unsplash.com/photo-1579871494447-9811cf80d66c?ixlib=rb-4.0.3',
      'category': 'Japanese',
      'rating': 4.7,
      'priceRange': '\$\$\$',
      'estimatedTime': '15-25 min',
      'description': 'Premium sushi and ramen'
    },
    {
      'name': 'McBurger Express',
      'image':
          'https://images.unsplash.com/photo-1561758033-7e924f619b47?ixlib=rb-4.0.3',
      'category': 'Fast Food',
      'rating': 4.3,
      'priceRange': '\$',
      'estimatedTime': '10-15 min',
      'description': 'Quick and tasty burgers'
    },
    {
      'name': 'Sea Paradise',
      'image':
          'https://images.unsplash.com/photo-1559339352-11d035aa65de?ixlib=rb-4.0.3',
      'category': 'Seafood',
      'rating': 4.5,
      'priceRange': '\$\$\$',
      'estimatedTime': '30-40 min',
      'description': 'Fresh seafood daily'
    },
    {
      'name': 'Steak House',
      'image':
          'https://images.unsplash.com/photo-1544025162-d76694265947?ixlib=rb-4.0.3',
      'category': 'Western',
      'rating': 4.9,
      'priceRange': '\$\$\$\$',
      'estimatedTime': '25-35 min',
      'description': 'Premium steaks and grills'
    },
    {
      'name': 'Padang Sederhana',
      'image':
          'https://images.unsplash.com/photo-1565557623262-b51c2513a641?ixlib=rb-4.0.3',
      'category': 'Indonesian',
      'rating': 4.4,
      'priceRange': '\$\$',
      'estimatedTime': '15-20 min',
      'description': 'Authentic Padang cuisine'
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Add navigation logic here if needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search restaurants...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey[300]!),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey[300]!),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
          ),

          // Category Filter
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                final isSelected = category == selectedCategory;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    selected: isSelected,
                    label: Text(category),
                    onSelected: (selected) {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                    backgroundColor: Colors.grey[100],
                    selectedColor: Colors.green[100],
                    checkmarkColor: Colors.green,
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.green[700] : Colors.black87,
                    ),
                  ),
                );
              },
            ),
          ),

          // Restaurant List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: restaurants.length,
              itemBuilder: (context, index) {
                final restaurant = restaurants[index];
                if (selectedCategory != 'All' &&
                    restaurant['category'] != selectedCategory) {
                  return const SizedBox.shrink();
                }
                return RestaurantCard(
                  name: restaurant['name'],
                  imageUrl: restaurant['image'],
                  category: restaurant['category'],
                  rating: restaurant['rating'].toString(),
                  priceRange: restaurant['priceRange'],
                  estimatedTime: restaurant['estimatedTime'],
                  description: restaurant['description'],
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.green[700],
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              activeIcon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long_outlined),
              activeIcon: Icon(Icons.receipt_long),
              label: 'Orders',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class RestaurantCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String category;
  final String rating;
  final String priceRange;
  final String estimatedTime;
  final String description;

  const RestaurantCard({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.category,
    required this.rating,
    required this.priceRange,
    required this.estimatedTime,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Restaurant Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.network(
              imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Restaurant Name and Rating
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green[100],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.star, size: 16, color: Colors.green[700]),
                          const SizedBox(width: 4),
                          Text(
                            rating,
                            style: TextStyle(
                              color: Colors.green[700],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Category and Price Range
                Row(
                  children: [
                    Text(
                      category,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '•',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      priceRange,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '•',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      estimatedTime,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Description
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
