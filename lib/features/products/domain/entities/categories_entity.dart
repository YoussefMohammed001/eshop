class CategoryEntity{
  final String name;
  final String image;
  final int id;
   bool isSelected;

  CategoryEntity( {required this.id,required this.name,required this.image, this.isSelected = false});
}