// Container(
//   width: double.infinity,
//   height: 90.h,
//   decoration: BoxDecoration(
//     color: Colors.grey,
//   ),
//   child: CachedNetworkImage(
//     imageUrl:
//         "https://i.im.ge/2023/01/24/sKsFgp.Untitled-2.png",
//     // "https://i.im.ge/2023/01/24/sKsXV4.Untitled-2.png",
//     width: double.infinity,
//     fit: BoxFit.cover,
//     placeholder: (context, url) => Shimmer(
//       child: Container(
//         width: double.infinity,
//         color: Colors.black87,
//       ),
//     ),
//     errorWidget: (context, url, error) => Container(
//       decoration: BoxDecoration(
//         color: Colors.grey,
//         borderRadius: BorderRadius.circular(0),
//       ),
//       child: Center(
//         child: Column(
//           mainAxisAlignment:
//               MainAxisAlignment.center,
//           crossAxisAlignment:
//               CrossAxisAlignment.center,
//           children: [
//             Text(
//               "Failed To Load Image",
//               style: GoogleFonts.montserrat(
//                 color: primaryText,
//                 fontSize: 10.sp,
//                 fontWeight: FontWeight.w600,
//               ),
//             )
//           ],
//         ),
//       ),
//       height: 140.h,
//       width: 135.h,
//     ),
//   ),
// ),
