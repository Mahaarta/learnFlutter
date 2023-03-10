part of 'widgets.dart';

class PromoCard extends StatelessWidget {
  final Promo promo;
  const PromoCard({super.key, required this.promo});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: primaryColor,
          ),
          child: Container(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(promo.title, style: whiteNumberFont),
                    Text(
                      promo.subtitle,
                      style: whiteNumberFont.copyWith(
                          fontSize: 11, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "OFF ",
                      style: yellowNumberFont.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      "${promo.discount}%",
                      style: yellowNumberFont.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        ShaderMask(
          shaderCallback: (rectangle) {
            return LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [
                Colors.black.withOpacity(0.1),
                Colors.transparent,
              ],
            ).createShader(const Rect.fromLTRB(0, 0, 77.5, 80));
          },
          blendMode: BlendMode.dstIn,
          child: SizedBox(
            height: 80,
            width: 77.5,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
              child: Image.asset("assets/reflection2.png"),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.black.withOpacity(0.1),
                  Colors.transparent,
                ],
              ).createShader(const Rect.fromLTRB(0, 0, 96, 45));
            },
            blendMode: BlendMode.dstIn,
            child: SizedBox(
              height: 46,
              width: 96,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(15),
                ),
                child: Image.asset("assets/reflection1.png"),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.black.withOpacity(0.1),
                  Colors.transparent,
                ],
              ).createShader(const Rect.fromLTRB(0, 0, 53, 25));
            },
            blendMode: BlendMode.dstIn,
            child: SizedBox(
              height: 25,
              width: 53,
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15),
                  ),
                  child: Image.asset("assets/reflection3.png")),
            ),
          ),
        )
      ],
    );
  }
}
