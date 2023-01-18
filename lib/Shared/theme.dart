part of 'shared.dart';

const double defaultMargin = 24;

// Color
const Color primaryColor = Color(0xff503E9D);
const Color accentColor1 = Color(0xff2C1F63);
const Color accentColor2 = Color(0xffFBD460);
const Color accentColor3 = Color(0xffADADAD);

// Font text color
TextStyle blackTextFont = GoogleFonts.raleway().copyWith(color: Colors.black, fontWeight: FontWeight.w500);
TextStyle whiteTextFont = GoogleFonts.raleway().copyWith(color: Colors.white, fontWeight: FontWeight.w500);
TextStyle purpleTextFont = GoogleFonts.raleway().copyWith(color: primaryColor, fontWeight: FontWeight.w500);
TextStyle greyTextFont = GoogleFonts.raleway().copyWith(color: accentColor3, fontWeight: FontWeight.w500);

// Number text color
TextStyle whiteNumberFont = GoogleFonts.openSans().copyWith(color: Colors.white);
TextStyle yellowNumberFont = GoogleFonts.openSans().copyWith(color: accentColor2);