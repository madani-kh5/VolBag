// le modèle slider contient les données de notre page guide , sliderView 
class SliderModel{
  String imagePath;
  String title;
  String desc;

  SliderModel({this.imagePath,this.title,this.desc});

  void setImagePath(String imagePath){
    this.imagePath=imagePath;
  }

  void setTitle(String title){
    this.title=title;
  }

  void setDesc(String desc){
    this.desc=desc;
  }

  String getImagePath(){
    return imagePath;
  }

  String getTitle(){
    return title;
  }

  String getDesc(){
    return desc;
  }
}

List<SliderModel> getSlides(){
  List<SliderModel> slides=new List<SliderModel>();
  SliderModel sliderModel= new SliderModel();

  /*        le silder numéro 1        */
  sliderModel.setImagePath("assets/images/hospital.png");
  sliderModel.setTitle("urgence");
  sliderModel.setDesc("trouvez de l'aide juste avec un simple geste pour préciser pour localisation");

  slides.add(sliderModel);

  
   /*        le silder numéro 2        */
  sliderModel= new SliderModel();
  sliderModel.setImagePath("assets/images/service.png");
  sliderModel.setTitle("services");
  sliderModel.setDesc("vous pouvez trouvez tout type de services qui peuvent vous aidez dans votre vie quotidienne et surtout dans le besoin");

  slides.add(sliderModel);

   /*        le silder numéro 3        */
  sliderModel= new SliderModel();
  sliderModel.setImagePath("assets/images/medical.png");
  sliderModel.setTitle("aide médical");
  sliderModel.setDesc("vous pouvez même trouver de l'aide médical et de personnel soignant");

  slides.add(sliderModel);

   /*        le silder numéro 4        */
  sliderModel= new SliderModel();
  sliderModel.setImagePath("assets/images/plus.png");
  sliderModel.setTitle("et encore plus");
  sliderModel.setDesc("Vous pouvez trouver plus de type de volontariat et vous pouvez même participer à améliorer et à ajouter des fonctionnalités");

  slides.add(sliderModel);

  return slides;
}