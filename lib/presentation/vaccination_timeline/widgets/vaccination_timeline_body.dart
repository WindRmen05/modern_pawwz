import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/vaccination_timeline/provider/provider.dart';

class VaccinationTimelineBody extends StatelessWidget {
  const VaccinationTimelineBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => VaccinationTimelineNotifier(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Vaccination Timeline"),
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
        ),
        body: Column(
          children: [
            /// Horizontal Date Selector
            SizedBox(
              height: 90,
              child: Consumer<VaccinationTimelineNotifier>(
                builder: (context, provider, _) {
                  DateTime startDate = DateTime.now().subtract(const Duration(days: 5));
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      DateTime date = startDate.add(Duration(days: index));
                      bool isSelected = provider.selectedDate.day == date.day &&
                          provider.selectedDate.month == date.month &&
                          provider.selectedDate.year == date.year;

                      return GestureDetector(
                        onTap: () => provider.changeDate(date),
                        child: Container(
                          width: 70,
                          margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.blueAccent : Colors.grey[200],
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"][date.weekday % 7],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: isSelected ? Colors.white : Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                "${date.day}",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: isSelected ? Colors.white : Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            /// Vaccination List
            Expanded(
              child: Consumer<VaccinationTimelineNotifier>(
                builder: (context, provider, _) {
                  final items = provider.vaccinationsForSelectedDate;
                  if (items.isEmpty) {
                    return const Center(
                      child: Text(
                        "No vaccinations scheduled",
                        style: TextStyle(color: Colors.black54, fontSize: 16),
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final v = items[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        elevation: 3,
                        child: ListTile(
                          title: Text(
                            v.title,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Status: ${v.status}"),
                              ...v.extraDetails.map((e) => Text("- $e")),
                            ],
                          ),
                          trailing: Text(
                            "${v.date.day}/${v.date.month}/${v.date.year}",
                            style: const TextStyle(color: Colors.black54),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
