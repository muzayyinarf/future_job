part of 'pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    var categoryProvider = Provider.of<CategoryProvider>(context);
    var jobProvider = Provider.of<JobProvider>(context);

    Widget header() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Howdy',
                style: titleTextStyle,
              ),
              Text(
                userProvider.user.name!,
                style: subTitleTextStyle,
              )
            ],
          ),
          CircleAvatar(
            radius: 31,
            backgroundImage: AssetImage('assets/avatar.png'),
          )
        ],
      );
    }

    Widget hotCategories() {
      return Container(
        child: Padding(
          padding: EdgeInsets.only(top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hot Categories',
                style: titleCategory,
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 200,
                child: FutureBuilder<List<CategoryModel>?>(
                    future: categoryProvider.getCategories(),
                    builder: (context, snapshot) {
                      print(snapshot.data);
                      if (snapshot.connectionState == ConnectionState.done) {
                        int index = -1;
                        return ListView(
                          scrollDirection: Axis.horizontal,
                          children: snapshot.data!.map((category) {
                            index++;
                            return Container(
                              margin: EdgeInsets.only(
                                left: (index == 0) ? 0 : 16,
                              ),
                              child: CategoryCard(category),
                            );
                          }).toList(),
                        );
                      }

                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }),
              ),
            ],
          ),
        ),
      );
    }

    Widget justPosted() {
      return Container(
        padding: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Just Posted',
              style: blackTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            FutureBuilder<List<JobModel>?>(
              future: jobProvider.getJobs(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  var index = -1;
                  return Column(
                    children: snapshot.data!.map((job) {
                      index++;
                      return Container(
                        margin: EdgeInsets.only(top: (index == 0) ? 0 : 16),
                        child: JobTile(job),
                      );
                    }).toList(),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            )
          ],
        ),
      );
    }

    return Scaffold(
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
          showSelectedLabels: false,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Color(0xffB3B5C4),
          selectedItemColor: Color(0xff272C2F),
          currentIndex: 0,
          elevation: 0,
          iconSize: 24,
          items: [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/navbar_1.png')), label: ''),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/navbar_2.png')), label: ''),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/navbar_3.png')), label: ''),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/navbar_4.png')), label: ''),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 30, 24, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                hotCategories(),
                justPosted(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
