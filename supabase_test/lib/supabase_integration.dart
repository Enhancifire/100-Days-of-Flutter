import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseHelper {
  final supabase = Supabase.instance.client;

  signUp(String phone) async {
    await supabase.auth.signInWithOtp(email: phone);
  }
}
