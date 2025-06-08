// // ignore_for_file: unreachable_switch_default

// import 'package:app4/models/meal.dart';
// import 'package:flutter/material.dart';
// // ignore: depend_on_referenced_packages
// // import 'package:transparent_image/transparent_image.dart';
// // ignore: unused_import
// import 'package:transparent_image/transparent_image.dart';

// class MealItem extends StatelessWidget {
//   final String title;
//   final String imageUrl;
//   final int duration;
//   final Complexity complexity;
//   final Affordability affordability;
//   const MealItem({
//     super.key,
//     required this.meal,
//     required this.title,
//     required this.imageUrl,
//     required this.duration,
//     required this.complexity,
//     required this.affordability, required this.onSelectMeal,

//   });
//   String get complexityText{
//     switch(complexity){
//       // ignore: dead_code
//       case Complexity.simple:return "simple";break;
//       // ignore: dead_code
//       case Complexity.challenging: return "challenging";break;
//       case Complexity.hard:return "hard";
//       // ignore: dead_code, unreachable_switch_default
//       default:return "unknown";break;
//     }
//   }
//     String get AffordabilityText{
//     switch(affordability){
//       // ignore: dead_code
//       case Affordability.affordable:return "affordable";break;
//       case Affordability.pricey: return ".pricey";break;
//       case Affordability.luxurious:return "luxurious";
//       default:return "unknown";break;
//     }
//   }
//   //استقبل
//   final Meal meal;
//   void selecteMeal() {}
//   final void Function (Meal meal) onSelectMeal;

//   @override
//   Widget build(BuildContext context) {
//     return  Card(
//          margin: EdgeInsets.all(8),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//         //84vid
//         clipBehavior: Clip.hardEdge,
//         elevation: 2,

//         child: Column(
//           children: [
//             Stack(
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(15),
//                     topRight: Radius.circular(15),
//                   ),
//                   child: Image.network(
//                     imageUrl,
//                     height: 200,
//                     width: double.infinity,
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//                 Positioned(
//                   bottom: 20,
//                   right: 10,

//                   child: Container(
//                     width: 300,
//                     color: Colors.black54,
//                     padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
//                     child: Text(
//                       title,
//                       style: TextStyle(fontSize: 26, color: Colors.white),
//                       softWrap: true,
//                       overflow: TextOverflow.fade,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Row(children: [
//                     Icon(Icons.schedule),
//                     SizedBox(width: 6,),
//                     Text("$duration   min")]),
//                   Row(children: [
//                     Icon(Icons.work),
//                     SizedBox(width: 6,),
//                     Text("$complexityText")]),
//                   Row(children: [
//                     Icon(Icons.attach_money),
//                     Text("$AffordabilityText")]),
//                 ],
//               ),
//             ),
//           ],
//         ),

//       children: InkWell(
//         onTap:()=> onSelectMeal,
//         child: Stack(
//           children: [

//             FadeInImage(
//               placeholder: MemoryImage(kTransparentImage),
//               //طباعه المحتويات فوق الصوره
//               image: NetworkImage(meal.imageUrl),
//             ),

//             Positioned(
//               bottom: 20,
//               right: 10,

// ignore_for_file: unreachable_switch_default

//               left: 0,
//               child: Container(width: 300,
//                 padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
//                 color: Colors.black54,
//                 child: Column(
//                   children: [
//                     Text(
//                       meal.title,
//                       textAlign: TextAlign.center,
//                       maxLines: 2,
//                       softWrap: true,
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(
//                         fontSize: 26,
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 12),
//                     Row(children: []),
//                   ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//       ),
//     );
//   }
// }
import 'package:app4/models/meal.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final void Function(Meal meal) onSelectMeal;
  //   final String title;
  // final String imageUrl;
  // final int duration;
  final Complexity complexity;
  final Affordability affordability;
  const MealItem({
    super.key,
    required this.meal,
    // required this.title,
    // required this.imageUrl,
    // required this.duration,
    required this.complexity,
    // required this.affordability,
    required this.onSelectMeal,
    required this.affordability,
  });

  String get complexityText {
    switch (complexity) {
      // ignore: dead_code
      case Complexity.simple:
        return "simple";
        // ignore: dead_code
        break;
      // ignore: dead_code
      case Complexity.challenging:
        return "challenging";
        // ignore: dead_code
        break;
      case Complexity.hard:
        return "hard";
      // ignore: duplicate_ignore
      // ignore: dead_code, unreachable_switch_default
      default:
        return "unknown";
        // ignore: dead_code
        break;
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.affordable:
        return "Affordable";
      case Affordability.pricey:
        return "Pricey";
      case Affordability.luxurious:
        return "Luxurious";
      default:
        return "Unknown";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(48)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: Column(
        children: [
          InkWell(
            onTap: () => onSelectMeal(meal),
            child: Stack(
              children: [
                FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(meal.imageUrl),
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Column(
                      children: [
                        Text(
                          meal.title,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    const Icon(Icons.schedule),
                    const SizedBox(width: 2),
                    Text(
                      "${meal.duration} min",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.work),

                    SizedBox(width: 2),
                    Text(
                      "$complexityText ",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.attach_money),
                    SizedBox(width: 2),
                    Text(
                      affordabilityText,
                      style: TextStyle(color: Colors.white),
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
