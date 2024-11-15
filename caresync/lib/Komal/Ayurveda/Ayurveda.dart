import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'AyurvedaDetailScreen.dart';

class AyurvedaItem {
  final String name;
  final String imagePath;
  final String description;

  AyurvedaItem({
    required this.name,
    required this.imagePath,
    required this.description,
  });
}

final List<AyurvedaItem> ayurvedaItems = [
  AyurvedaItem(
    name: "Ashwagandha",
    imagePath: "assets/jpg/Ayurveda/ashwagandha.jpg",
    description: "Ashwagandha (Withania somnifera) is a popular herb in Ayurvedic medicine, often referred to as an adaptogen due to its ability to help the body adapt to stress. It is widely used to reduce anxiety, improve sleep, enhance cognitive function, and increase energy levels. Ashwagandha has strong anti-inflammatory and antioxidant properties, which support overall health, boost immunity, and promote muscle strength. It is also known for improving endurance and vitality, making it a go-to herb for increasing stamina. Regular use of Ashwagandha is believed to support hormonal balance, including thyroid and adrenal health, and is commonly taken in powder, capsule, or liquid form.",
  ),
  AyurvedaItem(
    name: "Turmeric",
    imagePath: "assets/jpg/Ayurveda/turmeric.jpg",
    description: "Turmeric (Curcuma longa) is a golden-yellow spice that is a key ingredient in Ayurvedic medicine, known for its powerful healing properties. The active compound in turmeric, curcumin, is responsible for many of its health benefits, including its potent anti-inflammatory, antioxidant, and antimicrobial effects. Turmeric is widely used to support joint health, reduce inflammation, and relieve pain associated with conditions like arthritis. It also helps in detoxifying the body, improving digestion, and enhancing the immune system. Turmeric has been shown to have a positive impact on skin health, as it helps in healing wounds, reducing acne, and promoting a glowing complexion. In addition, it is often used to improve brain health and may have potential benefits in reducing the risk of neurodegenerative diseases such as Alzheimer's. Whether consumed as a spice in food, taken as a supplement, or applied topically as part of skincare routines, turmeric remains a powerful and versatile herb in traditional and modern healing practices.",
  ),
  AyurvedaItem(
    name: "Tulsi",
    imagePath: "assets/jpg/Ayurveda/tulsi.jpg",
    description: "Tulsi (Ocimum sanctum), commonly known as Holy Basil, is one of the most revered plants in Ayurvedic medicine and is considered a sacred herb in India. Known for its wide range of health benefits, Tulsi is celebrated for its adaptogenic, anti-inflammatory, and immune-boosting properties. It helps the body adapt to stress, reduces anxiety, and promotes mental clarity. Tulsi is also renowned for its ability to support the respiratory system, helping to alleviate symptoms of asthma, bronchitis, and other respiratory issues. Its antimicrobial properties make it an excellent herb for fighting infections and boosting the body's natural defenses. Tulsi also supports heart health by helping to regulate blood pressure and cholesterol levels. Additionally, it is used to improve digestion, reduce inflammation, and promote skin health. Whether consumed as a tea, used in extracts, or applied topically, Tulsi is considered a powerful herb for promoting overall wellness and balance in the body and mind.",
  ),
  AyurvedaItem(
    name: "Neem",
    imagePath: "assets/jpg/Ayurveda/neem.jpg",
    description:"Neem (Azadirachta indica) is a versatile herb widely used in Ayurvedic medicine for its powerful healing properties. Known for its antibacterial, antiviral, antifungal, and anti-inflammatory effects, neem is commonly used to treat a variety of ailments, including skin infections, acne, and digestive issues. Its detoxifying properties make it an effective cleanser for the blood, promoting overall skin health and immune function. Neem is also used to support oral health by preventing gum disease and tooth decay. Beyond its topical uses, neem is consumed in various forms, such as powder, oil, and tablets, to support overall wellness, reduce fever, and enhance liver function. With its wide range of applications, neem remains a cornerstone in natural healing practices, offering a holistic approach to health.",
  ),
  AyurvedaItem(
    name: "Amla",
    imagePath: "assets/jpg/Ayurveda/amla.jpg",
    description: "Amla, or (Indian Gooseberry), is a powerful and versatile herb used extensively in Ayurvedic medicine. It is renowned for its high vitamin C content, making it an excellent immune booster. The fruit is also packed with antioxidants that help combat oxidative stress, reduce inflammation, and promote healthy skin. Consuming Amla can improve digestion, detoxify the body, and enhance overall vitality. Its use in hair care is equally popular, as it strengthens hair, prevents premature graying, and promotes growth. Available in fresh, powdered, juiced, and oil forms, Amla supports heart health, aids in weight management, and improves general well-being, making it an essential part of Ayurvedic remedies.",
  ),
  AyurvedaItem(
    name: "Brahmi",
    imagePath: "assets/jpg/Ayurveda/brahmi.jpg",
    description: "Brahmi (scientifically known as Bacopa monnieri) is a highly regarded herb in Ayurveda, primarily known for its cognitive and mental health benefits. It is commonly used to improve memory, concentration, and overall brain function. Brahmi is often referred to as a brain tonic due to its positive impact on mental clarity and cognitive enhancement. It is also known for its calming properties, helping to reduce anxiety and promote mental relaxation. In addition to cognitive benefits, Brahmi has antioxidant and anti-inflammatory properties, which support overall wellness. It is commonly consumed as a supplement, in powder form, or as an herbal tea.",
  ),
  AyurvedaItem(
    name: "Ginger",
    imagePath: "assets/jpg/Ayurveda/Ginger.jpg",
    description: "Ginger (Zingiber officinale) is a widely used root in both culinary and medicinal practices, particularly in Ayurveda. Known for its pungent and spicy flavor, ginger is celebrated for its powerful medicinal properties, including its ability to aid digestion, relieve nausea, and reduce inflammation. It is often used to treat digestive issues such as indigestion, bloating, and gas, and is highly effective in relieving nausea caused by motion sickness or morning sickness during pregnancy. Ginger also has strong anti-inflammatory and antioxidant properties, which help to reduce pain and swelling, especially in conditions like arthritis. Additionally, it is beneficial for boosting the immune system, improving circulation, and supporting respiratory health by acting as an expectorant. Ginger can be consumed fresh, dried, as a powder, in teas, or as an oil, making it a versatile herb in Ayurveda for overall wellness.",
  ),
  AyurvedaItem(
    name: "Ajwain",
    imagePath: "assets/jpg/Ayurveda/Ajwain.jpg",
    description: "Ajwain (Trachyspermum ammi), also known as carom seeds or omum, is a popular spice in Ayurvedic medicine, known for its digestive and medicinal properties. It is commonly used to relieve indigestion, bloating, and gas. Ajwain has strong antimicrobial, anti-inflammatory, and antioxidant properties, making it effective in treating infections and boosting the immune system. It is also used to alleviate respiratory issues like asthma and bronchitis due to its ability to clear mucus from the airways. In addition, Ajwain is known to support heart health, reduce inflammation, and improve skin health. It is often consumed in the form of seeds, powder, or oil, either by itself or mixed with other herbs for digestive support and overall wellness.",
  ),
];

