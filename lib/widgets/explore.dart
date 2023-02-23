import 'package:flutter/material.dart';
import 'package:sssv1/screens/realestateProfileTest.dart';
import 'package:sssv1/screens/searchlist.dart';

class Explore extends StatelessWidget {
  const Explore({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(13),
      child: Column(
          children: [
        // first row
        Row(
          children: [
            Expanded(
              child: Container(
      margin: EdgeInsets.all(5),
      height: 85,
      // color: Colors.redAccent,
      decoration: const BoxDecoration(image:DecorationImage(
          image: NetworkImage("https://media.istockphoto.com/id/1178477986/photo/3d-rendering-fitness-equipment-on-color-background.jpg?s=612x612&w=0&k=20&c=h7vEqleo0FGeAR2hkIuv7erpT1c4GIDF0AIeWI5EmFw="),
          fit: BoxFit.cover,
        ) ,
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(11))
          // color: Colors.red,
          ),
      child: Align(alignment: Alignment(-0.7, 0.5),
        child: Text('GYM',style: TextStyle(color: Colors.white),)),
              ),
            ),
            Expanded(
      child: Container(
              margin: EdgeInsets.all(5),
              height: 85,
              decoration: const BoxDecoration(
      image:DecorationImage(
          image: NetworkImage("https://cdn.pixabay.com/photo/2018/10/01/09/21/pets-3715733__340.jpg"),
          fit: BoxFit.cover,
        ) ,
        color: Colors.blueAccent,
        borderRadius: BorderRadius.all(Radius.circular(11))
        // color: Colors.red,
        ),
        child: Align(alignment: Alignment(-0.7, 0.5),
        child: Text('Pets',style: TextStyle(color: Colors.white),)),
            )),
            Expanded(
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SearchList()));
        },
        child: Container(
                margin: EdgeInsets.all(5),
                height: 85,
                decoration: const BoxDecoration(
        image:DecorationImage(
            image: NetworkImage("https://as1.ftcdn.net/v2/jpg/03/09/24/40/1000_F_309244030_75QJt5NP1UaekvnGOIN5NgzGM6PxgEYe.jpg"),
            fit: BoxFit.cover,
          ) ,
          color: Colors.deepPurple,
          borderRadius: BorderRadius.all(Radius.circular(11))
          // color: Colors.red,
          ),
          child: Align(alignment: Alignment(-0.7, 0.5),
          child: Text('Real Estate',style: TextStyle(color: Colors.white),)),
              ),
      ))
          ],
        ),
        // second row 2
        Row(
          children: [
            Expanded(
              child: Container(
      margin: EdgeInsets.all(5),
      height: 85,
      // color: Colors.redAccent,
      decoration: const BoxDecoration(
        image:DecorationImage(
          image: NetworkImage("https://www.kotak.com/content/dam/Kotak/product_card_images/how-credit-cards-enhance-your-shopping-experience.jpg"),
          fit: BoxFit.cover,
        ) ,
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(11))
          // color: Colors.red,
          ),
          child: Align(alignment: Alignment(-0.7, 0.5),
        child: Text('Shopping',style: TextStyle(color: Colors.white),)),
              ),
            ),
            Expanded(
      child: Container(
              margin: EdgeInsets.all(5),
              height: 85,
              decoration: const BoxDecoration(
      image:DecorationImage(
          image: NetworkImage("https://images.unsplash.com/photo-1596462502278-27bfdc403348?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8&w=1000&q=80"),
          fit: BoxFit.cover,
        ) ,
        color: Colors.blueAccent,
        borderRadius: BorderRadius.all(Radius.circular(11))
        // color: Colors.red,
        ),
        child: Align(alignment: Alignment(-0.7, 0.5),
        child: Text('spa',style: TextStyle(color: Colors.white),)),
            )),
            Expanded(
      child: Container(
              margin: EdgeInsets.all(5),
              height: 85,
              decoration: const BoxDecoration(
      image:DecorationImage(
          image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9dwH9zzlgn5ufXYM-1Kgt1tREr9VRQFxeIQ&usqp=CAU"),
          fit: BoxFit.cover,
        ) ,
        color: Colors.deepPurple,
        borderRadius: BorderRadius.all(Radius.circular(11))
        // color: Colors.red,
        ),
        child: Align(alignment: Alignment(-0.7, 0.5),
        child: Text('Meditation Centers',style: TextStyle(color: Colors.white),)),

            )

            )
          ],
        ),
        // 3rd row
        Row(
          children: [
            Expanded(
              child: Container(
      margin: EdgeInsets.all(5),
      height: 85,
      // color: Colors.redAccent,
      decoration: const BoxDecoration(
        image:DecorationImage(
          image: NetworkImage("https://img.freepik.com/premium-photo/full-size-profile-side-photo-young-excited-girl-have-fun-dance-clubber-isolated-yellow-color-background_525549-8222.jpg?w=2000"),
          fit: BoxFit.cover,
        ) ,
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(11))
          // color: Colors.red,
          ),
          child: Align(alignment: Alignment(-0.7, 0.5),
        child: Text('Dance Schools',style: TextStyle(color: Colors.white),)),
              ),
            ),
            Expanded(
      child: Container(
              margin: EdgeInsets.all(5),
              height: 85,
              decoration: const BoxDecoration(
      image:DecorationImage(
          image: NetworkImage("https://t4.ftcdn.net/jpg/02/60/04/09/360_F_260040900_oO6YW1sHTnKxby4GcjCvtypUCWjnQRg5.jpg"),
          fit: BoxFit.cover,
        ) ,
        color: Colors.blueAccent,
        borderRadius: BorderRadius.all(Radius.circular(11))
        // color: Colors.red,
        ),
        child: Align(alignment: Alignment(-0.7, 0.5),
        child: Text('Doctors',style: TextStyle(color: Colors.white),)),
            )),
            Expanded(
      child: Container(
              margin: EdgeInsets.all(5),
              height: 85,
              decoration: const BoxDecoration(
      image:DecorationImage(
          image: NetworkImage("https://www.shutterstock.com/image-photo/happy-wedding-couple-dancing-on-260nw-615424550.jpg"),
          fit: BoxFit.cover,
        ) ,
        color: Colors.deepPurple,
        borderRadius: BorderRadius.all(Radius.circular(11))
        // color: Colors.red,
        ),
        child: Align(alignment: Alignment(-0.7, 0.5),
        child: Text('Wedding planing',style: TextStyle(color: Colors.white),)),
            ))
          ],
        ),
        // 4th row
        Row(
          children: [
            Expanded(
              child: Container(
      margin: EdgeInsets.all(5),
      height: 85,
      // color: Colors.redAccent,
      decoration: const BoxDecoration(
        image:DecorationImage(
          image: NetworkImage("https://s3.envato.com/files/f1718472-ff3e-4f8b-8159-b356d5510e5e/inline_image_preview.jpg"),
          fit: BoxFit.cover,
        ) ,
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(11))
          // color: Colors.red,
          ),
          child:Align(alignment: Alignment(-0.7, 0.5),
        child: Text('DJ',style: TextStyle(color: Colors.white),)) ,
              ),
            ),
            Expanded(
      child: Container(
              margin: EdgeInsets.all(5),
              height: 85,
              decoration: const BoxDecoration(
      image:DecorationImage(
          image: AssetImage("images/modell.jpeg"),
          fit: BoxFit.cover,
        ) ,
        color: Colors.blueAccent,
        borderRadius: BorderRadius.all(Radius.circular(11))
        // color: Colors.red,
        ),
        child: Align(alignment: Alignment(-0.7, 0.5),
        child: Text('Model',style: TextStyle(color: Colors.white),)),
            )),
            Expanded(
      child: Container(
              margin: EdgeInsets.all(5),
              height: 85,
              decoration: const BoxDecoration(
      image:DecorationImage(
          image: NetworkImage("https://as1.ftcdn.net/v2/jpg/03/53/54/12/1000_F_353541224_S3dKaxNcVj8LY214NfQDN3xFbEZflIN4.jpg"),
          fit: BoxFit.cover,
        ) ,
        color: Colors.deepPurple,
        borderRadius: BorderRadius.all(Radius.circular(11))
        // color: Colors.red,
        ),
        child: Align(alignment: Alignment(-0.7, 0.5),
        child: Text('swimming',style: TextStyle(color: Colors.white),)),
            ))
          ],
        ),
          ],
        ),
    );
  }
}