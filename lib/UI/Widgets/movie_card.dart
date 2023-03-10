part of 'widgets.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final Function? onTap;

  const MovieCard(this.movie, {super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 210,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: NetworkImage("${imageBaseURL}w780${movie.backdropPath}"),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        height: 150,
        width: 210,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(0.6),
              Colors.black.withOpacity(0)
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              movie.title,
              style: whiteNumberFont,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            RatingStars(
              voteAverage: movie.voteAverage,
            )
          ],
        ),
      ),
    );
  }
}
