class StringText{


  static final selectCrops = 'Select up to 8 crops you are intrested in';
}

  List images = [
    'assets/images/disease.jpg',
    'assets/images/disease.jpg',
    'assets/images/disease.jpg',
    'assets/images/disease.jpg',
    'assets/images/disease.jpg',
    'assets/images/disease.jpg',
    'assets/images/disease.jpg',
    'assets/images/disease.jpg',
    'assets/images/disease.jpg',
    'assets/images/disease.jpg',
    'assets/images/disease.jpg',
    'assets/images/disease.jpg',
    'assets/images/disease.jpg',
  ];
  List cropsName = [
    'Banana',
    'Cotton',
    'Wheat',
    'Rice',
    'Maize',
    'Apple',
    'asif',
    'khan',
    'mirha',
    'hamdan',
    'moaiz',
    'laptop',
    'pc',
    'Ac',
    'Dc',
  ];
  class SelectCropsData{
    String image;
    String name;
    SelectCropsData({
      required this.image,required this.name
    });
  }