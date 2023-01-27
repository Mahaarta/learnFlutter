import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_flutter/Bloc/bloc/blocs.dart';
import 'package:learn_flutter/Extensions/email_validator.dart';
import 'package:learn_flutter/Services/services.dart';
import 'package:learn_flutter/Shared/shared.dart';
import 'package:learn_flutter/UI/Pages/movie_page.dart';
import 'package:learn_flutter/UI/Widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../Models/models.dart';

part 'main_page.dart';
part 'sign_in_page.dart';
part 'wrapper.dart';
part 'splash_page.dart';
part 'preference_page.dart';
part 'sign_up_page.dart';
part 'account_confirmation_page.dart';

