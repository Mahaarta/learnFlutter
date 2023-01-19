import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:learn_flutter/Bloc/bloc/blocs.dart';
import 'package:learn_flutter/Extensions/email_validator.dart';
import 'package:learn_flutter/Services/services.dart';
import 'package:learn_flutter/Shared/shared.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

part 'main_page.dart';
part 'sign_in_page.dart';
part 'wrapper.dart';
part 'splash_page.dart';