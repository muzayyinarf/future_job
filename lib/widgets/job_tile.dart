part of 'widgets.dart';

class JobTile extends StatelessWidget {
  final JobModel job;

  JobTile(this.job);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => DetailPage(job)));
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            job.companyLogo!,
            width: 45,
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(job.name ?? 'Job Title',
                    style: GoogleFonts.poppins(
                        color: Color(0xff272C2F),
                        fontSize: 16,
                        fontWeight: FontWeight.w500)),
                Text(job.companyName ?? 'Company Name',
                    style: GoogleFonts.poppins(
                        color: Color(0xffB3B5C4),
                        fontSize: 14,
                        fontWeight: FontWeight.w400)),
                SizedBox(
                  height: 18.5,
                ),
                Divider(height: 10, thickness: 1, color: Color(0xffECEDF1))
              ],
            ),
          )
        ],
      ),
    );
  }
}