class AyurvedaGridScreen extends StatefulWidget {
  const AyurvedaGridScreen({super.key});

  @override
  State<AyurvedaGridScreen> createState() => _AyurvedaGridScreenState();
}

class _AyurvedaGridScreenState extends State<AyurvedaGridScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final crossAxisCount = screenWidth > 800 ? 4 : (screenWidth > 600 ? 3 : 2);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0, 0.3, 0.7, 1.0],
                colors: [
                  Color.fromRGBO(97, 206, 255, 220),
                  Colors.white,
                  Colors.white,
                  Color.fromRGBO(14, 190, 126, 220),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.0, screenHeight * 0.06, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Custom AppBar content
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                          height: screenWidth * 0.1,
                          width: screenWidth * 0.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),
                            color: Colors.white,
                          ),
                          child: const Icon(
                            size: 30,
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.grey,
                          )),
                    ),
            
                    Text(
                      'Ayurveda Items',
                      style: GoogleFonts.rubik(
                        fontSize: screenWidth * 0.07,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.09,
                    ),
                    // IconButton(
                    //   icon: const Icon(Icons.shopping_cart),
                    //   onPressed: _goToCart,
                    // ),
                  ],
                ),
               
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final itemWidth = constraints.maxWidth / crossAxisCount;
                        final imageSize = itemWidth * 0.5;
                        return GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: crossAxisCount,
                            crossAxisSpacing: 16.0,
                            mainAxisSpacing: 16.0,
                            childAspectRatio: 1,
                          ),
                          itemCount: ayurvedaItems.length,
                          itemBuilder: (context, index) {
                            final item = ayurvedaItems[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AyurvedaDetailScreen(item: item),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFFBFF2DF),
                                  borderRadius: BorderRadius.circular(16.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.4),
                                      spreadRadius: 2,
                                      blurRadius: 8,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      item.imagePath,
                                      width: imageSize,
                                      height: imageSize,
                                      fit: BoxFit.cover,
                                    ),
                                    const SizedBox(height: 8.0),
                                    Text(
                                      item.name,
                                      style: TextStyle(
                                        fontSize: screenWidth > 600 ? 18 : 14,
                                        fontWeight: FontWeight.w500,
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
