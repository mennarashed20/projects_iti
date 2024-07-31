//import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';

class ECommerceProdact extends StatefulWidget {
  const ECommerceProdact({super.key});

  @override
  State<ECommerceProdact> createState() => _ECommerceProdact();
}

class _ECommerceProdact extends State<ECommerceProdact> {
  bool _shown = false;
  bool _rememberMe = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: const Icon(Icons.sort),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: const Icon(Icons.shopping_bag_outlined),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Hello",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const Text(
                "Welcome to Laza",
                style: TextStyle(fontSize: 15,color: Colors.grey),
              ),
              const SizedBox(height: 20,),
              _searchBar(),
              const SizedBox(height: 20,),
              const BrandBar(brands: BrandCardModel.all,),
              const SizedBox(height: 20,),

               ProductsGrid(products: ProductCardModel.all,)
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchBar() => SizedBox(
    height: 50,
    child: Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200]
            ),
            child: TextFormField(

              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search,color: Colors.grey),
                hintText: "Search..",

                border: InputBorder.none,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 128, 0, 232)
          ),
          child: IconButton(onPressed: (){}, icon: const Icon(Icons.mic_outlined, color: Colors.white,)),
        ),
      ],
    ),
  );
}

class BrandBar extends StatefulWidget {
  final List<BrandCardModel> brands;
  const BrandBar({super.key, required this.brands});

  @override
  State<BrandBar> createState() => _BrandBarState();
}

class _BrandBarState extends State<BrandBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            const Text(
              "Choose Brand",
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: (){},
              child: const Text("View All" ,style: TextStyle(color: Colors.grey,),),
            ),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              for(final brand in widget.brands)
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: BrandCard(brand: brand),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class BrandCard extends StatefulWidget {
  final BrandCardModel brand;
  const BrandCard({
    super.key,
    required this.brand,
  });

  @override
  State<BrandCard> createState() => _BrandCardState();
}

class _BrandCardState extends State<BrandCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[200],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                height: 40,
                width: 40,
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Image.asset(widget.brand.brandImg)
            ),
            Padding(
              padding: const EdgeInsets.only(right: 50.0),
              child: Text(
                widget.brand.brandName,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BrandCardModel{
  static const all = [
    BrandCardModel("assets/icons/adidas.png", "Adidas"),
    BrandCardModel("assets/icons/nike.png", "Nike"),
    BrandCardModel("assets/icons/Fila.jpg", "Fila"),
    BrandCardModel("assets/icons/images.png", "puma")
  ];

  final String brandImg;
  final String brandName;
  const BrandCardModel(this.brandImg, this.brandName,);
}




class ProductsGrid extends StatefulWidget {
  final List<ProductCardModel> products;
  const ProductsGrid({super.key, required this.products});

  @override
  State<ProductsGrid> createState() => _ProductsGridState();
}

class _ProductsGridState extends State<ProductsGrid> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            const Text(
              "New Arraival",
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: (){},
              child: const Text("View All",style: TextStyle(color: Colors.grey),),
            ),
          ],
        ),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
               shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // عدد العناصر في كل صف
            mainAxisSpacing: 10.0, // المسافة الرأسية بين العناصر
            crossAxisSpacing: 10.0, // المسافة الأفقية بين العناصر
            childAspectRatio: .8, // نسبة العرض إلى الارتفاع لكل عنصر
            ),
            itemCount:  ProductCardModel.all.length, // عدد العناصر في الشبكة
            itemBuilder: (BuildContext context, int index) {
            return ProductCard(
              product: ProductCardModel.all[index],
            );
            },

            ),

      ],
    );
  }
}

class ProductCard extends StatefulWidget {
  final ProductCardModel product;
  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Column(
       // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                  height: 250,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    //color: Colors.grey[200],
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image.asset(widget.product.img,fit: BoxFit.fill)
              ),
              IconButton(
                onPressed: () => setState(() => widget.product.loved = !widget.product.loved),
                icon: widget.product.loved ? const Icon(Icons.favorite_border_rounded) : const Icon(Icons.favorite_border_sharp),
              ),
            ],
          ),
         SizedBox(height: 10,),
          Text(
            widget.product.name,
            style: const TextStyle(
                fontSize: 20
            ),
          ),
          Text(
            "${widget.product.price ~/ 1}\$",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCardModel{
  static final all = [
    ProductCardModel("assets/icons/sportswear-club-fleece-pullover-hoodie-Gw4Nwq.png", "sportswear-club-fleece-pullover-hoodie-Gw4Nwq", 99),
    ProductCardModel("assets/icons/toddler-faux-fur-jacket-xVFNwZ.png", "toddler-faux-fur-jacket-xVFNwZ hgb", 70.9),
    ProductCardModel("assets/icons/LU41E626_921_06_e.jpg", "LU41E626_921_06_e ", 58.9),
    ProductCardModel("assets/icons/LM43E984_300_01_e.jpg", "LM43E984_300_01_e", 58.9),
  ];

  final String img;
  final String name;
  bool loved;
  final double price;
  ProductCardModel(this.img, this.name, this.price, [this.loved = true]);
}