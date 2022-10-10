part of 'widgets.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;

  CategoryCard(this.category);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => CategoryPage(category)));
      },
      child: Container(
        width: 150,
        height: 200,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(category.imageUrl!))),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 16, bottom: 16),
            child: Text(
              category.name ?? 'title',
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
