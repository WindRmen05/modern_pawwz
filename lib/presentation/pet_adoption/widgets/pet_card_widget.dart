// ================== PET CARD WIDGET ==================
import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/pet_adoption/provider/pet_adoption_provider.dart';

class PetCard extends StatelessWidget {
  final Pet pet;
  const PetCard({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.all(12),
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // IMAGE + BOOKMARK
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.network(
                  pet.imageUrl,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 12,
                top: 12,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.bookmark_border, color: Colors.black),
                ),
              ),
            ],
          ),

          // DETAILS
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Pet name
                Text(
                  pet.name,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 4),

                // Distance
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(pet.distance,
                        style: TextStyle(color: Colors.grey[600])),
                  ],
                ),

                const SizedBox(height: 8),

                // Free/Paid + Certificate
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      pet.isFree ? "Free" : "Paid",
                      style: TextStyle(
                        color: pet.isFree ? Colors.green : Colors.red,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          pet.hasCertificate ? Icons.verified : Icons.cancel,
                          color: pet.hasCertificate ? Colors.blue : Colors.grey,
                          size: 18,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          pet.hasCertificate ? "Certified" : "No Certificate",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 18,
                      child: const Icon(Icons.arrow_outward,
                          color: Colors.white, size: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
