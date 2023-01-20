import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:learn_flutter/Bloc/User/bloc/user_bloc.dart';
import 'package:learn_flutter/Shared/shared.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: accentColor1,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          padding:
              const EdgeInsets.fromLTRB(defaultMargin, 20, defaultMargin, 30),
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, userState) {
              if (userState is UserLoaded) {
                return Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFF5F558B),
                        ),
                      ),
                      child: Stack(
                        children: [
                          const SpinKitFadingCircle(
                            size: 50,
                            color: accentColor2,
                          ),
                          FutureBuilder(
                            future: userState.user,
                            builder: (context, snapshot) => Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: (snapshot.data?.profilePicture == "")
                                        ? const AssetImage(
                                                "assets/user_pic.png")
                                            as ImageProvider
                                        : NetworkImage(
                                            snapshot.data?.profilePicture ??
                                                ""),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 16),
                      child: BlocBuilder<UserBloc, UserState>(
                        builder: (context, state) => FutureBuilder(
                          future: userState.user,
                          builder: (context, snapshot) => Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                /*
                                note: 
                                    1. (2 * defaultMargin) = margin left & margin right
                                    2. 50 = width of profile picture
                                    3. 12 = space between profile picture and white border left & right
                                        5 is space between
                                        1 is white border width
                                    4. 16 = space between white border & name
                              */

                                width: (MediaQuery.of(context).size.width -
                                    (2 * defaultMargin) -
                                    50 -
                                    12 -
                                    16),
                                child: Text(
                                  snapshot.data?.name ?? "",
                                  style: whiteTextFont.copyWith(fontSize: 18),
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                              Text(
                                NumberFormat.currency(
                                  locale: "id_ID",
                                  decimalDigits: 0,
                                  symbol: "IDR "
                                ).format(snapshot.data?.balance ?? 0),
                                style: yellowNumberFont.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                );
              } else {
                return const SpinKitFadingCircle(
                  color: accentColor2,
                  size: 50,
                );
              }
            },
          ),
        )
      ],
    );
  }
}
