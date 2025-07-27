import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es', 'fr'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? esText = '',
    String? frText = '',
  }) =>
      [enText, esText, frText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomeScreen
  {
    'i9gklzdx': {
      'en': 'Health Monitor',
      'es': 'Monitor de salud',
      'fr': 'Moniteur de santé',
    },
    'jfmnt0s2': {
      'en': 'Quick Actions',
      'es': '',
      'fr': '',
    },
    'q9h876sb': {
      'en': 'Home',
      'es': '',
      'fr': '',
    },
    'uj92cw0c': {
      'en': 'Health Data',
      'es': '',
      'fr': '',
    },
    '0imsqdxg': {
      'en': 'Appointments',
      'es': '',
      'fr': '',
    },
    'tzh3ffsm': {
      'en': 'Profile',
      'es': '',
      'fr': '',
    },
    'azk544s0': {
      'en':
          '\"Stay Hyderated : Aim to drink at least 8 glasses of water daily.\"',
      'es': '',
      'fr': '',
    },
    'n17nah8u': {
      'en':
          '\"Incorporate at least 30 minutes of physical activity into your routine each day.\"',
      'es': '',
      'fr': '',
    },
    'yiz1ovpb': {
      'en': 'Health Overview',
      'es': 'Métricas recientes',
      'fr': 'Mesures récentes',
    },
    'o4zrem1s': {
      'en': 'Recent Metrics',
      'es': 'Métricas recientes',
      'fr': 'Mesures récentes',
    },
    'xt2u14eh': {
      'en': 'View All',
      'es': 'Ver todo',
      'fr': 'Tout voir',
    },
    '4f0itcdh': {
      'en': 'Heart Rate',
      'es': 'Frecuencia cardíaca',
      'fr': 'Fréquence cardiaque',
    },
    '94905v13': {
      'en': 'Blood Pressure',
      'es': 'Presión arterial',
      'fr': 'Pression artérielle',
    },
    'mtuetw1c': {
      'en': 'Weight',
      'es': 'Peso',
      'fr': 'Poids',
    },
    '0rlsv8zj': {
      'en': 'BMI',
      'es': 'IMC',
      'fr': 'IMC',
    },
    'w6arvwed': {
      'en': 'Activity Level',
      'es': 'IMC',
      'fr': 'IMC',
    },
    'gewrle1z': {
      'en': 'Start Measurements',
      'es': 'Iniciar mediciones',
      'fr': 'Commencer les mesures',
    },
    '1vgpsqrl': {
      'en': 'Recent Activities',
      'es': 'Actividades recientes',
      'fr': 'Activités récentes',
    },
    '9uj8qfm9': {
      'en': 'Morning Walk',
      'es': 'Paseo matutino',
      'fr': 'Promenade matinale',
    },
    'bi2xkmii': {
      'en': '30 minutes • 2,500 steps',
      'es': '30 minutos • 2.500 pasos',
      'fr': '30 minutes • 2 500 pas',
    },
    'srbe0yhw': {
      'en': 'Blood Pressure Check',
      'es': 'Control de presión arterial',
      'fr': 'Contrôle de la tension artérielle',
    },
    'lnbuj4uz': {
      'en': '120/80 mmHg',
      'es': '120/80 mmHg',
      'fr': '120/80 mmHg',
    },
    '47e5p3qx': {
      'en': 'Click',
      'es': '',
      'fr': '',
    },
    '6ydk8czm': {
      'en': 'Date Range',
      'es': 'Rango de fechas',
      'fr': 'Plage de dates',
    },
    'jl7ndttn': {
      'en': 'Start Date',
      'es': 'Fecha de inicio',
      'fr': 'Date de début',
    },
    'byttuy28': {
      'en': 'End Date',
      'es': 'Fecha de finalización',
      'fr': 'Date de fin',
    },
    'tybzkrkf': {
      'en': 'Generate',
      'es': 'Generar',
      'fr': 'Générer',
    },
    'jri81wl3': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
    'n3dfpa1u': {
      'en': 'Verify to Login to your account',
      'es': 'Verificar para iniciar sesión en su cuenta',
      'fr': 'Vérifiez pour vous connecter à votre compte',
    },
  },
  // Login
  {
    'na5z6fqj': {
      'en': 'Welcome Back',
      'es': 'Bienvenido de nuevo',
      'fr': 'Content de te revoir',
    },
    'p1bp2ca7': {
      'en': 'Sign in to continue',
      'es': 'Inicia sesión para continuar',
      'fr': 'Connectez-vous pour continuer',
    },
    '00sanz82': {
      'en': 'Welcome to HealthChrono',
      'es': '',
      'fr': '',
    },
    'jceewbrt': {
      'en': 'Your personal health companion for a better lifestyle',
      'es': '',
      'fr': '',
    },
    'wlrdmdq1': {
      'en': 'Health Monitoring',
      'es': '',
      'fr': '',
    },
    'n2ebmgqv': {
      'en': 'Track your vital signs and health metrics',
      'es': '',
      'fr': '',
    },
    'zjrla1ku': {
      'en': 'Wellness Tracker',
      'es': '',
      'fr': '',
    },
    '55uybn2j': {
      'en': 'Monitor your daily health \nand stay on top of your wellness',
      'es': '',
      'fr': '',
    },
    '027qmgaa': {
      'en': 'Client',
      'es': 'Cliente',
      'fr': 'Client',
    },
    '4f1f2mqf': {
      'en': 'Email Address',
      'es': 'Dirección de correo electrónico',
      'fr': 'Adresse email',
    },
    '32zqov42': {
      'en': 'Password',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
    },
    'rw2yafui': {
      'en': 'Remember me',
      'es': 'Acuérdate de mí',
      'fr': 'Souviens-toi de moi',
    },
    'sxegjhsp': {
      'en': 'Forgot Password?',
      'es': '¿Has olvidado tu contraseña?',
      'fr': 'Mot de passe oublié?',
    },
    '7aqhfx10': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    '2uqpq1wf': {
      'en': 'Enter a valid email address',
      'es': 'Introduzca una dirección de correo electrónico válida',
      'fr': 'Entrez une adresse email valide',
    },
    'yq9z1et9': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'kyx6jxqp': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'pql5sdzi': {
      'en': 'Minimum 8 characters required',
      'es': 'Se requieren al menos 8 caracteres',
      'fr': 'Minimum 8 caractères requis',
    },
    'i7xh7lkm': {
      'en':
          'Password should contain:\n- At least one lower case letter\n- At least one upper case letter\n- At least one digit and\n- At least one special character',
      'es':
          'La contraseña debe contener:\n- Al menos una letra minúscula\n- Al menos una letra mayúscula\n- Al menos un dígito y\n- Al menos un carácter especial',
      'fr':
          'Le mot de passe doit contenir :\n- Au moins une lettre minuscule\n- Au moins une lettre majuscule\n- Au moins un chiffre et\n- Au moins un caractère spécial',
    },
    'bk5n2k5e': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'iyk58c0j': {
      'en': 'Login',
      'es': 'Acceso',
      'fr': 'Se connecter',
    },
    '32aqe5ot': {
      'en': 'Don\'t have an account? ',
      'es': '¿No tienes una cuenta?',
      'fr': 'Vous n\'avez pas de compte ?',
    },
    'st4lypux': {
      'en': 'Sign Up',
      'es': 'Inscribirse',
      'fr': 'S\'inscrire',
    },
    '9vlbpde1': {
      'en': 'Practitioner',
      'es': 'Facultativo',
      'fr': 'Praticien',
    },
    'jry6vmk6': {
      'en': 'Email Address',
      'es': 'Dirección de correo electrónico',
      'fr': 'Adresse email',
    },
    'noyehxmw': {
      'en': 'Password',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
    },
    'fnzph4o1': {
      'en': 'Remember me',
      'es': 'Acuérdate de mí',
      'fr': 'Souviens-toi de moi',
    },
    '6lkwm37j': {
      'en': 'Forgot Password?',
      'es': '¿Has olvidado tu contraseña?',
      'fr': 'Mot de passe oublié?',
    },
    'ymw5dup3': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'kuiqf0ee': {
      'en': 'Enter a valid email address',
      'es': 'Introduzca una dirección de correo electrónico válida',
      'fr': 'Entrez une adresse email valide',
    },
    '6graceay': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'dxrl83g7': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'qxr8dzyc': {
      'en': 'Minimum 8 characters required',
      'es': 'Se requieren al menos 8 caracteres',
      'fr': 'Minimum 8 caractères requis',
    },
    'u4267skp': {
      'en':
          'Password should contain:\n- At least one lower case letter\n- At least one upper case letter\n- At least one digit and\n- At least one special character',
      'es':
          'La contraseña debe contener:\n- Al menos una letra minúscula\n- Al menos una letra mayúscula\n- Al menos un dígito y\n- Al menos un carácter especial',
      'fr':
          'Le mot de passe doit contenir :\n- Au moins une lettre minuscule\n- Au moins une lettre majuscule\n- Au moins un chiffre et\n- Au moins un caractère spécial',
    },
    'ks1kcgbp': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'aypzs47r': {
      'en': 'Login',
      'es': 'Acceso',
      'fr': 'Se connecter',
    },
    'w0fcj9bz': {
      'en': 'Don\'t have an account? ',
      'es': '¿No tienes una cuenta?',
      'fr': 'Vous n\'avez pas de compte ?',
    },
    'izx7xckw': {
      'en': 'Sign Up',
      'es': 'Inscribirse',
      'fr': 'S\'inscrire',
    },
  },
  // SignUp
  {
    'p112f5ct': {
      'en': 'Create Account',
      'es': 'Crear una cuenta',
      'fr': 'Créer un compte',
    },
    '4mohut7o': {
      'en': 'Join us to track your health journey',
      'es': 'Únase a nosotros para seguir su trayectoria de salud',
      'fr': 'Rejoignez-nous pour suivre votre parcours de santé',
    },
    'y2swlogg': {
      'en': 'Health Chrono',
      'es': '',
      'fr': '',
    },
    'l48u6hpq': {
      'en': 'Your Personal Health Companion',
      'es': '',
      'fr': '',
    },
    'ytqnqfzq': {
      'en': 'Why Choose Health Monitor?',
      'es': '',
      'fr': '',
    },
    's6kk63kp': {
      'en': 'HIPAA Compliant Security',
      'es': '',
      'fr': '',
    },
    'nv0o9d96': {
      'en': 'Advanced Health Analytics',
      'es': '',
      'fr': '',
    },
    '8wamjm0t': {
      'en': 'Real-time Health Monitoring',
      'es': '',
      'fr': '',
    },
    'j644paej': {
      'en': 'Multi-device Support',
      'es': '',
      'fr': '',
    },
    'ho4tj62l': {
      'en': 'Client',
      'es': 'Cliente',
      'fr': 'Client',
    },
    'qjmq6jkq': {
      'en': 'First Name',
      'es': 'Nombre de pila',
      'fr': 'Prénom',
    },
    'd1er2gwd': {
      'en': 'Last Name',
      'es': 'Apellido',
      'fr': 'Nom de famille',
    },
    't5v0bziw': {
      'en': 'Select Gender',
      'es': 'Seleccione género',
      'fr': 'Sélectionnez le sexe',
    },
    '1gaif1ln': {
      'en': 'Search...',
      'es': 'Buscar...',
      'fr': 'Recherche...',
    },
    'wolgcyq1': {
      'en': 'Male',
      'es': 'Masculino',
      'fr': 'Mâle',
    },
    '6yvjem9l': {
      'en': 'Female',
      'es': 'Femenino',
      'fr': 'Femelle',
    },
    'oorfy6zs': {
      'en': 'Other',
      'es': 'Otro',
      'fr': 'Autre',
    },
    '4y9fz3ov': {
      'en': 'Field is required...',
      'es': 'El campo es obligatorio...',
      'fr': 'Le champ est obligatoire...',
    },
    'qlfn1z53': {
      'en': 'Field is required...',
      'es': 'El campo es obligatorio...',
      'fr': 'Le champ est obligatoire...',
    },
    '2ksqlvjs': {
      'en': 'Select Timezone',
      'es': 'Seleccione género',
      'fr': 'Sélectionnez le sexe',
    },
    'qnyjpgiy': {
      'en': 'Search...',
      'es': 'Buscar...',
      'fr': 'Recherche...',
    },
    'plhjp5wg': {
      'en': 'Field is required...',
      'es': 'El campo es obligatorio...',
      'fr': 'Le champ est obligatoire...',
    },
    '2vin7q4t': {
      'en': 'Password',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
    },
    'jaahnp4n': {
      'en': 'Confirm Password',
      'es': 'confirmar Contraseña',
      'fr': 'Confirmez le mot de passe',
    },
    'n4ylfa22': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'fxadkte7': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'jvczpd1g': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    '6vf20oyv': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'i4n4yp92': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'qkbilrxu': {
      'en': 'At least 8 characters are required...',
      'es': 'Se requieren al menos 8 caracteres...',
      'fr': 'Au moins 8 caractères sont requis...',
    },
    'ipe4gbg6': {
      'en':
          'Password should contain:\n- At least one lower case letter\n- At least one upper case letter\n- At least one digit and\n- At least one special character',
      'es':
          'La contraseña debe contener:\n- Al menos una letra minúscula\n- Al menos una letra mayúscula\n- Al menos un dígito y\n- Al menos un carácter especial',
      'fr':
          'Le mot de passe doit contenir :\n- Au moins une lettre minuscule\n- Au moins une lettre majuscule\n- Au moins un chiffre et\n- Au moins un caractère spécial',
    },
    '7tatnan4': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'y7qli3jx': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    '5zbvdpyf': {
      'en': 'At least 8 characters are required...',
      'es': 'Se requieren al menos 8 caracteres...',
      'fr': 'Au moins 8 caractères sont requis...',
    },
    'rjeiegz8': {
      'en':
          'Password should contain:\n- At least one lower case letter\n- At least one upper case letter\n- At least one digit and\n- At least one special character',
      'es':
          'La contraseña debe contener:\n- Al menos una letra minúscula\n- Al menos una letra mayúscula\n- Al menos un dígito y\n- Al menos un carácter especial',
      'fr':
          'Le mot de passe doit contenir :\n- Au moins une lettre minuscule\n- Au moins une lettre majuscule\n- Au moins un chiffre et\n- Au moins un caractère spécial',
    },
    'vaubj65b': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'ik5jq9xm': {
      'en': 'Sign Up',
      'es': 'Inscribirse',
      'fr': 'S\'inscrire',
    },
    '9y7qmas7': {
      'en': 'By creating an account, you are agreeing to our ',
      'es': 'Al crear una cuenta, usted acepta nuestros',
      'fr': 'En créant un compte, vous acceptez nos',
    },
    'i7olfo6d': {
      'en': 'Terms & Conditions',
      'es': 'Términos y condiciones',
      'fr': 'Conditions générales',
    },
    'tyfsi3bq': {
      'en': ' and ',
      'es': 'y',
      'fr': 'et',
    },
    '49wi9d2t': {
      'en': 'Privacy Policy',
      'es': 'política de privacidad',
      'fr': 'politique de confidentialité',
    },
    'tc152fsr': {
      'en': 'Already have an account? ',
      'es': '¿Ya tienes una cuenta?',
      'fr': 'Vous avez déjà un compte ?',
    },
    'wyki395q': {
      'en': 'Sign In',
      'es': 'Iniciar sesión',
      'fr': 'Se connecter',
    },
    'khiwu4pi': {
      'en': 'Practitioner',
      'es': 'Facultativo',
      'fr': 'Praticien',
    },
    'ro7rzn4b': {
      'en': 'Practitioner Details',
      'es': 'Datos del practicante',
      'fr': 'Détails du praticien',
    },
    'w21l3if1': {
      'en': 'First Name',
      'es': 'Nombre de pila',
      'fr': 'Prénom',
    },
    'bfpzgfos': {
      'en': 'Last Name',
      'es': 'Apellido',
      'fr': 'Nom de famille',
    },
    'kzx9y4d9': {
      'en': 'Select Gender',
      'es': 'Seleccione género',
      'fr': 'Sélectionnez le sexe',
    },
    'bm8ag3n3': {
      'en': 'Search...',
      'es': 'Buscar...',
      'fr': 'Recherche...',
    },
    'xumd8005': {
      'en': 'Male',
      'es': 'Masculino',
      'fr': 'Mâle',
    },
    'wxzomt78': {
      'en': 'Female',
      'es': 'Femenino',
      'fr': 'Femelle',
    },
    'p79uhhk8': {
      'en': 'Other',
      'es': 'Otro',
      'fr': 'Autre',
    },
    'z0pv4lu1': {
      'en': 'Field is required...',
      'es': 'El campo es obligatorio...',
      'fr': 'Le champ est obligatoire...',
    },
    'eevppkgi': {
      'en': 'Field is required...',
      'es': 'El campo es obligatorio...',
      'fr': 'Le champ est obligatoire...',
    },
    'm6ykttwv': {
      'en': 'Select Timezone',
      'es': 'Seleccione género',
      'fr': 'Sélectionnez le sexe',
    },
    'b21vnc3x': {
      'en': 'Search...',
      'es': 'Buscar...',
      'fr': 'Recherche...',
    },
    '8qvu2q46': {
      'en': 'Field is required...',
      'es': 'El campo es obligatorio...',
      'fr': 'Le champ est obligatoire...',
    },
    '7ns30vuu': {
      'en': 'Password',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
    },
    'dsbqno33': {
      'en': 'Confirm Password',
      'es': 'confirmar Contraseña',
      'fr': 'Confirmez le mot de passe',
    },
    'nqx42xrx': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'ms4x46jh': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'nf7k2hp7': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'cb3eq0kr': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'okdef7mq': {
      'en': 'Field is required...',
      'es': 'El campo es obligatorio...',
      'fr': 'Le champ est obligatoire...',
    },
    'mpqylcnw': {
      'en': 'At least 8 characters are required...',
      'es': 'Se requieren al menos 8 caracteres...',
      'fr': 'Au moins 8 caractères sont requis...',
    },
    'z8bz2u7s': {
      'en':
          'Password should contain:\n- At least one lower case letter\n- At least one upper case letter\n- At least one digit and\n- At least one special character',
      'es':
          'La contraseña debe contener:\n- Al menos una letra minúscula\n- Al menos una letra mayúscula\n- Al menos un dígito y\n- Al menos un carácter especial',
      'fr':
          'Le mot de passe doit contenir :\n- Au moins une lettre minuscule\n- Au moins une lettre majuscule\n- Au moins un chiffre et\n- Au moins un caractère spécial',
    },
    'n4j3pxir': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'o427pwtc': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'uiq025z8': {
      'en': 'At least 8 characters are required...',
      'es': 'Se requieren al menos 8 caracteres...',
      'fr': 'Au moins 8 caractères sont requis...',
    },
    '5qryoada': {
      'en':
          'Password should contain:\n- At least one lower case letter\n- At least one upper case letter\n- At least one digit and\n- At least one special character',
      'es':
          'La contraseña debe contener:\n- Al menos una letra minúscula\n- Al menos una letra mayúscula\n- Al menos un dígito y\n- Al menos un carácter especial',
      'fr':
          'Le mot de passe doit contenir :\n- Au moins une lettre minuscule\n- Au moins une lettre majuscule\n- Au moins un chiffre et\n- Au moins un caractère spécial',
    },
    'jbpot3wn': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '9w26y6vc': {
      'en': 'Sign Up',
      'es': 'Inscribirse',
      'fr': 'S\'inscrire',
    },
    '4b8th5fi': {
      'en': 'By creating an account, you are agreeing to our ',
      'es': 'Al crear una cuenta, usted acepta nuestros',
      'fr': 'En créant un compte, vous acceptez nos',
    },
    '8yfzbvgr': {
      'en': 'Terms & Conditions',
      'es': 'Términos y condiciones',
      'fr': 'Conditions générales',
    },
    'ki9j3yn0': {
      'en': ' and ',
      'es': 'y',
      'fr': 'et',
    },
    '14npaaz4': {
      'en': 'Privacy Policy',
      'es': 'política de privacidad',
      'fr': 'politique de confidentialité',
    },
    'y2rey9z5': {
      'en': 'Already have an account? ',
      'es': '¿Ya tienes una cuenta?',
      'fr': 'Vous avez déjà un compte ?',
    },
    '2o313cg4': {
      'en': 'Sign In',
      'es': 'Iniciar sesión',
      'fr': 'Se connecter',
    },
    'jpm5t1xq': {
      'en': 'Practitioner Information',
      'es': 'Información para el profesional',
      'fr': 'Informations pour les praticiens',
    },
    'hcp7e9gb': {
      'en': 'Practitioner Type(s)',
      'es': 'Tipo(s) de practicante',
      'fr': 'Type(s) de praticien(s)',
    },
    'b48ooe3i': {
      'en': 'Search...',
      'es': 'Buscar...',
      'fr': 'Recherche...',
    },
    '4r3le09c': {
      'en': 'Option 1',
      'es': 'Opción 1',
      'fr': 'Option 1',
    },
    'thpdosx2': {
      'en': 'Option 2',
      'es': 'Opción 2',
      'fr': 'Option 2',
    },
    '69uouvr2': {
      'en': 'Option 3',
      'es': 'Opción 3',
      'fr': 'Option 3',
    },
    'br5v0ih0': {
      'en': 'Are you medically licensed in your state/country?',
      'es': '¿Tiene usted licencia médica en su estado/país?',
      'fr': 'Êtes-vous titulaire d’une licence médicale dans votre état/pays ?',
    },
    'jgbqztke': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'pt9c4v4b': {
      'en': 'Yes',
      'es': 'Sí',
      'fr': 'Oui',
    },
    '65rbnx1s': {
      'en': 'No',
      'es': 'No',
      'fr': 'Non',
    },
    'got1n3iy': {
      'en': 'Type in your registration number',
      'es': 'Escriba su número de registro',
      'fr': 'Entrez votre numéro d\'immatriculation',
    },
    'm2sogv2n': {
      'en': 'Are you non-medically licensed in your state/country?',
      'es': '¿Tiene usted licencia no médica en su estado/país?',
      'fr':
          'N’êtes-vous pas titulaire d’une licence médicale dans votre état/pays ?',
    },
    '9wh2r5q3': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'n61skv3n': {
      'en': 'Yes',
      'es': 'Sí',
      'fr': 'Oui',
    },
    'rw2ugkmc': {
      'en': 'No',
      'es': 'No',
      'fr': 'Non',
    },
    'rw7fru4h': {
      'en': 'What type of license?',
      'es': '¿Qué tipo de licencia?',
      'fr': 'Quel type de licence ?',
    },
    'ny2hl68r': {
      'en': 'Business Information',
      'es': 'Información comercial',
      'fr': 'Informations commerciales',
    },
    'ksqi2tii': {
      'en': 'Business Name',
      'es': 'Nombre de la empresa',
      'fr': 'Nom de l\'entreprise',
    },
    'ix0tvbaw': {
      'en': 'Phone Number',
      'es': 'Número de teléfono',
      'fr': 'Numéro de téléphone',
    },
    'hdvyfwka': {
      'en': 'City',
      'es': 'Ciudad',
      'fr': 'Ville',
    },
    '9444lr14': {
      'en': 'State',
      'es': 'Estado',
      'fr': 'État',
    },
    'giu8i2ja': {
      'en': 'Province',
      'es': 'Provincia',
      'fr': 'Province',
    },
    'ngw5x8do': {
      'en': 'Country',
      'es': 'País',
      'fr': 'Pays',
    },
    'uj7gcubo': {
      'en': 'Type of Business',
      'es': 'Tipo de asunto',
      'fr': 'Type d\'entreprise',
    },
    'quw4jbv0': {
      'en': 'Personal Business',
      'es': 'Negocios personales',
      'fr': 'Affaires personnelles',
    },
    'ecrdulh7': {
      'en': 'Another Organization',
      'es': 'Otra organización',
      'fr': 'Une autre organisation',
    },
    'a7b5mh9r': {
      'en':
          'Approximately how many other practitioners work in your office, if any?',
      'es':
          '¿Aproximadamente cuántos otros profesionales trabajan en su consultorio, si hay alguno?',
      'fr':
          'Environ combien d’autres praticiens travaillent dans votre cabinet, le cas échéant ?',
    },
    '6hk0kgf3': {
      'en': 'Search...',
      'es': 'Buscar...',
      'fr': 'Recherche...',
    },
    'ghz2ysjh': {
      'en': '1 - 3',
      'es': '1 - 3',
      'fr': '1 - 3',
    },
    'x2crqfi5': {
      'en': '4 - 10',
      'es': '4 - 10',
      'fr': '4 - 10',
    },
    '9iyqiud2': {
      'en': '10+',
      'es': '10+',
      'fr': '10+',
    },
    'kwsxj6jc': {
      'en':
          'Do you have support staff that need access to Healthmagus ( e.g., viewing privileges, to make/update appts, accept payments, assist with lab tests orders, invoicing, etc.)?',
      'es':
          '¿Tiene personal de apoyo que necesita acceso a Healthmagus (por ejemplo, privilegios de visualización, para hacer/actualizar citas, aceptar pagos, ayudar con pedidos de pruebas de laboratorio, facturación, etc.)?',
      'fr':
          'Avez-vous du personnel de soutien qui a besoin d\'accéder à Healthmagus (par exemple, pour visualiser les privilèges, pour prendre/mettre à jour les rendez-vous, accepter les paiements, aider aux commandes de tests de laboratoire, à la facturation, etc.) ?',
    },
    '2mgksev1': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'pd96dk78': {
      'en': 'Yes',
      'es': 'Sí',
      'fr': 'Oui',
    },
    '48lnlzd3': {
      'en': 'No',
      'es': 'No',
      'fr': 'Non',
    },
    'uo6ki37m': {
      'en':
          'If yes, how many support staff need access to your Healthmagus account?\n',
      'es':
          'Si es así, ¿cuántos miembros del personal de soporte necesitan acceso a su cuenta de Healthmagus?',
      'fr':
          'Si oui, combien d’employés de soutien ont besoin d’accéder à votre compte Healthmagus ?',
    },
    '8u09mi8t': {
      'en': 'Search...',
      'es': 'Buscar...',
      'fr': 'Recherche...',
    },
    'l0ei7s3e': {
      'en': '0',
      'es': '0',
      'fr': '0',
    },
    'rrukfvlx': {
      'en': '1',
      'es': '1',
      'fr': '1',
    },
    'vijqt4if': {
      'en': '2',
      'es': '2',
      'fr': '2',
    },
    'xuqcrxmz': {
      'en': '3',
      'es': '3',
      'fr': '3',
    },
    '9xwha39w': {
      'en': '4',
      'es': '4',
      'fr': '4',
    },
  },
  // Settings
  {
    'a9wxzkr8': {
      'en': 'Settings',
      'es': 'Ajustes',
      'fr': 'Paramètres',
    },
    'j01zyf7l': {
      'en': 'Customize your app settings',
      'es': 'Personaliza tu experiencia con la aplicación',
      'fr': 'Personnalisez l\'expérience de votre application',
    },
    's99s8pum': {
      'en': 'App Preferences',
      'es': 'Preferencias de la aplicación',
      'fr': 'Préférences de l\'application',
    },
    '044b1vof': {
      'en': 'Dark Mode',
      'es': 'Modo oscuro',
      'fr': 'Mode sombre',
    },
    'qz3tmw74': {
      'en': 'Switch between themes',
      'es': 'Cambiar entre temas claros y oscuros',
      'fr': 'Basculer entre les thèmes clairs et sombres',
    },
    'u2yt1tt5': {
      'en': 'Language',
      'es': 'Idioma',
      'fr': 'Langue',
    },
    'wngq1r38': {
      'en': 'About',
      'es': 'Acerca de',
      'fr': 'À propos',
    },
    '3gru0arb': {
      'en': 'App Version',
      'es': 'Versión de la aplicación',
      'fr': 'Version de l\'application',
    },
    'mvac8d8c': {
      'en': '1.0.0',
      'es': '1.0.0',
      'fr': '1.0.0',
    },
    'yr4asonc': {
      'en': 'Terms & Conditions',
      'es': 'Términos y condiciones',
      'fr': 'Conditions générales',
    },
    '1gx396sx': {
      'en': 'Privacy Policy',
      'es': 'política de privacidad',
      'fr': 'politique de confidentialité',
    },
    'ztkrcpwg': {
      'en': 'Sign Out',
      'es': 'Desconectar',
      'fr': 'Se déconnecter',
    },
  },
  // HealthMetricsDashboard
  {
    '2t20ahzz': {
      'en': 'Health Dashboard',
      'es': 'Panel de salud',
      'fr': 'Tableau de bord de santé',
    },
    'jcwfuloi': {
      'en': 'Your daily health metrics at a glance',
      'es': 'Sus métricas de salud diarias de un vistazo',
      'fr': 'Vos mesures de santé quotidiennes en un coup d\'œil',
    },
    'jynao036': {
      'en': 'Heart Rate',
      'es': 'Frecuencia cardíaca',
      'fr': 'Fréquence cardiaque',
    },
    'hc2zob7d': {
      'en': 'BPM',
      'es': 'BPM',
      'fr': 'BPM',
    },
    'pli2uc44': {
      'en': 'View Details',
      'es': 'Ver detalles',
      'fr': 'Voir les détails',
    },
    'mkmqzmdf': {
      'en': 'Blood Pressure',
      'es': 'Presión arterial',
      'fr': 'Pression artérielle',
    },
    'ueklmba0': {
      'en': 'mmHg',
      'es': 'mmHg',
      'fr': 'mmHg',
    },
    '5boynfmw': {
      'en': 'Systolic Blood Pressure',
      'es': '',
      'fr': '',
    },
    'hjtfrv1p': {
      'en': 'Diastolic Blood Pressure',
      'es': '',
      'fr': '',
    },
    '4yeayjhs': {
      'en': 'View Details',
      'es': 'Ver detalles',
      'fr': 'Voir les détails',
    },
    'xqecvd5u': {
      'en': 'Base Metabolic Index',
      'es': 'Índice metabólico básico',
      'fr': 'Indice métabolique de base',
    },
    'zex3my2o': {
      'en': 'View Details',
      'es': 'Ver detalles',
      'fr': 'Voir les détails',
    },
    'vagkbzl9': {
      'en': 'Waist to Hip Ratio',
      'es': 'Relación cintura-cadera',
      'fr': 'Rapport taille/hanches',
    },
    'orsivn4b': {
      'en': 'View Details',
      'es': 'Ver detalles',
      'fr': 'Voir les détails',
    },
    '52b3z19k': {
      'en': 'Waist to Height Ratio',
      'es': 'Relación cintura-altura',
      'fr': 'Rapport taille/hauteur',
    },
    '6ic52eyp': {
      'en': 'View Details',
      'es': 'Ver detalles',
      'fr': 'Voir les détails',
    },
    'fm1owstr': {
      'en': 'Health Data',
      'es': 'Datos de salud',
      'fr': 'Données sur la santé',
    },
  },
  // RemindersandNotificationsScreen
  {
    'zbv0ug1r': {
      'en': 'Active Reminders',
      'es': 'Recordatorios activos',
      'fr': 'Rappels actifs',
    },
    'yns6ghwq': {
      'en': 'Take Medication',
      'es': 'Tomar medicación',
      'fr': 'Prendre des médicaments',
    },
    '5wjhufcw': {
      'en': 'Daily at 9:00 AM',
      'es': 'Diariamente a las 9:00 AM',
      'fr': 'Tous les jours à 9h00',
    },
    'zlwrrnef': {
      'en': 'Water Intake',
      'es': 'Consumo de agua',
      'fr': 'Consommation d\'eau',
    },
    'k1se1mc7': {
      'en': 'Every 2 hours',
      'es': 'Cada 2 horas',
      'fr': 'Toutes les 2 heures',
    },
    '6jzju9ag': {
      'en': 'Exercise Time',
      'es': 'Tiempo de ejercicio',
      'fr': 'Temps d\'exercice',
    },
    'dn1y0cim': {
      'en': 'Weekdays at 6:00 PM',
      'es': 'De lunes a viernes a las 18:00 horas',
      'fr': 'En semaine à 18h00',
    },
    'eszv40ga': {
      'en': 'Add New Reminder',
      'es': 'Agregar nuevo recordatorio',
      'fr': 'Ajouter un nouveau rappel',
    },
    '9n0n20z0': {
      'en': 'Reminder Title',
      'es': 'Título del recordatorio',
      'fr': 'Titre du rappel',
    },
    '3pl6qtgk': {
      'en': 'Time',
      'es': 'Tiempo',
      'fr': 'Temps',
    },
    '7serrfew': {
      'en': 'Select Time',
      'es': 'Seleccionar hora',
      'fr': 'Sélectionnez l\'heure',
    },
    'j1ekyo7r': {
      'en': 'Frequency',
      'es': 'Frecuencia',
      'fr': 'Fréquence',
    },
    'ygxpwkh8': {
      'en': 'Select Days',
      'es': 'Seleccione días',
      'fr': 'Sélectionnez les jours',
    },
    's8cz320o': {
      'en': 'Save Reminder',
      'es': 'Guardar recordatorio',
      'fr': 'Enregistrer le rappel',
    },
    '62pgg9y6': {
      'en': 'Reminders',
      'es': 'Recordatorios',
      'fr': 'Rappels',
    },
    'ot27tmpu': {
      'en': 'Stay on track with your health goals',
      'es': 'Manténgase encaminado hacia sus objetivos de salud',
      'fr': 'Restez sur la bonne voie avec vos objectifs de santé',
    },
    'w1kjps9m': {
      'en': 'Reminders',
      'es': 'Recordatorios',
      'fr': 'Rappels',
    },
  },
  // UserProfileScreen
  {
    'emfxp42c': {
      'en': 'Profile',
      'es': 'Perfil',
      'fr': 'Profil',
    },
    'nl0qg3zh': {
      'en': 'Manage your account settings',
      'es': 'Administrar la configuración de su cuenta',
      'fr': 'Gérez les paramètres de votre compte',
    },
    'qcytjr75': {
      'en':
          'Your heart beats with purpose- keep it strong with movement and mindfulness',
      'es': '',
      'fr': '',
    },
    'vaxodxyr': {
      'en':
          'Functional medicine focuses on root causes, not just symptoms. Stay consistent!',
      'es': '',
      'fr': '',
    },
    'rhal01hu': {
      'en':
          'Your health journey is unique. Track your progress and adapt your plan accordingly',
      'es': '',
      'fr': '',
    },
    'vv2xmtm1': {
      'en': 'View Profile',
      'es': 'Ver perfil',
      'fr': 'Voir le profil',
    },
    '1qdq4kny': {
      'en': 'Account Settings',
      'es': 'Configuraciones de la cuenta',
      'fr': 'Paramètres du compte',
    },
    'o9yrf4z9': {
      'en': 'General Settings',
      'es': 'Configuración general',
      'fr': 'Paramètres généraux',
    },
    '1bfgop0t': {
      'en': 'Privacy & Security',
      'es': 'Privacidad y seguridad',
      'fr': 'Confidentialité et sécurité',
    },
    '5wlsff70': {
      'en': 'Log Out',
      'es': 'Finalizar la sesión',
      'fr': 'Se déconnecter',
    },
    'gj6rthge': {
      'en': 'Profile',
      'es': 'Perfil',
      'fr': 'Profil',
    },
  },
  // DeviceSyncScreen
  {
    'u0kex754': {
      'en': 'Connected Devices',
      'es': 'Dispositivos conectados',
      'fr': 'Appareils connectés',
    },
    'rk7ml6jn': {
      'en': 'Manage your health monitoring devices',
      'es': 'Administra tus dispositivos de monitoreo de salud',
      'fr': 'Gérez vos appareils de surveillance de la santé',
    },
    '061klvjn': {
      'en': 'Active Devices',
      'es': 'Dispositivos activos',
      'fr': 'Appareils actifs',
    },
    'qahsfehk': {
      'en': 'Add Device',
      'es': 'Agregar dispositivo',
      'fr': 'Ajouter un appareil',
    },
    'ejy1uk14': {
      'en': 'FitPro Smartwatch',
      'es': 'Reloj inteligente FitPro',
      'fr': 'Montre connectée FitPro',
    },
    'lbv6rsp7': {
      'en': 'Connected • Battery 85%',
      'es': 'Conectado • Batería 85%',
      'fr': 'Connecté • Batterie 85%',
    },
    'r7tvua75': {
      'en': 'HealthTrack Band',
      'es': 'Banda de seguimiento de salud',
      'fr': 'Bracelet HealthTrack',
    },
    'gk3yn2x5': {
      'en': 'Connected • Battery 62%',
      'es': 'Conectado • Batería 62%',
      'fr': 'Connecté • Batterie 62%',
    },
    '4i4v5k0x': {
      'en': 'SmartScale Pro',
      'es': 'Báscula inteligente Pro',
      'fr': 'Balance intelligente Pro',
    },
    'pysnshrq': {
      'en': 'Disconnected',
      'es': 'Desconectado',
      'fr': 'Déconnecté',
    },
    'm5soncxy': {
      'en': 'Pairing Instructions',
      'es': 'Instrucciones de emparejamiento',
      'fr': 'Instructions d\'appariement',
    },
    'zxzul3c0': {
      'en': '1',
      'es': '1',
      'fr': '1',
    },
    'k6thck86': {
      'en': 'Enable Bluetooth on your device',
      'es': 'Habilite Bluetooth en su dispositivo',
      'fr': 'Activer le Bluetooth sur votre appareil',
    },
    'g75x7zoc': {
      'en': '2',
      'es': '2',
      'fr': '2',
    },
    'yhuh9jns': {
      'en': 'Press and hold device power button',
      'es': 'Mantenga presionado el botón de encendido del dispositivo',
      'fr':
          'Appuyez sur le bouton d\'alimentation de l\'appareil et maintenez-le enfoncé',
    },
    'g7x1wuxt': {
      'en': '3',
      'es': '3',
      'fr': '3',
    },
    '30oli20d': {
      'en': 'Tap \'Add Device\' when ready',
      'es': 'Pulse \"Agregar dispositivo\" cuando esté listo',
      'fr': 'Appuyez sur « Ajouter un appareil » lorsque vous êtes prêt',
    },
    'tk1nu4tb': {
      'en': 'Device Settings',
      'es': 'Configuración del dispositivo',
      'fr': 'Paramètres de l\'appareil',
    },
    'fo71fpbf': {
      'en': 'Auto-Sync',
      'es': 'Sincronización automática',
      'fr': 'Synchronisation automatique',
    },
    '8uqhuxrw': {
      'en': 'Sync data automatically',
      'es': 'Sincronizar datos automáticamente',
      'fr': 'Synchroniser les données automatiquement',
    },
    'jvktjpqm': {
      'en': 'Background Scanning',
      'es': 'Escaneo de fondo',
      'fr': 'Analyse en arrière-plan',
    },
    '5j8m1eyi': {
      'en': 'Search for devices in background',
      'es': 'Buscar dispositivos en segundo plano',
      'fr': 'Rechercher des appareils en arrière-plan',
    },
  },
  // ErrorScreen
  {
    'fe6xaxqp': {
      'en': 'Oops! Something went wrong',
      'es': '¡Ups! Algo salió mal',
      'fr': 'Oups ! Une erreur s\'est produite',
    },
    'rgig0etf': {
      'en':
          'We\'re having trouble connecting to our servers. Please check your connection and try again.',
      'es':
          'Tenemos problemas para conectarnos a nuestros servidores. Por favor, comprueba tu conexión y vuelve a intentarlo.',
      'fr':
          'Nous rencontrons des problèmes de connexion à nos serveurs. Veuillez vérifier votre connexion et réessayer.',
    },
    '8somwg50': {
      'en': 'Try Again',
      'es': 'Intentar otra vez',
      'fr': 'Essayer à nouveau',
    },
  },
  // forgotpassword
  {
    'rbmnyh9n': {
      'en': 'Forgot Password',
      'es': 'Has olvidado tu contraseña',
      'fr': 'Mot de passe oublié',
    },
    '3ly46bri': {
      'en': 'Change Password',
      'es': 'Cambiar la contraseña',
      'fr': 'Changer le mot de passe',
    },
    'xi4qf2bs': {
      'en': 'Enter your preferred way to receive OTP',
      'es': 'Ingresa tu forma preferida de recibir OTP',
      'fr': 'Entrez votre moyen préféré pour recevoir l\'OTP',
    },
    'idz5r32l': {
      'en': 'Select Verification Method',
      'es': 'Seleccionar método de verificación',
      'fr': 'Sélectionnez la méthode de vérification',
    },
    'cenzmhcg': {
      'en': 'Email',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
    },
    'ucztp8tw': {
      'en': 'Receive code via email',
      'es': 'Recibir código por correo electrónico',
      'fr': 'Recevoir le code par email',
    },
    'gjju9d1h': {
      'en': 'Mobile',
      'es': 'Móvil',
      'fr': 'Mobile',
    },
    'y83ut25m': {
      'en': 'Receive code via SMS',
      'es': 'Recibir código vía SMS',
      'fr': 'Recevoir le code par SMS',
    },
    'eknnmlz2': {
      'en': 'Enter your email',
      'es': 'Ingresa tu correo electrónico',
      'fr': 'Entrez votre email',
    },
    'ioq0tf3y': {
      'en': 'Enter your phone number',
      'es': 'Ingresa tu correo electrónico',
      'fr': 'Entrez votre email',
    },
    'qncjkiv5': {
      'en': 'example@gmail.com',
      'es': 'ejemplo@gmail.com',
      'fr': 'exemple@gmail.com',
    },
    '8if0whrk': {
      'en': '44355544678',
      'es': '',
      'fr': '',
    },
    'n2g7wnfa': {
      'en': 'Field is required...',
      'es': 'Se requiere correo electrónico...',
      'fr': 'L\'email est obligatoire...',
    },
    '75iu604s': {
      'en': 'Enter a valid email address...',
      'es': 'Introduzca una dirección de correo electrónico válida...',
      'fr': 'Entrez une adresse email valide...',
    },
    '2bj2z8a7': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'cwi8ckbn': {
      'en': 'Send OTP',
      'es': 'Enviar OTP',
      'fr': 'Envoyer OTP',
    },
    'xd9nb46u': {
      'en': 'Send OTP',
      'es': 'Enviar OTP',
      'fr': 'Envoyer OTP',
    },
  },
  // Healthmetricsform
  {
    'myft29h8': {
      'en': ' Body Measurements',
      'es': 'Medidas corporales',
      'fr': 'Mensurations corporelles',
    },
    'wxvfedsc': {
      'en': 'Height (feet)',
      'es': 'Altura (pies)',
      'fr': 'Hauteur (pieds)',
    },
    '39ekr7pq': {
      'en': 'Height (in)',
      'es': 'Altura (pulgadas)',
      'fr': 'Hauteur (po)',
    },
    'ud7ukr2t': {
      'en': 'Weight (lbs)',
      'es': 'Peso (libras)',
      'fr': 'Poids (lb)',
    },
    '2yotxvxg': {
      'en': 'Chest (inches)',
      'es': 'Cintura (pulgadas)',
      'fr': 'Tour de taille (pouces)',
    },
    '1m2aylum': {
      'en': 'Waist (inches)',
      'es': 'Cintura (pulgadas)',
      'fr': 'Tour de taille (pouces)',
    },
    'l00gy7wh': {
      'en': 'Hip (inches)',
      'es': 'Cadera (pulgadas)',
      'fr': 'Hanche (pouces)',
    },
    '09dkh3j6': {
      'en': 'Activity Level',
      'es': 'Nivel de actividad',
      'fr': 'Niveau d\'activité',
    },
    'rbmozojb': {
      'en': 'Sedentary',
      'es': 'Sedentario',
      'fr': 'Sédentaire',
    },
    'wrp2kyb6': {
      'en': 'Light',
      'es': 'Luz',
      'fr': 'Lumière',
    },
    'qcd86t9t': {
      'en': 'Moderate',
      'es': 'Moderado',
      'fr': 'Modéré',
    },
    '70hlpl9t': {
      'en': 'Active',
      'es': 'Activo',
      'fr': 'Actif',
    },
    'lq8qzghp': {
      'en': 'Very Active',
      'es': 'Muy activo',
      'fr': 'Très actif',
    },
    'oadeu5ro': {
      'en': 'Field is required...',
      'es': 'El campo es obligatorio...',
      'fr': 'Le champ est obligatoire...',
    },
    'ejdlx067': {
      'en': 'Vitals',
      'es': 'Partes vitales',
      'fr': 'Signes vitaux',
    },
    'fou2ch6z': {
      'en': 'Heart Rate (BPM)',
      'es': 'Frecuencia cardíaca (BPM)',
      'fr': 'Fréquence cardiaque (BPM)',
    },
    'el0oucgw': {
      'en': 'Systolic BP',
      'es': 'Presión arterial sistólica',
      'fr': 'Pression artérielle systolique',
    },
    'llh2x0hz': {
      'en': 'Diastolic BP',
      'es': 'Presión arterial diastólica',
      'fr': 'Pression artérielle diastolique',
    },
    'ykpgehac': {
      'en': 'Save Measurements',
      'es': 'Guardar medidas',
      'fr': 'Enregistrer les mesures',
    },
    'ftms6z3z': {
      'en': 'Field is required...',
      'es': '',
      'fr': '',
    },
    '6d5s0jc1': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    'ofzk2vaw': {
      'en': 'Height (in) is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'wstffvgg': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    'gvzsuyqx': {
      'en': 'Field is required...',
      'es': '',
      'fr': '',
    },
    'vrhzeki9': {
      'en': 'Weight should be between 60 to 660 lbs...',
      'es': '',
      'fr': '',
    },
    'nxwjk27w': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    'glyjc1nm': {
      'en': 'Field is required...',
      'es': 'El campo es obligatorio...',
      'fr': 'Le champ est obligatoire...',
    },
    'vrt70vok': {
      'en': 'Waist size should be between 15 to 80 inches...',
      'es': '',
      'fr': '',
    },
    'clg4lm5e': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    'm23cmn3g': {
      'en': 'Field is required...',
      'es': 'El campo es obligatorio...',
      'fr': 'Le champ est obligatoire...',
    },
    '5vp36sgg': {
      'en': 'Hip size should be between 20 to 80 inches...',
      'es': '',
      'fr': '',
    },
    '7teqluye': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    'jp0rki0z': {
      'en': 'Field is required...',
      'es': 'El campo es obligatorio...',
      'fr': 'Le champ est obligatoire...',
    },
    '3z3szcof': {
      'en': 'Heart rate should be between 30 to 250 BPM...',
      'es': '',
      'fr': '',
    },
    'xijuf0rz': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    'zq4us69f': {
      'en': 'Field is required...',
      'es': '',
      'fr': '',
    },
    'shk2fmod': {
      'en': '50 - 300',
      'es': '',
      'fr': '',
    },
    'j1uhrv05': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    'ma1nxnjy': {
      'en': 'Field is required...',
      'es': '',
      'fr': '',
    },
    't9au4ziu': {
      'en': '30 - 200',
      'es': '',
      'fr': '',
    },
    'wuf8dkov': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'xinwysn9': {
      'en': 'Health Metrics',
      'es': 'Métricas de salud',
      'fr': 'Indicateurs de santé',
    },
    'qgcdqhua': {
      'en': 'Track your body metrics and vitals',
      'es':
          'Realice un seguimiento de sus métricas corporales y signos vitales',
      'fr': 'Suivez les paramètres et les signes vitaux de votre corps',
    },
  },
  // EditProfile
  {
    '5av4njdt': {
      'en': 'Edit Profile',
      'es': 'Editar perfil',
      'fr': 'Modifier le profil',
    },
    'gtfh9bao': {
      'en': 'Update your personal information',
      'es': 'Actualice su información personal',
      'fr': 'Mettez à jour vos informations personnelles',
    },
    'ql0rnf1c': {
      'en': 'Change Photo',
      'es': 'Cambiar foto',
      'fr': 'Changer la photo',
    },
    's6aha04c': {
      'en': 'Delete Photo',
      'es': 'Eliminar foto',
      'fr': 'Supprimer la photo',
    },
    'z0mttqb4': {
      'en': 'First Name',
      'es': 'Nombre de pila',
      'fr': 'Prénom',
    },
    '390a1zs8': {
      'en': 'Last Name',
      'es': 'Apellido',
      'fr': 'Nom de famille',
    },
    'yrdghdew': {
      'en': 'Select Gender',
      'es': 'Seleccione género',
      'fr': 'Sélectionnez le sexe',
    },
    'ydre89or': {
      'en': 'Search...',
      'es': 'Buscar...',
      'fr': 'Recherche...',
    },
    'guaiay6z': {
      'en': 'Male',
      'es': 'Masculino',
      'fr': 'Mâle',
    },
    'afwoa0mg': {
      'en': 'Female',
      'es': 'Femenino',
      'fr': 'Femelle',
    },
    'p6dndoyj': {
      'en': 'Other',
      'es': 'Otro',
      'fr': 'Autre',
    },
    'jrhgzcjl': {
      'en': 'Time Zone',
      'es': 'Seleccione género',
      'fr': 'Sélectionnez le sexe',
    },
    'oy7g8smg': {
      'en': 'Search...',
      'es': 'Buscar...',
      'fr': 'Recherche...',
    },
    'comsbukp': {
      'en': 'Phone Number',
      'es': 'Número de teléfono',
      'fr': 'Numéro de téléphone',
    },
    'q0c184ow': {
      'en': 'Send OTP',
      'es': 'Enviar OTP',
      'fr': 'Envoyer OTP',
    },
    'zg6incyt': {
      'en': 'Enter OTP',
      'es': 'Ingresar OTP',
      'fr': 'Entrez OTP',
    },
    'awa4hri5': {
      'en': 'Verify',
      'es': 'Verificar',
      'fr': 'Vérifier',
    },
    'pwxndrnp': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    '8dl2vqt5': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '47hl795e': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'hyd0o44e': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'hxvrm0xk': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'ft9wpl5n': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'xf9igqza': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'yq2dx774': {
      'en': 'Enter a valid email address...',
      'es': 'Introduzca una dirección de correo electrónico válida...',
      'fr': 'Entrez une adresse email valide...',
    },
    'o76wdhz2': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'phsef2ca': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    '6he2j2qr': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'kz42ttup': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    's4ipx0vy': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'gphhcqki': {
      'en': 'Save Changes',
      'es': 'Guardar cambios',
      'fr': 'Enregistrer les modifications',
    },
    'zzoajes4': {
      'en': 'Cancel',
      'es': 'Cancelar',
      'fr': 'Annuler',
    },
    'yat9dtl9': {
      'en': 'Change Photo',
      'es': 'Cambiar foto',
      'fr': 'Changer la photo',
    },
    'hzxcl1sb': {
      'en': 'Delete Photo',
      'es': 'Eliminar foto',
      'fr': 'Supprimer la photo',
    },
    'fcz8tl70': {
      'en': 'First Name',
      'es': 'Nombre de pila',
      'fr': 'Prénom',
    },
    'v56qmjhn': {
      'en': 'Last Name',
      'es': 'Apellido',
      'fr': 'Nom de famille',
    },
    'vg6u3t5m': {
      'en': 'Select Gender',
      'es': 'Seleccione género',
      'fr': 'Sélectionnez le sexe',
    },
    'df5bt3qh': {
      'en': 'Search...',
      'es': 'Buscar...',
      'fr': 'Recherche...',
    },
    'xw93u45n': {
      'en': 'Male',
      'es': 'Masculino',
      'fr': 'Mâle',
    },
    '99tzrlhg': {
      'en': 'Female',
      'es': 'Femenino',
      'fr': 'Femelle',
    },
    'hp1nvoti': {
      'en': 'Other',
      'es': 'Otro',
      'fr': 'Autre',
    },
    'b919jznv': {
      'en': 'Time Zone',
      'es': 'Seleccione género',
      'fr': 'Sélectionnez le sexe',
    },
    'z134lrdn': {
      'en': 'Search...',
      'es': 'Buscar...',
      'fr': 'Recherche...',
    },
    'yc2qh3br': {
      'en': 'Phone Number',
      'es': 'Número de teléfono',
      'fr': 'Numéro de téléphone',
    },
    'rob4p65e': {
      'en': 'Send OTP',
      'es': 'Enviar OTP',
      'fr': 'Envoyer OTP',
    },
    'gz4ntskx': {
      'en': 'Enter OTP',
      'es': 'Ingresar OTP',
      'fr': 'Entrez OTP',
    },
    'knsaplvv': {
      'en': 'Verify',
      'es': 'Verificar',
      'fr': 'Vérifier',
    },
    '0vehavkm': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'm4ply978': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'xxd8xk9c': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    '31afb232': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'ldtw0qh8': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    '17e3yfck': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'u3fwzrnz': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'osnuao1e': {
      'en': 'Enter a valid email address...',
      'es': 'Introduzca una dirección de correo electrónico válida...',
      'fr': 'Entrez une adresse email valide...',
    },
    'nntsq6hg': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'kmq2la17': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'ilq98w9q': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'hq1ylm0a': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    '67pkdu57': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'kz7io60e': {
      'en': 'Save Changes',
      'es': 'Guardar cambios',
      'fr': 'Enregistrer les modifications',
    },
    'xoh0x2vt': {
      'en': 'Cancel',
      'es': 'Cancelar',
      'fr': 'Annuler',
    },
  },
  // PrivacyAndSecurity
  {
    'nlsfc02p': {
      'en': 'Account Security',
      'es': 'Seguridad de la cuenta',
      'fr': 'Sécurité du compte',
    },
    'osrm7ri2': {
      'en': 'Two-Factor Authentication',
      'es': 'Autenticación de dos factores',
      'fr': 'Authentification à deux facteurs',
    },
    'kek4nbvb': {
      'en': 'Add an extra layer of security',
      'es': 'Añade una capa adicional de seguridad',
      'fr': 'Ajoutez une couche de sécurité supplémentaire',
    },
    'iveqqq4s': {
      'en': 'Biometric Login',
      'es': 'Inicio de sesión biométrico',
      'fr': 'Connexion biométrique',
    },
    '8nkxnexl': {
      'en': 'Use fingerprint or face recognition',
      'es': 'Utilice reconocimiento de huellas dactilares o facial',
      'fr': 'Utiliser l\'empreinte digitale ou la reconnaissance faciale',
    },
    'x3kqg6iy': {
      'en': 'Change Password',
      'es': 'Cambiar la contraseña',
      'fr': 'Changer le mot de passe',
    },
    'a7xlzfgu': {
      'en': 'Account Actions',
      'es': 'Acciones de la cuenta',
      'fr': 'Actions du compte',
    },
    'xbvyr7c4': {
      'en': 'Deactivate Account',
      'es': 'Desactivar cuenta',
      'fr': 'Désactiver le compte',
    },
    'batgglot': {
      'en': 'Privacy & Security',
      'es': 'Privacidad y seguridad',
      'fr': 'Confidentialité et sécurité',
    },
    'je9b1dr4': {
      'en': 'Manage your account security and data',
      'es': 'Administra la seguridad y los datos de tu cuenta',
      'fr': 'Gérez la sécurité et les données de votre compte',
    },
  },
  // ResetPassword
  {
    '3j6zre6m': {
      'en': 'Change Password',
      'es': 'Cambiar la contraseña',
      'fr': 'Changer le mot de passe',
    },
    'medah2nf': {
      'en': 'Enter your new password below',
      'es': 'Ingrese su nueva contraseña a continuación',
      'fr': 'Entrez votre nouveau mot de passe ci-dessous',
    },
    'legkhzg9': {
      'en': 'Enter OTP',
      'es': 'Ingresar OTP',
      'fr': 'Entrez OTP',
    },
    'hrkjhflz': {
      'en': 'New Password',
      'es': 'Nueva contraseña',
      'fr': 'Nouveau mot de passe',
    },
    'xzdf0irv': {
      'en': 'Confirm New Password',
      'es': 'Confirmar nueva contraseña',
      'fr': 'Confirmer le nouveau mot de passe',
    },
    'xb43w5xm': {
      'en': 'Phone Number is required',
      'es': 'El número de teléfono es obligatorio',
      'fr': 'Le numéro de téléphone est obligatoire',
    },
    'skbqr37h': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'qdjawcsz': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    '60ng9lby': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'w841ph8e': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'yillaf0m': {
      'en':
          'Password should contain:\n- At least one lower case letter\n- At least one upper case letter\n- At least one digit and\n- At least one special character',
      'es':
          'La contraseña debe contener:\n- Al menos una letra minúscula\n- Al menos una letra mayúscula\n- Al menos un dígito y\n- Al menos un carácter especial',
      'fr':
          'Le mot de passe doit contenir :\n- Au moins une lettre minuscule\n- Au moins une lettre majuscule\n- Au moins un chiffre et\n- Au moins un caractère spécial',
    },
    'o0bjxm7z': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'y80jpqdv': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'kfldn6ec': {
      'en':
          'Password should contain:\n- At least one lower case letter\n- At least one upper case letter\n- At least one digit and\n- At least one special character',
      'es':
          'La contraseña debe contener:\n- Al menos una letra minúscula\n- Al menos una letra mayúscula\n- Al menos un dígito y\n- Al menos un carácter especial',
      'fr':
          'Le mot de passe doit contenir :\n- Au moins une lettre minuscule\n- Au moins une lettre majuscule\n- Au moins un chiffre et\n- Au moins un caractère spécial',
    },
    'k7cbdufu': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'bhiz8x4y': {
      'en': 'Change Password',
      'es': 'Cambiar la contraseña',
      'fr': 'Changer le mot de passe',
    },
    'xvz1yecq': {
      'en': 'Change Password',
      'es': 'Cambiar la contraseña',
      'fr': 'Changer le mot de passe',
    },
    'l6nawb0n': {
      'en': 'Cancel',
      'es': 'Cancelar',
      'fr': 'Annuler',
    },
  },
  // PractitionerDashboard
  {
    '8ozg46iv': {
      'en': 'Primary Care Physician',
      'es': 'Médico de atención primaria',
      'fr': 'Médecin de premier recours',
    },
    'jpv5sqgc': {
      'en': 'Quick Actions',
      'es': 'Acciones rápidas',
      'fr': 'Actions rapides',
    },
    'j6ncybls': {
      'en': 'Add New Client',
      'es': 'Agregar nuevo cliente',
      'fr': 'Ajouter un nouveau client',
    },
    'sa6x0hm1': {
      'en': 'Client Search',
      'es': 'Búsqueda de clientes',
      'fr': 'Recherche de clients',
    },
    '5pdwi1x5': {
      'en': 'Profile',
      'es': 'Búsqueda de clientes',
      'fr': 'Recherche de clients',
    },
    'lgzazr2s': {
      'en': 'Appointments',
      'es': 'Citas de hoy',
      'fr': 'Rendez-vous d\'aujourd\'hui',
    },
    'wy4m338j': {
      'en': 'View All',
      'es': 'Ver todo',
      'fr': 'Tout voir',
    },
    'njp135am': {
      'en': '10:30',
      'es': '10:30',
      'fr': '10h30',
    },
    'ar6f98aj': {
      'en': 'AM',
      'es': 'SOY',
      'fr': 'SUIS',
    },
    '9vv25ibx': {
      'en': 'Emma Thompson',
      'es': 'Emma Thompson',
      'fr': 'Emma Thompson',
    },
    '860quo7x': {
      'en': 'Pending',
      'es': 'Pendiente',
      'fr': 'En attente',
    },
    '3tabmwzy': {
      'en': 'Client Reminders',
      'es': 'Recordatorios para clientes',
      'fr': 'Rappels aux clients',
    },
    'p8ktihp1': {
      'en': 'Medication Check',
      'es': 'Control de medicación',
      'fr': 'Vérification des médicaments',
    },
    'qrmetbml': {
      'en': '5 clients need review',
      'es': '5 pacientes necesitan revisión',
      'fr': '5 patients doivent être examinés',
    },
    '6ox1a3za': {
      'en': 'Blood Pressure Monitoring',
      'es': 'Monitoreo de la presión arterial',
      'fr': 'Surveillance de la pression artérielle',
    },
    'staggzv3': {
      'en': '3 clients need attention',
      'es': '3 pacientes necesitan atención',
      'fr': '3 patients ont besoin d\'attention',
    },
  },
  // SignUpAuthentication
  {
    'ffbdkkfu': {
      'en': 'Verification',
      'es': 'Verificación',
      'fr': 'Vérification',
    },
    'h0ui0klw': {
      'en': 'Enter your email and phone number',
      'es': 'Introduce tu correo electrónico y número de teléfono',
      'fr': 'Entrez votre email et votre numéro de téléphone',
    },
    'q86mnmbe': {
      'en': 'Choose your role',
      'es': 'Elige tu rol',
      'fr': 'Choisissez votre rôle',
    },
    'gz5pl636': {
      'en': 'Client',
      'es': 'Cliente',
      'fr': 'Client',
    },
    'nvz21urr': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'qa3m6cc5': {
      'en': 'Practitioner',
      'es': 'Facultativo',
      'fr': 'Praticien',
    },
    'zu7cc1fh': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'wyranlfm': {
      'en': 'Enter Email Address',
      'es': 'Introduzca la dirección de correo electrónico',
      'fr': 'Entrez l\'adresse e-mail',
    },
    '61mnt1wd': {
      'en': 'Email',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
    },
    'kc51r9z7': {
      'en': 'Send OTP',
      'es': 'Enviar OTP',
      'fr': 'Envoyer OTP',
    },
    'ambxqfp3': {
      'en': 'Enter OTP sent to your email',
      'es': 'Ingresa el OTP enviado a tu correo electrónico',
      'fr': 'Entrez l\'OTP envoyé à votre adresse e-mail',
    },
    'uyifey5q': {
      'en': 'Enter OTP',
      'es': 'Ingresar OTP',
      'fr': 'Entrez OTP',
    },
    '9c66owdy': {
      'en': 'Didn\'t receive code? Wait for',
      'es': '¿No has recibido el código? Espera.',
      'fr': 'Vous n\'avez pas reçu le code ? Attendez',
    },
    'g17n56ft': {
      'en': 'Verify',
      'es': 'Verificar',
      'fr': 'Vérifier',
    },
    'g6s6ikge': {
      'en': 'Email address is required...',
      'es': 'Se requiere dirección de correo electrónico...',
      'fr': 'L\'adresse e-mail est requise...',
    },
    'mmptyuwj': {
      'en': 'Enter a valid email address...',
      'es': 'Introduzca una dirección de correo electrónico válida...',
      'fr': 'Entrez une adresse email valide...',
    },
    'btzlsvxi': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'ftjnyy1d': {
      'en': 'OTP is required...',
      'es': 'Se requiere OTP...',
      'fr': 'L\'OTP est requis...',
    },
    'wmx11uj5': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'e440cyyr': {
      'en': 'Enter Phone Number',
      'es': 'Introduzca el número de teléfono',
      'fr': 'Entrez le numéro de téléphone',
    },
    'cjymf0f4': {
      'en': 'Phone Number',
      'es': 'Número de teléfono',
      'fr': 'Numéro de téléphone',
    },
    'kynt008c': {
      'en': 'Send OTP',
      'es': 'Enviar OTP',
      'fr': 'Envoyer OTP',
    },
    '92obf5d7': {
      'en': 'Enter OTP sent to your phone number',
      'es': 'Ingresa el OTP enviado a tu número de teléfono',
      'fr': 'Entrez l\'OTP envoyé à votre numéro de téléphone',
    },
    'sgy7j763': {
      'en': 'Enter OTP',
      'es': 'Ingresar OTP',
      'fr': 'Entrez OTP',
    },
    '2matpt80': {
      'en': 'Didn\'t receive code? Wait for',
      'es': '¿No has recibido el código? Espera.',
      'fr': 'Vous n\'avez pas reçu le code ? Attendez',
    },
    '2anbyo8h': {
      'en': 'Verify',
      'es': 'Verificar',
      'fr': 'Vérifier',
    },
    '1nxnpw7a': {
      'en': 'Phone Number is required...',
      'es': 'El número de teléfono es obligatorio...',
      'fr': 'Le numéro de téléphone est requis...',
    },
    '0irmgest': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'bl5yruft': {
      'en': 'OTP is required...',
      'es': 'Se requiere OTP...',
      'fr': 'L\'OTP est requis...',
    },
    'sl0v5j10': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'pi96ddsg': {
      'en': 'Next',
      'es': 'Próximo',
      'fr': 'Suivant',
    },
    '5tr33iei': {
      'en': 'Already have an account? ',
      'es': '¿Ya tienes una cuenta?',
      'fr': 'Vous avez déjà un compte ?',
    },
    'il370f2n': {
      'en': 'Sign In',
      'es': 'Iniciar sesión',
      'fr': 'Se connecter',
    },
  },
  // ClientDetailsAtPractitionerSide
  {
    'l4qsyav1': {
      'en': 'Client Details',
      'es': 'Datos del cliente',
      'fr': 'Détails du client',
    },
    'zy4t9rsi': {
      'en': 'View and manage client information',
      'es': 'Ver y administrar la información del cliente',
      'fr': 'Afficher et gérer les informations client',
    },
    'zuz9eju0': {
      'en': 'Personal Information',
      'es': 'Información personal',
      'fr': 'Renseignements personnels',
    },
    '9hpebupw': {
      'en': 'Email',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
    },
    'aciurlkd': {
      'en': 'Phone',
      'es': 'Teléfono',
      'fr': 'Téléphone',
    },
    '5gnkbs3j': {
      'en': 'Date of Birth',
      'es': 'Fecha de nacimiento',
      'fr': 'Date de naissance',
    },
    '931422zu': {
      'en': 'Gender',
      'es': 'Género',
      'fr': 'Genre',
    },
    '857zlzb6': {
      'en': 'Health Information',
      'es': 'Información de salud',
      'fr': 'Informations sur la santé',
    },
    '5bweban8': {
      'en': 'Export',
      'es': 'Exportar',
      'fr': 'Exporter',
    },
    '0fl8vot1': {
      'en': 'Height',
      'es': 'Altura',
      'fr': 'Hauteur',
    },
    'ccmc2p00': {
      'en': 'Weight',
      'es': 'Peso',
      'fr': 'Poids',
    },
    '0xcjpghv': {
      'en': 'Waist',
      'es': 'Cintura',
      'fr': 'Taille',
    },
    'fwo6i31l': {
      'en': 'Hip',
      'es': 'Cadera',
      'fr': 'Hanche',
    },
    'o09ob6rb': {
      'en': 'New Measurements',
      'es': 'Nuevas mediciones',
      'fr': 'Nouvelles mesures',
    },
    '266ovnki': {
      'en': 'View History',
      'es': 'Ver historial',
      'fr': 'Voir l\'historique',
    },
    'wlw06uvk': {
      'en': 'View Health Data',
      'es': 'Ver datos de salud',
      'fr': 'Afficher les données de santé',
    },
    'ceflffbz': {
      'en': 'Recent Appointments',
      'es': 'Nombramientos recientes',
      'fr': 'Nominations récentes',
    },
    'vrw6veka': {
      'en': 'General Checkup',
      'es': 'Chequeo general',
      'fr': 'Examen général',
    },
    'mbe1njpa': {
      'en': 'Follow-up Consultation',
      'es': 'Consulta de seguimiento',
      'fr': 'Consultation de suivi',
    },
    'z35mwz78': {
      'en': 'June 1, 2023 • 2:00 PM',
      'es': '1 de junio de 2023 • 14:00 horas',
      'fr': '1er juin 2023 • 14h00',
    },
    'vacfend3': {
      'en': 'Upcoming',
      'es': 'Próximamente',
      'fr': 'Prochain',
    },
    'pvq8f343': {
      'en': 'Book Appointment',
      'es': 'Reservar cita',
      'fr': 'Prendre rendez-vous',
    },
    '1g1kzmzq': {
      'en': 'Message Client',
      'es': 'Mensaje de cliente',
      'fr': 'Client de messagerie',
    },
  },
  // RegisterClientfromPractitioner
  {
    'zm0jmfdu': {
      'en': 'Client Registration',
      'es': 'Registro de clientes',
      'fr': 'Inscription du client',
    },
    '8kfiiojj': {
      'en': 'Create a new client account',
      'es': 'Crear una nueva cuenta de cliente',
      'fr': 'Créer un nouveau compte client',
    },
    'd7kfnvqp': {
      'en': 'First Name',
      'es': 'Nombre de pila',
      'fr': 'Prénom',
    },
    'xku2kb7n': {
      'en': 'Last Name',
      'es': 'Apellido',
      'fr': 'Nom de famille',
    },
    '94pshwzv': {
      'en': 'Select Gender',
      'es': 'Seleccione género',
      'fr': 'Sélectionnez le sexe',
    },
    '9peucgkf': {
      'en': 'Search...',
      'es': 'Buscar...',
      'fr': 'Recherche...',
    },
    'gydfj5gx': {
      'en': 'Male',
      'es': 'Masculino',
      'fr': 'Mâle',
    },
    '19eg7qbc': {
      'en': 'Female',
      'es': 'Femenino',
      'fr': 'Femelle',
    },
    'c0yl6orv': {
      'en': 'Other',
      'es': 'Otro',
      'fr': 'Autre',
    },
    'xdpfx4gh': {
      'en': 'Field is required...',
      'es': 'El campo es obligatorio...',
      'fr': 'Le champ est obligatoire...',
    },
    'qergjehr': {
      'en': 'Field is required...',
      'es': 'El campo es obligatorio...',
      'fr': 'Le champ est obligatoire...',
    },
    'p79z7l8h': {
      'en': 'Select Timezone',
      'es': 'Seleccione género',
      'fr': 'Sélectionnez le sexe',
    },
    'y47mhugt': {
      'en': 'Search...',
      'es': 'Buscar...',
      'fr': 'Recherche...',
    },
    'k7euz7sg': {
      'en': 'Field is required...',
      'es': 'El campo es obligatorio...',
      'fr': 'Le champ est obligatoire...',
    },
    '5dkt1omv': {
      'en': 'Phone Number',
      'es': 'Número de teléfono',
      'fr': 'Numéro de téléphone',
    },
    'xo4ldasu': {
      'en': 'Email',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
    },
    'eqm0ch2m': {
      'en': 'Password',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
    },
    'muv9tb80': {
      'en': 'Confirm Password',
      'es': 'confirmar Contraseña',
      'fr': 'Confirmez le mot de passe',
    },
    'jzswho3r': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'xii0nhhh': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'y2sxs61j': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    '5vusks5x': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'jliw8yrh': {
      'en': 'Field is required...',
      'es': 'El número de teléfono es obligatorio',
      'fr': 'Le numéro de téléphone est obligatoire',
    },
    'yk1pan8h': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'zhdgs8x6': {
      'en': 'Field is required...',
      'es': 'Se requiere correo electrónico',
      'fr': 'L\'email est obligatoire',
    },
    'yq2dx774': {
      'en': 'Enter a valid email address...',
      'es': 'Introduzca una dirección de correo electrónico válida...',
      'fr': 'Entrez une adresse email valide...',
    },
    'm4mb225c': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '6a9500z2': {
      'en': 'Field is required...',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'dj6ckizy': {
      'en':
          'Password should contain:\n- At least one lower case letter\n- At least one upper case letter\n- At least one digit and\n- At least one special character',
      'es':
          'La contraseña debe contener:\n- Al menos una letra minúscula\n- Al menos una letra mayúscula\n- Al menos un dígito y\n- Al menos un carácter especial',
      'fr':
          'Le mot de passe doit contenir :\n- Au moins une lettre minuscule\n- Au moins une lettre majuscule\n- Au moins un chiffre et\n- Au moins un caractère spécial',
    },
    'bvjavoco': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '9w92gips': {
      'en': 'Field is required...',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'ngqcwzfo': {
      'en':
          'Password should contain:\n- At least one lower case letter\n- At least one upper case letter\n- At least one digit and\n- At least one special character',
      'es':
          'La contraseña debe contener:\n- Al menos una letra minúscula\n- Al menos una letra mayúscula\n- Al menos un dígito y\n- Al menos un carácter especial',
      'fr':
          'Le mot de passe doit contenir :\n- Au moins une lettre minuscule\n- Au moins une lettre majuscule\n- Au moins un chiffre et\n- Au moins un caractère spécial',
    },
    '971n2icq': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'w9g8k4qt': {
      'en': 'Register',
      'es': 'Registro',
      'fr': 'Registre',
    },
  },
  // ClientHealthDashboardAtPS
  {
    'ewll11ch': {
      'en': 'Health Dashboard',
      'es': 'Panel de salud',
      'fr': 'Tableau de bord de santé',
    },
    'clwndpyu': {
      'en': 'Your daily health metrics at a glance',
      'es': 'Sus métricas de salud diarias de un vistazo',
      'fr': 'Vos mesures de santé quotidiennes en un coup d\'œil',
    },
    'ckbo5im8': {
      'en': 'Heart Rate',
      'es': 'Frecuencia cardíaca',
      'fr': 'Fréquence cardiaque',
    },
    'iyarrklf': {
      'en': 'BPM',
      'es': 'BPM',
      'fr': 'BPM',
    },
    'cigb1u2m': {
      'en': 'View Details',
      'es': 'Ver detalles',
      'fr': 'Voir les détails',
    },
    'e9vtdzqd': {
      'en': 'Blood Pressure',
      'es': 'Presión arterial',
      'fr': 'Pression artérielle',
    },
    'mmmcc9hk': {
      'en': 'mmHg',
      'es': 'mmHg',
      'fr': 'mmHg',
    },
    '4o1waucs': {
      'en': 'Systolic Blood Pressure',
      'es': '',
      'fr': '',
    },
    'dzf41w7l': {
      'en': 'Diastolic Blood Pressure',
      'es': '',
      'fr': '',
    },
    'gxg2h314': {
      'en': 'View Details',
      'es': 'Ver detalles',
      'fr': 'Voir les détails',
    },
    '5c9wfh2b': {
      'en': 'Base Metabolic Index',
      'es': 'Índice metabólico básico',
      'fr': 'Indice métabolique de base',
    },
    'mvre2g0f': {
      'en': 'View Details',
      'es': 'Ver detalles',
      'fr': 'Voir les détails',
    },
    '90cn8mfc': {
      'en': 'Waist to Hip Ratio',
      'es': 'Relación cintura-cadera',
      'fr': 'Rapport taille/hanches',
    },
    'vd1jg5u0': {
      'en': 'View Details',
      'es': 'Ver detalles',
      'fr': 'Voir les détails',
    },
    'mzzrezlk': {
      'en': 'Waist to Height Ratio',
      'es': 'Relación cintura-altura',
      'fr': 'Rapport taille/hauteur',
    },
    'rj6izh8a': {
      'en': 'View Details',
      'es': 'Ver detalles',
      'fr': 'Voir les détails',
    },
    'updeg42s': {
      'en': 'Health Data',
      'es': 'Datos de salud',
      'fr': 'Données sur la santé',
    },
  },
  // ViewProfile
  {
    'y4vunq14': {
      'en': 'View Profile',
      'es': 'Ver perfil',
      'fr': 'Voir le profil',
    },
    '3hru00zh': {
      'en': 'View your personal information',
      'es': 'Ver su información personal',
      'fr': 'Consultez vos informations personnelles',
    },
    'w69m7u8u': {
      'en': 'Edit Profile',
      'es': 'Editar perfil',
      'fr': 'Modifier le profil',
    },
    'qww9esd7': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'do3avuf8': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'rrp7zmma': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'wii7bzd9': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'xwudyiqp': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'kyxhjinc': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '1vtb5qqe': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'xgo1pdkd': {
      'en': 'Enter a valid email address...',
      'es': 'Introduzca una dirección de correo electrónico válida...',
      'fr': 'Entrez une adresse email valide...',
    },
    'hzgnri4t': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '47s117ee': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'ze0dvb4d': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'pozviv5w': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    '99l7wsrr': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'ynz0a96h': {
      'en': 'Edit Profile',
      'es': 'Editar perfil',
      'fr': 'Modifier le profil',
    },
    'dn5g8r54': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    '3j78hbxg': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'wotndbpj': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'ds2bpek3': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'qbrwxlyg': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    '8p2cmmsv': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'm4gryhvt': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'jb7i5e5v': {
      'en': 'Enter a valid email address...',
      'es': 'Introduzca una dirección de correo electrónico válida...',
      'fr': 'Entrez une adresse email valide...',
    },
    'e73oub0e': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '66g6fr32': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    '58i4lhjf': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '29u6hwpa': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    '7p7myfsd': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '8bnv18nv': {
      'en': 'Back',
      'es': 'Atrás',
      'fr': 'Dos',
    },
  },
  // SignUpAdmin
  {
    'nemqnwq5': {
      'en': 'Create Account',
      'es': 'Crear una cuenta',
      'fr': 'Créer un compte',
    },
    '5k53esun': {
      'en': 'Join us to track your health journey',
      'es': 'Únase a nosotros para seguir su trayectoria de salud',
      'fr': 'Rejoignez-nous pour suivre votre parcours de santé',
    },
    'k9kui6yx': {
      'en': 'Admin SignUp',
      'es': 'Registro de administrador',
      'fr': 'Inscription de l\'administrateur',
    },
    'nw2vw7yp': {
      'en': 'First Name',
      'es': 'Nombre de pila',
      'fr': 'Prénom',
    },
    'zcj7zmbo': {
      'en': 'Last Name',
      'es': 'Apellido',
      'fr': 'Nom de famille',
    },
    'hou35hoi': {
      'en': 'Select Gender',
      'es': 'Seleccione género',
      'fr': 'Sélectionnez le sexe',
    },
    'qox5rk20': {
      'en': 'Search...',
      'es': 'Buscar...',
      'fr': 'Recherche...',
    },
    'midnxcq9': {
      'en': 'Male',
      'es': 'Masculino',
      'fr': 'Mâle',
    },
    '4csf1p61': {
      'en': 'Female',
      'es': 'Femenino',
      'fr': 'Femelle',
    },
    '64082tek': {
      'en': 'Other',
      'es': 'Otro',
      'fr': 'Autre',
    },
    'hvh7wemu': {
      'en': 'Password',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
    },
    'lzqvyp5u': {
      'en': 'Confirm Password',
      'es': 'confirmar Contraseña',
      'fr': 'Confirmez le mot de passe',
    },
    'g0obj0x1': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'umv6cyxm': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'w0cxkzw1': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'zlsf0ojw': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'i6y40lke': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'cb48x2wc': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'e4l8h3g3': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'gxg2yc8s': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'i2w9quuy': {
      'en': 'Sign Up',
      'es': 'Inscribirse',
      'fr': 'S\'inscrire',
    },
  },
  // LoginAdmin
  {
    'hvufd8ch': {
      'en': 'Welcome Back',
      'es': 'Bienvenido de nuevo',
      'fr': 'Content de te revoir',
    },
    'w8mm26yl': {
      'en': 'Sign in to continue',
      'es': 'Inicia sesión para continuar',
      'fr': 'Connectez-vous pour continuer',
    },
    'b5zvzrxz': {
      'en': 'Admin Login',
      'es': 'Inicio de sesión de administrador',
      'fr': 'Connexion administrateur',
    },
    'kj74rx2w': {
      'en': 'Email Address',
      'es': 'Dirección de correo electrónico',
      'fr': 'Adresse email',
    },
    'w9n8a013': {
      'en': 'Password',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
    },
    'px9zoypd': {
      'en': 'Forgot Password?',
      'es': '¿Has olvidado tu contraseña?',
      'fr': 'Mot de passe oublié?',
    },
    'b3re7u9q': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'ie8xv9bt': {
      'en': 'Enter a valid email address',
      'es': 'Introduzca una dirección de correo electrónico válida',
      'fr': 'Entrez une adresse email valide',
    },
    '8z6bjhgt': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'qjvl83pg': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'd90kwdkt': {
      'en': 'Minimum 8 characters required',
      'es': 'Se requieren al menos 8 caracteres',
      'fr': 'Minimum 8 caractères requis',
    },
    's1ky4db2': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '49w4ylb8': {
      'en': 'Login',
      'es': 'Acceso',
      'fr': 'Se connecter',
    },
    'q8glkq8v': {
      'en': 'Don\'t have an account? ',
      'es': '¿No tienes una cuenta?',
      'fr': 'Vous n\'avez pas de compte ?',
    },
    '72flh210': {
      'en': 'Sign Up',
      'es': 'Inscribirse',
      'fr': 'S\'inscrire',
    },
  },
  // SignUpCopy
  {
    'ki4nl517': {
      'en': 'Create Account',
      'es': 'Crear una cuenta',
      'fr': 'Créer un compte',
    },
    'vary80jc': {
      'en': 'Join us to track your health journey',
      'es': 'Únase a nosotros para seguir su trayectoria de salud',
      'fr': 'Rejoignez-nous pour suivre votre parcours de santé',
    },
    '1my0c4xb': {
      'en': 'Client',
      'es': 'Cliente',
      'fr': 'Client',
    },
    'dg9wtmkm': {
      'en': 'First Name',
      'es': 'Nombre de pila',
      'fr': 'Prénom',
    },
    '1vtcwz03': {
      'en': 'Last Name',
      'es': 'Apellido',
      'fr': 'Nom de famille',
    },
    'mvbk2lw6': {
      'en': 'Select Gender',
      'es': 'Seleccione género',
      'fr': 'Sélectionnez le sexe',
    },
    'lo79w9rq': {
      'en': 'Search...',
      'es': 'Buscar...',
      'fr': 'Recherche...',
    },
    'iphlh7uc': {
      'en': 'Male',
      'es': 'Masculino',
      'fr': 'Mâle',
    },
    'vsyw7g7k': {
      'en': 'Female',
      'es': 'Femenino',
      'fr': 'Femelle',
    },
    '9jxjpocv': {
      'en': 'Other',
      'es': 'Otro',
      'fr': 'Autre',
    },
    '654ksfuy': {
      'en': 'Password',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
    },
    't1esmp7y': {
      'en': 'Confirm Password',
      'es': 'confirmar Contraseña',
      'fr': 'Confirmez le mot de passe',
    },
    'fv9y96p5': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'yamd2vyp': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'yqqnarmn': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'c1kyc5d8': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '9boknblf': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    '8w0vrkkh': {
      'en': 'At least 8 characters are required...',
      'es': 'Se requieren al menos 8 caracteres...',
      'fr': 'Au moins 8 caractères sont requis...',
    },
    'xqfjx0ii': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'u1k4680v': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'w99s3utg': {
      'en': 'At least 8 characters are required...',
      'es': 'Se requieren al menos 8 caracteres...',
      'fr': 'Au moins 8 caractères sont requis...',
    },
    'f1ivmgiw': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '5u5j29p4': {
      'en': 'Sign Up',
      'es': 'Inscribirse',
      'fr': 'S\'inscrire',
    },
    '31ec3743': {
      'en': 'Already have an account? ',
      'es': '¿Ya tienes una cuenta?',
      'fr': 'Vous avez déjà un compte ?',
    },
    'jteaihe9': {
      'en': 'Sign In',
      'es': 'Iniciar sesión',
      'fr': 'Se connecter',
    },
    'v7g5eq2p': {
      'en': 'Practitioner',
      'es': 'Facultativo',
      'fr': 'Praticien',
    },
    'vj1veqhq': {
      'en': 'Practitioner Details',
      'es': 'Datos del practicante',
      'fr': 'Détails du praticien',
    },
    '8pkbqz56': {
      'en': 'First Name',
      'es': 'Nombre de pila',
      'fr': 'Prénom',
    },
    '3njg8tth': {
      'en': 'Last Name',
      'es': 'Apellido',
      'fr': 'Nom de famille',
    },
    'rkxrnb2b': {
      'en': 'Select Gender',
      'es': 'Seleccione género',
      'fr': 'Sélectionnez le sexe',
    },
    'ancu8kx4': {
      'en': 'Search...',
      'es': 'Buscar...',
      'fr': 'Recherche...',
    },
    'gle4qad7': {
      'en': 'Male',
      'es': 'Masculino',
      'fr': 'Mâle',
    },
    'ry7l46gr': {
      'en': 'Female',
      'es': 'Femenino',
      'fr': 'Femelle',
    },
    '7ai6ot6z': {
      'en': 'Other',
      'es': 'Otro',
      'fr': 'Autre',
    },
    'zagg6l3i': {
      'en': 'Password',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
    },
    'g6icmo35': {
      'en': 'Confirm Password',
      'es': 'confirmar Contraseña',
      'fr': 'Confirmez le mot de passe',
    },
    'onjgoi0j': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'u05fbdbt': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'f848tozh': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'y7z4ar4d': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'wcwscfu9': {
      'en': 'Field is required...',
      'es': 'El campo es obligatorio...',
      'fr': 'Le champ est obligatoire...',
    },
    'w0fnezyo': {
      'en': 'At least 8 characters are required...',
      'es': 'Se requieren al menos 8 caracteres...',
      'fr': 'Au moins 8 caractères sont requis...',
    },
    '305h88bn': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '8x6m86rz': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'p3romqzx': {
      'en': 'At least 8 characters are required...',
      'es': 'Se requieren al menos 8 caracteres...',
      'fr': 'Au moins 8 caractères sont requis...',
    },
    '93dsptdj': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'zpo0jz52': {
      'en': 'Sign Up',
      'es': 'Inscribirse',
      'fr': 'S\'inscrire',
    },
    '4f40h4ie': {
      'en': 'Already have an account? ',
      'es': '¿Ya tienes una cuenta?',
      'fr': 'Vous avez déjà un compte ?',
    },
    'pjitjo6v': {
      'en': 'Sign In',
      'es': 'Iniciar sesión',
      'fr': 'Se connecter',
    },
    'gnsittub': {
      'en': 'Practitioner Information',
      'es': 'Información para el profesional',
      'fr': 'Informations pour les praticiens',
    },
    'murjlbuv': {
      'en': 'Practitioner Type(s)',
      'es': 'Tipo(s) de practicante',
      'fr': 'Type(s) de praticien(s)',
    },
    'cucu7tcg': {
      'en': 'Search...',
      'es': 'Buscar...',
      'fr': 'Recherche...',
    },
    'mprkid1r': {
      'en': 'Option 1',
      'es': 'Opción 1',
      'fr': 'Option 1',
    },
    'aaldkjyo': {
      'en': 'Option 2',
      'es': 'Opción 2',
      'fr': 'Option 2',
    },
    'rgzrvk7f': {
      'en': 'Option 3',
      'es': 'Opción 3',
      'fr': 'Option 3',
    },
    '2gmdf0mu': {
      'en': 'Are you medically licensed in your state/country?',
      'es': '¿Tiene usted licencia médica en su estado/país?',
      'fr': 'Êtes-vous titulaire d’une licence médicale dans votre état/pays ?',
    },
    'o6xq85eq': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'erhm3tnw': {
      'en': 'Yes',
      'es': 'Sí',
      'fr': 'Oui',
    },
    'f1fjl7yc': {
      'en': 'No',
      'es': 'No',
      'fr': 'Non',
    },
    'eby8uje9': {
      'en': 'Type in your registration number',
      'es': 'Escriba su número de registro',
      'fr': 'Entrez votre numéro d\'immatriculation',
    },
    'b2iwhp6s': {
      'en': 'Are you non-medically licensed in your state/country?',
      'es': '¿Tiene usted licencia no médica en su estado/país?',
      'fr':
          'N’êtes-vous pas titulaire d’une licence médicale dans votre état/pays ?',
    },
    'k375uc51': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'm03yp87m': {
      'en': 'Yes',
      'es': 'Sí',
      'fr': 'Oui',
    },
    'w86xi16j': {
      'en': 'No',
      'es': 'No',
      'fr': 'Non',
    },
    'a5upupl7': {
      'en': 'What type of license?',
      'es': '¿Qué tipo de licencia?',
      'fr': 'Quel type de licence ?',
    },
    '2nzj7qyq': {
      'en': 'Business Information',
      'es': 'Información comercial',
      'fr': 'Informations commerciales',
    },
    '8zkldxni': {
      'en': 'Business Name',
      'es': 'Nombre de la empresa',
      'fr': 'Nom de l\'entreprise',
    },
    '53zjy4rk': {
      'en': 'Phone Number',
      'es': 'Número de teléfono',
      'fr': 'Numéro de téléphone',
    },
    'hrs0odj4': {
      'en': 'City',
      'es': 'Ciudad',
      'fr': 'Ville',
    },
    'c9xcfr3s': {
      'en': 'State',
      'es': 'Estado',
      'fr': 'État',
    },
    '9rmemtu5': {
      'en': 'Province',
      'es': 'Provincia',
      'fr': 'Province',
    },
    'gjusqebj': {
      'en': 'Country',
      'es': 'País',
      'fr': 'Pays',
    },
    'zibxpb6u': {
      'en': 'Type of Business',
      'es': 'Tipo de asunto',
      'fr': 'Type d\'entreprise',
    },
    '2gnu2mxq': {
      'en': 'Personal Business',
      'es': 'Negocios personales',
      'fr': 'Affaires personnelles',
    },
    'x18myg3v': {
      'en': 'Another Organization',
      'es': 'Otra organización',
      'fr': 'Une autre organisation',
    },
    'hb2avhoi': {
      'en':
          'Approximately how many other practitioners work in your office, if any?',
      'es':
          '¿Aproximadamente cuántos otros profesionales trabajan en su consultorio, si hay alguno?',
      'fr':
          'Environ combien d’autres praticiens travaillent dans votre cabinet, le cas échéant ?',
    },
    '8p1zg48v': {
      'en': 'Search...',
      'es': 'Buscar...',
      'fr': 'Recherche...',
    },
    '7jlf2875': {
      'en': '1 - 3',
      'es': '1 - 3',
      'fr': '1 - 3',
    },
    '3gphl6a1': {
      'en': '4 - 10',
      'es': '4 - 10',
      'fr': '4 - 10',
    },
    'rweju50d': {
      'en': '10+',
      'es': '10+',
      'fr': '10+',
    },
    'cb0wrd76': {
      'en':
          'Do you have support staff that need access to Healthmagus ( e.g., viewing privileges, to make/update appts, accept payments, assist with lab tests orders, invoicing, etc.)?',
      'es':
          '¿Tiene personal de apoyo que necesita acceso a Healthmagus (por ejemplo, privilegios de visualización, para hacer/actualizar citas, aceptar pagos, ayudar con pedidos de pruebas de laboratorio, facturación, etc.)?',
      'fr':
          'Avez-vous du personnel de soutien qui a besoin d\'accéder à Healthmagus (par exemple, pour visualiser les privilèges, pour prendre/mettre à jour les rendez-vous, accepter les paiements, aider aux commandes de tests de laboratoire, à la facturation, etc.) ?',
    },
    'zup1bbdr': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'gprlb0nf': {
      'en': 'Yes',
      'es': 'Sí',
      'fr': 'Oui',
    },
    'rh2rrrx2': {
      'en': 'No',
      'es': 'No',
      'fr': 'Non',
    },
    'nt9k3qy4': {
      'en':
          'If yes, how many support staff need access to your Healthmagus account?\n',
      'es':
          'Si es así, ¿cuántos miembros del personal de soporte necesitan acceso a su cuenta de Healthmagus?',
      'fr':
          'Si oui, combien d’employés de soutien ont besoin d’accéder à votre compte Healthmagus ?',
    },
    '3ocz4ptb': {
      'en': 'Search...',
      'es': 'Buscar...',
      'fr': 'Recherche...',
    },
    'aup6252p': {
      'en': '0',
      'es': '0',
      'fr': '0',
    },
    'txt6z1f6': {
      'en': '1',
      'es': '1',
      'fr': '1',
    },
    'srvhd8ho': {
      'en': '2',
      'es': '2',
      'fr': '2',
    },
    '3wett3sb': {
      'en': '3',
      'es': '3',
      'fr': '3',
    },
    'wpv9scz7': {
      'en': '4',
      'es': '4',
      'fr': '4',
    },
  },
  // healthdashboard
  {
    '6zupe210': {
      'en': 'Health Dashboard',
      'es': 'Panel de salud',
      'fr': 'Tableau de bord de santé',
    },
    'ziuw9vqr': {
      'en': 'Track your progress over time',
      'es': 'Sigue tu progreso a lo largo del tiempo',
      'fr': 'Suivez vos progrès au fil du temps',
    },
    'lqler9et': {
      'en': 'Current Metrics',
      'es': 'Métricas actuales',
      'fr': 'Mesures actuelles',
    },
    'mrir3lgj': {
      'en': 'Last updated: June 15, 2023',
      'es': 'Última actualización: 15 de junio de 2023',
      'fr': 'Dernière mise à jour : 15 juin 2023',
    },
    'k8q75mil': {
      'en': 'Update Metrics',
      'es': 'Actualizar métricas',
      'fr': 'Mettre à jour les métriques',
    },
    '17tcqemz': {
      'en': 'Weight',
      'es': 'Peso',
      'fr': 'Poids',
    },
    '5gzy5q3m': {
      'en': '165 lbs',
      'es': '165 libras',
      'fr': '165 livres',
    },
    'o4hphxiq': {
      'en': '-2.5 lbs',
      'es': '-2,5 libras',
      'fr': '-2,5 livres',
    },
    'w20m32fd': {
      'en': 'BMI',
      'es': 'IMC',
      'fr': 'IMC',
    },
    'dvsuf4nv': {
      'en': '24.2',
      'es': '24.2',
      'fr': '24.2',
    },
    'f022t6v3': {
      'en': 'Healthy',
      'es': 'Saludable',
      'fr': 'En bonne santé',
    },
    '5abfyn9g': {
      'en': 'Body Fat %',
      'es': '% de grasa corporal',
      'fr': '% de graisse corporelle',
    },
    'z0tue8zi': {
      'en': '18%',
      'es': '18%',
      'fr': '18%',
    },
    'hluvvcbc': {
      'en': '-1.5%',
      'es': '-1,5%',
      'fr': '-1,5%',
    },
    '3effo1yc': {
      'en': 'Historical Data',
      'es': 'Datos históricos',
      'fr': 'Données historiques',
    },
    'm14n0fib': {
      'en': 'Date',
      'es': 'Fecha',
      'fr': 'Date',
    },
    '4x8m53ig': {
      'en': 'Weight',
      'es': 'Peso',
      'fr': 'Poids',
    },
    '50siodbx': {
      'en': 'BMI',
      'es': 'IMC',
      'fr': 'IMC',
    },
    '74z4d3fx': {
      'en': 'Body Fat',
      'es': 'Grasa corporal',
      'fr': 'Graisse corporelle',
    },
    '2jgholm4': {
      'en': 'Jun 15, 2023',
      'es': '15 de junio de 2023',
      'fr': '15 juin 2023',
    },
    'scokpkla': {
      'en': '165 lbs',
      'es': '165 libras',
      'fr': '165 livres',
    },
    '0dfwjtey': {
      'en': '24.2',
      'es': '24.2',
      'fr': '24.2',
    },
    'kzmfe325': {
      'en': '18%',
      'es': '18%',
      'fr': '18%',
    },
    '2msws8by': {
      'en': 'May 15, 2023',
      'es': '15 de mayo de 2023',
      'fr': '15 mai 2023',
    },
    '0iq71vyb': {
      'en': '167.5 lbs',
      'es': '167,5 libras',
      'fr': '167,5 livres',
    },
    '2pmdlpaz': {
      'en': '24.6',
      'es': '24.6',
      'fr': '24.6',
    },
    '5i3m8trs': {
      'en': '19.5%',
      'es': '19,5%',
      'fr': '19,5%',
    },
    'acblia4l': {
      'en': 'Apr 15, 2023',
      'es': '15 de abril de 2023',
      'fr': '15 avril 2023',
    },
    't725uxa1': {
      'en': '170 lbs',
      'es': '170 libras',
      'fr': '170 livres',
    },
    'd0nw4mr7': {
      'en': '25.0',
      'es': '25.0',
      'fr': '25.0',
    },
    'mwaeoqtd': {
      'en': '20%',
      'es': '20%',
      'fr': '20%',
    },
    'd735fsqp': {
      'en': 'Mar 15, 2023',
      'es': '15 de marzo de 2023',
      'fr': '15 mars 2023',
    },
    'gzzkgzry': {
      'en': '172.5 lbs',
      'es': '172,5 libras',
      'fr': '172,5 livres',
    },
    'zlxy3cwv': {
      'en': '25.3',
      'es': '25.3',
      'fr': '25.3',
    },
    'e3od4djb': {
      'en': '21%',
      'es': '21%',
      'fr': '21%',
    },
    '69x9zkc5': {
      'en': 'Other Measurements',
      'es': 'Otras medidas',
      'fr': 'Autres mesures',
    },
    '3yopv47u': {
      'en': 'Measurement',
      'es': 'Medición',
      'fr': 'Mesures',
    },
    'ei279m4i': {
      'en': 'Current',
      'es': 'Actual',
      'fr': 'Actuel',
    },
    'zffbguyn': {
      'en': 'Previous',
      'es': 'Anterior',
      'fr': 'Précédent',
    },
    '395o33z5': {
      'en': 'Change',
      'es': 'Cambiar',
      'fr': 'Changement',
    },
    'ig57o06b': {
      'en': 'Waist',
      'es': 'Cintura',
      'fr': 'Taille',
    },
    'bc5vylxg': {
      'en': '32 in',
      'es': '32 pulgadas',
      'fr': '32 pouces',
    },
    'hcodk649': {
      'en': '33 in',
      'es': '33 pulgadas',
      'fr': '33 pouces',
    },
    '9tmzp2ic': {
      'en': '-1 in',
      'es': '-1 en',
      'fr': '-1 dans',
    },
    'okv9x55k': {
      'en': 'Hip',
      'es': 'Cadera',
      'fr': 'Hanche',
    },
    '580hlmgc': {
      'en': '40 in',
      'es': '40 pulgadas',
      'fr': '40 pouces',
    },
    'lm1y8tqg': {
      'en': '41 in',
      'es': '41 pulgadas',
      'fr': '41 po',
    },
    '1obr90hk': {
      'en': '-1 in',
      'es': '-1 en',
      'fr': '-1 dans',
    },
    '8dx7d8eq': {
      'en': 'Chest',
      'es': 'Pecho',
      'fr': 'Poitrine',
    },
    'tfgotaam': {
      'en': '42 in',
      'es': '42 pulgadas',
      'fr': '42 po',
    },
    'uk0u1x09': {
      'en': '43 in',
      'es': '43 pulgadas',
      'fr': '43 pouces',
    },
    '5lhvnsfq': {
      'en': '-1 in',
      'es': '-1 en',
      'fr': '-1 dans',
    },
  },
  // dashboard1
  {
    'te99m5hj': {
      'en': 'Health Metrics',
      'es': 'Métricas de salud',
      'fr': 'Indicateurs de santé',
    },
    '16119vgr': {
      'en': 'Track your wellness journey',
      'es': 'Sigue tu recorrido de bienestar',
      'fr': 'Suivez votre parcours de bien-être',
    },
    'ilodnec2': {
      'en': 'Today\'s Overview',
      'es': 'Resumen de hoy',
      'fr': 'Aperçu d\'aujourd\'hui',
    },
    'nikxlx3z': {
      'en': '72',
      'es': '72',
      'fr': '72',
    },
    'dy52r0vt': {
      'en': 'Heart Rate',
      'es': 'Frecuencia cardíaca',
      'fr': 'Fréquence cardiaque',
    },
    'czjtye2g': {
      'en': '2,456',
      'es': '2.456',
      'fr': '2 456',
    },
    '9qitcq3i': {
      'en': 'Calories',
      'es': 'Calorias',
      'fr': 'Calories',
    },
    'jz9gg8h7': {
      'en': '8,234',
      'es': '8.234',
      'fr': '8 234',
    },
    'ykka5u7s': {
      'en': 'Steps',
      'es': 'Pasos',
      'fr': 'Mesures',
    },
    'bmoxzcly': {
      'en': 'Weekly Progress',
      'es': 'Progreso semanal',
      'fr': 'Progrès hebdomadaires',
    },
    'vk09yswn': {
      'en': 'Mon',
      'es': 'Lun',
      'fr': 'Lun',
    },
    'x48d4nzw': {
      'en': 'Tue',
      'es': 'Mar',
      'fr': 'Mar',
    },
    'w4f231lr': {
      'en': 'Wed',
      'es': 'Casarse',
      'fr': 'Épouser',
    },
    'f08e86mw': {
      'en': 'Thu',
      'es': 'Jue',
      'fr': 'Jeu',
    },
    's7brq36p': {
      'en': 'Fri',
      'es': 'Vie',
      'fr': 'Ven',
    },
    'waudcexs': {
      'en': 'Sat',
      'es': 'Se sentó',
      'fr': 'Assis',
    },
    'kv8fk29w': {
      'en': 'Sun',
      'es': 'Sol',
      'fr': 'Soleil',
    },
    '2fk0f8qo': {
      'en': 'Detailed Metrics',
      'es': 'Métricas detalladas',
      'fr': 'Mesures détaillées',
    },
    'v8hppzo5': {
      'en': 'Metric',
      'es': 'Métrico',
      'fr': 'Métrique',
    },
    'fmof4cii': {
      'en': 'Current',
      'es': 'Actual',
      'fr': 'Actuel',
    },
    'b9rw8ipr': {
      'en': 'Previous',
      'es': 'Anterior',
      'fr': 'Précédent',
    },
    '694tfqky': {
      'en': 'Blood Pressure',
      'es': 'Presión arterial',
      'fr': 'Pression artérielle',
    },
    'z1n1otv2': {
      'en': '120/80',
      'es': '120/80',
      'fr': '120/80',
    },
    'd0c3x401': {
      'en': '118/79',
      'es': '118/79',
      'fr': '118/79',
    },
    'n0vgofz8': {
      'en': 'Blood Sugar',
      'es': 'Glucemia',
      'fr': 'Glycémie',
    },
    'b3hnj970': {
      'en': '95 mg/dL',
      'es': '95 mg/dl',
      'fr': '95 mg/dL',
    },
    'ksvdlcyu': {
      'en': '98 mg/dL',
      'es': '98 mg/dl',
      'fr': '98 mg/dL',
    },
    'nu15njuh': {
      'en': 'Weight',
      'es': 'Peso',
      'fr': 'Poids',
    },
    'gai29iye': {
      'en': '68 kg',
      'es': '68 kilogramos',
      'fr': '68 kg',
    },
    'b3f502ts': {
      'en': '70 kg',
      'es': '70 kilos',
      'fr': '70 kg',
    },
    'iv8o3wxr': {
      'en': 'Body Fat',
      'es': 'Grasa corporal',
      'fr': 'Graisse corporelle',
    },
    '0ocpczn5': {
      'en': '18%',
      'es': '18%',
      'fr': '18%',
    },
    'n1wty7lc': {
      'en': '20%',
      'es': '20%',
      'fr': '20%',
    },
    'yor9ppxs': {
      'en': 'Sleep Duration',
      'es': 'Duración del sueño',
      'fr': 'Durée du sommeil',
    },
    'l8lk4xia': {
      'en': '7.5 hrs',
      'es': '7,5 horas',
      'fr': '7,5 heures',
    },
    'bxsd78mn': {
      'en': '7.2 hrs',
      'es': '7,2 horas',
      'fr': '7,2 heures',
    },
    'j8ihqo5g': {
      'en': 'Monthly Summary',
      'es': 'Resumen mensual',
      'fr': 'Résumé mensuel',
    },
    '5a26llrr': {
      'en': 'Average Steps',
      'es': 'Pasos promedio',
      'fr': 'Pas moyens',
    },
    'u05uvf4a': {
      'en': '8,745/day',
      'es': '8.745/día',
      'fr': '8 745/jour',
    },
    'u6wluyo7': {
      'en': 'Calories Burned',
      'es': 'Calorias quemadas',
      'fr': 'Calories brûlées',
    },
    'u6wx86uy': {
      'en': '2,345/day',
      'es': '2.345/día',
      'fr': '2 345/jour',
    },
    '45ovmti0': {
      'en': 'Active Minutes',
      'es': 'Minutos activos',
      'fr': 'Minutes actives',
    },
    'r9hp7a8r': {
      'en': '45 mins/day',
      'es': '45 minutos/día',
      'fr': '45 min/jour',
    },
    'bki2uylm': {
      'en': 'Distance Covered',
      'es': 'Distancia recorrida',
      'fr': 'Distance parcourue',
    },
    'j8ne5fi0': {
      'en': '5.8 km/day',
      'es': '5,8 km/día',
      'fr': '5,8 km/jour',
    },
    'fncctzno': {
      'en': 'Resting Heart Rate',
      'es': 'Frecuencia cardíaca en reposo',
      'fr': 'Fréquence cardiaque au repos',
    },
    '9cqiqpc9': {
      'en': '68 bpm',
      'es': '68 lpm',
      'fr': '68 bpm',
    },
  },
  // ViewMetrics
  {
    'bahn2q01': {
      'en': 'View Metrics',
      'es': 'Ver métricas',
      'fr': 'Afficher les métriques',
    },
    '436qczgk': {
      'en': 'View your most recent measurements',
      'es': 'Ver tus medidas más recientes',
      'fr': 'Consultez vos mesures les plus récentes',
    },
    '41fng22k': {
      'en': 'Graphs',
      'es': 'Gráficos',
      'fr': 'Graphiques',
    },
    'ygpjpwfk': {
      'en': '>',
      'es': '>',
      'fr': '>',
    },
    'xmc9rwlf': {
      'en': 'Export',
      'es': 'Exportar',
      'fr': 'Exporter',
    },
    '4eelp4op': {
      'en': '>',
      'es': '>',
      'fr': '>',
    },
    'g2ge50f5': {
      'en': 'History',
      'es': 'Historia',
      'fr': 'Histoire',
    },
    '6nmmwymc': {
      'en': '>',
      'es': '>',
      'fr': '>',
    },
    '621vqzz8': {
      'en': 'Metrics',
      'es': 'Métrica',
      'fr': 'Métrique',
    },
    'ls2376yz': {
      'en': 'Weight',
      'es': 'Peso',
      'fr': 'Poids',
    },
    'xh0zk6m2': {
      'en': 'Waist',
      'es': 'Cintura',
      'fr': 'Taille',
    },
    'h08c1xsj': {
      'en': 'Hip',
      'es': 'Cadera',
      'fr': 'Hanche',
    },
    'hcaz5jkz': {
      'en': 'BMI',
      'es': 'IMC',
      'fr': 'IMC',
    },
    'u6y7y7oq': {
      'en': 'Chest',
      'es': 'Nivel de oxígeno en sangre',
      'fr': 'Niveau d\'oxygène dans le sang',
    },
    'ltj8ac6k': {
      'en': 'Activity Level',
      'es': 'Nivel de actividad',
      'fr': 'Niveau d\'activité',
    },
    'o2iup70x': {
      'en': 'Blood Pressure',
      'es': 'Presión arterial',
      'fr': 'Pression artérielle',
    },
    'py22uoe7': {
      'en': 'Heart Rate',
      'es': 'Frecuencia cardíaca',
      'fr': 'Fréquence cardiaque',
    },
    'rdstndg7': {
      'en': 'Waist to Hip Ratio',
      'es': 'Relación cintura-cadera',
      'fr': 'Rapport taille/hanches',
    },
    '41lu700m': {
      'en': 'Waist to Height Ratio',
      'es': 'Relación cintura-altura',
      'fr': 'Rapport taille/hauteur',
    },
    'kf9viqol': {
      'en': 'Height',
      'es': 'Altura',
      'fr': 'Hauteur',
    },
    '0og3v9bn': {
      'en': 'BMR',
      'es': 'BMR',
      'fr': 'BMR',
    },
    '8eojx2sl': {
      'en': 'TEE',
      'es': 'TEE',
      'fr': 'TEE',
    },
    'ddrxie1p': {
      'en': 'Ideal Body Weight',
      'es': 'Peso corporal ideal',
      'fr': 'Poids corporel idéal',
    },
    '096wmf9c': {
      'en': 'Fluid Requirement',
      'es': 'Requerimiento de líquidos',
      'fr': 'Besoin en fluide',
    },
    'c9fd996s': {
      'en': 'Created Date',
      'es': 'Fecha de creación',
      'fr': 'Date de création',
    },
  },
  // EditHealthmetricsRecord
  {
    'zpme7pmh': {
      'en': ' Body Measurements',
      'es': 'Medidas corporales',
      'fr': 'Mensurations corporelles',
    },
    'h709pwrs': {
      'en': 'Height (feet)',
      'es': 'Altura (pies)',
      'fr': 'Hauteur (pieds)',
    },
    '3v1uvtz6': {
      'en': 'Height (in)',
      'es': 'Altura (pulgadas)',
      'fr': 'Hauteur (po)',
    },
    'gcqb18v8': {
      'en': 'Weight (lbs)',
      'es': 'Peso (libras)',
      'fr': 'Poids (lb)',
    },
    'ntfnlz96': {
      'en': 'Waist (inches)',
      'es': 'Cintura (pulgadas)',
      'fr': 'Tour de taille (pouces)',
    },
    '4fjursml': {
      'en': 'Hip (inches)',
      'es': 'Cadera (pulgadas)',
      'fr': 'Hanche (pouces)',
    },
    'mrvbl3x2': {
      'en': 'Chest (inches)',
      'es': 'Cadera (pulgadas)',
      'fr': 'Hanche (pouces)',
    },
    'm3ze44jf': {
      'en': 'Activity Level',
      'es': 'Nivel de actividad',
      'fr': 'Niveau d\'activité',
    },
    'cya0nfc7': {
      'en': 'Sedentary',
      'es': 'Sedentario',
      'fr': 'Sédentaire',
    },
    'czehp1sm': {
      'en': 'Light',
      'es': 'Luz',
      'fr': 'Lumière',
    },
    '5bxgr6lh': {
      'en': 'Moderate',
      'es': 'Moderado',
      'fr': 'Modéré',
    },
    'ob6nnej0': {
      'en': 'Active',
      'es': 'Activo',
      'fr': 'Actif',
    },
    'my44a0fb': {
      'en': 'Very Active',
      'es': 'Muy activo',
      'fr': 'Très actif',
    },
    'oi6w2dr8': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'o2cw44w4': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'd3igl5ib': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'mw2dg4mw': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    's768smrm': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'enturtou': {
      'en': 'Weight should be between 60 and 660 lbs...',
      'es': 'El peso debe estar entre 60 y 660 libras.',
      'fr': 'Le poids doit être compris entre 60 et 660 livres.',
    },
    'sgcdm007': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'rt4zic9f': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'ciwldetm': {
      'en': 'Waist should be between 15 to 80 inches...',
      'es': 'La cintura debe medir entre 15 y 80 pulgadas...',
      'fr': 'La taille doit être comprise entre 15 et 80 pouces...',
    },
    '7z0o8y3u': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    'ta6ic2kw': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'bsfuly1w': {
      'en': 'Hip should be between 20 to 80 inches...',
      'es': 'La cadera debe medir entre 20 y 80 pulgadas...',
      'fr': 'Les hanches doivent mesurer entre 20 et 80 pouces.',
    },
    'v0rx2fz3': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '1wvl481k': {
      'en': 'Vitals',
      'es': 'Partes vitales',
      'fr': 'Signes vitaux',
    },
    '10o61usj': {
      'en': 'Heart Rate (BPM)',
      'es': 'Frecuencia cardíaca (BPM)',
      'fr': 'Fréquence cardiaque (BPM)',
    },
    'c7gjhb9b': {
      'en': 'Systolic BP',
      'es': 'Presión arterial sistólica',
      'fr': 'Pression artérielle systolique',
    },
    '5k2uggkl': {
      'en': 'Diastolic BP',
      'es': 'Presión arterial diastólica',
      'fr': 'Pression artérielle diastolique',
    },
    '1aht0atp': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'xrnavzew': {
      'en': 'Heart Rate should be between 30 and 250 BPM...',
      'es': 'La frecuencia cardíaca debe estar entre 30 y 250 LPM...',
      'fr': 'La fréquence cardiaque doit être comprise entre 30 et 250 BPM...',
    },
    'lrdw5vcx': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'xezc4uwq': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'jr20xb81': {
      'en': 'Systolic BP: 50 - 300',
      'es': 'Presión arterial sistólica: 50 a 300',
      'fr': 'Pression artérielle systolique : 50 à 300',
    },
    'sesnbal0': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '5maku4uv': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'zc74v8bc': {
      'en': 'Diastolic BP: 30 - 200',
      'es': 'Presión arterial diastólica: 30 a 200',
      'fr': 'Tension artérielle diastolique : 30 à 200',
    },
    'tebl70a5': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '028vfrej': {
      'en': 'Update',
      'es': 'Actualizar',
      'fr': 'Mise à jour',
    },
    'd09a2za0': {
      'en': 'Edit Record',
      'es': 'Editar registro',
      'fr': 'Modifier l\'enregistrement',
    },
    'jkp8ivnq': {
      'en': 'Edit your metrics record here',
      'es': 'Edite su registro de métricas aquí',
      'fr': 'Modifiez votre enregistrement de métriques ici',
    },
  },
  // ViewMetricsHistory
  {
    'e2iwt4ys': {
      'en': 'View History',
      'es': 'Ver historial',
      'fr': 'Voir l\'historique',
    },
    'ow4z96c3': {
      'en': 'View all your measurements',
      'es': 'Ver todas tus medidas',
      'fr': 'Voir toutes vos mesures',
    },
    'ogtxsox8': {
      'en': 'Weight',
      'es': 'Peso',
      'fr': 'Poids',
    },
    'e22oe5m7': {
      'en': 'BMI',
      'es': 'IMC',
      'fr': 'IMC',
    },
    'pnn7gvek': {
      'en': 'Heart Rate',
      'es': 'Frecuencia cardíaca',
      'fr': 'Fréquence cardiaque',
    },
    '17lq1li6': {
      'en': 'Blood Oxygen Level',
      'es': 'Nivel de oxígeno en sangre',
      'fr': 'Niveau d\'oxygène dans le sang',
    },
    'xzxcauwv': {
      'en': '97%',
      'es': '97%',
      'fr': '97%',
    },
    'la0uem44': {
      'en': 'Blood Pressue',
      'es': 'Presión arterial',
      'fr': 'Pression artérielle',
    },
  },
  // ViewAllMetricsOfEachRecord
  {
    '8o7kqryi': {
      'en': 'Metrics',
      'es': 'Métrica',
      'fr': 'Métrique',
    },
    '7tsp8s3b': {
      'en': 'Weight',
      'es': 'Peso',
      'fr': 'Poids',
    },
    'rk05c6c7': {
      'en': 'Waist',
      'es': 'Cintura',
      'fr': 'Taille',
    },
    '7ipd3u6o': {
      'en': 'Hip',
      'es': 'Cadera',
      'fr': 'Hanche',
    },
    '6m9ctlp9': {
      'en': 'BMI',
      'es': 'IMC',
      'fr': 'IMC',
    },
    '3ph8uklo': {
      'en': 'Chest',
      'es': 'Nivel de oxígeno en sangre',
      'fr': 'Niveau d\'oxygène dans le sang',
    },
    'yqh9irev': {
      'en': 'Activity Level',
      'es': 'Nivel de actividad',
      'fr': 'Niveau d\'activité',
    },
    't8pcjez1': {
      'en': 'Blood Pressure',
      'es': 'Presión arterial',
      'fr': 'Pression artérielle',
    },
    'z0ke1x2a': {
      'en': 'Heart Rate',
      'es': 'Frecuencia cardíaca',
      'fr': 'Fréquence cardiaque',
    },
    '4fnaeukv': {
      'en': 'Waist to Hip Ratio',
      'es': 'Relación cintura-cadera',
      'fr': 'Rapport taille/hanches',
    },
    'kc2os2n4': {
      'en': 'Waist to Height Ratio',
      'es': 'Relación cintura-altura',
      'fr': 'Rapport taille/hauteur',
    },
    'asoq62hg': {
      'en': 'Height',
      'es': 'Altura',
      'fr': 'Hauteur',
    },
    'n3uj65bq': {
      'en': 'BMR',
      'es': 'BMR',
      'fr': 'BMR',
    },
    'ep5y1im3': {
      'en': 'TEE',
      'es': 'TEE',
      'fr': 'TEE',
    },
    'adgbp3fk': {
      'en': 'Ideal Body Weight',
      'es': 'Peso corporal ideal',
      'fr': 'Poids corporel idéal',
    },
    '1xogrs7m': {
      'en': 'Fluid Requirement',
      'es': 'Requerimiento de líquidos',
      'fr': 'Besoin en fluide',
    },
    'yl7pxdgj': {
      'en': 'Created Date',
      'es': 'Fecha de creación',
      'fr': 'Date de création',
    },
    'jerrzhwo': {
      'en': 'View Metrics Record',
      'es': 'Ver registro de métricas',
      'fr': 'Afficher l\'enregistrement des métriques',
    },
    '6jw42dar': {
      'en': 'View your specific measurements',
      'es': 'Ver sus medidas específicas',
      'fr': 'Visualisez vos mesures spécifiques',
    },
  },
  // draft
  {
    'yprbexn1': {
      'en': 'Date Range',
      'es': 'Rango de fechas',
      'fr': 'Plage de dates',
    },
    'smh7m5s5': {
      'en': 'Refresh',
      'es': 'Refrescar',
      'fr': 'Rafraîchir',
    },
    'ug7idmzn': {
      'en': 'Start Date',
      'es': 'Fecha de inicio',
      'fr': 'Date de début',
    },
    '01i1xid8': {
      'en': 'End Date',
      'es': 'Fecha de finalización',
      'fr': 'Date de fin',
    },
    'r2dpre5x': {
      'en': 'Generate',
      'es': 'Generar',
      'fr': 'Générer',
    },
    'j90k3n64': {
      'en': 'Metrics',
      'es': 'Métrica',
      'fr': 'Métrique',
    },
    'z0lh8orn': {
      'en': 'Weekly Overview',
      'es': 'Resumen semanal',
      'fr': 'Aperçu hebdomadaire',
    },
    'x8d6yp68': {
      'en': 'Today',
      'es': 'Hoy',
      'fr': 'Aujourd\'hui',
    },
    'wsjceu0p': {
      'en': 'Week',
      'es': 'Semana',
      'fr': 'Semaine',
    },
    'gf5yujgd': {
      'en': 'Month',
      'es': 'Mes',
      'fr': 'Mois',
    },
    'vmqrrfrn': {
      'en': 'Year',
      'es': 'Año',
      'fr': 'Année',
    },
    'zrksld7f': {
      'en': 'All',
      'es': 'Todo',
      'fr': 'Tous',
    },
    'jleoy4h2': {
      'en': 'Today',
      'es': 'Hoy',
      'fr': 'Aujourd\'hui',
    },
    'yli6cr7a': {
      'en': 'Mon',
      'es': 'Lun',
      'fr': 'Lun',
    },
    'n6akpyhq': {
      'en': 'Tue',
      'es': 'Mar',
      'fr': 'Mar',
    },
    '6tsyaqom': {
      'en': 'Wed',
      'es': 'Casarse',
      'fr': 'Épouser',
    },
    'y3iptzwr': {
      'en': 'Thu',
      'es': 'Jue',
      'fr': 'Jeu',
    },
    'g6w2u1xo': {
      'en': 'Fri',
      'es': 'Vie',
      'fr': 'Ven',
    },
    'c1hh9gh5': {
      'en': 'Sat',
      'es': 'Se sentó',
      'fr': 'Assis',
    },
    '6e21na8e': {
      'en': 'Sun',
      'es': 'Sol',
      'fr': 'Soleil',
    },
    '18bpu5p2': {
      'en': 'Back',
      'es': 'Atrás',
      'fr': 'Dos',
    },
    '3mg3qkds': {
      'en': 'Page Title',
      'es': 'Título de la página',
      'fr': 'Titre de la page',
    },
  },
  // HealthMetricsGraphs
  {
    'jf0skfxu': {
      'en': 'Health Trends',
      'es': 'Tendencias de salud',
      'fr': 'Tendances en matière de santé',
    },
    '76mogb5t': {
      'en': 'Your health data trends at a glance',
      'es': 'Las tendencias de sus datos de salud de un vistazo',
      'fr': 'Aperçu des tendances de vos données de santé',
    },
    'f47fvik5': {
      'en': 'Date Range',
      'es': 'Rango de fechas',
      'fr': 'Plage de dates',
    },
    'p9x0ckot': {
      'en': 'Start Date',
      'es': 'Fecha de inicio',
      'fr': 'Date de début',
    },
    'j7vbul21': {
      'en': 'End Date',
      'es': 'Fecha de finalización',
      'fr': 'Date de fin',
    },
    'vmkax24x': {
      'en': 'Generate',
      'es': 'Generar',
      'fr': 'Générer',
    },
    'kpfymf7l': {
      'en': 'Download',
      'es': 'Generar',
      'fr': 'Générer',
    },
    't2926v16': {
      'en': 'Download',
      'es': 'Generar',
      'fr': 'Générer',
    },
    '8rsk10un': {
      'en': 'Overview',
      'es': 'Descripción general',
      'fr': 'Aperçu',
    },
    'u66qx3eq': {
      'en': 'Today',
      'es': 'Hoy',
      'fr': 'Aujourd\'hui',
    },
    '3nrqmdbw': {
      'en': 'Week',
      'es': 'Semana',
      'fr': 'Semaine',
    },
    'k0l2njln': {
      'en': 'Month',
      'es': 'Mes',
      'fr': 'Mois',
    },
    'en6hm5zb': {
      'en': 'Year',
      'es': 'Año',
      'fr': 'Année',
    },
    'u64rbfsq': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'sqgpgu4v': {
      'en': 'Systolic Blood Pressure',
      'es': '',
      'fr': '',
    },
    'x641f0fm': {
      'en': 'Diastolic Blood Pressure',
      'es': '',
      'fr': '',
    },
    'nnig1yxg': {
      'en': 'Health Data',
      'es': 'Datos de salud',
      'fr': 'Données sur la santé',
    },
  },
  // HealthMetricsGraphsCopy
  {
    'coqygtir': {
      'en': 'Health Trends',
      'es': 'Tendencias de salud',
      'fr': 'Tendances en matière de santé',
    },
    'wtttq684': {
      'en': 'Your health data trends at a glance',
      'es': 'Las tendencias de sus datos de salud de un vistazo',
      'fr': 'Aperçu des tendances de vos données de santé',
    },
    'xesgtfs3': {
      'en': 'Date Range',
      'es': 'Rango de fechas',
      'fr': 'Plage de dates',
    },
    'ji69feln': {
      'en': 'Start Date',
      'es': 'Fecha de inicio',
      'fr': 'Date de début',
    },
    'bhgzftpf': {
      'en': 'End Date',
      'es': 'Fecha de finalización',
      'fr': 'Date de fin',
    },
    'cnnrh9uf': {
      'en': 'Generate',
      'es': 'Generar',
      'fr': 'Générer',
    },
    'n8xr0trb': {
      'en': 'Today',
      'es': 'Hoy',
      'fr': 'Aujourd\'hui',
    },
    'w8x5rm49': {
      'en': 'Week',
      'es': 'Semana',
      'fr': 'Semaine',
    },
    'f0doj2go': {
      'en': 'Month',
      'es': 'Mes',
      'fr': 'Mois',
    },
    'dkejec32': {
      'en': 'Year',
      'es': 'Año',
      'fr': 'Année',
    },
    'tsm3le0v': {
      'en': 'All',
      'es': 'Todo',
      'fr': 'Tous',
    },
    's6a23gav': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'npvn1md1': {
      'en': '-',
      'es': '-',
      'fr': '-',
    },
    '9u0a89ne': {
      'en': 'Health Data',
      'es': 'Datos de salud',
      'fr': 'Données sur la santé',
    },
  },
  // DraftofGraph
  {
    '01l532vv': {
      'en': 'Health Trends',
      'es': 'Tendencias de salud',
      'fr': 'Tendances en matière de santé',
    },
    '2qbswnny': {
      'en': 'Your health data trends at a glance',
      'es': 'Las tendencias de sus datos de salud de un vistazo',
      'fr': 'Aperçu des tendances de vos données de santé',
    },
    'juxmo1mn': {
      'en': 'Date Range',
      'es': 'Rango de fechas',
      'fr': 'Plage de dates',
    },
    'vxhd9jad': {
      'en': 'Start Date',
      'es': 'Fecha de inicio',
      'fr': 'Date de début',
    },
    'kpk7byjl': {
      'en': 'End Date',
      'es': 'Fecha de finalización',
      'fr': 'Date de fin',
    },
    '8ev0v0l4': {
      'en': 'Generate',
      'es': 'Generar',
      'fr': 'Générer',
    },
    'aei8rmmn': {
      'en': 'Today',
      'es': 'Hoy',
      'fr': 'Aujourd\'hui',
    },
    'efdt95qo': {
      'en': 'Week',
      'es': 'Semana',
      'fr': 'Semaine',
    },
    'y56gr0i8': {
      'en': 'Month',
      'es': 'Mes',
      'fr': 'Mois',
    },
    '3mcade7p': {
      'en': 'Year',
      'es': 'Año',
      'fr': 'Année',
    },
    '4dl57ntx': {
      'en': 'All',
      'es': 'Todo',
      'fr': 'Tous',
    },
    '6e6ajxe3': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'vh23xwxt': {
      'en': '-',
      'es': '-',
      'fr': '-',
    },
    '8sixr72i': {
      'en': 'Health Data',
      'es': 'Datos de salud',
      'fr': 'Données sur la santé',
    },
  },
  // DemoedHealthGraphs
  {
    'rlkep6fc': {
      'en': 'Health Trends',
      'es': 'Tendencias de salud',
      'fr': 'Tendances en matière de santé',
    },
    'ihy5v1n5': {
      'en': 'Your health data trends at a glance',
      'es': 'Las tendencias de sus datos de salud de un vistazo',
      'fr': 'Aperçu des tendances de vos données de santé',
    },
    '0hcyxjo0': {
      'en': 'Date Range',
      'es': 'Rango de fechas',
      'fr': 'Plage de dates',
    },
    'czleth1z': {
      'en': 'Start Date',
      'es': 'Fecha de inicio',
      'fr': 'Date de début',
    },
    '9wg6ms8s': {
      'en': 'End Date',
      'es': 'Fecha de finalización',
      'fr': 'Date de fin',
    },
    'vin4ddo8': {
      'en': 'Generate',
      'es': 'Generar',
      'fr': 'Générer',
    },
    'tg7y89rd': {
      'en': 'Overview',
      'es': 'Descripción general',
      'fr': 'Aperçu',
    },
    'g4setfey': {
      'en': 'Health Data',
      'es': 'Datos de salud',
      'fr': 'Données sur la santé',
    },
  },
  // HealthMetricsGraphsChoiceChips
  {
    '70amker4': {
      'en': 'Health Trends',
      'es': 'Tendencias de salud',
      'fr': 'Tendances en matière de santé',
    },
    '4si3kj1t': {
      'en': 'Your health data trends at a glance',
      'es': 'Las tendencias de sus datos de salud de un vistazo',
      'fr': 'Aperçu des tendances de vos données de santé',
    },
    '3hx2iw70': {
      'en': 'Date Range',
      'es': 'Rango de fechas',
      'fr': 'Plage de dates',
    },
    '7pyctgtd': {
      'en': 'Start Date',
      'es': 'Fecha de inicio',
      'fr': 'Date de début',
    },
    's2b6dc8j': {
      'en': 'End Date',
      'es': 'Fecha de finalización',
      'fr': 'Date de fin',
    },
    'qkn62jll': {
      'en': 'Generate',
      'es': 'Generar',
      'fr': 'Générer',
    },
    '0wvci12x': {
      'en': 'Overview',
      'es': 'Descripción general',
      'fr': 'Aperçu',
    },
    '00usu32q': {
      'en': 'Today',
      'es': 'Hoy',
      'fr': 'Aujourd\'hui',
    },
    'cvkf5w63': {
      'en': 'Week',
      'es': 'Semana',
      'fr': 'Semaine',
    },
    'z8gozdbl': {
      'en': 'Month',
      'es': 'Mes',
      'fr': 'Mois',
    },
    'jo4ywfz8': {
      'en': 'Year',
      'es': 'Año',
      'fr': 'Année',
    },
    'qli6di8q': {
      'en': 'All',
      'es': 'Todo',
      'fr': 'Tous',
    },
    'w56c2yrj': {
      'en': 'Year',
      'es': 'Año',
      'fr': 'Année',
    },
    'jjp6vhfd': {
      'en': 'Health Data',
      'es': 'Datos de salud',
      'fr': 'Données sur la santé',
    },
  },
  // HealthMetricsGraphsCharts
  {
    '84i3kfe1': {
      'en': 'Health Trends',
      'es': 'Tendencias de salud',
      'fr': 'Tendances en matière de santé',
    },
    'l50uupya': {
      'en': 'Your health data trends at a glance',
      'es': 'Las tendencias de sus datos de salud de un vistazo',
      'fr': 'Aperçu des tendances de vos données de santé',
    },
    '7no9x0y0': {
      'en': 'Date Range',
      'es': 'Rango de fechas',
      'fr': 'Plage de dates',
    },
    'xo4wl5uw': {
      'en': 'Start Date',
      'es': 'Fecha de inicio',
      'fr': 'Date de début',
    },
    'q0edx1fi': {
      'en': 'End Date',
      'es': 'Fecha de finalización',
      'fr': 'Date de fin',
    },
    'o14he3sg': {
      'en': 'Generate',
      'es': 'Generar',
      'fr': 'Générer',
    },
    'j9rdauoo': {
      'en': 'Overview',
      'es': 'Descripción general',
      'fr': 'Aperçu',
    },
    '68nb91by': {
      'en': 'Today',
      'es': 'Hoy',
      'fr': 'Aujourd\'hui',
    },
    '5bsfdxew': {
      'en': 'Week',
      'es': 'Semana',
      'fr': 'Semaine',
    },
    'ntd2e19a': {
      'en': 'Month',
      'es': 'Mes',
      'fr': 'Mois',
    },
    '2iq1f8l6': {
      'en': 'Year',
      'es': 'Año',
      'fr': 'Année',
    },
    'qxtc9rzz': {
      'en': 'All',
      'es': 'Todo',
      'fr': 'Tous',
    },
    'ex6c9336': {
      'en': 'Month',
      'es': 'Mes',
      'fr': 'Mois',
    },
    'tmcshe34': {
      'en': 'Date',
      'es': 'Fecha',
      'fr': 'Date',
    },
    'bc8c8mnm': {
      'en': 'Value',
      'es': 'Valor',
      'fr': 'Valeur',
    },
    'jq55ybd1': {
      'en': 'Health Data',
      'es': 'Datos de salud',
      'fr': 'Données sur la santé',
    },
  },
  // HealthMetricsGraphsCopy2
  {
    '7o5op7qm': {
      'en': 'Health Trends',
      'es': 'Tendencias de salud',
      'fr': 'Tendances en matière de santé',
    },
    '03aw5gkn': {
      'en': 'Your health data trends at a glance',
      'es': 'Las tendencias de sus datos de salud de un vistazo',
      'fr': 'Aperçu des tendances de vos données de santé',
    },
    'bcbwp74i': {
      'en': 'Date Range',
      'es': 'Rango de fechas',
      'fr': 'Plage de dates',
    },
    '3on0cve1': {
      'en': 'Start Date',
      'es': 'Fecha de inicio',
      'fr': 'Date de début',
    },
    '5clmv4iz': {
      'en': 'End Date',
      'es': 'Fecha de finalización',
      'fr': 'Date de fin',
    },
    'a2cww2at': {
      'en': 'Generate',
      'es': 'Generar',
      'fr': 'Générer',
    },
    '6b8jgpzs': {
      'en': 'Download',
      'es': 'Generar',
      'fr': 'Générer',
    },
    'my152zad': {
      'en': 'Overview',
      'es': 'Descripción general',
      'fr': 'Aperçu',
    },
    'k0xx3zpv': {
      'en': 'Today',
      'es': 'Hoy',
      'fr': 'Aujourd\'hui',
    },
    'vaedaeox': {
      'en': 'Week',
      'es': 'Semana',
      'fr': 'Semaine',
    },
    'vuy1sdx5': {
      'en': 'Month',
      'es': 'Mes',
      'fr': 'Mois',
    },
    'nhc92me9': {
      'en': 'Year',
      'es': 'Año',
      'fr': 'Année',
    },
    '6q1n4jk4': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '4zmwd6hl': {
      'en': 'Health Data',
      'es': 'Datos de salud',
      'fr': 'Données sur la santé',
    },
  },
  // PractitionerProfileScreen
  {
    'x876zhsd': {
      'en': 'Profile',
      'es': 'Perfil',
      'fr': 'Profil',
    },
    '5v9jioyd': {
      'en': 'Manage your account settings',
      'es': 'Administrar la configuración de su cuenta',
      'fr': 'Gérez les paramètres de votre compte',
    },
    'w4q98rs9': {
      'en':
          'Your heart beats with purpose- keep it strong with movement and mindfulness',
      'es': '',
      'fr': '',
    },
    'pahw6kvy': {
      'en':
          'Functional medicine focuses on root causes, not just symptoms. Stay consistent!',
      'es': '',
      'fr': '',
    },
    'n70gunzl': {
      'en':
          'Your health journey is unique. Track your progress and adapt your plan accordingly',
      'es': '',
      'fr': '',
    },
    'nifo0pd3': {
      'en': 'View Profile',
      'es': 'Ver perfil',
      'fr': 'Voir le profil',
    },
    '6pvxi6sn': {
      'en': 'Account Settings',
      'es': 'Configuraciones de la cuenta',
      'fr': 'Paramètres du compte',
    },
    'g3ctotib': {
      'en': 'General Settings',
      'es': 'Configuración general',
      'fr': 'Paramètres généraux',
    },
    'ov87mhp6': {
      'en': 'Privacy & Security',
      'es': 'Privacidad y seguridad',
      'fr': 'Confidentialité et sécurité',
    },
    'v1ecirgn': {
      'en': 'Log Out',
      'es': 'Finalizar la sesión',
      'fr': 'Se déconnecter',
    },
    'wrpwij4u': {
      'en': 'Profile',
      'es': 'Perfil',
      'fr': 'Profil',
    },
  },
  // HealthMetricsGraphsFinal
  {
    'bvq1vdym': {
      'en': 'Health Trends',
      'es': 'Tendencias de salud',
      'fr': 'Tendances en matière de santé',
    },
    'mbnch294': {
      'en': 'Your health data trends at a glance',
      'es': 'Las tendencias de sus datos de salud de un vistazo',
      'fr': 'Aperçu des tendances de vos données de santé',
    },
    '2nhf5om1': {
      'en': 'Date Range',
      'es': 'Rango de fechas',
      'fr': 'Plage de dates',
    },
    'z8lj6wlw': {
      'en': 'Start Date',
      'es': 'Fecha de inicio',
      'fr': 'Date de début',
    },
    'wel66z5a': {
      'en': 'End Date',
      'es': 'Fecha de finalización',
      'fr': 'Date de fin',
    },
    '9pebrpnn': {
      'en': 'Generate',
      'es': 'Generar',
      'fr': 'Générer',
    },
    'o1pex1aq': {
      'en': 'Download',
      'es': 'Generar',
      'fr': 'Générer',
    },
    '1blso12g': {
      'en': 'Download',
      'es': 'Generar',
      'fr': 'Générer',
    },
    'lnzmpw23': {
      'en': 'Overview',
      'es': 'Descripción general',
      'fr': 'Aperçu',
    },
    '9yukl4tm': {
      'en': 'Today',
      'es': 'Hoy',
      'fr': 'Aujourd\'hui',
    },
    'tgybbinw': {
      'en': 'Week',
      'es': 'Semana',
      'fr': 'Semaine',
    },
    'ixnuwi4t': {
      'en': 'Month',
      'es': 'Mes',
      'fr': 'Mois',
    },
    '0olnmaz7': {
      'en': 'Year',
      'es': 'Año',
      'fr': 'Année',
    },
    'a3rxbr8g': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '4i4sv8zc': {
      'en': 'Systolic Blood Pressure',
      'es': '',
      'fr': '',
    },
    'jdsawzke': {
      'en': 'Diastolic Blood Pressure',
      'es': '',
      'fr': '',
    },
    'iuwtma7f': {
      'en': 'Health Data',
      'es': 'Datos de salud',
      'fr': 'Données sur la santé',
    },
  },
  // HomeScreenFinal
  {
    '4cmp1tjy': {
      'en': 'Health Monitor',
      'es': 'Monitor de salud',
      'fr': 'Moniteur de santé',
    },
    '82g5th3z': {
      'en': 'Quick Actions',
      'es': '',
      'fr': '',
    },
    'r5zto16m': {
      'en': 'Home',
      'es': '',
      'fr': '',
    },
    'nxu3n33a': {
      'en': 'Health Data',
      'es': '',
      'fr': '',
    },
    'kauo426x': {
      'en': 'Profile',
      'es': '',
      'fr': '',
    },
    '4m22vqkh': {
      'en':
          '\"Stay Hyderated : Aim to drink at least 8 glasses of water daily.\"',
      'es': '',
      'fr': '',
    },
    'hvz46d0i': {
      'en':
          '\"Incorporate at least 30 minutes of physical activity into your routine each day.\"',
      'es': '',
      'fr': '',
    },
    'poq7ro7f': {
      'en': 'Health Overview',
      'es': 'Métricas recientes',
      'fr': 'Mesures récentes',
    },
    'bg3haujn': {
      'en': 'Recent Metrics',
      'es': 'Métricas recientes',
      'fr': 'Mesures récentes',
    },
    '9krf0mxs': {
      'en': 'View All',
      'es': 'Ver todo',
      'fr': 'Tout voir',
    },
    'bjt20u4r': {
      'en': 'Heart Rate',
      'es': 'Frecuencia cardíaca',
      'fr': 'Fréquence cardiaque',
    },
    'zo2ops8x': {
      'en': '97%',
      'es': '97%',
      'fr': '97%',
    },
    'sfbuodmr': {
      'en': 'Blood Oxygen Level',
      'es': 'Nivel de oxígeno en sangre',
      'fr': 'Niveau d\'oxygène dans le sang',
    },
    '3al1hrxi': {
      'en': 'Blood Pressure',
      'es': 'Presión arterial',
      'fr': 'Pression artérielle',
    },
    'jgsl494q': {
      'en': 'Weight',
      'es': 'Peso',
      'fr': 'Poids',
    },
    'kwx7e5wl': {
      'en': 'BMI',
      'es': 'IMC',
      'fr': 'IMC',
    },
    'tlyn1o8x': {
      'en': 'Activity Level',
      'es': 'IMC',
      'fr': 'IMC',
    },
    'fgas0k2k': {
      'en': 'Start Measurements',
      'es': 'Iniciar mediciones',
      'fr': 'Commencer les mesures',
    },
    '3k7j58kl': {
      'en': 'Recent Activities',
      'es': 'Actividades recientes',
      'fr': 'Activités récentes',
    },
    'dcg87mbf': {
      'en': 'Morning Walk',
      'es': 'Paseo matutino',
      'fr': 'Promenade matinale',
    },
    'f7cvgvjx': {
      'en': '30 minutes • 2,500 steps',
      'es': '30 minutos • 2.500 pasos',
      'fr': '30 minutes • 2 500 pas',
    },
    'hf6lodli': {
      'en': 'Blood Pressure Check',
      'es': 'Control de presión arterial',
      'fr': 'Contrôle de la tension artérielle',
    },
    'oui1957h': {
      'en': '120/80 mmHg',
      'es': '120/80 mmHg',
      'fr': '120/80 mmHg',
    },
    'ozkfr9yy': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
    'zztr1yk7': {
      'en': 'Verify to Login to your account',
      'es': 'Verificar para iniciar sesión en su cuenta',
      'fr': 'Vérifiez pour vous connecter à votre compte',
    },
  },
  // HealthmetricsformFinal
  {
    '9anu5r48': {
      'en': ' Body Measurements',
      'es': 'Medidas corporales',
      'fr': 'Mensurations corporelles',
    },
    'bdzdoitg': {
      'en': 'Height (feet)',
      'es': 'Altura (pies)',
      'fr': 'Hauteur (pieds)',
    },
    'qnjepxb8': {
      'en': 'Height (in)',
      'es': 'Altura (pulgadas)',
      'fr': 'Hauteur (po)',
    },
    'mlj5gat1': {
      'en': 'Weight (lbs)',
      'es': 'Peso (libras)',
      'fr': 'Poids (lb)',
    },
    'b7z6edot': {
      'en': 'Waist (inches)',
      'es': 'Cintura (pulgadas)',
      'fr': 'Tour de taille (pouces)',
    },
    'xdy6f4ts': {
      'en': 'Hip (inches)',
      'es': 'Cadera (pulgadas)',
      'fr': 'Hanche (pouces)',
    },
    'mxw25e72': {
      'en': 'Activity Level',
      'es': 'Nivel de actividad',
      'fr': 'Niveau d\'activité',
    },
    'pgvvrvh5': {
      'en': 'Sedentary',
      'es': 'Sedentario',
      'fr': 'Sédentaire',
    },
    'uskz5ux8': {
      'en': 'Light',
      'es': 'Luz',
      'fr': 'Lumière',
    },
    'p4xbynwx': {
      'en': 'Moderate',
      'es': 'Moderado',
      'fr': 'Modéré',
    },
    '92cwbh6x': {
      'en': 'Active',
      'es': 'Activo',
      'fr': 'Actif',
    },
    'yj5nalt4': {
      'en': 'Very Active',
      'es': 'Muy activo',
      'fr': 'Très actif',
    },
    'g6dvia2d': {
      'en': 'Field is required...',
      'es': 'El campo es obligatorio...',
      'fr': 'Le champ est obligatoire...',
    },
    '3rbl8uzz': {
      'en': 'Field is required...',
      'es': 'El campo es obligatorio...',
      'fr': 'Le champ est obligatoire...',
    },
    'c1nnq7an': {
      'en': 'Only digits and decimal are valid...',
      'es': 'Sólo son válidos dígitos y decimales...',
      'fr': 'Seuls les chiffres et les décimales sont valides...',
    },
    'iknovlo9': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'whdbta5y': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'tgmcubqn': {
      'en': 'Only digits and decimal are valid...',
      'es': 'Sólo son válidos dígitos y decimales...',
      'fr': 'Seuls les chiffres et les décimales sont valides...',
    },
    'vth1ekus': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'a9usa5af': {
      'en': 'Field is required...',
      'es': 'El campo es obligatorio...',
      'fr': 'Le champ est obligatoire...',
    },
    'k0qx867o': {
      'en': 'Weight should be between 60 to 660 lbs...',
      'es': 'El peso debe estar entre 60 y 660 libras.',
      'fr': 'Le poids doit être compris entre 60 et 660 livres.',
    },
    'bil1qlx7': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '3imix8z5': {
      'en': 'Field is required...',
      'es': 'El campo es obligatorio...',
      'fr': 'Le champ est obligatoire...',
    },
    'mg37zoib': {
      'en': 'Waist size should be between 15 to 80 inches...',
      'es': 'El tamaño de la cintura debe estar entre 15 y 80 pulgadas...',
      'fr': 'Le tour de taille doit être compris entre 15 et 80 pouces...',
    },
    'a00r0k33': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'jmxzrl3n': {
      'en': 'Field is required...',
      'es': 'El campo es obligatorio...',
      'fr': 'Le champ est obligatoire...',
    },
    'w1lc2zlp': {
      'en': 'Hip size should be between 20 to 80 inches...',
      'es': 'El tamaño de la cadera debe estar entre 20 y 80 pulgadas...',
      'fr': 'La taille des hanches doit être comprise entre 20 et 80 pouces.',
    },
    'f9e4hk2s': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'vxeeyc2c': {
      'en': 'Vitals',
      'es': 'Partes vitales',
      'fr': 'Signes vitaux',
    },
    '0jpwp844': {
      'en': 'Heart Rate (BPM)',
      'es': 'Frecuencia cardíaca (BPM)',
      'fr': 'Fréquence cardiaque (BPM)',
    },
    '1w52vk3r': {
      'en': 'Blood Oxygen Level (SpO2)',
      'es': 'Nivel de oxígeno en sangre (SpO2)',
      'fr': 'Taux d\'oxygène dans le sang (SpO2)',
    },
    'wgigemew': {
      'en': 'Systolic BP',
      'es': 'Presión arterial sistólica',
      'fr': 'Pression artérielle systolique',
    },
    'qb0rps6c': {
      'en': 'Diastolic BP',
      'es': 'Presión arterial diastólica',
      'fr': 'Pression artérielle diastolique',
    },
    'aaumds9a': {
      'en': 'Field is required...',
      'es': 'El campo es obligatorio...',
      'fr': 'Le champ est obligatoire...',
    },
    'fffkuehy': {
      'en': 'Heart rate should be between 30 to 250 BPM...',
      'es': 'La frecuencia cardíaca debe estar entre 30 y 250 LPM...',
      'fr': 'La fréquence cardiaque doit être comprise entre 30 et 250 BPM...',
    },
    'e9wdsd6u': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'f7wa2tj8': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'tkfs7swt': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'bggbco57': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'z3z3qiyo': {
      'en': 'Systolic BP: 50 - 300',
      'es': 'Presión arterial sistólica: 50 - 300',
      'fr': 'Pression artérielle systolique : 50 - 300',
    },
    'gyh7r0kw': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '3rf8ro0n': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'rrb0rga6': {
      'en': 'Diastolic BP: 30 - 200',
      'es': 'Presión arterial diastólica: 30 a 200',
      'fr': 'Tension artérielle diastolique : 30 à 200',
    },
    '1vrvna15': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'fuj97qdw': {
      'en': 'Save Measurements',
      'es': 'Guardar medidas',
      'fr': 'Enregistrer les mesures',
    },
    'jmp607gw': {
      'en': 'Health Metrics',
      'es': 'Métricas de salud',
      'fr': 'Indicateurs de santé',
    },
    'hc7wi0ez': {
      'en': 'Track your body metrics and vitals',
      'es':
          'Realice un seguimiento de sus métricas corporales y signos vitales',
      'fr': 'Suivez les paramètres et les signes vitaux de votre corps',
    },
  },
  // EditHealthmetricsRecordFinal
  {
    'z770q2qj': {
      'en': ' Body Measurements',
      'es': 'Medidas corporales',
      'fr': 'Mensurations corporelles',
    },
    'a5ynts34': {
      'en': 'Height (feet)',
      'es': 'Altura (pies)',
      'fr': 'Hauteur (pieds)',
    },
    'a8u55kyj': {
      'en': 'Height (in)',
      'es': 'Altura (pulgadas)',
      'fr': 'Hauteur (po)',
    },
    'v99ugai6': {
      'en': 'Weight (lbs)',
      'es': 'Peso (libras)',
      'fr': 'Poids (lb)',
    },
    'uomk3s3d': {
      'en': 'Waist (inches)',
      'es': 'Cintura (pulgadas)',
      'fr': 'Tour de taille (pouces)',
    },
    'u5aishgh': {
      'en': 'Hip (inches)',
      'es': 'Cadera (pulgadas)',
      'fr': 'Hanche (pouces)',
    },
    '2w0j2sx6': {
      'en': 'Activity Level',
      'es': 'Nivel de actividad',
      'fr': 'Niveau d\'activité',
    },
    'zgmrf3wb': {
      'en': 'Sedentary',
      'es': 'Sedentario',
      'fr': 'Sédentaire',
    },
    '2n66xx02': {
      'en': 'Light',
      'es': 'Luz',
      'fr': 'Lumière',
    },
    'wb3vadki': {
      'en': 'Moderate',
      'es': 'Moderado',
      'fr': 'Modéré',
    },
    'okfcayna': {
      'en': 'Active',
      'es': 'Activo',
      'fr': 'Actif',
    },
    'vfnetv0c': {
      'en': 'Very Active',
      'es': 'Muy activo',
      'fr': 'Très actif',
    },
    'fjongii0': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'alaw3mml': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'ny5e098t': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'ituuibte': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'p6k3irbe': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'woqouuu5': {
      'en': 'Weight should be between 60 and 660 lbs...',
      'es': 'El peso debe estar entre 60 y 660 libras.',
      'fr': 'Le poids doit être compris entre 60 et 660 livres.',
    },
    'fqxftoss': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'fsrhj9ik': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'q201qirr': {
      'en': 'Waist should be between 15 to 80 inches...',
      'es': 'La cintura debe medir entre 15 y 80 pulgadas...',
      'fr': 'La taille doit être comprise entre 15 et 80 pouces...',
    },
    'jb4ock10': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'lu1rjnp8': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    '3d0w0xie': {
      'en': 'Hip should be between 20 to 80 inches...',
      'es': 'La cadera debe medir entre 20 y 80 pulgadas...',
      'fr': 'Les hanches doivent mesurer entre 20 et 80 pouces.',
    },
    'nb627j9s': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'd7debhju': {
      'en': 'Vitals',
      'es': 'Partes vitales',
      'fr': 'Signes vitaux',
    },
    'n4fwhgyi': {
      'en': 'Heart Rate (BPM)',
      'es': 'Frecuencia cardíaca (BPM)',
      'fr': 'Fréquence cardiaque (BPM)',
    },
    'rlejo9ek': {
      'en': 'Blood Oxygen Level (SpO2)',
      'es': 'Nivel de oxígeno en sangre (SpO2)',
      'fr': 'Taux d\'oxygène dans le sang (SpO2)',
    },
    'clhx4b0d': {
      'en': 'Systolic BP',
      'es': 'Presión arterial sistólica',
      'fr': 'Pression artérielle systolique',
    },
    '89y9eint': {
      'en': 'Diastolic BP',
      'es': 'Presión arterial diastólica',
      'fr': 'Pression artérielle diastolique',
    },
    'qtxfjxmu': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'rgo0rkic': {
      'en': 'Heart Rate should be between 30 and 250 BPM...',
      'es': 'La frecuencia cardíaca debe estar entre 30 y 250 LPM...',
      'fr': 'La fréquence cardiaque doit être comprise entre 30 et 250 BPM...',
    },
    'wnyunv3b': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '498vfdju': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'mug9ikfy': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'flepk4mq': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'xmd18oqt': {
      'en': 'Systolic BP: 50 to 300',
      'es': 'Presión arterial sistólica: 50 a 300',
      'fr': 'Pression artérielle systolique : 50 à 300',
    },
    'rk6yaxl9': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'acwmlmxa': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'wjof4fep': {
      'en': 'Diastolic BP: 30 to 200',
      'es': 'Presión arterial diastólica: 30 a 200',
      'fr': 'Tension artérielle diastolique : 30 à 200',
    },
    'wzwg394f': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '4gi84pqc': {
      'en': 'Update',
      'es': 'Actualizar',
      'fr': 'Mise à jour',
    },
    'vmmwsqk8': {
      'en': 'Edit Record',
      'es': 'Editar registro',
      'fr': 'Modifier l\'enregistrement',
    },
    'r8dy8oay': {
      'en': 'Edit your metrics record here',
      'es': 'Edite su registro de métricas aquí',
      'fr': 'Modifiez votre enregistrement de métriques ici',
    },
  },
  // BookAppointment
  {
    '2i6fv973': {
      'en': 'Select Practitioner',
      'es': '',
      'fr': '',
    },
    'elzzzd4v': {
      'en': 'Select Date',
      'es': '',
      'fr': '',
    },
    'sk79qgsv': {
      'en': 'Available Time Slots',
      'es': '',
      'fr': '',
    },
    'jyqeoc7o': {
      'en': '9:00 AM',
      'es': '',
      'fr': '',
    },
    'yzgicadl': {
      'en': '9:30 AM',
      'es': '',
      'fr': '',
    },
    'chr4z3qq': {
      'en': '10:00 AM',
      'es': '',
      'fr': '',
    },
    'ffdhpszs': {
      'en': '10:30 AM',
      'es': '',
      'fr': '',
    },
    '26h64dok': {
      'en': '11:00 AM',
      'es': '',
      'fr': '',
    },
    '62b4kdbx': {
      'en': '11:30 AM',
      'es': '',
      'fr': '',
    },
    '53t2zy72': {
      'en': '1:00 PM',
      'es': '',
      'fr': '',
    },
    'sseg796c': {
      'en': '1:30 PM',
      'es': '',
      'fr': '',
    },
    'h3vmfvj4': {
      'en': '2:00 PM',
      'es': '',
      'fr': '',
    },
    'ykqpk2a1': {
      'en': '2:30 PM',
      'es': '',
      'fr': '',
    },
    'woq7czj6': {
      'en': '3:00 PM',
      'es': '',
      'fr': '',
    },
    'haux5ylr': {
      'en': '3:30 PM',
      'es': '',
      'fr': '',
    },
    'q1w5bxey': {
      'en': '4:00 PM',
      'es': '',
      'fr': '',
    },
    '247foxcz': {
      'en': '4:30 PM',
      'es': '',
      'fr': '',
    },
    '9f4sbj2v': {
      'en': '9:00 AM',
      'es': '',
      'fr': '',
    },
    'gbdhpyay': {
      'en': '9:30 AM',
      'es': '',
      'fr': '',
    },
    'e48rd3q5': {
      'en': '10:00 AM',
      'es': '',
      'fr': '',
    },
    '9eblu19i': {
      'en': '10:30 AM',
      'es': '',
      'fr': '',
    },
    'brcmi7v1': {
      'en': '11:30 AM',
      'es': '',
      'fr': '',
    },
    't9emy0d2': {
      'en': '11:00 AM',
      'es': '',
      'fr': '',
    },
    'gdz3iuqj': {
      'en': '1:00 PM',
      'es': '',
      'fr': '',
    },
    'msmmxz1k': {
      'en': '1:30 PM',
      'es': '',
      'fr': '',
    },
    '2z9j1dsd': {
      'en': '2:00 PM',
      'es': '',
      'fr': '',
    },
    'moiwix9t': {
      'en': '2:30 PM',
      'es': '',
      'fr': '',
    },
    'vbrnfe8l': {
      'en': '3:00 PM',
      'es': '',
      'fr': '',
    },
    'slntdg2r': {
      'en': '3:30 PM',
      'es': '',
      'fr': '',
    },
    '4uapjonj': {
      'en': '4:00 PM',
      'es': '',
      'fr': '',
    },
    'k33ci2e9': {
      'en': '4:30 PM',
      'es': '',
      'fr': '',
    },
    'wiy7nwa5': {
      'en': 'Available Time Slots',
      'es': '',
      'fr': '',
    },
    'ze0vrju0': {
      'en': '9:00 AM',
      'es': '',
      'fr': '',
    },
    's8e8ffmy': {
      'en': '9:30 AM',
      'es': '',
      'fr': '',
    },
    'er0cvjeb': {
      'en': '10:00 AM',
      'es': '',
      'fr': '',
    },
    'fdz1uq63': {
      'en': '10:30 AM',
      'es': '',
      'fr': '',
    },
    'pixx0jwq': {
      'en': '11:00 AM',
      'es': '',
      'fr': '',
    },
    '7itc5uwr': {
      'en': '11:30 AM',
      'es': '',
      'fr': '',
    },
    'naoz6abq': {
      'en': '1:00 PM',
      'es': '',
      'fr': '',
    },
    'wzm7q947': {
      'en': '1:30 PM',
      'es': '',
      'fr': '',
    },
    'w5d6z8oo': {
      'en': '2:00 PM',
      'es': '',
      'fr': '',
    },
    'f9xppq2g': {
      'en': '2:30 PM',
      'es': '',
      'fr': '',
    },
    '348hdqtz': {
      'en': '3:00 PM',
      'es': '',
      'fr': '',
    },
    '89abrk54': {
      'en': '3:30 PM',
      'es': '',
      'fr': '',
    },
    'wrh4zqn4': {
      'en': '4:00 PM',
      'es': '',
      'fr': '',
    },
    'xp4jj3yg': {
      'en': '4:30 PM',
      'es': '',
      'fr': '',
    },
    'kupnubze': {
      'en': 'Confirm Appointment',
      'es': '',
      'fr': '',
    },
    '463soemm': {
      'en': 'Book Appointment',
      'es': 'Editar perfil',
      'fr': 'Modifier le profil',
    },
  },
  // Appointments
  {
    'l6ka2p80': {
      'en': 'Upcoming',
      'es': 'Cliente',
      'fr': 'Client',
    },
    '3x01ph8u': {
      'en': 'Date',
      'es': '',
      'fr': '',
    },
    'q6fognn5': {
      'en': 'Time',
      'es': '',
      'fr': '',
    },
    '6d81917g': {
      'en': 'Cancel',
      'es': '',
      'fr': '',
    },
    'qr03pkir': {
      'en': 'Reschedule',
      'es': '',
      'fr': '',
    },
    '7aphb3pf': {
      'en': 'Pending',
      'es': '',
      'fr': '',
    },
    'qmazvltv': {
      'en': 'Date',
      'es': '',
      'fr': '',
    },
    'xs1xuh8g': {
      'en': 'Time',
      'es': '',
      'fr': '',
    },
    'l8epmptz': {
      'en': 'Reschedule',
      'es': '',
      'fr': '',
    },
    '4xsa4x65': {
      'en': 'My Appointments',
      'es': 'Editar perfil',
      'fr': 'Modifier le profil',
    },
    's6gc0ia4': {
      'en': 'Appointments',
      'es': '',
      'fr': '',
    },
  },
  // AppointmentsCopy
  {
    '2c66nskk': {
      'en': 'Upcoming',
      'es': 'Cliente',
      'fr': 'Client',
    },
    '9vw809co': {
      'en': 'Date',
      'es': '',
      'fr': '',
    },
    'njaio9co': {
      'en': 'Time',
      'es': '',
      'fr': '',
    },
    'zgg7b2k7': {
      'en': 'Cancel',
      'es': '',
      'fr': '',
    },
    'thbkwamz': {
      'en': 'Reschedule',
      'es': '',
      'fr': '',
    },
    'uutuzgz0': {
      'en': 'Completed',
      'es': 'Facultativo',
      'fr': 'Praticien',
    },
    '02sjwh8o': {
      'en': 'Cancelled',
      'es': '',
      'fr': '',
    },
    'ivexzypo': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'zkw8gg56': {
      'en': 'Date',
      'es': '',
      'fr': '',
    },
    'gjvcc60w': {
      'en': 'Time',
      'es': '',
      'fr': '',
    },
    '2w002y1v': {
      'en': 'Reschedule',
      'es': '',
      'fr': '',
    },
    'ukcn15j7': {
      'en': 'My Appointments',
      'es': 'Editar perfil',
      'fr': 'Modifier le profil',
    },
    'gp1st6q8': {
      'en': 'Appointments',
      'es': '',
      'fr': '',
    },
  },
  // PractitionerAppointments
  {
    'k6xl3k51': {
      'en': 'Upcoming',
      'es': 'Cliente',
      'fr': 'Client',
    },
    'axaeytzh': {
      'en': 'Date',
      'es': '',
      'fr': '',
    },
    'rfjqf8z0': {
      'en': 'Time',
      'es': '',
      'fr': '',
    },
    'f7i9v5uh': {
      'en': 'Cancel',
      'es': '',
      'fr': '',
    },
    '6pu1puq5': {
      'en': 'Pending',
      'es': '',
      'fr': '',
    },
    '2oi9aqbp': {
      'en': 'Date',
      'es': '',
      'fr': '',
    },
    'r8qkn3bo': {
      'en': 'Time',
      'es': '',
      'fr': '',
    },
    '9dfzem8b': {
      'en': 'Accept',
      'es': '',
      'fr': '',
    },
    'p6261i0p': {
      'en': 'Reject',
      'es': '',
      'fr': '',
    },
    'xoav4wld': {
      'en': 'My Appointments',
      'es': 'Editar perfil',
      'fr': 'Modifier le profil',
    },
    'qhfjelk9': {
      'en': 'Appointments',
      'es': '',
      'fr': '',
    },
  },
  // ClientHealthDashboardAtPSCopy
  {
    'sk8hyngu': {
      'en': 'Health Dashboard',
      'es': 'Panel de salud',
      'fr': 'Tableau de bord de santé',
    },
    'hw7ey3zd': {
      'en': 'Your daily health metrics at a glance',
      'es': 'Sus métricas de salud diarias de un vistazo',
      'fr': 'Vos mesures de santé quotidiennes en un coup d\'œil',
    },
    '9h30b5as': {
      'en': 'Heart Rate',
      'es': 'Frecuencia cardíaca',
      'fr': 'Fréquence cardiaque',
    },
    'pr4k3xop': {
      'en': 'BPM',
      'es': 'BPM',
      'fr': 'BPM',
    },
    'a8gmoc1a': {
      'en': 'View Details',
      'es': 'Ver detalles',
      'fr': 'Voir les détails',
    },
    'tzed1ijz': {
      'en': 'Blood Pressure',
      'es': 'Presión arterial',
      'fr': 'Pression artérielle',
    },
    '42m4pwxy': {
      'en': 'mmHg',
      'es': 'mmHg',
      'fr': 'mmHg',
    },
    'y6w3zu4g': {
      'en': 'Systolic Blood Pressure',
      'es': '',
      'fr': '',
    },
    '14sgdz9n': {
      'en': 'Diastolic Blood Pressure',
      'es': '',
      'fr': '',
    },
    '5szjvhnc': {
      'en': 'View Details',
      'es': 'Ver detalles',
      'fr': 'Voir les détails',
    },
    'akvhzecq': {
      'en': 'Base Metabolic Index',
      'es': 'Índice metabólico básico',
      'fr': 'Indice métabolique de base',
    },
    'ku3hozu9': {
      'en': 'View Details',
      'es': 'Ver detalles',
      'fr': 'Voir les détails',
    },
    'jz2xn0ld': {
      'en': 'Waist to Hip Ratio',
      'es': 'Relación cintura-cadera',
      'fr': 'Rapport taille/hanches',
    },
    'q1eyhfbk': {
      'en': 'View Details',
      'es': 'Ver detalles',
      'fr': 'Voir les détails',
    },
    '3va48c2t': {
      'en': 'Waist to Height Ratio',
      'es': 'Relación cintura-altura',
      'fr': 'Rapport taille/hauteur',
    },
    'f32nk7sr': {
      'en': 'View Details',
      'es': 'Ver detalles',
      'fr': 'Voir les détails',
    },
    '7cdjmzy9': {
      'en': 'Health Data',
      'es': 'Datos de salud',
      'fr': 'Données sur la santé',
    },
  },
  // Links
  {
    'p80chatp': {
      'en': 'Pending',
      'es': 'Cliente',
      'fr': 'Client',
    },
    'rkt071yn': {
      'en': 'Email',
      'es': '',
      'fr': '',
    },
    '9m1mk7qk': {
      'en': 'Phone',
      'es': '',
      'fr': '',
    },
    'dx39by7e': {
      'en': 'Accept',
      'es': '',
      'fr': '',
    },
    'p4pekhjv': {
      'en': 'Reject',
      'es': '',
      'fr': '',
    },
    'ymls11gb': {
      'en': 'Active',
      'es': 'Facultativo',
      'fr': 'Praticien',
    },
    'vb3fw881': {
      'en': 'Email',
      'es': '',
      'fr': '',
    },
    'nf0lkg3b': {
      'en': 'Phone',
      'es': '',
      'fr': '',
    },
    '97szt419': {
      'en': 'Reschedule',
      'es': '',
      'fr': '',
    },
    'v36bdlw6': {
      'en': 'My Linked Practitioners',
      'es': 'Editar perfil',
      'fr': 'Modifier le profil',
    },
    'ws6t0wzo': {
      'en': 'Appointments',
      'es': '',
      'fr': '',
    },
  },
  // PractitionerLinks
  {
    'ejbrrw8y': {
      'en': 'Pending',
      'es': 'Cliente',
      'fr': 'Client',
    },
    'o03r7aup': {
      'en': 'Email',
      'es': '',
      'fr': '',
    },
    'tjj1lper': {
      'en': 'Phone',
      'es': '',
      'fr': '',
    },
    'rbskg0ha': {
      'en': 'Accept',
      'es': '',
      'fr': '',
    },
    'vag46bmt': {
      'en': 'Reject',
      'es': '',
      'fr': '',
    },
    '2ott19jz': {
      'en': 'Active',
      'es': 'Facultativo',
      'fr': 'Praticien',
    },
    '5vcgtfml': {
      'en': 'Email',
      'es': '',
      'fr': '',
    },
    'x18qmwkv': {
      'en': 'Phone',
      'es': '',
      'fr': '',
    },
    'wcmksbun': {
      'en': 'Reschedule',
      'es': '',
      'fr': '',
    },
    '2eam7z2f': {
      'en': 'My Linked Clients',
      'es': 'Editar perfil',
      'fr': 'Modifier le profil',
    },
    'b5wuok91': {
      'en': 'Appointments',
      'es': '',
      'fr': '',
    },
  },
  // AppointmentsCopy2
  {
    '9hov8mke': {
      'en': 'Upcoming',
      'es': '',
      'fr': '',
    },
    'lqpxqr1q': {
      'en': 'Date',
      'es': '',
      'fr': '',
    },
    'qdz8lll0': {
      'en': 'Time',
      'es': '',
      'fr': '',
    },
    '2alt8r9i': {
      'en': 'Cancel',
      'es': '',
      'fr': '',
    },
    '7skmf3tp': {
      'en': 'Reschedule',
      'es': '',
      'fr': '',
    },
    'wu7kdggu': {
      'en': 'Completed',
      'es': '',
      'fr': '',
    },
    'e3lvvdx0': {
      'en': 'Date',
      'es': '',
      'fr': '',
    },
    'lnjfyg04': {
      'en': 'Time',
      'es': '',
      'fr': '',
    },
    'zt67a9xk': {
      'en': 'Reschedule',
      'es': '',
      'fr': '',
    },
    'r5r4iaus': {
      'en': 'Cancelled',
      'es': '',
      'fr': '',
    },
    'pnv386kv': {
      'en': 'Date',
      'es': '',
      'fr': '',
    },
    '7dtsbpbf': {
      'en': 'Time',
      'es': '',
      'fr': '',
    },
    'ujn1z79k': {
      'en': 'Reschedule',
      'es': '',
      'fr': '',
    },
    'mrqsmfq3': {
      'en': 'My Appointments',
      'es': '',
      'fr': '',
    },
    'ezc6sz9p': {
      'en': 'Appointments',
      'es': '',
      'fr': '',
    },
  },
  // AppointmentsNewFinal
  {
    'lhrljqe9': {
      'en': 'Upcoming',
      'es': 'Cliente',
      'fr': 'Client',
    },
    'ayrx6zqs': {
      'en': 'Date',
      'es': '',
      'fr': '',
    },
    '0zw9ecw0': {
      'en': 'Time',
      'es': '',
      'fr': '',
    },
    'jddxw5ki': {
      'en': 'Cancel',
      'es': '',
      'fr': '',
    },
    '5cp17d0w': {
      'en': 'Reschedule',
      'es': '',
      'fr': '',
    },
    'b3yvocwu': {
      'en': 'Completed',
      'es': 'Facultativo',
      'fr': 'Praticien',
    },
    'ism8lf82': {
      'en': 'Date',
      'es': '',
      'fr': '',
    },
    '6zyt0fg2': {
      'en': 'Time',
      'es': '',
      'fr': '',
    },
    'nmjdbzx3': {
      'en': 'Reschedule',
      'es': '',
      'fr': '',
    },
    '5y2sg4pl': {
      'en': 'Cancelled',
      'es': '',
      'fr': '',
    },
    'zw3v48n3': {
      'en': 'Date',
      'es': '',
      'fr': '',
    },
    'o0aj8k9f': {
      'en': 'Time',
      'es': '',
      'fr': '',
    },
    'hkhr7hw2': {
      'en': 'Reschedule',
      'es': '',
      'fr': '',
    },
    'roqfzt8w': {
      'en': 'Pending',
      'es': '',
      'fr': '',
    },
    'jcjw5o8s': {
      'en': 'Date',
      'es': '',
      'fr': '',
    },
    '65b2vuq0': {
      'en': 'Time',
      'es': '',
      'fr': '',
    },
    'jis5xc4l': {
      'en': 'Reschedule',
      'es': '',
      'fr': '',
    },
    '39yu3k2l': {
      'en': 'My Appointments',
      'es': 'Editar perfil',
      'fr': 'Modifier le profil',
    },
    'dyuxg2v6': {
      'en': 'Appointments',
      'es': '',
      'fr': '',
    },
  },
  // PractitionerAppointmentsNewFinal
  {
    'duo7jq47': {
      'en': 'Upcoming',
      'es': 'Cliente',
      'fr': 'Client',
    },
    'sgjltj69': {
      'en': 'Date',
      'es': '',
      'fr': '',
    },
    '2an1njef': {
      'en': 'Time',
      'es': '',
      'fr': '',
    },
    'ozwtxi1s': {
      'en': 'Cancel',
      'es': '',
      'fr': '',
    },
    '6z3pz1lq': {
      'en': 'Completed',
      'es': 'Facultativo',
      'fr': 'Praticien',
    },
    '0i0v43n5': {
      'en': 'Date',
      'es': '',
      'fr': '',
    },
    '33a0ah8j': {
      'en': 'Time',
      'es': '',
      'fr': '',
    },
    '1484xj08': {
      'en': 'Reschedule',
      'es': '',
      'fr': '',
    },
    'vfrmxiiy': {
      'en': 'Cancelled',
      'es': '',
      'fr': '',
    },
    'rlcwgxpz': {
      'en': 'Date',
      'es': '',
      'fr': '',
    },
    'mle37itl': {
      'en': 'Time',
      'es': '',
      'fr': '',
    },
    'pefwi4ax': {
      'en': 'Pending',
      'es': '',
      'fr': '',
    },
    'y9o79y3v': {
      'en': 'Date',
      'es': '',
      'fr': '',
    },
    'ukoo86eq': {
      'en': 'Time',
      'es': '',
      'fr': '',
    },
    'yxiqnvd5': {
      'en': 'Accept',
      'es': '',
      'fr': '',
    },
    'ipxrnq9c': {
      'en': 'Reject',
      'es': '',
      'fr': '',
    },
    '1abrs5so': {
      'en': 'My Appointments',
      'es': 'Editar perfil',
      'fr': 'Modifier le profil',
    },
    'f2vaydr4': {
      'en': 'Appointments',
      'es': '',
      'fr': '',
    },
  },
  // DownloadOptions
  {
    'x3xzu88p': {
      'en': 'Export Options',
      'es': 'Opciones de exportación',
      'fr': 'Options d\'exportation',
    },
    'alnxjk11': {
      'en': 'Send the report to your registered email?',
      'es': '¿Enviar el informe a su correo electrónico registrado?',
      'fr': 'Envoyer le rapport à votre email enregistré ?',
    },
    'oawdgsj5': {
      'en': 'Send',
      'es': 'Enviar',
      'fr': 'Envoyer',
    },
    'agatfebd': {
      'en': 'Send the report to your practitioner\'s email?',
      'es': '¿Enviar el informe al correo electrónico de su médico?',
      'fr': 'Envoyer le rapport à l\'email de votre praticien ?',
    },
    'kv40x0fa': {
      'en': 'Send',
      'es': 'Enviar',
      'fr': 'Envoyer',
    },
    'zga50fbb': {
      'en': 'Download your records',
      'es': 'Descargue sus registros',
      'fr': 'Téléchargez vos enregistrements',
    },
    '3ak2yga4': {
      'en': 'Download',
      'es': 'Descargar',
      'fr': 'Télécharger',
    },
    '8acmzo76': {
      'en': 'Download',
      'es': 'Descargar',
      'fr': 'Télécharger',
    },
    'a7t52d6d': {
      'en': 'Send the report to client\'s email?',
      'es': '¿Enviar el informe al correo electrónico del cliente?',
      'fr': 'Envoyer le rapport à l\'e-mail du client ?',
    },
    'a9iq1fkr': {
      'en': 'Send',
      'es': 'Enviar',
      'fr': 'Envoyer',
    },
    'mutd8sdn': {
      'en': 'Send the report to your registered email?',
      'es': '¿Enviar el informe a su correo electrónico registrado?',
      'fr': 'Envoyer le rapport à votre email enregistré ?',
    },
    'i1dcsyje': {
      'en': 'Send',
      'es': 'Enviar',
      'fr': 'Envoyer',
    },
    'v1pwk80f': {
      'en': 'Download your records',
      'es': 'Descargue sus registros',
      'fr': 'Téléchargez vos enregistrements',
    },
    '2z2ayzzk': {
      'en': 'Download',
      'es': 'Descargar',
      'fr': 'Télécharger',
    },
    '2clgae7i': {
      'en': 'Download',
      'es': 'Descargar',
      'fr': 'Télécharger',
    },
    'u7fvyfam': {
      'en': 'Report sent successfully...',
      'es': 'Informe enviado exitosamente...',
      'fr': 'Rapport envoyé avec succès...',
    },
    'smrnm4mt': {
      'en': 'There was an error. Try again...',
      'es': 'Se ha producido un error. Inténtalo de nuevo...',
      'fr': 'Une erreur s\'est produite. Réessayez...',
    },
  },
  // SearchCilentDetails
  {
    'od3ivm1a': {
      'en': 'Search Client Details',
      'es': 'Buscar detalles del cliente',
      'fr': 'Rechercher les détails du client',
    },
    't3t9ijnp': {
      'en': 'Email',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
    },
    '0b3dg5jn': {
      'en': 'Email Address',
      'es': 'Dirección de correo electrónico',
      'fr': 'Adresse email',
    },
    'y7uae2fp': {
      'en': 'Search',
      'es': 'Buscar',
      'fr': 'Recherche',
    },
    '81aa3rjq': {
      'en': 'Email Address is required',
      'es': 'La dirección de correo electrónico es obligatoria',
      'fr': 'L\'adresse e-mail est obligatoire',
    },
    'aimzzfq3': {
      'en': 'Enter a valid email address...',
      'es': 'Introduzca una dirección de correo electrónico válida...',
      'fr': 'Entrez une adresse email valide...',
    },
    'm2ga8mlc': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'u399w9bb': {
      'en': 'Retrieving client details...',
      'es': 'Detalles del cliente recuperados exitosamente...',
      'fr': 'Détails du client récupérés avec succès...',
    },
    'd83j79k4': {
      'en': 'Phone',
      'es': 'Teléfono',
      'fr': 'Téléphone',
    },
    '642agvca': {
      'en': 'Phone Number',
      'es': 'Número de teléfono',
      'fr': 'Numéro de téléphone',
    },
    '5z4uj764': {
      'en': 'Search',
      'es': 'Buscar',
      'fr': 'Recherche',
    },
    '72k4i9uj': {
      'en': 'Field is required...',
      'es': 'El campo es obligatorio...',
      'fr': 'Le champ est obligatoire...',
    },
    'wfi2c7ap': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'fjajso8q': {
      'en': 'Retrieving client details...',
      'es': 'Detalles del cliente recuperados exitosamente...',
      'fr': 'Détails du client récupérés avec succès...',
    },
  },
  // DownloadOptionsCopy
  {
    'jwlog8nc': {
      'en': 'Export Options',
      'es': 'Opciones de exportación',
      'fr': 'Options d\'exportation',
    },
    '4ziyz4qe': {
      'en': 'Send the report to your registered email?',
      'es': '¿Enviar el informe a su correo electrónico registrado?',
      'fr': 'Envoyer le rapport à votre email enregistré ?',
    },
    'x0av14qg': {
      'en': 'Send the report to your practitioner\'s email?',
      'es': '¿Enviar el informe al correo electrónico de su médico?',
      'fr': 'Envoyer le rapport à l\'email de votre praticien ?',
    },
    '6pbddnkz': {
      'en': 'Email Address',
      'es': 'Dirección de correo electrónico',
      'fr': 'Adresse email',
    },
    '36cyedcd': {
      'en': 'Send',
      'es': 'Enviar',
      'fr': 'Envoyer',
    },
    'ved8zl9j': {
      'en': 'Client search method',
      'es': 'Método de búsqueda de clientes',
      'fr': 'Méthode de recherche de clients',
    },
    'ogx9a85g': {
      'en': 'Email',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
    },
    '60kqn8wa': {
      'en': 'Phone',
      'es': 'Teléfono',
      'fr': 'Téléphone',
    },
    'sfby4me6': {
      'en': 'Send the report to client\'s email?',
      'es': '¿Enviar el informe al correo electrónico del cliente?',
      'fr': 'Envoyer le rapport à l\'e-mail du client ?',
    },
    'bgm98ndy': {
      'en': 'Send the report to your registered email?',
      'es': '¿Enviar el informe a su correo electrónico registrado?',
      'fr': 'Envoyer le rapport à votre email enregistré ?',
    },
  },
  // DownloadOptionsRealCopy
  {
    'x8u7wb5h': {
      'en': 'Export Options',
      'es': 'Opciones de exportación',
      'fr': 'Options d\'exportation',
    },
    'xoptlvzk': {
      'en': 'Send the report to your registered email?',
      'es': '¿Enviar el informe a su correo electrónico registrado?',
      'fr': 'Envoyer le rapport à votre email enregistré ?',
    },
    'rye3f7pg': {
      'en': 'Send',
      'es': 'Enviar',
      'fr': 'Envoyer',
    },
    'wkyracjv': {
      'en': 'Send the report to your practitioner\'s email?',
      'es': '¿Enviar el informe al correo electrónico de su médico?',
      'fr': 'Envoyer le rapport à l\'email de votre praticien ?',
    },
    'ha1kftd1': {
      'en': 'Email Address',
      'es': 'Dirección de correo electrónico',
      'fr': 'Adresse email',
    },
    '4i2tw410': {
      'en': 'Send',
      'es': 'Enviar',
      'fr': 'Envoyer',
    },
    'u9c3o22i': {
      'en': 'Download your records',
      'es': 'Descargue sus registros',
      'fr': 'Téléchargez vos enregistrements',
    },
    'wrzbgesl': {
      'en': 'Download',
      'es': 'Descargar',
      'fr': 'Télécharger',
    },
    '5z0kwuvc': {
      'en': 'Send the report to client\'s email?',
      'es': '¿Enviar el informe al correo electrónico del cliente?',
      'fr': 'Envoyer le rapport à l\'e-mail du client ?',
    },
    'fv8oh38d': {
      'en': 'Send',
      'es': 'Enviar',
      'fr': 'Envoyer',
    },
    '8swmqt4o': {
      'en': 'Send the report to your registered email?',
      'es': '¿Enviar el informe a su correo electrónico registrado?',
      'fr': 'Envoyer le rapport à votre email enregistré ?',
    },
    'qkrm9n92': {
      'en': 'Send',
      'es': 'Enviar',
      'fr': 'Envoyer',
    },
    'uqjlsqer': {
      'en': 'Download your records',
      'es': 'Descargue sus registros',
      'fr': 'Téléchargez vos enregistrements',
    },
    'ksmqz2nk': {
      'en': 'Download',
      'es': 'Descargar',
      'fr': 'Télécharger',
    },
  },
  // PrivacyPolicy
  {
    'k53t6peo': {
      'en': 'Privacy Policy',
      'es': 'política de privacidad',
      'fr': 'politique de confidentialité',
    },
    'g5fzwrzl': {
      'en': 'Last Updated: February 06, 2025',
      'es': 'Última actualización: 6 de febrero de 2025',
      'fr': 'Dernière mise à jour : 6 février 2025',
    },
    '5wefdc7v': {
      'en':
          'This Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You.\n\nWe use Your Personal data to provide and improve the Service. By using the Service, You agree to the collection and use of information in accordance with this Privacy Policy.',
      'es':
          'Esta Política de privacidad describe nuestras políticas y procedimientos sobre la recopilación, el uso y la divulgación de su información cuando utiliza el Servicio y le informa sobre sus derechos de privacidad y cómo la ley lo protege. \n\nUsamos sus datos personales para proporcionar y mejorar el Servicio. Al utilizar el Servicio, acepta la recopilación y el uso de información de acuerdo con esta Política de privacidad.',
      'fr':
          'Cette politique de confidentialité décrit nos politiques et procédures relatives à la collecte, à l\'utilisation et à la divulgation de vos informations lorsque vous utilisez le service et vous informe de vos droits en matière de confidentialité et de la manière dont la loi vous protège. \n\nNous utilisons vos données personnelles pour fournir et améliorer le service. En utilisant le service, vous acceptez la collecte et l\'utilisation des informations conformément à la présente politique de confidentialité.',
    },
    'ajafymew': {
      'en': 'Interpretation and Definitions',
      'es': 'Interpretación y definiciones',
      'fr': 'Interprétation et définitions',
    },
    '3pkizzgn': {
      'en': 'Interpretation',
      'es': 'Interpretación',
      'fr': 'Interprétation',
    },
    'yytj06pa': {
      'en':
          'The words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.',
      'es':
          'Las palabras cuya letra inicial está en mayúscula tienen significados definidos en las siguientes condiciones. Las siguientes definiciones tendrán el mismo significado independientemente de que aparezcan en singular o en plural.',
      'fr':
          'Les mots dont la lettre initiale est une majuscule ont des significations définies dans les conditions suivantes. Les définitions suivantes ont la même signification, qu\'elles apparaissent au singulier ou au pluriel.',
    },
    '4syz6wp8': {
      'en': 'Definitions',
      'es': 'Definiciones',
      'fr': 'Définitions',
    },
    '6wwx718k': {
      'en': 'For the purposes of this Privacy Policy:',
      'es': 'A los efectos de esta Política de Privacidad:',
      'fr': 'Aux fins de la présente politique de confidentialité :',
    },
    'qf907p2c': {
      'en': 'Account ',
      'es': 'Cuenta',
      'fr': 'Compte',
    },
    '110d04x0': {
      'en':
          'means a unique account created for You to access our Service or parts of our Service.',
      'es':
          'significa una cuenta única creada para que Usted acceda a nuestro Servicio o partes de nuestro Servicio.',
      'fr':
          'désigne un compte unique créé pour vous permettre d\'accéder à notre Service ou à certaines parties de notre Service.',
    },
    'c3eve51o': {
      'en': 'Affiliate ',
      'es': 'Filial',
      'fr': 'Filiale',
    },
    'pnw60mky': {
      'en':
          'means an entity that controls, is controlled by or is under common control with a party, where \"control\" means ownership of 50% or more of the shares, equity interest or other securities entitled to vote for election of directors or other managing authority.',
      'es':
          'significa una entidad que controla, es controlada por o está bajo control común con una parte, donde \"control\" significa propiedad del 50% o más de las acciones, intereses de capital u otros valores con derecho a voto para la elección de directores u otra autoridad administrativa.',
      'fr':
          'désigne une entité qui contrôle, est contrôlée par ou est sous contrôle commun avec une partie, où « contrôle » signifie la propriété de 50 % ou plus des actions, des participations ou d\'autres titres donnant droit de vote pour l\'élection des administrateurs ou d\'autres autorités de gestion.',
    },
    'jyjvjuz9': {
      'en': 'Application ',
      'es': 'Solicitud',
      'fr': 'Application',
    },
    'sk36zqkd': {
      'en':
          'refers to HealthChrono, the software program provided by the Company.',
      'es':
          'se refiere a HealthChrono, el programa de software proporcionado por la Compañía.',
      'fr': 'fait référence à HealthChrono, le logiciel fourni par la Société.',
    },
    'vn20l6yj': {
      'en': 'Company ',
      'es': 'Compañía',
      'fr': 'Entreprise',
    },
    'i12hgxhu': {
      'en':
          '(referred to as either \"the Company\", \"We\", \"Us\" or \"Our\" in this Agreement) refers to LVTLABS LLC, 13010 Morris Road #650.',
      'es':
          '(en este Acuerdo se hace referencia a ella como \"la Compañía\", \"Nosotros\", \"Nos\" o \"Nuestro\") se refiere a LVTLABS LLC, 13010 Morris Road #650.',
      'fr':
          '(appelée « la Société », « Nous », « Notre » ou « Nos » dans le présent Contrat) fait référence à LVTLABS LLC, 13010 Morris Road #650.',
    },
    'shznbhno': {
      'en': 'Country ',
      'es': 'País',
      'fr': 'Pays',
    },
    '3gq9zasc': {
      'en': 'refers to: Georgia, United States',
      'es': 'se refiere a: Georgia, Estados Unidos',
      'fr': 'fait référence à : Géorgie, États-Unis',
    },
    '6c8n6y0l': {
      'en': 'Device ',
      'es': 'Dispositivo',
      'fr': 'Appareil',
    },
    'i24xd42k': {
      'en':
          'means any device that can access the Service such as a computer, a cellphone or a digital tablet.',
      'es':
          'significa cualquier dispositivo que pueda acceder al Servicio, como una computadora, un teléfono celular o una tableta digital.',
      'fr':
          'désigne tout appareil pouvant accéder au Service tel qu\'un ordinateur, un téléphone portable ou une tablette numérique.',
    },
    'u86fk3iq': {
      'en': 'Personal Data ',
      'es': 'Datos personales',
      'fr': 'Données personnelles',
    },
    '2x9fvx3d': {
      'en':
          'is any information that relates to an identified or identifiable individual.',
      'es':
          'es cualquier información que se relacione con un individuo identificado o identificable.',
      'fr':
          'désigne toute information relative à une personne identifiée ou identifiable.',
    },
    '74fbxfl5': {
      'en': 'Service ',
      'es': 'Servicio',
      'fr': 'Service',
    },
    'ym9lnmd6': {
      'en': 'refers to the Application.',
      'es': 'se refiere a la Solicitud.',
      'fr': 'fait référence à l\'Application.',
    },
    'c66rc620': {
      'en': 'Service Provider ',
      'es': 'Proveedor de servicios',
      'fr': 'Fournisseur de services',
    },
    'm8vp48q1': {
      'en':
          'means any natural or legal person who processes the data on behalf of the Company. It refers to third-party companies or individuals employed by the Company to facilitate the Service, to provide the Service on behalf of the Company, to perform services related to the Service or to assist the Company in analyzing how the Service is used.',
      'es':
          'significa cualquier persona física o jurídica que procesa los datos en nombre de la Compañía. Se refiere a empresas o individuos de terceros empleados por la Compañía para facilitar el Servicio, para proporcionar el Servicio en nombre de la Compañía, para realizar servicios relacionados con el Servicio o para ayudar a la Compañía a analizar cómo se utiliza el Servicio.',
      'fr':
          'désigne toute personne physique ou morale qui traite les données pour le compte de la Société. Il s\'agit de sociétés tierces ou de personnes employées par la Société pour faciliter le Service, pour fournir le Service au nom de la Société, pour exécuter des services liés au Service ou pour aider la Société à analyser la manière dont le Service est utilisé.',
    },
    'ksx66kqi': {
      'en': 'Usage Data ',
      'es': 'Datos de uso',
      'fr': 'Données d\'utilisation',
    },
    'aln3e9my': {
      'en':
          'refers to data collected automatically, either generated by the use of the Service or from the Service infrastructure itself (for example, the duration of a page visit).',
      'es':
          'se refiere a los datos recopilados automáticamente, ya sea generados por el uso del Servicio o por la propia infraestructura del Servicio (por ejemplo, la duración de la visita a una página).',
      'fr':
          'désigne les données collectées automatiquement, générées soit par l\'utilisation du Service, soit par l\'infrastructure du Service elle-même (par exemple, la durée de visite d\'une page).',
    },
    'cepnyg31': {
      'en': 'You ',
      'es': 'Tú',
      'fr': 'Toi',
    },
    '85jbvc62': {
      'en':
          'means the individual accessing or using the Service, or the company, or other legal entity on behalf of which such individual is accessing or using the Service, as applicable.',
      'es':
          'significa el individuo que accede o utiliza el Servicio, o la empresa u otra entidad legal en nombre de la cual dicho individuo accede o utiliza el Servicio, según corresponda.',
      'fr':
          'désigne la personne qui accède au Service ou l\'utilise, ou la société ou toute autre entité juridique au nom de laquelle cette personne accède au Service ou l\'utilise, selon le cas.',
    },
    'ge2g2lv4': {
      'en': 'Collecting and Using Personal Data',
      'es': 'Recopilación y uso de datos personales',
      'fr': 'Collecte et utilisation des données personnelles',
    },
    '5p7jm973': {
      'en': 'Types of Data Collected',
      'es': 'Tipos de datos recopilados',
      'fr': 'Types de données collectées',
    },
    'mdeg708b': {
      'en': 'Personal Data',
      'es': 'Datos personales',
      'fr': 'Données personnelles',
    },
    'krjb88bw': {
      'en':
          'While using Our Service, We may ask You to provide Us with certain personally identifiable information that can be used to contact or identify You. Personally identifiable information may include, but is not limited to:',
      'es':
          'Al utilizar nuestro Servicio, podemos solicitarle que nos proporcione cierta información de identificación personal que se puede utilizar para contactarlo o identificarlo. La información de identificación personal puede incluir, entre otras cosas:',
      'fr':
          'Lors de l\'utilisation de notre service, nous pouvons vous demander de nous fournir certaines informations personnelles identifiables qui peuvent être utilisées pour vous contacter ou vous identifier. Les informations personnelles identifiables peuvent inclure, sans toutefois s\'y limiter :',
    },
    '68qk8vem': {
      'en':
          '•\tEmail address\n•\tFirst name and last name\n•\tPhone number\n•\tUsage Data',
      'es':
          '• Dirección de correo electrónico \n• Nombre y apellido \n• Número de teléfono \n• Datos de uso',
      'fr':
          '• Adresse e-mail \n• Prénom et nom \n• Numéro de téléphone \n• Données d\'utilisation',
    },
    'wjvjsb5x': {
      'en': 'Usage Data',
      'es': 'Datos de uso',
      'fr': 'Données d\'utilisation',
    },
    '3mv3fm9f': {
      'en':
          'Usage Data is collected automatically when using the Service.\n\nUsage Data may include information such as Your Device\'s Internet Protocol address (e.g. IP address), browser type, browser version, the pages of our Service that You visit, the time and date of Your visit, the time spent on those pages, unique device identifiers and other diagnostic data.\n\nWhen You access the Service by or through a mobile device, We may collect certain information automatically, including, but not limited to, the type of mobile device You use, Your mobile device unique ID, the IP address of Your mobile device, Your mobile operating system, the type of mobile Internet browser You use, unique device identifiers and other diagnostic data.\n\nWe may also collect information that Your browser sends whenever You visit our Service or when You access the Service by or through a mobile device.',
      'es':
          'Los datos de uso se recopilan automáticamente al utilizar el Servicio. \n\nLos datos de uso pueden incluir información como la dirección de protocolo de Internet de su dispositivo (por ejemplo, la dirección IP), el tipo de navegador, la versión del navegador, las páginas de nuestro Servicio que visita, la hora y la fecha de su visita, el tiempo que pasa en esas páginas, identificadores únicos del dispositivo y otros datos de diagnóstico. \n\nCuando accede al Servicio mediante un dispositivo móvil, podemos recopilar cierta información automáticamente, que incluye, entre otros, el tipo de dispositivo móvil que utiliza, el identificador único de su dispositivo móvil, la dirección IP de su dispositivo móvil, su sistema operativo móvil, el tipo de navegador de Internet móvil que utiliza, identificadores únicos del dispositivo y otros datos de diagnóstico. \n\nTambién podemos recopilar información que su navegador envía cada vez que visita nuestro Servicio o cuando accede al Servicio mediante un dispositivo móvil.',
      'fr':
          'Les données d\'utilisation sont collectées automatiquement lors de l\'utilisation du Service. \n\nLes données d\'utilisation peuvent inclure des informations telles que l\'adresse IP (par exemple, l\'adresse IP) de votre appareil, le type de navigateur, la version du navigateur, les pages de notre Service que vous visitez, l\'heure et la date de votre visite, le temps passé sur ces pages, les identifiants uniques de l\'appareil et d\'autres données de diagnostic.\n\nLorsque vous accédez au Service par ou via un appareil mobile, nous pouvons collecter automatiquement certaines informations, y compris, mais sans s\'y limiter, le type d\'appareil mobile que vous utilisez, l\'identifiant unique de votre appareil mobile, l\'adresse IP de votre appareil mobile, votre système d\'exploitation mobile, le type de navigateur Internet mobile que vous utilisez, les identifiants uniques de l\'appareil et d\'autres données de diagnostic. \n\nNous pouvons également collecter des informations que votre navigateur envoie chaque fois que vous visitez notre Service ou lorsque vous accédez au Service par ou via un appareil mobile.',
    },
    'pkf1decj': {
      'en': 'Use of Your Personal Data',
      'es': 'Uso de sus datos personales',
      'fr': 'Utilisation de vos données personnelles',
    },
    'r2vs1iry': {
      'en': 'The Company may use Personal Data for the following purposes:',
      'es':
          'La Compañía podrá utilizar los Datos Personales para los siguientes fines:',
      'fr':
          'La Société peut utiliser les Données Personnelles aux fins suivantes :',
    },
    '89lfe4y7': {
      'en': 'To provide and maintain our Service, ',
      'es': 'Para proporcionar y mantener nuestro Servicio,',
      'fr': 'Pour fournir et maintenir notre service,',
    },
    'te9mvui8': {
      'en': 'including to monitor the usage of our Service.',
      'es': 'incluyendo el seguimiento del uso de nuestro Servicio.',
      'fr': 'y compris pour surveiller l’utilisation de notre Service.',
    },
    'v141gurs': {
      'en': 'To manage Your Account: ',
      'es': 'Para administrar su cuenta:',
      'fr': 'Pour gérer votre compte :',
    },
    'ngpmehew': {
      'en':
          'to manage Your registration as a user of the Service. The Personal Data You provide can give You access to different functionalities of the Service that are available to You as a registered user.',
      'es':
          'Para gestionar su registro como usuario del Servicio. Los Datos Personales que proporcione podrán darle acceso a diferentes funcionalidades del Servicio que están disponibles para Usted como usuario registrado.',
      'fr':
          'pour gérer votre inscription en tant qu\'utilisateur du Service. Les Données Personnelles que vous fournissez peuvent vous donner accès à différentes fonctionnalités du Service qui vous sont accessibles en tant qu\'utilisateur enregistré.',
    },
    'dzkn1m6w': {
      'en': 'For the performance of a contract: ',
      'es': 'Para la ejecución de un contrato:',
      'fr': 'Pour l’exécution d’un contrat :',
    },
    '7tv88zds': {
      'en':
          'the development, compliance and undertaking of the purchase contract for the products, items or services You have purchased or of any other contract with Us through the Service.',
      'es':
          'el desarrollo, cumplimiento y ejecución del contrato de compra de los productos, artículos o servicios que Usted haya adquirido o de cualquier otro contrato con Nosotros a través del Servicio.',
      'fr':
          'l\'élaboration, le respect et l\'exécution du contrat d\'achat des produits, articles ou services que vous avez achetés ou de tout autre contrat avec nous via le Service.',
    },
    '3x8c7ih5': {
      'en': 'To contact You: ',
      'es': 'Para contactarte:',
      'fr': 'Pour vous contacter :',
    },
    '45x7zfpf': {
      'en':
          'To contact You by email, telephone calls, SMS, or other equivalent forms of electronic communication, such as a mobile application\'s push notifications regarding updates or informative communications related to the functionalities, products or contracted services, including the security updates, when necessary or reasonable for their implementation.',
      'es':
          'Para comunicarnos con Usted por correo electrónico, llamadas telefónicas, SMS u otras formas equivalentes de comunicación electrónica, como las notificaciones push de una aplicación móvil sobre actualizaciones o comunicaciones informativas relacionadas con las funcionalidades, productos o servicios contratados, incluidas las actualizaciones de seguridad, cuando sea necesario o razonable para su implementación.',
      'fr':
          'Pour vous contacter par courrier électronique, appels téléphoniques, SMS ou autres formes équivalentes de communication électronique, telles que les notifications push d\'une application mobile concernant les mises à jour ou les communications informatives liées aux fonctionnalités, produits ou services contractuels, y compris les mises à jour de sécurité, lorsque cela est nécessaire ou raisonnable pour leur mise en œuvre.',
    },
    'p64k5khe': {
      'en': 'To provide You ',
      'es': 'Para proporcionarle',
      'fr': 'Pour vous fournir',
    },
    'rpjmspht': {
      'en':
          'with news, special offers and general information about other goods, services and events which we offer that are similar to those that you have already purchased or enquired about unless You have opted not to receive such information.',
      'es':
          'con noticias, ofertas especiales e información general sobre otros bienes, servicios y eventos que ofrecemos y que sean similares a los que ya ha adquirido o consultado, a menos que haya optado por no recibir dicha información.',
      'fr':
          'avec des nouvelles, des offres spéciales et des informations générales sur d\'autres biens, services et événements que nous proposons et qui sont similaires à ceux que vous avez déjà achetés ou sur lesquels vous avez demandé des renseignements, sauf si vous avez choisi de ne pas recevoir ces informations.',
    },
    'u7740tx1': {
      'en': 'To manage Your requests: ',
      'es': 'Para gestionar sus solicitudes:',
      'fr': 'Pour gérer vos demandes :',
    },
    'uqk3s5hk': {
      'en': 'To attend and manage Your requests to Us.',
      'es': 'Para atender y gestionar sus solicitudes hacia Nosotros.',
      'fr': 'Pour répondre et gérer vos demandes auprès de nous.',
    },
    'iph2pz2x': {
      'en': 'For business transfers: ',
      'es': 'Para transferencias de empresas:',
      'fr': 'Pour les transferts d’entreprise :',
    },
    'v0m8g66v': {
      'en':
          'We may use Your information to evaluate or conduct a merger, divestiture, restructuring, reorganization, dissolution, or other sale or transfer of some or all of Our assets, whether as a going concern or as part of bankruptcy, liquidation, or similar proceeding, in which Personal Data held by Us about our Service users is among the assets transferred.',
      'es':
          'Podemos utilizar su información para evaluar o llevar a cabo una fusión, desinversión, reestructuración, reorganización, disolución u otra venta o transferencia de algunos o todos nuestros activos, ya sea como un negocio en marcha o como parte de una quiebra, liquidación o procedimiento similar, en el que los datos personales que tenemos sobre los usuarios de nuestro Servicio se encuentran entre los activos transferidos.',
      'fr':
          'Nous pouvons utiliser vos informations pour évaluer ou mener une fusion, une cession, une restructuration, une réorganisation, une dissolution ou toute autre vente ou transfert de tout ou partie de nos actifs, que ce soit dans le cadre d\'une entreprise en activité ou d\'une faillite, d\'une liquidation ou d\'une procédure similaire, dans laquelle les données personnelles que nous détenons sur les utilisateurs de nos services font partie des actifs transférés.',
    },
    'sl89ua1d': {
      'en': 'For other purposes: ',
      'es': 'Para otros fines:',
      'fr': 'À d’autres fins :',
    },
    'anb0an78': {
      'en':
          'We may use Your information for other purposes, such as data analysis, identifying usage trends, determining the effectiveness of our promotional campaigns and to evaluate and improve our Service, products, services, marketing and your experience.',
      'es':
          'Podemos utilizar su información para otros fines, como análisis de datos, identificación de tendencias de uso, determinación de la efectividad de nuestras campañas promocionales y para evaluar y mejorar nuestro Servicio, productos, servicios, marketing y su experiencia.',
      'fr':
          'Nous pouvons utiliser vos informations à d\'autres fins, telles que l\'analyse de données, l\'identification des tendances d\'utilisation, la détermination de l\'efficacité de nos campagnes promotionnelles et pour évaluer et améliorer notre service, nos produits, nos services, notre marketing et votre expérience.',
    },
    'r3ydwkld': {
      'en':
          'We may share Your personal information in the following situations:',
      'es':
          'Podemos compartir su información personal en las siguientes situaciones:',
      'fr':
          'Nous pouvons partager vos informations personnelles dans les situations suivantes :',
    },
    'pj56bzuq': {
      'en': '•\tWith Service Providers: ',
      'es': '• Con proveedores de servicios:',
      'fr': '• Avec les prestataires de services :',
    },
    's1514yey': {
      'en':
          'We may share Your personal information with Service Providers to monitor and analyze the use of our Service, to contact You.',
      'es':
          'Podemos compartir su información personal con proveedores de servicios para monitorear y analizar el uso de nuestro Servicio y para comunicarnos con usted.',
      'fr':
          'Nous pouvons partager vos informations personnelles avec des fournisseurs de services pour surveiller et analyser l\'utilisation de notre service, pour vous contacter.',
    },
    'jpf9j3f2': {
      'en': '•\tFor business transfers: ',
      'es': '• Para transmisiones de empresas:',
      'fr': '• Pour les transmissions d’entreprise :',
    },
    'e7lk0b4l': {
      'en':
          'We may share or transfer Your personal information in connection with, or during negotiations of, any merger, sale of Company assets, financing, or acquisition of all or a portion of Our business to another company.',
      'es':
          'Podemos compartir o transferir su información personal en relación con, o durante las negociaciones de, cualquier fusión, venta de activos de la empresa, financiación o adquisición de la totalidad o parte de nuestro negocio a otra empresa.',
      'fr':
          'Nous pouvons partager ou transférer vos informations personnelles dans le cadre ou au cours de négociations relatives à toute fusion, vente d\'actifs de la Société, financement ou acquisition de tout ou partie de notre entreprise à une autre société.',
    },
    '3245xy67': {
      'en': '•\tWith Affiliates: ',
      'es': '• Con Afiliados:',
      'fr': '• Avec les affiliés :',
    },
    '97motudd': {
      'en':
          'We may share Your information with Our affiliates, in which case we will require those affiliates to honor this Privacy Policy. Affiliates include Our parent company and any other subsidiaries, joint venture partners or other companies that We control or that are under common control with Us.',
      'es':
          'Podemos compartir su información con nuestras filiales, en cuyo caso les exigiremos que respeten esta Política de privacidad. Las filiales incluyen nuestra empresa matriz y cualquier otra subsidiaria, socios de empresas conjuntas u otras empresas que controlamos o que están bajo control común con nosotros.',
      'fr':
          'Nous pouvons partager vos informations avec nos sociétés affiliées, auquel cas nous exigerons de ces sociétés affiliées qu\'elles respectent la présente politique de confidentialité. Les sociétés affiliées comprennent notre société mère et toutes les autres filiales, partenaires de coentreprise ou autres sociétés que nous contrôlons ou qui sont sous contrôle commun avec nous.',
    },
    'brsmiixb': {
      'en': '•\tWith business partners: ',
      'es': '• Con socios comerciales:',
      'fr': '• Avec des partenaires commerciaux :',
    },
    'tk7xsrw6': {
      'en':
          'We may share Your information with Our business partners to offer You certain products, services or promotions.',
      'es':
          'Podemos compartir su información con nuestros socios comerciales para ofrecerle ciertos productos, servicios o promociones.',
      'fr':
          'Nous pouvons partager vos informations avec nos partenaires commerciaux pour vous proposer certains produits, services ou promotions.',
    },
    'tylh3xsk': {
      'en': '•\tWith other users: ',
      'es': '• Con otros usuarios:',
      'fr': '• Avec d’autres utilisateurs :',
    },
    '07nrfcjo': {
      'en':
          'When You share personal information or otherwise interact in the public areas with other users, such information may be viewed by all users and may be publicly distributed outside.',
      'es':
          'Cuando usted comparte información personal o interactúa de otra manera en áreas públicas con otros usuarios, dicha información podrá ser vista por todos los usuarios y podrá distribuirse públicamente en el exterior.',
      'fr':
          'Lorsque vous partagez des informations personnelles ou interagissez d\'une autre manière dans les espaces publics avec d\'autres utilisateurs, ces informations peuvent être consultées par tous les utilisateurs et peuvent être diffusées publiquement à l\'extérieur.',
    },
    'kxmnp0yi': {
      'en': '•\tWith Your consent: ',
      'es': '• Con su consentimiento:',
      'fr': '• Avec votre consentement :',
    },
    '13u7pn56': {
      'en':
          'We may disclose Your personal information for any other purpose with Your consent.',
      'es':
          'Podemos divulgar su información personal para cualquier otro propósito con su consentimiento.',
      'fr':
          'Nous pouvons divulguer vos informations personnelles à toute autre fin avec votre consentement.',
    },
    'gnytki64': {
      'en': 'Retention of Your Personal Data',
      'es': 'Conservación de sus datos personales',
      'fr': 'Conservation de vos données personnelles',
    },
    '6go48a9l': {
      'en':
          'The Company will retain Your Personal Data only for as long as is necessary for the purposes set out in this Privacy Policy. We will retain and use Your Personal Data to the extent necessary to comply with our legal obligations (for example, if we are required to retain your data to comply with applicable laws), resolve disputes, and enforce our legal agreements and policies.\n\nThe Company will also retain Usage Data for internal analysis purposes. Usage Data is generally retained for a shorter period of time, except when this data is used to strengthen the security or to improve the functionality of Our Service, or We are legally obligated to retain this data for longer time periods.',
      'es':
          'La Compañía conservará sus Datos Personales únicamente durante el tiempo que sea necesario para los fines establecidos en esta Política de Privacidad. Conservaremos y utilizaremos sus Datos Personales en la medida necesaria para cumplir con nuestras obligaciones legales (por ejemplo, si estamos obligados a conservar sus datos para cumplir con las leyes aplicables), resolver disputas y hacer cumplir nuestros acuerdos y políticas legales.\n\n\nLa Compañía también conservará los Datos de Uso para fines de análisis interno. Los Datos de Uso generalmente se conservan durante un período de tiempo más corto, excepto cuando estos datos se utilizan para fortalecer la seguridad o mejorar la funcionalidad de Nuestro Servicio, o estamos legalmente obligados a conservar estos datos durante períodos de tiempo más largos.',
      'fr':
          'La Société conservera vos données personnelles uniquement aussi longtemps que nécessaire aux fins énoncées dans la présente politique de confidentialité. Nous conserverons et utiliserons vos données personnelles dans la mesure nécessaire pour nous conformer à nos obligations légales (par exemple, si nous sommes tenus de conserver vos données pour nous conformer aux lois applicables), résoudre des litiges et appliquer nos accords et politiques juridiques.\n\n\nLa Société conservera également les données d\'utilisation à des fins d\'analyse interne. Les données d\'utilisation sont généralement conservées pendant une période plus courte, sauf lorsque ces données sont utilisées pour renforcer la sécurité ou pour améliorer la fonctionnalité de notre service, ou que nous sommes légalement obligés de conserver ces données pendant des périodes plus longues.',
    },
    '8a8w8ffi': {
      'en': 'Transfer of Your Personal Data',
      'es': 'Transferencia de sus datos personales',
      'fr': 'Transfert de vos données personnelles',
    },
    'nxv7jjp6': {
      'en':
          'Your information, including Personal Data, is processed at the Company\'s operating offices and in any other places where the parties involved in the processing are located. It means that this information may be transferred to — and maintained on — computers located outside of Your state, province, country or other governmental jurisdiction where the data protection laws may differ than those from Your jurisdiction.\n\nYour consent to this Privacy Policy followed by Your submission of such information represents Your agreement to that transfer.\n\nThe Company will take all steps reasonably necessary to ensure that Your data is treated securely and in accordance with this Privacy Policy and no transfer of Your Personal Data will take place to an organization or a country unless there are adequate controls in place including the security of Your data and other personal information.',
      'es':
          'Su información, incluidos los Datos personales, se procesa en las oficinas operativas de la Compañía y en cualquier otro lugar donde se encuentren las partes involucradas en el procesamiento. Esto significa que esta información puede transferirse a computadoras ubicadas fuera de su estado, provincia, país u otra jurisdicción gubernamental donde las leyes de protección de datos pueden diferir de las de su jurisdicción y mantenerse en ellas.\n\n\nSu consentimiento a esta Política de privacidad seguido de su envío de dicha información representa su aceptación de dicha transferencia.\n\n\nLa Compañía tomará todas las medidas razonablemente necesarias para garantizar que sus datos se traten de forma segura y de acuerdo con esta Política de privacidad y no se realizará ninguna transferencia de sus Datos personales a una organización o un país a menos que existan controles adecuados, incluida la seguridad de sus datos y otra información personal.',
      'fr':
          'Vos informations, y compris vos données personnelles, sont traitées dans les bureaux d\'exploitation de la Société et dans tout autre lieu où se trouvent les parties impliquées dans le traitement. Cela signifie que ces informations peuvent être transférées vers des ordinateurs situés en dehors de votre État, province, pays ou autre juridiction gouvernementale, et y être conservées, où les lois sur la protection des données peuvent différer de celles de votre juridiction.\n\n\nVotre consentement à la présente politique de confidentialité suivi de la soumission de ces informations représente votre accord à ce transfert.\n\n\nLa Société prendra toutes les mesures raisonnablement nécessaires pour garantir que vos données sont traitées de manière sécurisée et conformément à la présente politique de confidentialité et aucun transfert de vos données personnelles n\'aura lieu vers une organisation ou un pays à moins que des contrôles adéquats ne soient en place, y compris la sécurité de vos données et autres informations personnelles.',
    },
    '5sseoi0g': {
      'en': 'Delete Your Personal Data',
      'es': 'Eliminar sus datos personales',
      'fr': 'Supprimer vos données personnelles',
    },
    'zbns2qju': {
      'en':
          'You have the right to delete or request that We assist in deleting the Personal Data that We have collected about You.\n\nOur Service may give You the ability to delete certain information about You from within the Service.\n\nYou may update, amend, or delete Your information at any time by signing in to Your Account, if you have one, and visiting the account settings section that allows you to manage Your personal information. You may also contact Us to request access to, correct, or delete any personal information that You have provided to Us.\n\nPlease note, however, that We may need to retain certain information when we have a legal obligation or lawful basis to do so.',
      'es':
          'Tiene derecho a eliminar o solicitar que le ayudemos a eliminar los Datos personales que hemos recopilado sobre usted.\n\n\nNuestro Servicio puede brindarle la posibilidad de eliminar cierta información sobre usted desde el Servicio.\n\n\nPuede actualizar, modificar o eliminar su información en cualquier momento iniciando sesión en su Cuenta, si tiene una, y visitando la sección de configuración de la cuenta que le permite administrar su información personal. También puede comunicarse con nosotros para solicitar acceso, corregir o eliminar cualquier información personal que nos haya proporcionado.\n\n\nSin embargo, tenga en cuenta que es posible que necesitemos conservar cierta información cuando tengamos una obligación legal o una base legal para hacerlo.',
      'fr':
          'Vous avez le droit de supprimer ou de demander que nous vous aidions à supprimer les données personnelles que nous avons collectées à votre sujet.\n\n\nNotre service peut vous donner la possibilité de supprimer certaines informations vous concernant au sein du service.\n\n\nVous pouvez mettre à jour, modifier ou supprimer vos informations à tout moment en vous connectant à votre compte, si vous en avez un, et en visitant la section des paramètres du compte qui vous permet de gérer vos informations personnelles. Vous pouvez également nous contacter pour demander l\'accès à toute information personnelle que vous nous avez fournie, la rectifier ou la supprimer.\n\n\nVeuillez noter, cependant, que nous pouvons avoir besoin de conserver certaines informations lorsque nous avons une obligation légale ou une base légale pour le faire.',
    },
    'bcop4mn8': {
      'en': 'Disclosure of Your Personal Data',
      'es': 'Divulgación de sus datos personales',
      'fr': 'Divulgation de vos données personnelles',
    },
    '540tac1o': {
      'en': 'Business Transactions',
      'es': 'Transacciones comerciales',
      'fr': 'Transactions commerciales',
    },
    'powttbis': {
      'en':
          'If the Company is involved in a merger, acquisition or asset sale, Your Personal Data may be transferred. We will provide notice before Your Personal Data is transferred and becomes subject to a different Privacy Policy.',
      'es':
          'Si la Compañía participa en una fusión, adquisición o venta de activos, sus Datos Personales pueden ser transferidos. Le notificaremos antes de que sus Datos Personales sean transferidos y queden sujetos a una Política de Privacidad diferente.',
      'fr':
          'Si la Société est impliquée dans une fusion, une acquisition ou une vente d\'actifs, vos données personnelles peuvent être transférées. Nous vous informerons avant que vos données personnelles ne soient transférées et ne soient soumises à une politique de confidentialité différente.',
    },
    '1ofoa48s': {
      'en': 'Law enforcement',
      'es': 'Aplicación de la ley',
      'fr': 'Application de la loi',
    },
    'ui9lgwat': {
      'en':
          'Under certain circumstances, the Company may be required to disclose Your Personal Data if required to do so by law or in response to valid requests by public authorities (e.g. a court or a government agency).',
      'es':
          'En determinadas circunstancias, la Compañía puede estar obligada a divulgar sus Datos Personales si así lo exige la ley o en respuesta a solicitudes válidas de autoridades públicas (por ejemplo, un tribunal o una agencia gubernamental).',
      'fr':
          'Dans certaines circonstances, la Société peut être amenée à divulguer vos Données personnelles si la loi l\'exige ou en réponse à des demandes valables des autorités publiques (par exemple, un tribunal ou une agence gouvernementale).',
    },
    '2khsooh8': {
      'en': 'Other legal requirements',
      'es': 'Otros requisitos legales',
      'fr': 'Autres exigences légales',
    },
    'i7alxzew': {
      'en':
          'The Company may disclose Your Personal Data in the good faith belief that such action is necessary to:',
      'es':
          'La Compañía podrá divulgar sus Datos Personales creyendo de buena fe que dicha acción es necesaria para:',
      'fr':
          'La Société peut divulguer vos données personnelles si elle estime de bonne foi qu\'une telle action est nécessaire pour :',
    },
    'foihw3be': {
      'en':
          '•\tComply with a legal obligation\n•\tProtect and defend the rights or property of the Company\n•\tPrevent or investigate possible wrongdoing in connection with the Service\n•\tProtect the personal safety of Users of the Service or the public\n•\tProtect against legal liability',
      'es':
          '• Cumplir con una obligación legal\n\n• Proteger y defender los derechos o la propiedad de la Compañía\n\n• Prevenir o investigar posibles irregularidades en relación con el Servicio\n\n• Proteger la seguridad personal de los Usuarios del Servicio o del público\n\n• Protegerse contra la responsabilidad legal',
      'fr':
          '• Se conformer à une obligation légale\n\n• Protéger et défendre les droits ou la propriété de la Société\n\n• Prévenir ou enquêter sur d\'éventuels actes répréhensibles en rapport avec le Service\n\n• Protéger la sécurité personnelle des Utilisateurs du Service ou du public\n\n• Se protéger contre toute responsabilité légale',
    },
    '74c33pdm': {
      'en': 'Security of Your Personal Data',
      'es': 'Seguridad de sus datos personales',
      'fr': 'Sécurité de vos données personnelles',
    },
    'cpnrvy9v': {
      'en':
          'The security of Your Personal Data is important to Us, but remember that no method of transmission over the Internet, or method of electronic storage is 100% secure. While We strive to use commercially acceptable means to protect Your Personal Data, We cannot guarantee its absolute security.',
      'es':
          'La seguridad de sus datos personales es importante para nosotros, pero recuerde que ningún método de transmisión por Internet o método de almacenamiento electrónico es 100 % seguro. Si bien nos esforzamos por utilizar medios comercialmente aceptables para proteger sus datos personales, no podemos garantizar su seguridad absoluta.',
      'fr':
          'La sécurité de vos données personnelles est importante pour nous, mais n\'oubliez pas qu\'aucune méthode de transmission sur Internet ou de stockage électronique n\'est sûre à 100 %. Bien que nous nous efforcions d\'utiliser des moyens commercialement acceptables pour protéger vos données personnelles, nous ne pouvons pas garantir leur sécurité absolue.',
    },
    '028wzruz': {
      'en': 'Children\'s Privacy',
      'es': 'Privacidad de los niños',
      'fr': 'Confidentialité des enfants',
    },
    'fjjsgsh4': {
      'en':
          'Our Service does not address anyone under the age of 13. We do not knowingly collect personally identifiable information from anyone under the age of 13. If You are a parent or guardian and You are aware that Your child has provided Us with Personal Data, please contact Us. If We become aware that We have collected Personal Data from anyone under the age of 13 without verification of parental consent, We take steps to remove that information from Our servers.\n\nIf We need to rely on consent as a legal basis for processing Your information and Your country requires consent from a parent, We may require Your parent\'s consent before We collect and use that information.',
      'es':
          'Nuestro Servicio no está dirigido a ninguna persona menor de 13 años. No recopilamos deliberadamente información de identificación personal de ninguna persona menor de 13 años. Si usted es padre o tutor y sabe que su hijo nos ha proporcionado datos personales, comuníquese con nosotros. Si nos damos cuenta de que hemos recopilado datos personales de cualquier persona menor de 13 años sin verificar el consentimiento de los padres, tomamos medidas para eliminar esa información de nuestros servidores.\n\n\nSi necesitamos confiar en el consentimiento como base legal para procesar su información y su país requiere el consentimiento de un padre, es posible que solicitemos el consentimiento de sus padres antes de recopilar y usar esa información.',
      'fr':
          'Notre service ne s\'adresse pas aux personnes de moins de 13 ans. Nous ne collectons pas sciemment d\'informations personnelles identifiables auprès de personnes de moins de 13 ans. Si vous êtes un parent ou un tuteur et que vous savez que votre enfant nous a fourni des données personnelles, veuillez nous contacter. Si nous apprenons que nous avons collecté des données personnelles auprès d\'une personne de moins de 13 ans sans vérification du consentement parental, nous prenons des mesures pour supprimer ces informations de nos serveurs.\n\n\nSi nous devons nous appuyer sur le consentement comme base juridique pour le traitement de vos informations et que votre pays exige le consentement d\'un parent, nous pouvons exiger le consentement de votre parent avant de collecter et d\'utiliser ces informations.',
    },
    'uvvt4jby': {
      'en': 'Links to Other Websites',
      'es': 'Enlaces a otros sitios web',
      'fr': 'Liens vers d\'autres sites Web',
    },
    'u4fowflt': {
      'en':
          'Our Service may contain links to other websites that are not operated by Us. If You click on a third party link, You will be directed to that third party\'s site. We strongly advise You to review the Privacy Policy of every site You visit.\n\nWe have no control over and assume no responsibility for the content, privacy policies or practices of any third party sites or services.',
      'es':
          'Nuestro Servicio puede contener enlaces a otros sitios web que no son operados por Nosotros. Si hace clic en un enlace de un tercero, será dirigido al sitio de ese tercero. Le recomendamos encarecidamente que revise la Política de privacidad de cada sitio que visite.\n\n\nNo tenemos control ni asumimos ninguna responsabilidad por el contenido, las políticas de privacidad o las prácticas de sitios o servicios de terceros.',
      'fr':
          'Notre service peut contenir des liens vers d\'autres sites Web qui ne sont pas exploités par nous. Si vous cliquez sur un lien tiers, vous serez redirigé vers le site de ce tiers. Nous vous conseillons vivement de consulter la politique de confidentialité de chaque site que vous visitez.\n\n\nNous n\'avons aucun contrôle sur le contenu, les politiques de confidentialité ou les pratiques de tout site ou service tiers et n\'assumons aucune responsabilité à leur égard.',
    },
    '7cdv6uym': {
      'en': 'Changes to this Privacy Policy',
      'es': 'Cambios a esta Política de Privacidad',
      'fr': 'Modifications de la présente politique de confidentialité',
    },
    'uut78yrf': {
      'en':
          'We may update Our Privacy Policy from time to time. We will notify You of any changes by posting the new Privacy Policy on this page.\n\nWe will let You know via email and/or a prominent notice on Our Service, prior to the change becoming effective and update the \"Last updated\" date at the top of this Privacy Policy.\n\nYou are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.',
      'es':
          'Es posible que actualicemos nuestra Política de privacidad de vez en cuando. Le notificaremos sobre cualquier cambio mediante la publicación de la nueva Política de privacidad en esta página.\n\n\nLe informaremos por correo electrónico y/o mediante un aviso destacado en nuestro Servicio antes de que el cambio entre en vigencia y actualizaremos la fecha de \"Última actualización\" en la parte superior de esta Política de privacidad.\n\n\nSe le recomienda revisar esta Política de privacidad periódicamente para conocer los cambios. Los cambios a esta Política de privacidad entran en vigencia cuando se publican en esta página.',
      'fr':
          'Nous pouvons mettre à jour notre politique de confidentialité de temps à autre. Nous vous informerons de tout changement en publiant la nouvelle politique de confidentialité sur cette page.\n\n\nNous vous informerons par e-mail et/ou par un avis bien visible sur notre service, avant que le changement ne prenne effet et mettrons à jour la date de « dernière mise à jour » en haut de cette politique de confidentialité.\n\n\nIl vous est conseillé de consulter régulièrement cette politique de confidentialité pour prendre connaissance de tout changement. Les modifications apportées à cette politique de confidentialité entrent en vigueur dès leur publication sur cette page.',
    },
    'pk209njh': {
      'en': 'Contact Us',
      'es': 'Contáctenos',
      'fr': 'Contactez-nous',
    },
    'y1q9ynpo': {
      'en':
          'If you have any questions about this Privacy Policy, You can contact us:',
      'es':
          'Si tiene alguna pregunta sobre esta Política de privacidad, puede contactarnos:',
      'fr':
          'Si vous avez des questions sur cette politique de confidentialité, vous pouvez nous contacter :',
    },
    'jzisv4xm': {
      'en': '•\tBy email: contactus@lvtlabs.com',
      'es': '• Por correo electrónico: contactus@lvtlabs.com',
      'fr': '• Par email : contactus@lvtlabs.com',
    },
    'g13w7m7v': {
      'en': 'Contact Privacy Team',
      'es': 'Contactar al equipo de privacidad',
      'fr': 'Contactez l\'équipe de confidentialité',
    },
  },
  // PrivacyPolicyCopy
  {
    '1tvdj8hn': {
      'en': 'Privacy Policy',
      'es': 'política de privacidad',
      'fr': 'politique de confidentialité',
    },
    'u7266ehm': {
      'en': 'Last Updated: February 06, 2025',
      'es': 'Última actualización: 6 de febrero de 2025',
      'fr': 'Dernière mise à jour : 6 février 2025',
    },
    'stpikrqc': {
      'en': '1. Information We Collect',
      'es': '1. Información que recopilamos',
      'fr': '1. Informations que nous collectons',
    },
    'k8ncz3v5': {
      'en':
          'We collect information that you provide directly to us, including your name, email address, and any other information you choose to provide. We also automatically collect certain information about your device when you use our services.',
      'es':
          'Recopilamos información que usted nos proporciona directamente, incluido su nombre, dirección de correo electrónico y cualquier otra información que elija proporcionar. También recopilamos automáticamente cierta información sobre su dispositivo cuando utiliza nuestros servicios.',
      'fr':
          'Nous collectons les informations que vous nous fournissez directement, notamment votre nom, votre adresse e-mail et toute autre information que vous choisissez de fournir. Nous collectons également automatiquement certaines informations sur votre appareil lorsque vous utilisez nos services.',
    },
    'q0cm9ibu': {
      'en': '2. How We Use Your Information',
      'es': '2. Cómo utilizamos su información',
      'fr': '2. Comment nous utilisons vos informations',
    },
    '5ry05des': {
      'en':
          'We use the information we collect to provide, maintain, and improve our services, communicate with you, and comply with legal obligations. Your data helps us personalize your experience and enhance our service quality.',
      'es':
          'Utilizamos la información que recopilamos para proporcionar, mantener y mejorar nuestros servicios, comunicarnos con usted y cumplir con las obligaciones legales. Sus datos nos ayudan a personalizar su experiencia y mejorar la calidad de nuestro servicio.',
      'fr':
          'Nous utilisons les informations que nous collectons pour fournir, maintenir et améliorer nos services, communiquer avec vous et respecter nos obligations légales. Vos données nous aident à personnaliser votre expérience et à améliorer la qualité de nos services.',
    },
    'whoho7z8': {
      'en': '3. Information Sharing',
      'es': '3. Intercambio de información',
      'fr': '3. Partage d\'informations',
    },
    'fnoucv55': {
      'en':
          'We do not sell your personal information. We may share your information with third-party service providers who assist us in operating our platform, conducting our business, or serving our users.',
      'es':
          'No vendemos su información personal. Podemos compartir su información con proveedores de servicios externos que nos ayudan a operar nuestra plataforma, llevar adelante nuestro negocio o brindar servicios a nuestros usuarios.',
      'fr':
          'Nous ne vendons pas vos informations personnelles. Nous pouvons partager vos informations avec des fournisseurs de services tiers qui nous aident à exploiter notre plateforme, à mener nos activités ou à servir nos utilisateurs.',
    },
    '9w4huqcz': {
      'en': '4. Data Security',
      'es': '4. Seguridad de los datos',
      'fr': '4. Sécurité des données',
    },
    'nu2id6y4': {
      'en':
          'We implement appropriate technical and organizational measures to protect your personal information against unauthorized access, alteration, disclosure, or destruction.',
      'es':
          'Implementamos medidas técnicas y organizativas apropiadas para proteger su información personal contra acceso, alteración, divulgación o destrucción no autorizados.',
      'fr':
          'Nous mettons en œuvre des mesures techniques et organisationnelles appropriées pour protéger vos informations personnelles contre tout accès, altération, divulgation ou destruction non autorisés.',
    },
    '1zpraw59': {
      'en': 'Contact Privacy Team',
      'es': 'Contactar al equipo de privacidad',
      'fr': 'Contactez l\'équipe de confidentialité',
    },
  },
  // TermsandConditions
  {
    'ofgwzcqh': {
      'en': 'HealthChrono Terms and Conditions',
      'es': 'Términos y condiciones',
      'fr': 'Termes et conditions',
    },
    'z17t2v7u': {
      'en': 'Last Updated: February 28, 2025',
      'es': 'Última actualización: 13 de febrero de 2025',
      'fr': 'Dernière mise à jour : 13 février 2025',
    },
    'j7gycvak': {
      'en': 'Agreement to our Legal Terms',
      'es': 'Aceptación de nuestros términos legales',
      'fr': 'Acceptation de nos conditions juridiques',
    },
    '107mq60d': {
      'en': 'We are LVTLABS (\"',
      'es': 'Somos LVTLABS (\"',
      'fr': 'Nous sommes LVTLABS (\"',
    },
    'jioysayr': {
      'en': 'Company',
      'es': 'Compañía',
      'fr': 'Entreprise',
    },
    'ru9oild9': {
      'en': ',\" \"',
      'es': ',\" \"',
      'fr': ', \" \"',
    },
    '5fyvtlj2': {
      'en': 'we',
      'es': 'nosotros',
      'fr': 'nous',
    },
    'pxugyya3': {
      'en': ',\" \"',
      'es': ',\" \"',
      'fr': ', \" \"',
    },
    'yhb5wvdo': {
      'en': 'us',
      'es': 'a nosotros',
      'fr': 'nous',
    },
    'ns73cg8r': {
      'en': ',\" \"',
      'es': ',\" \"',
      'fr': ', \" \"',
    },
    'e9bzf97r': {
      'en': 'our',
      'es': 'nuestro',
      'fr': 'notre',
    },
    'l2habyhn': {
      'en':
          '\"), a company registered in Georgia, United States at 13010 Morris Rd suite 650, Alpharetta, GA 30004, USA, Alpharetta, GA 30004.',
      'es':
          '\"), una empresa registrada en Georgia, Estados Unidos en 13010 Morris Rd suite 650, Alpharetta, GA 30004, EE. UU., Alpharetta, GA 30004.',
      'fr':
          '\"), une société enregistrée en Géorgie, États-Unis au 13010 Morris Rd suite 650, Alpharetta, GA 30004, USA, Alpharetta, GA 30004.',
    },
    '4cik4xbg': {
      'en':
          'This Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You.\n\nWe use Your Personal data to provide and improve the Service. By using the Service, You agree to the collection and use of information in accordance with this Privacy Policy.',
      'es':
          'Esta Política de privacidad describe nuestras políticas y procedimientos sobre la recopilación, el uso y la divulgación de su información cuando utiliza el Servicio y le informa sobre sus derechos de privacidad y cómo la ley lo protege.\n\n\nUtilizamos sus datos personales para proporcionar y mejorar el Servicio. Al utilizar el Servicio, usted acepta la recopilación y el uso de información de acuerdo con esta Política de privacidad.',
      'fr':
          'Cette politique de confidentialité décrit nos politiques et procédures relatives à la collecte, à l\'utilisation et à la divulgation de vos informations lorsque vous utilisez le service et vous informe de vos droits en matière de confidentialité et de la manière dont la loi vous protège.\n\n\nNous utilisons vos données personnelles pour fournir et améliorer le service. En utilisant le service, vous acceptez la collecte et l\'utilisation des informations conformément à la présente politique de confidentialité.',
    },
    '9n16t5re': {
      'en': 'We operate the mobile application HealthChrono (the \"',
      'es': 'Operamos la aplicación móvil HealthChrono (la \"',
      'fr': 'Nous exploitons l\'application mobile HealthChrono (la «',
    },
    'om4gh3mj': {
      'en': 'App',
      'es': 'Aplicación',
      'fr': 'Application',
    },
    '68fz4cm6': {
      'en':
          '\"), as well as any other related products and services that refer or link to these legal terms (the \"',
      'es':
          '\"), así como cualesquiera otros productos y servicios relacionados que hagan referencia o enlacen a estos términos legales (el \"',
      'fr':
          '\"), ainsi que tout autre produit et service connexe faisant référence ou se liant à ces conditions juridiques (les \"',
    },
    'fsngc6i7': {
      'en': 'Legal Terms',
      'es': 'Términos legales',
      'fr': 'Mentions légales',
    },
    'xy057bfp': {
      'en': '\") (collectively, the \"',
      'es': '\") (colectivamente, el \"',
      'fr': '\") (collectivement, les \"',
    },
    'g5edljuz': {
      'en': 'Services',
      'es': 'Servicios',
      'fr': 'Services',
    },
    'p0fkhlz6': {
      'en': '\").',
      'es': '\").',
      'fr': '\").',
    },
    'snldkswg': {
      'en':
          'The words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.',
      'es':
          'Las palabras cuya letra inicial está en mayúscula tienen significados definidos en las siguientes condiciones. Las siguientes definiciones tendrán el mismo significado independientemente de que aparezcan en singular o en plural.',
      'fr':
          'Les mots dont la lettre initiale est une majuscule ont des significations définies dans les conditions suivantes. Les définitions suivantes ont la même signification, qu\'elles apparaissent au singulier ou au pluriel.',
    },
    '7q8z6fnh': {
      'en':
          'You can contact us by phone at (+1)404-287-2384, email at contactus@lvtlabs.com, or by mail to 13010 Morris Rd suite 650, Alpharetta, GA 30004, USA, Alpharetta, GA 30004, United States.',
      'es':
          'Puede comunicarse con nosotros por teléfono al (+1)404-287-2384, correo electrónico a contactus@lvtlabs.com o por correo postal a 13010 Morris Rd suite 650, Alpharetta, GA 30004, USA, Alpharetta, GA 30004, Estados Unidos.',
      'fr':
          'Vous pouvez nous contacter par téléphone au (+1)404-287-2384, par e-mail à contactus@lvtlabs.com ou par courrier à 13010 Morris Rd suite 650, Alpharetta, GA 30004, USA, Alpharetta, GA 30004, États-Unis.',
    },
    '35392r38': {
      'en':
          'These Legal Terms constitute a legally binding agreement made between you, whether personally or on behalf of an entity (\"',
      'es':
          'Estos Términos Legales constituyen un acuerdo legalmente vinculante celebrado entre usted, ya sea personalmente o en nombre de una entidad (\"',
      'fr':
          'Les présentes conditions juridiques constituent un accord juridiquement contraignant conclu entre vous, que ce soit personnellement ou au nom d\'une entité («',
    },
    'j178a7s5': {
      'en': 'you',
      'es': 'tú',
      'fr': 'toi',
    },
    'boj1x00m': {
      'en':
          '\"), and LVTLABS, concerning your access to and use of the Services. You agree that by accessing the Services, you have read, understood, and agreed to be bound by all of these Legal Terms. IF YOU DO NOT AGREE WITH ALL OF THESE LEGAL TERMS, THEN YOU ARE EXPRESSLY PROHIBITED FROM USING THE SERVICES AND YOU MUST DISCONTINUE USE IMMEDIATELY.',
      'es':
          '\") y LVTLABS, en relación con su acceso y uso de los Servicios. Usted acepta que al acceder a los Servicios, ha leído, comprendido y aceptado estar sujeto a todos estos Términos legales. SI NO ESTÁ DE ACUERDO CON TODOS ESTOS TÉRMINOS LEGALES, ENTONCES SE LE PROHÍBE EXPRESAMENTE UTILIZAR LOS SERVICIOS Y DEBE DEJAR DE USARLOS INMEDIATAMENTE.',
      'fr':
          '\"), et LVTLABS, concernant votre accès et votre utilisation des Services. Vous acceptez qu\'en accédant aux Services, vous avez lu, compris et accepté d\'être lié par toutes ces conditions juridiques. SI VOUS N\'ÊTES PAS D\'ACCORD AVEC TOUTES CES CONDITIONS JURIDIQUES, IL VOUS EST EXPRESSÉMENT INTERDIT D\'UTILISER LES SERVICES ET VOUS DEVEZ CESSER IMMÉDIATEMENT DE LES UTILISER.',
    },
    '8wj5ezho': {
      'en': 'For the purposes of this Privacy Policy:',
      'es': 'A los efectos de esta Política de Privacidad:',
      'fr': 'Aux fins de la présente politique de confidentialité :',
    },
    'o7tu4bq8': {
      'en':
          'We will provide you with prior notice of any scheduled changes to the Services you are using. The modified Legal Terms will become effective upon posting or notifying you by ',
      'es':
          'Le avisaremos con antelación de cualquier cambio programado en los Servicios que esté utilizando. Los Términos legales modificados entrarán en vigor al publicarlos o notificárselos por correo electrónico.',
      'fr':
          'Nous vous informerons au préalable de toute modification prévue des Services que vous utilisez. Les Conditions légales modifiées entreront en vigueur dès leur publication ou notification par',
    },
    '9wpnh259': {
      'en': 'contactus@lvtlabs.com',
      'es': 'Contáctenos@lvtlabs.com',
      'fr': 'contactus@lvtlabs.com',
    },
    'jegbpf5t': {
      'en':
          ', as stated in the email message. By continuing to use the Services after the effective date of any changes, you agree to be bound by the modified terms.\n\nThe Services are intended for users who are at least 18 years old. Persons under the age of 18 are not permitted to use or register for the Services.\n\nWe recommend that you print a copy of these Legal Terms for your records.',
      'es':
          ', tal como se indica en el mensaje de correo electrónico. Si continúa utilizando los Servicios después de la fecha de entrada en vigor de cualquier cambio, acepta estar sujeto a los términos modificados.\n\n\nLos Servicios están destinados a usuarios que tengan al menos 18 años. Las personas menores de 18 años no pueden utilizar ni registrarse en los Servicios.\n\n\n\nLe recomendamos que imprima una copia de estos Términos legales para sus registros.',
      'fr':
          ', comme indiqué dans le message électronique. En continuant à utiliser les Services après la date d\'entrée en vigueur de toute modification, vous acceptez d\'être lié par les conditions modifiées.\n\n\nLes Services sont destinés aux utilisateurs âgés d\'au moins 18 ans. Les personnes de moins de 18 ans ne sont pas autorisées à utiliser ou à s\'inscrire aux Services.\n\n\n\nNous vous recommandons d\'imprimer une copie des présentes Conditions légales pour vos archives.',
    },
    '6grf9uuj': {
      'en': 'For the purposes of this Privacy Policy:',
      'es': 'A los efectos de esta Política de Privacidad:',
      'fr': 'Aux fins de la présente politique de confidentialité :',
    },
    'if4z6hfy': {
      'en': '1. OUR SERVICES',
      'es': '1. NUESTROS SERVICIOS',
      'fr': '1. NOS SERVICES',
    },
    '4r5n4rdt': {
      'en':
          'The information provided when using the Services is not intended for distribution to or use by any person or entity in any jurisdiction or country where such distribution or use would be contrary to law or regulation or which would subject us to any registration requirement within such jurisdiction or country. Accordingly, those persons who choose to access the Services from other locations do so on their own initiative and are solely responsible for compliance with local laws, if and to the extent local laws are applicable.\n\nThe Services are not tailored to comply with industry-specific regulations (Health Insurance Portability and Accountability Act (HIPAA), Federal Information Security Management Act (FISMA), etc.), so if your interactions would be subjected to such laws, you may not use the Services. You may not use the Services in a way that would violate the Gramm-Leach-Bliley Act (GLBA).',
      'es':
          'La información proporcionada al utilizar los Servicios no está destinada a ser distribuida ni utilizada por ninguna persona o entidad en ninguna jurisdicción o país donde dicha distribución o uso sea contrario a la ley o regulación o que nos someta a algún requisito de registro dentro de dicha jurisdicción o país. En consecuencia, aquellas personas que elijan acceder a los Servicios desde otras ubicaciones lo harán por iniciativa propia y serán las únicas responsables del cumplimiento de las leyes locales, si y en la medida en que las leyes locales sean aplicables.\n\n\nLos Servicios no están diseñados para cumplir con las regulaciones específicas de la industria (Ley de Portabilidad y Responsabilidad de Seguros Médicos [HIPAA], Ley Federal de Gestión de Seguridad de la Información [FISMA], etc.), por lo que si sus interacciones estuvieran sujetas a dichas leyes, no podrá utilizar los Servicios. No podrá utilizar los Servicios de una manera que viole la Ley Gramm-Leach-Bliley (GLBA).',
      'fr':
          'Les informations fournies lors de l\'utilisation des Services ne sont pas destinées à être distribuées ou utilisées par une personne ou une entité dans une juridiction ou un pays où une telle distribution ou utilisation serait contraire à la loi ou à la réglementation ou qui nous soumettrait à une obligation d\'enregistrement dans cette juridiction ou ce pays. En conséquence, les personnes qui choisissent d\'accéder aux Services à partir d\'autres emplacements le font de leur propre initiative et sont seules responsables du respect des lois locales, si et dans la mesure où les lois locales sont applicables.\n\n\nLes Services ne sont pas conçus pour se conformer aux réglementations spécifiques à l\'industrie (Health Insurance Portability and Accountability Act (HIPAA), Federal Information Security Management Act (FISMA), etc.), donc si vos interactions sont soumises à de telles lois, vous ne pouvez pas utiliser les Services. Vous ne pouvez pas utiliser les Services d\'une manière qui violerait la loi Gramm-Leach-Bliley (GLBA).',
    },
    'ws4xxcse': {
      'en': '2. INTELLECTUAL PROPERTY RIGHTS',
      'es': '2. DERECHOS DE PROPIEDAD INTELECTUAL',
      'fr': '2. DROITS DE PROPRIÉTÉ INTELLECTUELLE',
    },
    'jde9f9d1': {
      'en': 'Our Intellectual property',
      'es': 'Nuestra propiedad intelectual',
      'fr': 'Notre propriété intellectuelle',
    },
    'at2jkhqf': {
      'en':
          'We are the owner or the licensee of all intellectual property rights in our Services, including all source code, databases, functionality, software, website designs, audio, video, text, photographs, and graphics in the Services (collectively, the \"Content\"), as well as the trademarks, service marks, and logos contained therein (the \"Marks\").\n\nOur Content and Marks are protected by copyright and trademark laws (and various other intellectual property rights and unfair competition laws) and treaties in the United States and around the world.\n\nThe Content and Marks are provided in or through the Services \"AS IS\" for your personal, non-commercial use or internal business purpose only.',
      'es':
          'Somos el propietario o licenciatario de todos los derechos de propiedad intelectual de nuestros Servicios, incluidos todos los códigos fuente, bases de datos, funcionalidad, software, diseños de sitios web, audio, video, texto, fotografías y gráficos en los Servicios (colectivamente, el \"Contenido\"), así como las marcas comerciales, marcas de servicio y logotipos contenidos en ellos (las \"Marcas\").\n\n\n\nNuestro Contenido y Marcas están protegidos por leyes de derechos de autor y marcas comerciales (y varios otros derechos de propiedad intelectual y leyes de competencia desleal) y tratados en los Estados Unidos y en todo el mundo.\n\n\n\nEl Contenido y las Marcas se proporcionan en o a través de los Servicios \"TAL CUAL\" para su uso personal, no comercial o solo para fines comerciales internos.',
      'fr':
          'Nous sommes le propriétaire ou le titulaire de licence de tous les droits de propriété intellectuelle sur nos Services, y compris l\'ensemble du code source, des bases de données, des fonctionnalités, des logiciels, des conceptions de sites Web, de l\'audio, de la vidéo, du texte, des photographies et des graphiques dans les Services (collectivement, le « Contenu »), ainsi que les marques commerciales, les marques de service et les logos qui y sont contenus (les « Marques »).\n\n\n\nNotre Contenu et nos Marques sont protégés par les lois sur le droit d\'auteur et les marques commerciales (et diverses autres lois sur les droits de propriété intellectuelle et la concurrence déloyale) et les traités aux États-Unis et dans le monde entier.\n\n\n\nLe Contenu et les Marques sont fournis dans ou via les Services « EN L\'ÉTAT » pour votre usage personnel, non commercial ou à des fins commerciales internes uniquement.',
    },
    '67lmegtz': {
      'en': 'Your use of our Services',
      'es': 'Su uso de nuestros Servicios',
      'fr': 'Votre utilisation de nos services',
    },
    'u6digee1': {
      'en':
          'Subject to your compliance with these Legal Terms, including the \"',
      'es':
          'Sujeto a su cumplimiento de estos Términos Legales, incluidos los \"',
      'fr':
          'Sous réserve de votre respect des présentes conditions légales, y compris les «',
    },
    'e8isqrtw': {
      'en': 'PROHIBITED ACTIVITIES',
      'es': 'ACTIVIDADES PROHIBIDAS',
      'fr': 'ACTIVITÉS INTERDITES',
    },
    'm6kuz5hz': {
      'en':
          '\" section below, we grant you a non-exclusive, non-transferable, revocable license to:',
      'es':
          '\"sección a continuación, le otorgamos una licencia no exclusiva, intransferible y revocable para:',
      'fr':
          '\" ci-dessous, nous vous accordons une licence non exclusive, non transférable et révocable pour :',
    },
    '0b02r5zn': {
      'en':
          '•\taccess the Services; and download or print a copy of any portion of the Content to which you have properly gained access, solely for your personal, non-commercial use or internal business purpose.',
      'es':
          '• descargar o imprimir una copia de cualquier parte del Contenido al que haya obtenido acceso de forma adecuada, únicamente para su uso personal, no comercial o para fines comerciales internos.',
      'fr':
          '• télécharger ou imprimer une copie de toute partie du Contenu à laquelle vous avez dûment accès, uniquement pour votre usage personnel et non commercial ou à des fins commerciales internes.',
    },
    'uqtnbpcm': {
      'en':
          'Except as set out in this section or elsewhere in our Legal Terms, no part of the Services and no Content or Marks may be copied, reproduced, aggregated, republished, uploaded, posted, publicly displayed, encoded, translated, transmitted, distributed, sold, licensed, or otherwise exploited for any commercial purpose whatsoever, without our express prior written permission.\n\nIf you wish to make any use of the Services, Content, or Marks other than as set out in this section or elsewhere in our Legal Terms, please address your request to: contactus@lvtlabs.com. If we ever grant you the permission to post, reproduce, or publicly display any part of our Services or Content, you must identify us as the owners or licensors of the Services, Content, or Marks and ensure that any copyright or proprietary notice appears or is visible on posting, reproducing, or displaying our Content.\n\nWe reserve all rights not expressly granted to you in and to the Services, Content, and Marks.\n\nAny breach of these Intellectual Property Rights will constitute a material breach of our Legal Terms and your right to use our Services will terminate immediately.',
      'es':
          'Salvo lo establecido en esta sección o en otras partes de nuestros Términos legales, ninguna parte de los Servicios ni ningún Contenido o Marcas se puede copiar, reproducir, agregar, republicar, cargar, publicar, mostrar públicamente, codificar, traducir, transmitir, distribuir, vender, licenciar o explotar de otro modo para ningún propósito comercial, sin nuestro expreso permiso previo por escrito.\n\n\nSi desea hacer cualquier uso de los Servicios, el Contenido o las Marcas que no sea el establecido en esta sección o en otras partes de nuestros Términos legales, envíe su solicitud a: contactus@lvtlabs.com. Si alguna vez le otorgamos el permiso para publicar, reproducir o mostrar públicamente cualquier parte de nuestros Servicios o Contenido, debe identificarnos como los propietarios o licenciantes de los Servicios, el Contenido o las Marcas y asegurarse de que cualquier aviso de derechos de autor o de propiedad aparezca o sea visible al publicar, reproducir o mostrar nuestro Contenido.\n\n\nNos reservamos todos los derechos que no se le otorgan expresamente en relación con los Servicios, el Contenido y las Marcas.\n\n\nCualquier incumplimiento de estos Derechos de propiedad intelectual constituirá un incumplimiento sustancial de nuestros Términos legales y su derecho a utilizar nuestros Servicios finalizará de inmediato.',
      'fr':
          'Sauf indication contraire dans cette section ou ailleurs dans nos Conditions légales, aucune partie des Services et aucun Contenu ou Marque ne peuvent être copiés, reproduits, agrégés, réédités, téléchargés, publiés, affichés publiquement, codés, traduits, transmis, distribués, vendus, concédés sous licence ou exploités de quelque autre manière à des fins commerciales que ce soit, sans notre autorisation écrite préalable expresse.\n\n\nSi vous souhaitez faire un usage des Services, du Contenu ou des Marques autre que celui indiqué dans cette section ou ailleurs dans nos Conditions légales, veuillez adresser votre demande à : contactus@lvtlabs.com. Si nous vous accordons un jour la permission de publier, de reproduire ou d\'afficher publiquement une partie de nos Services ou Contenu, vous devez nous identifier comme propriétaires ou concédants de licence des Services, du Contenu ou des Marques et vous assurer que tout avis de droit d\'auteur ou de propriété apparaît ou est visible lors de la publication, de la reproduction ou de l\'affichage de notre Contenu.\n\n\nNous nous réservons tous les droits qui ne vous sont pas expressément accordés sur les Services, le Contenu et les Marques.\n\n\nToute violation de ces droits de propriété intellectuelle constituera une violation substantielle de nos Conditions légales et votre droit d\'utiliser nos Services prendra fin immédiatement.',
    },
    's0ggiey7': {
      'en': 'Your submissions',
      'es': 'Sus envíos',
      'fr': 'Vos soumissions',
    },
    'e24smo7j': {
      'en': 'Please review this section and the \"',
      'es': 'Por favor revise esta sección y la \"',
      'fr': 'Veuillez consulter cette section et la «',
    },
    '3ez706za': {
      'en': 'PROHIBITED ACTIVITIES',
      'es': 'ACTIVIDADES PROHIBIDAS',
      'fr': 'ACTIVITÉS INTERDITES',
    },
    '6jm7p84s': {
      'en':
          '\" section carefully prior to using our Services to understand the (a) rights you give us and (b) obligations you have when you post or upload any content through the Services.',
      'es':
          '\" Lea atentamente esta sección antes de utilizar nuestros Servicios para comprender (a) los derechos que nos otorga y (b) las obligaciones que tiene cuando publica o carga cualquier contenido a través de los Servicios.',
      'fr':
          '\" Veuillez lire attentivement la section avant d\'utiliser nos Services afin de comprendre (a) les droits que vous nous accordez et (b) les obligations que vous avez lorsque vous publiez ou téléchargez du contenu via les Services.',
    },
    '84d1dwvk': {
      'en': 'Submissions: ',
      'es': 'Envíos:',
      'fr': 'Soumissions :',
    },
    'dbfxfuoy': {
      'en':
          'By directly sending us any question, comment, suggestion, idea, feedback, or other information about the Services (\"Submissions\"), you agree to assign to us all intellectual property rights in such Submission. You agree that we shall own this Submission and be entitled to its unrestricted use and dissemination for any lawful purpose, commercial or otherwise, without acknowledgment or compensation to you.',
      'es':
          'Al enviarnos directamente cualquier pregunta, comentario, sugerencia, idea, opinión u otra información sobre los Servicios (\"Contribuciones\"), usted acepta cedernos todos los derechos de propiedad intelectual sobre dichas Contribuciones. Usted acepta que seremos los propietarios de estas Contribuciones y tendremos derecho a su uso y difusión sin restricciones para cualquier propósito legal, comercial o de otro tipo, sin reconocimiento ni compensación para usted.',
      'fr':
          'En nous envoyant directement une question, un commentaire, une suggestion, une idée, un retour d\'information ou toute autre information sur les Services (« Soumissions »), vous acceptez de nous céder tous les droits de propriété intellectuelle sur cette Soumission. Vous acceptez que nous soyons propriétaires de cette Soumission et que nous ayons le droit de l\'utiliser et de la diffuser sans restriction à toute fin légale, commerciale ou autre, sans reconnaissance ni compensation à votre égard.',
    },
    '6nckyac1': {
      'en': 'You are responsible for what you post or upload: ',
      'es': 'Usted es responsable de lo que publica o carga:',
      'fr': 'Vous êtes responsable de ce que vous publiez ou téléchargez :',
    },
    'i6u9zoig': {
      'en': 'By sending us Submissions through any part of the Services you:',
      'es':
          'Al enviarnos Envíos a través de cualquier parte de los Servicios, usted:',
      'fr':
          'En nous envoyant des soumissions via n\'importe quelle partie des Services, vous :',
    },
    '84ihboel': {
      'en': '• Confirm that you have read and agree with our \"',
      'es': '• Confirme que ha leído y está de acuerdo con nuestra \"',
      'fr':
          '• Confirmez que vous avez lu et accepté nos « conditions générales »',
    },
    'suiyuzim': {
      'en': 'PROHIBITED ACTIVITIES',
      'es': 'ACTIVIDADES PROHIBIDAS',
      'fr': 'ACTIVITÉS INTERDITES',
    },
    'iwlaeust': {
      'en':
          '\" and will not post, send, publish, upload, or transmit through the Services any Submission that is illegal, harassing, hateful, harmful, defamatory, obscene, bullying, abusive, discriminatory, threatening to any person or group, sexually explicit, false, inaccurate, deceitful, or misleading;',
      'es':
          '\" y no publicará, enviará, publicará, cargará ni transmitirá a través de los Servicios ningún Envío que sea ilegal, acosador, odioso, dañino, difamatorio, obsceno, acosador, abusivo, discriminatorio, amenazante para cualquier persona o grupo, sexualmente explícito, falso, inexacto, engañoso o confuso;',
      'fr':
          '\" et ne publiera, n\'enverra, ne publiera, ne téléchargera ou ne transmettra via les Services aucune Soumission illégale, harcelante, haineuse, nuisible, diffamatoire, obscène, intimidante, abusive, discriminatoire, menaçante pour toute personne ou groupe, sexuellement explicite, fausse, inexacte, trompeuse ou mensongère ;',
    },
    'fy36d2qp': {
      'en':
          '• to the extent permissible by applicable law, waive any and all moral rights to any such Submission;',
      'es':
          '• en la medida en que lo permita la ley aplicable, renunciar a todos y cada uno de los derechos morales sobre dicha Presentación;',
      'fr':
          '• dans la mesure permise par la loi applicable, renoncer à tous les droits moraux sur une telle soumission ;',
    },
    '15eptwhz': {
      'en':
          '• warrant that any such Submission are original to you or that you have the necessary rights and licenses to submit such Submissions and that you have full authority to grant us the above-mentioned rights in relation to your Submissions; and',
      'es':
          '• garantizar que dichos Envíos son originales suyos o que usted tiene los derechos y licencias necesarios para enviar dichos Envíos y que tiene plena autoridad para otorgarnos los derechos mencionados anteriormente en relación con sus Envíos; y',
      'fr':
          '• garantissez que toute soumission de ce type est originale ou que vous disposez des droits et licences nécessaires pour soumettre de telles soumissions et que vous avez toute autorité pour nous accorder les droits mentionnés ci-dessus en relation avec vos soumissions ; et',
    },
    'j85g83vg': {
      'en':
          '• warrant and represent that your Submissions do not constitute confidential information.',
      'es':
          '• garantiza y declara que sus Envíos no constituyen información confidencial.',
      'fr':
          '• garantissez et déclarez que vos soumissions ne constituent pas des informations confidentielles.',
    },
    'twq7j8ch': {
      'en':
          'You are solely responsible for your Submissions and you expressly agree to reimburse us for any and all losses that we may suffer because of your breach of (a) this section, (b) any third party’s intellectual property rights, or (c) applicable law.',
      'es':
          'Usted es el único responsable de sus Envíos y acepta expresamente reembolsarnos todas y cada una de las pérdidas que podamos sufrir debido a su incumplimiento de (a) esta sección, (b) los derechos de propiedad intelectual de terceros o (c) la ley aplicable.',
      'fr':
          'Vous êtes seul responsable de vos soumissions et vous acceptez expressément de nous rembourser toutes les pertes que nous pourrions subir en raison de votre violation (a) de la présente section, (b) des droits de propriété intellectuelle d’un tiers ou (c) de la loi applicable.',
    },
    'ihyhhuda': {
      'en': '3. USER REPRESENTATIONS',
      'es': '3. DECLARACIONES DEL USUARIO',
      'fr': '3. REPRÉSENTATIONS DES UTILISATEURS',
    },
    'o91h6iut': {
      'en':
          'By using the Services, you represent and warrant that: (1) all registration information you submit will be true, accurate, current, and complete; (2) you will maintain the accuracy of such information and promptly update such registration information as necessary; (3) you have the legal capacity and you agree to comply with these Legal Terms; (4) you are not a minor in the jurisdiction in which you reside; (5) you will not access the Services through automated or non-human means, whether through a bot, script or otherwise; (6) you will not use the Services for any illegal or unauthorized purpose; and (7) your use of the Services will not violate any applicable law or regulation.\n\nIf you provide any information that is untrue, inaccurate, not current, or incomplete, we have the right to suspend or terminate your account and refuse any and all current or future use of the Services (or any portion thereof).',
      'es':
          'Al utilizar los Servicios, usted declara y garantiza que: (1) toda la información de registro que envíe será verdadera, precisa, actual y completa; (2) mantendrá la precisión de dicha información y actualizará rápidamente dicha información de registro según sea necesario; (3) tiene la capacidad legal y acepta cumplir con estos Términos legales; (4) no es menor de edad en la jurisdicción en la que reside; (5) no accederá a los Servicios a través de medios automatizados o no humanos, ya sea a través de un bot, un script o de otro modo; (6) no utilizará los Servicios para ningún propósito ilegal o no autorizado; y (7) su uso de los Servicios no violará ninguna ley o regulación aplicable.\n\n\nSi proporciona información que sea falsa, inexacta, no actual o incompleta, tenemos el derecho de suspender o cancelar su cuenta y rechazar cualquier uso actual o futuro de los Servicios (o cualquier parte de ellos).',
      'fr':
          'En utilisant les Services, vous déclarez et garantissez que : (1) toutes les informations d\'inscription que vous soumettez seront vraies, exactes, à jour et complètes ; (2) vous maintiendrez l\'exactitude de ces informations et mettrez rapidement à jour ces informations d\'inscription si nécessaire ; (3) vous avez la capacité juridique et vous acceptez de vous conformer aux présentes Conditions légales ; (4) vous n\'êtes pas mineur dans la juridiction dans laquelle vous résidez ; (5) vous n\'accéderez pas aux Services par des moyens automatisés ou non humains, que ce soit par le biais d\'un robot, d\'un script ou autre ; (6) vous n\'utiliserez pas les Services à des fins illégales ou non autorisées ; et (7) votre utilisation des Services ne violera aucune loi ou réglementation applicable.\n\n\nSi vous fournissez des informations fausses, inexactes, non actuelles ou incomplètes, nous avons le droit de suspendre ou de résilier votre compte et de refuser toute utilisation actuelle ou future des Services (ou de toute partie de ceux-ci).',
    },
    'wm6cinlh': {
      'en': '4. USER REGISTRATION',
      'es': '4. REGISTRO DE USUARIO',
      'fr': '4. ENREGISTREMENT DE L\'UTILISATEUR',
    },
    'p1cqgq6n': {
      'en':
          'You may be required to register to use the Services. You agree to keep your password confidential and will be responsible for all use of your account and password. We reserve the right to remove, reclaim, or change a username you select if we determine, in our sole discretion, that such username is inappropriate, obscene, or otherwise objectionable.',
      'es':
          'Es posible que se le solicite que se registre para utilizar los Servicios. Usted acepta mantener la confidencialidad de su contraseña y será responsable de todo uso de su cuenta y contraseña. Nos reservamos el derecho de eliminar, reclamar o cambiar un nombre de usuario que seleccione si determinamos, a nuestro exclusivo criterio, que dicho nombre de usuario es inapropiado, obsceno o de otro modo objetable.',
      'fr':
          'Vous devrez peut-être vous inscrire pour utiliser les Services. Vous acceptez de garder votre mot de passe confidentiel et serez responsable de toute utilisation de votre compte et de votre mot de passe. Nous nous réservons le droit de supprimer, de récupérer ou de modifier un nom d\'utilisateur que vous sélectionnez si nous déterminons, à notre seule discrétion, que ce nom d\'utilisateur est inapproprié, obscène ou autrement répréhensible.',
    },
    'o8jlaxm6': {
      'en': '5. PROHIBITED ACTIVITIES',
      'es': '5. ACTIVIDADES PROHIBIDAS',
      'fr': '5. ACTIVITÉS INTERDITES',
    },
    'dliziux3': {
      'en':
          'You may not access or use the Services for any purpose other than that for which we make the Services available. The Services may not be used in connection with any commercial endeavors except those that are specifically endorsed or approved by us.\n\nAs a user of the Services, you agree not to:',
      'es':
          'No podrá acceder ni utilizar los Servicios para ningún otro fin que no sea aquel para el que los ponemos a disposición. Los Servicios no podrán utilizarse en relación con ningún emprendimiento comercial, excepto aquellos que estén específicamente respaldados o aprobados por nosotros.\n\n\nComo usuario de los Servicios, usted acepta no:',
      'fr':
          'Vous ne pouvez pas accéder aux Services ni les utiliser à d\'autres fins que celles pour lesquelles nous les mettons à disposition. Les Services ne peuvent pas être utilisés dans le cadre d\'activités commerciales, à l\'exception de celles qui sont spécifiquement approuvées par nous.\n\n\nEn tant qu\'utilisateur des Services, vous acceptez de ne pas :',
    },
    '2won7dd9': {
      'en':
          '•\tSystematically retrieve data or other content from the Services to create or compile, directly or indirectly, a collection, compilation, database, or directory without written permission from us.\n\n•\tTrick, defraud, or mislead us and other users, especially in any attempt to learn sensitive account information such as user passwords.\n\n•\tCircumvent, disable, or otherwise interfere with security-related features of the Services, including features that prevent or restrict the use or copying of any Content or enforce limitations on the use of the Services and/or the Content contained therein.\n\n•\tDisparage, tarnish, or otherwise harm, in our opinion, us and/or the Services.\n\n•\tUse any information obtained from the Services in order to harass, abuse, or harm another person.\n\n•\tMake improper use of our support services or submit false reports of abuse or misconduct.\n\n• Use the Services in a manner inconsistent with any applicable laws or regulations.\n\n•\tEngage in unauthorized framing of or linking to the Services.\n\n•\tUpload or transmit (or attempt to upload or to transmit) viruses, Trojan horses, or other material, including excessive use of capital letters and spamming (continuous posting of repetitive text), that interferes with any party’s uninterrupted use and enjoyment of the Services or modifies, impairs, disrupts, alters, or interferes with the use, features, functions, operation, or maintenance of the Services.\n\n•\tEngage in any automated use of the system, such as using scripts to send comments or messages, or using any data mining, robots, or similar data gathering and extraction tools.\n\n•\tDelete the copyright or other proprietary rights notice from any Content.\n\n•\tAttempt to impersonate another user or person or use the username of another user.\n\n•\tUpload or transmit (or attempt to upload or to transmit) viruses, Trojan horses, or other material, including excessive use of capital letters and spamming (continuous posting of repetitive text), that interferes with any party’s uninterrupted use and enjoyment of the Services or modifies, impairs, disrupts, alters, or interferes with the use, features, functions, operation, or maintenance of the Services.\n\n•\tInterfere with, disrupt, or create an undue burden on the Services or the networks or services connected to the Services.\n\n•\tHarass, annoy, intimidate, or threaten any of our employees or agents engaged in providing any portion of the Services to you.\n\n•\tAttempt to bypass any measures of the Services designed to prevent or restrict access to the Services, or any portion of the Services.\n\n•\tCopy or adapt the Services\' software, including but not limited to Flash, PHP, HTML, JavaScript, or other code.\n\n•\tExcept as permitted by applicable law, decipher, decompile, disassemble, or reverse engineer any of the software comprising or in any way making up a part of the Services.\n\n•\tExcept as may be the result of standard search engine or Internet browser usage, use, launch, develop, or distribute any automated system, including without limitation, any spider, robot, cheat utility, scraper, or offline reader that accesses the Services, or use or launch any unauthorized script or other software.\n\n•\tUse a buying agent or purchasing agent to make purchases on the Services.\n\n•\tMake any unauthorized use of the Services, including collecting usernames and/or email addresses of users by electronic or other means for the purpose of sending unsolicited email, or creating user accounts by automated means or under false pretenses.\n\n•\tUse the Services as part of any effort to compete with us or otherwise use the Services and/or the Content for any revenue-generating endeavor or commercial enterprise.',
      'es':
          '• Recuperar sistemáticamente datos u otro contenido de los Servicios para crear o compilar, directa o indirectamente, una colección, compilación, base de datos o directorio sin nuestro permiso por escrito.\n\n\n• Engañar, defraudar o confundirnos a nosotros y a otros usuarios, especialmente en cualquier intento de obtener información confidencial de la cuenta, como las contraseñas de usuario.\n\n\n• Eludir, deshabilitar o interferir de otro modo con las funciones relacionadas con la seguridad de los Servicios, incluidas las funciones que impiden o restringen el uso o la copia de cualquier Contenido o imponen limitaciones en el uso de los Servicios y/o el Contenido incluido en ellos.\n\n\n• Menospreciar, manchar o dañar de otro modo, en nuestra opinión, a nosotros y/o a los Servicios.\n\n\n• Utilizar cualquier información obtenida de los Servicios para acosar, abusar o dañar a otra persona.\n\n\n• Hacer un uso indebido de nuestros servicios de soporte o enviar informes falsos de abuso o mala conducta.\n\n\n• Utilizar los Servicios de una manera incompatible con las leyes o regulaciones aplicables.\n\n\n• Participar en la creación de marcos o enlaces no autorizados a los Servicios.\n\n\n• Cargar o transmitir (o intentar cargar o transmitir) virus, caballos de Troya u otro material, incluido el uso excesivo de letras mayúsculas y el envío de spam (publicación continua de texto repetitivo), que interfiera con el uso y disfrute ininterrumpido de los Servicios por parte de cualquier parte o que modifique, perjudique, interrumpa, altere o interfiera con el uso, las características, las funciones, el funcionamiento o el mantenimiento de los Servicios.\n\n\n• Participar en cualquier uso automatizado del sistema, como el uso de scripts para enviar comentarios o mensajes, o el uso de minería de datos, robots o herramientas similares de recopilación y extracción de datos.\n\n\n• Eliminar el aviso de derechos de autor u otros derechos de propiedad de cualquier Contenido.\n\n\n• Intentar hacerse pasar por otro usuario o persona o utilizar el nombre de usuario de otro usuario.\n\n• Cargar o transmitir (o intentar cargar o transmitir) virus, caballos de Troya u otro material, incluido el uso excesivo de letras mayúsculas y spam (publicación continua de texto repetitivo), que interfiera con el uso y disfrute ininterrumpido de los Servicios por parte de cualquier parte o que modifique, perjudique, interrumpa, altere o interfiera con el uso, las características, las funciones, el funcionamiento o el mantenimiento de los Servicios.\n\n\n• Interferir, interrumpir o crear una carga indebida en los Servicios o las redes o servicios conectados a los Servicios.\n\n\n• Acosar, molestar, intimidar o amenazar a cualquiera de nuestros empleados o agentes que participen en la prestación de cualquier parte de los Servicios.\n\n\n• Intentar eludir cualquier medida de los Servicios diseñada para evitar o restringir el acceso a los Servicios o a cualquier parte de los mismos.\n\n\n• Copiar o adaptar el software de los Servicios, incluidos, entre otros, Flash, PHP, HTML, JavaScript u otro código.\n\n\n• Salvo que lo permita la ley aplicable, descifrar, descompilar, desensamblar o aplicar ingeniería inversa a cualquier software que comprenda o forme parte de los Servicios.\n\n\n• Salvo que sea el resultado del uso estándar de un motor de búsqueda o un navegador de Internet, utilizar, iniciar, desarrollar o distribuir cualquier sistema automatizado, incluidos, entre otros, cualquier araña, robot, utilidad de trampa, raspador o lector fuera de línea que acceda a los Servicios, o utilizar o iniciar cualquier script u otro software no autorizado.\n\n\n• Utilizar un agente de compras o un agente de compras para realizar compras en los Servicios.\n\n\n• Hacer cualquier uso no autorizado de los Servicios, incluida la recopilación de nombres de usuario y/o direcciones de correo electrónico de los usuarios por medios electrónicos u otros medios con el fin de enviar correo electrónico no solicitado o crear cuentas de usuario por medios automatizados o con falsas pretensiones.\n\n\n• Utilizar los Servicios como parte de cualquier esfuerzo por competir con nosotros o, de otro modo, utilizar los Servicios y/o el Contenido para cualquier esfuerzo generador de ingresos o empresa comercial.',
      'fr':
          '• Récupérer systématiquement des données ou d\'autres contenus des Services pour créer ou compiler, directement ou indirectement, une collection, une compilation, une base de données ou un répertoire sans notre autorisation écrite.\n\n\n• Nous piéger, frauder ou induire en erreur, ainsi que d\'autres utilisateurs, en particulier dans le cadre de toute tentative d\'obtenir des informations de compte sensibles telles que les mots de passe des utilisateurs.\n\n\n• Contourner, désactiver ou interférer de toute autre manière avec les fonctionnalités liées à la sécurité des Services, y compris les fonctionnalités qui empêchent ou restreignent l\'utilisation ou la copie de tout Contenu ou imposent des limitations à l\'utilisation des Services et/ou du Contenu qu\'ils contiennent.\n\n\n• Dénigrer, ternir ou nuire de toute autre manière, à notre avis, à nous-mêmes et/ou aux Services.\n\n\n• Utiliser toute information obtenue à partir des Services afin de harceler, d\'abuser ou de nuire à une autre personne.\n\n\n• Utiliser nos services d\'assistance de manière inappropriée ou soumettre de faux rapports d\'abus ou de mauvaise conduite.\n\n\n• Utiliser les Services d\'une manière non conforme aux lois ou réglementations applicables.\n\n\n• Participer à un cadrage ou à un lien non autorisé vers les Services.\n\n\n• Télécharger ou transmettre (ou tenter de télécharger ou de transmettre) des virus, des chevaux de Troie ou d\'autres éléments, y compris l\'utilisation excessive de majuscules et le spam (publication continue de texte répétitif), qui interfère avec l\'utilisation et la jouissance ininterrompues des Services par une partie ou modifie, altère, perturbe, altère ou interfère avec l\'utilisation, les caractéristiques, les fonctions, le fonctionnement ou la maintenance des Services.\n\n\n• Utiliser le système de manière automatisée, comme utiliser des scripts pour envoyer des commentaires ou des messages, ou utiliser des outils d\'exploration de données, des robots ou des outils similaires de collecte et d\'extraction de données.\n\n\n• Supprimer les mentions de droits d\'auteur ou autres droits de propriété de tout Contenu.\n\n\n• Tenter d\'usurper l\'identité d\'un autre utilisateur ou d\'une autre personne ou d\'utiliser le nom d\'utilisateur d\'un autre utilisateur.\n\n• Télécharger ou transmettre (ou tenter de télécharger ou de transmettre) des virus, des chevaux de Troie ou d\'autres éléments, y compris l\'utilisation excessive de majuscules et le spam (publication continue de texte répétitif), qui interfère avec l\'utilisation et la jouissance ininterrompues des Services par une partie ou qui modifie, altère, perturbe, altère ou interfère avec l\'utilisation, les caractéristiques, les fonctions, le fonctionnement ou la maintenance des Services.\n\n\n• Interférer avec, perturber ou créer une charge excessive sur les Services ou les réseaux ou services connectés aux Services.\n\n\n• Harceler, ennuyer, intimider ou menacer l\'un de nos employés ou agents engagés dans la fourniture de toute partie des Services à votre intention.\n\n\n• Tenter de contourner toute mesure des Services conçue pour empêcher ou restreindre l\'accès aux Services, ou à toute partie des Services.\n\n\n• Copier ou adapter le logiciel des Services, y compris, mais sans s\'y limiter, Flash, PHP, HTML, JavaScript ou autre code.\n\n\n• Sauf si la loi applicable le permet, déchiffrer, décompiler, désassembler ou procéder à l\'ingénierie inverse de tout logiciel composant ou constituant de quelque manière que ce soit une partie des Services.\n\n\n• Sauf si cela résulte de l\'utilisation standard d\'un moteur de recherche ou d\'un navigateur Internet, utiliser, lancer, développer ou distribuer tout système automatisé, y compris, sans limitation, tout robot d\'indexation, utilitaire de triche, scraper ou lecteur hors ligne qui accède aux Services, ou utiliser ou lancer tout script ou autre logiciel non autorisé.\n\n\n• Utiliser un agent d\'achat ou un agent d\'achat pour effectuer des achats sur les Services.\n\n\n• Faire toute utilisation non autorisée des Services, y compris la collecte de noms d\'utilisateur et/ou d\'adresses e-mail d\'utilisateurs par des moyens électroniques ou autres dans le but d\'envoyer des e-mails non sollicités, ou de créer des comptes d\'utilisateurs par des moyens automatisés ou sous de faux prétextes.\n\n\n• Utiliser les Services dans le cadre de tout effort visant à nous concurrencer ou utiliser autrement les Services et/ou le Contenu pour toute activité génératrice de revenus ou entreprise commerciale.',
    },
    'o5pmsn91': {
      'en': '6. USER GENERATED CONTRIBUTIONS',
      'es': '6. CONTRIBUCIONES GENERADAS POR LOS USUARIOS',
      'fr': '6. CONTRIBUTIONS GÉNÉRÉES PAR LES UTILISATEURS',
    },
    'xbv5yuhb': {
      'en':
          'The Services does not offer users to submit or post content. We may provide you with the opportunity to create, submit, post, display, transmit, perform, publish, distribute, or broadcast content and materials to us or on the Services, including but not limited to text, writings, video, audio, photographs, graphics, comments, suggestions, or personal information or other material (collectively, \"Contributions\"). Contributions may be viewable by other users of the Services and through third-party websites. As such, any Contributions you transmit may be treated in accordance with the Services\' Privacy Policy. When you create or make available any Contributions, you thereby represent and warrant that:',
      'es':
          'Los Servicios no ofrecen a los usuarios la posibilidad de enviar o publicar contenido. Podemos brindarle la oportunidad de crear, enviar, publicar, exhibir, transmitir, ejecutar, publicar, distribuir o difundir contenido y materiales para nosotros o en los Servicios, incluidos, entre otros, textos, escritos, videos, audios, fotografías, gráficos, comentarios, sugerencias o información personal u otro material (en conjunto, \"Contribuciones\"). Las Contribuciones pueden ser visibles para otros usuarios de los Servicios y a través de sitios web de terceros. Como tal, cualquier Contribución que transmita puede ser tratada de acuerdo con la Política de privacidad de los Servicios. Cuando crea o pone a disposición cualquier Contribución, declara y garantiza que:',
      'fr':
          'Les Services ne permettent pas aux utilisateurs de soumettre ou de publier du contenu. Nous pouvons vous offrir la possibilité de créer, soumettre, publier, afficher, transmettre, exécuter, publier, distribuer ou diffuser du contenu et des documents à notre intention ou sur les Services, y compris, mais sans s\'y limiter, du texte, des écrits, des vidéos, de l\'audio, des photographies, des graphiques, des commentaires, des suggestions ou des informations personnelles ou d\'autres documents (collectivement, les « Contributions »). Les Contributions peuvent être visibles par d\'autres utilisateurs des Services et via des sites Web tiers. Ainsi, toutes les Contributions que vous transmettez peuvent être traitées conformément à la Politique de confidentialité des Services. Lorsque vous créez ou mettez à disposition des Contributions, vous déclarez et garantissez par la présente que :',
    },
    'ttatll83': {
      'en':
          '•\tThe creation, distribution, transmission, public display, or performance, and the accessing, downloading, or copying of your Contributions do not and will not infringe the proprietary rights, including but not limited to the copyright, patent, trademark, trade secret, or moral rights of any third party.\n\n•\tYou are the creator and owner of or have the necessary licenses, rights, consents, releases, and permissions to use and to authorize us, the Services, and other users of the Services to use your Contributions in any manner contemplated by the Services and these Legal Terms.\n\n•\tYou have the written consent, release, and/or permission of each and every identifiable individual person in your Contributions to use the name or likeness of each and every such identifiable individual person to enable inclusion and use of your Contributions in any manner contemplated by the Services and these Legal Terms.\n\n•\tYour Contributions are not false, inaccurate, or misleading.\n\n•\tYour Contributions are not unsolicited or unauthorized advertising, promotional materials, pyramid schemes, chain letters, spam, mass mailings, or other forms of solicitation.\n\n•\tYour Contributions are not obscene, lewd, lascivious, filthy, violent, harassing, libelous, slanderous, or otherwise objectionable (as determined by us).\n\n•\tYour Contributions do not ridicule, mock, disparage, intimidate, or abuse anyone.\n\n•\tYour Contributions are not used to harass or threaten (in the legal sense of those terms) any other person and to promote violence against a specific person or class of people.\n\n•\tYour Contributions do not violate any applicable law, regulation, or rule.\n\n•\tYour Contributions do not violate the privacy or publicity rights of any third party.\n\n•\tYour Contributions do not violate any applicable law concerning child pornography, or otherwise intended to protect the health or well-being of minors.\n\n•\tYour Contributions do not include any offensive comments that are connected to race, national origin, gender, sexual preference, or physical handicap.\n\n•\tYour Contributions do not otherwise violate, or link to material that violates, any provision of these Legal Terms, or any applicable law or regulation.',
      'es':
          '• La creación, distribución, transmisión, exhibición pública o presentación, y el acceso, descarga o copia de sus Contribuciones no infringen ni infringirán los derechos de propiedad, incluidos, entre otros, los derechos de autor, patentes, marcas registradas, secretos comerciales o derechos morales de terceros.\n\n\n• Usted es el creador y propietario o tiene las licencias, derechos, consentimientos, autorizaciones y permisos necesarios para usar y autorizarnos a nosotros, a los Servicios y a otros usuarios de los Servicios a usar sus Contribuciones de cualquier manera contemplada por los Servicios y estos Términos legales.\n\n\n• Usted tiene el consentimiento, la autorización y/o el permiso por escrito de todas y cada una de las personas individuales identificables en sus Contribuciones para usar el nombre o la imagen de todas y cada una de esas personas individuales identificables para permitir la inclusión y el uso de sus Contribuciones de cualquier manera contemplada por los Servicios y estos Términos legales.\n\n\n• Sus contribuciones no son falsas, inexactas ni engañosas.\n\n\n• Sus contribuciones no son publicidad no solicitada ni autorizada, materiales promocionales, esquemas piramidales, cartas en cadena, correo basura, correo masivo ni otras formas de solicitación.\n\n\n• Sus contribuciones no son obscenas, lascivas, sucias, violentas, acosadoras, calumniosas, difamatorias ni de otro modo objetables (según lo determinemos nosotros).\n\n\n• Sus contribuciones no ridiculizan, se burlan, menosprecian, intimidan ni abusan de nadie.\n\n\n• Sus contribuciones no se utilizan para acosar o amenazar (en el sentido legal de esos términos) a ninguna otra persona ni para promover la violencia contra una persona o clase de personas específicas.\n\n\n• Sus contribuciones no violan ninguna ley, regulación o norma aplicable.\n\n\n• Sus contribuciones no violan los derechos de privacidad o publicidad de ningún tercero.\n\n\n• Sus contribuciones no violan ninguna ley aplicable en materia de pornografía infantil, ni tienen por objeto proteger la salud o el bienestar de los menores.\n\n\n• Sus contribuciones no incluyen ningún comentario ofensivo relacionado con la raza, el origen nacional, el género, la preferencia sexual o la discapacidad física.\n\n\n• Sus contribuciones no violan ni se vinculan a material que viole ninguna disposición de estos Términos legales ni ninguna ley o regulación aplicable.',
      'fr':
          '• La création, la distribution, la transmission, l\'affichage public ou l\'exécution, ainsi que l\'accès, le téléchargement ou la copie de vos Contributions ne portent pas atteinte et ne porteront pas atteinte aux droits de propriété, y compris, mais sans s\'y limiter, aux droits d\'auteur, aux brevets, aux marques déposées, aux secrets commerciaux ou aux droits moraux de tout tiers.\n\n\n• Vous êtes le créateur et le propriétaire de vos Contributions ou disposez des licences, droits, consentements, décharges et permissions nécessaires pour les utiliser et nous autoriser, ainsi que les Services et les autres utilisateurs des Services, à utiliser vos Contributions de toute manière envisagée par les Services et les présentes Conditions légales.\n\n\n• Vous disposez du consentement écrit, de la décharge et/ou de la permission de chaque personne identifiable dans vos Contributions pour utiliser le nom ou l\'image de chaque personne identifiable afin de permettre l\'inclusion et l\'utilisation de vos Contributions de toute manière envisagée par les Services et les présentes Conditions légales.\n\n\n• Vos Contributions ne sont pas fausses, inexactes ou trompeuses.\n\n\n• Vos contributions ne sont pas des publicités non sollicitées ou non autorisées, des documents promotionnels, des systèmes pyramidaux, des chaînes de lettres, des spams, des envois de courriers en masse ou d\'autres formes de sollicitation.\n\n\n• Vos contributions ne sont pas obscènes, obscènes, lascives, sales, violentes, harcelantes, calomnieuses, calomnieuses ou autrement répréhensibles (selon nous).\n\n\n• Vos contributions ne ridiculisent, ne se moquent, ne dénigrent, n\'intimident ou n\'abusent personne.\n\n\n• Vos contributions ne sont pas utilisées pour harceler ou menacer (au sens juridique du terme) une autre personne et pour promouvoir la violence contre une personne ou une catégorie de personnes spécifique.\n\n\n• Vos contributions ne violent aucune loi, réglementation ou règle applicable.\n\n\n• Vos contributions ne violent pas les droits à la vie privée ou à la publicité d\'un tiers.\n\n\n• Vos contributions ne violent aucune loi applicable concernant la pornographie infantile, ou visant à protéger la santé ou le bien-être des mineurs.\n\n\n• Vos contributions ne contiennent aucun commentaire offensant lié à la race, à l\'origine nationale, au sexe, à l\'orientation sexuelle ou au handicap physique.\n\n\n• Vos contributions ne violent pas, ni ne renvoient à des éléments qui violent, toute disposition des présentes conditions juridiques, ou toute loi ou réglementation applicable.',
    },
    'c7cn40q8': {
      'en':
          'Any use of the Services in violation of the foregoing violates these Legal Terms and may result in, among other things, termination or suspension of your rights to use the Services.',
      'es':
          'Cualquier uso de los Servicios que viole lo anterior viola estos Términos Legales y puede resultar, entre otras cosas, en la terminación o suspensión de sus derechos para usar los Servicios.',
      'fr':
          'Toute utilisation des Services en violation de ce qui précède viole les présentes Conditions légales et peut entraîner, entre autres, la résiliation ou la suspension de vos droits d\'utilisation des Services.',
    },
    'x8bk6wix': {
      'en': '7. CONTRIBUTION LICENSE',
      'es': '7. LICENCIA DE CONTRIBUCIÓN',
      'fr': '7. LICENCE DE CONTRIBUTION',
    },
    'lujqijw1': {
      'en':
          'You and Services agree that we may access, store, process, and use any information and personal data that you provide following the terms of the Privacy Policy and your choices (including settings).\n\nBy submitting suggestions or other feedback regarding the Services, you agree that we can use and share such feedback for any purpose without compensation to you.\n\nWe do not assert any ownership over your Contributions. You retain full ownership of all of your Contributions and any intellectual property rights or other proprietary rights associated with your Contributions. We are not liable for any statements or representations in your Contributions provided by you in any area on the Services. You are solely responsible for your Contributions to the Services and you expressly agree to exonerate us from any and all responsibility and to refrain from any legal action against us regarding your Contributions.',
      'es':
          'Usted y los Servicios aceptan que podemos acceder, almacenar, procesar y utilizar cualquier información y datos personales que proporcione siguiendo los términos de la Política de privacidad y sus opciones (incluidas las configuraciones).\n\n\n\nAl enviar sugerencias u otros comentarios sobre los Servicios, usted acepta que podemos usar y compartir dichos comentarios para cualquier propósito sin compensación para usted.\n\n\n\nNo afirmamos ninguna propiedad sobre sus Contribuciones. Usted conserva la propiedad total de todas sus Contribuciones y cualquier derecho de propiedad intelectual u otros derechos de propiedad asociados con sus Contribuciones. No somos responsables de ninguna declaración o representación en sus Contribuciones proporcionadas por usted en cualquier área de los Servicios. Usted es el único responsable de sus Contribuciones a los Servicios y acepta expresamente exonerarnos de toda responsabilidad y abstenernos de cualquier acción legal contra nosotros con respecto a sus Contribuciones.',
      'fr':
          'Vous et les Services acceptez que nous puissions accéder, stocker, traiter et utiliser toutes les informations et données personnelles que vous fournissez conformément aux termes de la Politique de confidentialité et à vos choix (y compris les paramètres).\n\n\n\nEn soumettant des suggestions ou d\'autres commentaires concernant les Services, vous acceptez que nous puissions utiliser et partager ces commentaires à toutes fins sans compensation pour vous.\n\n\n\nNous ne revendiquons aucun droit de propriété sur vos Contributions. Vous conservez la pleine propriété de toutes vos Contributions et de tous les droits de propriété intellectuelle ou autres droits de propriété associés à vos Contributions. Nous ne sommes pas responsables des déclarations ou représentations contenues dans vos Contributions fournies par vous dans n\'importe quelle zone des Services. Vous êtes seul responsable de vos Contributions aux Services et vous acceptez expressément de nous exonérer de toute responsabilité et de vous abstenir de toute action en justice contre nous concernant vos Contributions.',
    },
    'ufdys9vi': {
      'en': '8. MOBILE APPLICATION LICENSE',
      'es': '8. LICENCIA DE APLICACIÓN MÓVIL',
      'fr': '8. LICENCE D\'APPLICATION MOBILE',
    },
    'wiqb6kup': {
      'en': 'Use License',
      'es': 'Licencia de uso',
      'fr': 'Licence d\'utilisation',
    },
    'ilae97ms': {
      'en':
          'If you access the Services via the App, then we grant you a revocable, non-exclusive, non-transferable, limited right to install and use the App on wireless electronic devices owned or controlled by you, and to access and use the App on such devices strictly in accordance with the terms and conditions of this mobile application license contained in these Legal Terms. You shall not: (1) except as permitted by applicable law, decompile, reverse engineer, disassemble, attempt to derive the source code of, or decrypt the App; (2) make any modification, adaptation, improvement, enhancement, translation, or derivative work from the App; (3) violate any applicable laws, rules, or regulations in connection with your access or use of the App; (4) remove, alter, or obscure any proprietary notice (including any notice of copyright or trademark) posted by us or the licensors of the App; (5) use the App for any revenue-generating endeavor, commercial enterprise, or other purpose for which it is not designed or intended; (6) make the App available over a network or other environment permitting access or use by multiple devices or users at the same time; (7) use the App for creating a product, service, or software that is, directly or indirectly, competitive with or in any way a substitute for the App; (8) use the App to send automated queries to any website or to send any unsolicited commercial email; or (9) use any proprietary information or any of our interfaces or our other intellectual property in the design, development, manufacture, licensing, or distribution of any applications, accessories, or devices for use with the App.',
      'es':
          'Si accede a los Servicios a través de la Aplicación, le otorgamos un derecho revocable, no exclusivo, intransferible y limitado para instalar y usar la Aplicación en dispositivos electrónicos inalámbricos de su propiedad o controlados por usted, y para acceder y usar la Aplicación en dichos dispositivos estrictamente de acuerdo con los términos y condiciones de esta licencia de aplicación móvil contenida en estos Términos legales. No deberá: (1) excepto según lo permita la ley aplicable, descompilar, aplicar ingeniería inversa, desensamblar, intentar derivar el código fuente de, o descifrar la Aplicación; (2) realizar cualquier modificación, adaptación, mejora, realce, traducción o trabajo derivado de la Aplicación; (3) violar cualquier ley, regla o regulación aplicable en relación con su acceso o uso de la Aplicación; (4) eliminar, alterar u ocultar cualquier aviso de propiedad (incluido cualquier aviso de derechos de autor o marca registrada) publicado por nosotros o los licenciantes de la Aplicación; (5) usar la Aplicación para cualquier esfuerzo generador de ingresos, empresa comercial u otro propósito para el cual no esté diseñada o destinada; (6) hacer que la Aplicación esté disponible a través de una red u otro entorno que permita el acceso o uso por parte de múltiples dispositivos o usuarios al mismo tiempo; (7) utilizar la Aplicación para crear un producto, servicio o software que sea, directa o indirectamente, competitivo con o de alguna manera un sustituto de la Aplicación; (8) utilizar la Aplicación para enviar consultas automáticas a cualquier sitio web o para enviar cualquier correo electrónico comercial no solicitado; o (9) utilizar cualquier información de propiedad exclusiva o cualquiera de nuestras interfaces u otra propiedad intelectual en el diseño, desarrollo, fabricación, licencia o distribución de cualquier aplicación, accesorio o dispositivo para su uso con la Aplicación.',
      'fr':
          'Français Si vous accédez aux Services via l\'Application, nous vous accordons un droit révocable, non exclusif, non transférable et limité d\'installer et d\'utiliser l\'Application sur des appareils électroniques sans fil que vous possédez ou contrôlez, et d\'accéder à l\'Application et de l\'utiliser sur ces appareils en stricte conformité avec les termes et conditions de cette licence d\'application mobile contenue dans les présentes Conditions légales. Vous ne devez pas : (1) sauf si la loi applicable le permet, décompiler, rétroconcevoir, désassembler, tenter de dériver le code source ou décrypter l\'Application ; (2) apporter une modification, une adaptation, une amélioration, un perfectionnement, une traduction ou un travail dérivé de l\'Application ; (3) violer les lois, règles ou réglementations applicables en rapport avec votre accès ou votre utilisation de l\'Application ; (4) supprimer, modifier ou masquer tout avis de propriété (y compris tout avis de droit d\'auteur ou de marque déposée) publié par nous ou les concédants de licence de l\'Application ; (5) utiliser l\'Application pour toute activité génératrice de revenus, entreprise commerciale ou toute autre fin pour laquelle elle n\'est pas conçue ou prévue ; (6) rendre l\'application disponible sur un réseau ou un autre environnement permettant l\'accès ou l\'utilisation par plusieurs appareils ou utilisateurs en même temps ; (7) utiliser l\'application pour créer un produit, un service ou un logiciel qui est, directement ou indirectement, en concurrence avec l\'application ou qui la remplace de quelque manière que ce soit ; (8) utiliser l\'application pour envoyer des requêtes automatisées à n\'importe quel site Web ou pour envoyer tout courrier électronique commercial non sollicité ; ou (9) utiliser toute information exclusive ou l\'une de nos interfaces ou notre autre propriété intellectuelle dans la conception, le développement, la fabrication, la licence ou la distribution de toute application, accessoire ou appareil à utiliser avec l\'application.',
    },
    'w9rvntfb': {
      'en': 'Apple and Android Devices',
      'es': 'Dispositivos Apple y Android',
      'fr': 'Appareils Apple et Android',
    },
    'aohaxv06': {
      'en':
          'The following terms apply when you use the App obtained from either the Apple Store or Google Play (each an \"App Distributor\") to access the Services: (1) the license granted to you for our App is limited to a non-transferable license to use the application on a device that utilizes the Apple iOS or Android operating systems, as applicable, and in accordance with the usage rules set forth in the applicable App Distributor’s terms of service; (2) we are responsible for providing any maintenance and support services with respect to the App as specified in the terms and conditions of this mobile application license contained in these Legal Terms or as otherwise required under applicable law, and you acknowledge that each App Distributor has no obligation whatsoever to furnish any maintenance and support services with respect to the App; (3) in the event of any failure of the App to conform to any applicable warranty, you may notify the applicable App Distributor, and the App Distributor, in accordance with its terms and policies, may refund the purchase price, if any, paid for the App, and to the maximum extent permitted by applicable law, the App Distributor will have no other warranty obligation whatsoever with respect to the App; (4) you represent and warrant that (i) you are not located in a country that is subject to a US government embargo, or that has been designated by the US government as a \"terrorist supporting\" country and (ii) you are not listed on any US government list of prohibited or restricted parties; (5) you must comply with applicable third-party terms of agreement when using the App, e.g., if you have a VoIP application, then you must not be in violation of their wireless data service agreement when using the App; and (6) you acknowledge and agree that the App Distributors are third-party beneficiaries of the terms and conditions in this mobile application license contained in these Legal Terms, and that each App Distributor will have the right (and will be deemed to have accepted the right) to enforce the terms and conditions in this mobile application license contained in these Legal Terms against you as a third-party beneficiary thereof.',
      'es':
          'Los siguientes términos se aplican cuando utiliza la Aplicación obtenida de Apple Store o Google Play (cada uno un \"Distribuidor de la Aplicación\") para acceder a los Servicios: (1) la licencia que se le otorga para nuestra Aplicación se limita a una licencia no transferible para usar la aplicación en un dispositivo que utilice los sistemas operativos Apple iOS o Android, según corresponda, y de acuerdo con las reglas de uso establecidas en los términos de servicio del Distribuidor de la Aplicación correspondiente; (2) somos responsables de proporcionar cualquier servicio de mantenimiento y soporte con respecto a la Aplicación como se especifica en los términos y condiciones de esta licencia de aplicación móvil contenida en estos Términos legales o como lo requiera la ley aplicable, y usted reconoce que cada Distribuidor de la Aplicación no tiene obligación alguna de proporcionar ningún servicio de mantenimiento y soporte con respecto a la Aplicación; (3) en caso de que la Aplicación no cumpla con alguna garantía aplicable, usted puede notificar al Distribuidor de la Aplicación correspondiente, y el Distribuidor de la Aplicación, de acuerdo con sus términos y políticas, puede reembolsar el precio de compra, si lo hubiera, pagado por la Aplicación, y en la medida máxima permitida por la ley aplicable, el Distribuidor de la Aplicación no tendrá ninguna otra obligación de garantía con respecto a la Aplicación; (4) usted declara y garantiza que (i) no se encuentra en un país que esté sujeto a un embargo del gobierno de los EE. UU., o que haya sido designado por el gobierno de los EE. UU. como un país \"que apoya al terrorismo\" y (ii) no figura en ninguna lista del gobierno de los EE. UU. de partes prohibidas o restringidas; (5) debe cumplir con los términos de acuerdo de terceros aplicables al usar la Aplicación, por ejemplo, si tiene una aplicación de VoIP, entonces no debe estar en violación de su acuerdo de servicio de datos inalámbricos al usar la Aplicación; y (6) usted reconoce y acepta que los Distribuidores de Aplicaciones son terceros beneficiarios de los términos y condiciones de esta licencia de aplicación móvil contenidos en estos Términos Legales, y que cada Distribuidor de Aplicaciones tendrá el derecho (y se considerará que ha aceptado el derecho) de hacer cumplir los términos y condiciones de esta licencia de aplicación móvil contenidos en estos Términos Legales contra usted como tercero beneficiario de los mismos.',
      'fr':
          'Français Les conditions suivantes s\'appliquent lorsque vous utilisez l\'Application obtenue auprès de l\'Apple Store ou de Google Play (chacun étant un « Distributeur d\'Applications ») pour accéder aux Services : (1) la licence qui vous est accordée pour notre Application est limitée à une licence non transférable pour utiliser l\'Application sur un appareil qui utilise les systèmes d\'exploitation Apple iOS ou Android, selon le cas, et conformément aux règles d\'utilisation énoncées dans les conditions de service du Distributeur d\'Applications applicable ; (2) nous sommes responsables de la fourniture de tous les services de maintenance et d\'assistance relatifs à l\'Application comme spécifié dans les conditions générales de cette licence d\'application mobile contenues dans les présentes Conditions légales ou comme autrement requis par la loi applicable, et vous reconnaissez que chaque Distributeur d\'Applications n\'a aucune obligation de fournir des services de maintenance et d\'assistance relatifs à l\'Application ; (3) en cas de non-conformité de l\'application à une garantie applicable, vous pouvez en informer le distributeur d\'applications concerné, et le distributeur d\'applications, conformément à ses conditions et politiques, peut rembourser le prix d\'achat, le cas échéant, payé pour l\'application, et dans la mesure maximale autorisée par la loi applicable, le distributeur d\'applications n\'aura aucune autre obligation de garantie quelle qu\'elle soit concernant l\'application ; (4) vous déclarez et garantissez que (i) vous n\'êtes pas situé dans un pays soumis à un embargo du gouvernement américain, ou qui a été désigné par le gouvernement américain comme un pays « soutenant le terrorisme » et (ii) vous ne figurez sur aucune liste du gouvernement américain de parties interdites ou restreintes ; (5) vous devez vous conformer aux conditions générales applicables des tiers lorsque vous utilisez l\'application, par exemple, si vous avez une application VoIP, vous ne devez pas enfreindre leur contrat de service de données sans fil lorsque vous utilisez l\'application ; et (6) vous reconnaissez et acceptez que les distributeurs d\'applications sont des bénéficiaires tiers des termes et conditions de cette licence d\'application mobile contenus dans ces conditions juridiques, et que chaque distributeur d\'applications aura le droit (et sera réputé avoir accepté le droit) de faire respecter les termes et conditions de cette licence d\'application mobile contenus dans ces conditions juridiques contre vous en tant que tiers bénéficiaire de celles-ci.',
    },
    'db8tsf05': {
      'en': '9. SERVICES MANAGEMENT',
      'es': '9. GESTIÓN DE SERVICIOS',
      'fr': '9. GESTION DES SERVICES',
    },
    'byblts2j': {
      'en':
          'We reserve the right, but not the obligation, to: (1) monitor the Services for violations of these Legal Terms; (2) take appropriate legal action against anyone who, in our sole discretion, violates the law or these Legal Terms, including without limitation, reporting such user to law enforcement authorities; (3) in our sole discretion and without limitation, refuse, restrict access to, limit the availability of, or disable (to the extent technologically feasible) any of your Contributions or any portion thereof; (4) in our sole discretion and without limitation, notice, or liability, to remove from the Services or otherwise disable all files and content that are excessive in size or are in any way burdensome to our systems; and (5) otherwise manage the Services in a manner designed to protect our rights and property and to facilitate the proper functioning of the Services.',
      'es':
          'Nos reservamos el derecho, pero no la obligación, de: (1) monitorear los Servicios para detectar violaciones de estos Términos Legales; (2) tomar las medidas legales apropiadas contra cualquier persona que, a nuestro exclusivo criterio, viole la ley o estos Términos Legales, incluyendo, sin limitación, reportar a dicho usuario a las autoridades policiales; (3) a nuestro exclusivo criterio y sin limitación, rechazar, restringir el acceso, limitar la disponibilidad o deshabilitar (en la medida que sea tecnológicamente posible) cualquiera de sus Contribuciones o cualquier parte de las mismas; (4) a nuestro exclusivo criterio y sin limitación, aviso o responsabilidad, eliminar de los Servicios o deshabilitar de otra manera todos los archivos y contenidos que sean excesivos en tamaño o que sean de alguna manera una carga para nuestros sistemas; y (5) administrar de otra manera los Servicios de una manera diseñada para proteger nuestros derechos y propiedad y facilitar el funcionamiento adecuado de los Servicios.',
      'fr':
          'Nous nous réservons le droit, mais non l\'obligation, de : (1) surveiller les Services pour détecter toute violation des présentes Conditions légales ; (2) prendre les mesures juridiques appropriées contre quiconque, à notre seule discrétion, viole la loi ou les présentes Conditions légales, y compris, sans limitation, signaler cet utilisateur aux autorités chargées de l\'application de la loi ; (3) à notre seule discrétion et sans limitation, refuser, restreindre l\'accès, limiter la disponibilité ou désactiver (dans la mesure où cela est technologiquement possible) l\'une quelconque de vos Contributions ou toute partie de celles-ci ; (4) à notre seule discrétion et sans limitation, préavis ou responsabilité, de supprimer des Services ou de désactiver de toute autre manière tous les fichiers et contenus qui sont de taille excessive ou qui sont de quelque manière que ce soit encombrants pour nos systèmes ; et (5) gérer par ailleurs les Services d\'une manière conçue pour protéger nos droits et notre propriété et pour faciliter le bon fonctionnement des Services.',
    },
    'euajnlxk': {
      'en': '10. PRIVACY POLICY',
      'es': '10. POLÍTICA DE PRIVACIDAD',
      'fr': '10. POLITIQUE DE CONFIDENTIALITÉ',
    },
    'ed690drc': {
      'en':
          'We care about data privacy and security. Please review our Privacy Policy By using the Services, you agree to be bound by our Privacy Policy, which is incorporated into these Legal Terms. Please be advised the Services are hosted in the United States. If you access the Services from any other region of the world with laws or other requirements governing personal data collection, use, or disclosure that differ from applicable laws in the United States, then through your continued use of the Services, you are transferring your data to the United States, and you expressly consent to have your data transferred to and processed in the United States.',
      'es':
          'Nos preocupamos por la privacidad y la seguridad de los datos. Revise nuestra Política de privacidad: __________. Al utilizar los Servicios, usted acepta estar sujeto a nuestra Política de privacidad, que se incorpora a estos Términos legales. Tenga en cuenta que los Servicios están alojados en los Estados Unidos. Si accede a los Servicios desde cualquier otra región del mundo con leyes u otros requisitos que rijan la recopilación, el uso o la divulgación de datos personales que difieran de las leyes aplicables en los Estados Unidos, entonces, a través de su uso continuo de los Servicios, está transfiriendo sus datos a los Estados Unidos y da su consentimiento expreso para que sus datos se transfieran y procesen en los Estados Unidos.',
      'fr':
          'Nous nous soucions de la confidentialité et de la sécurité des données. Veuillez consulter notre politique de confidentialité : __________. En utilisant les Services, vous acceptez d\'être lié par notre politique de confidentialité, qui est intégrée aux présentes conditions juridiques. Veuillez noter que les Services sont hébergés aux États-Unis. Si vous accédez aux Services depuis toute autre région du monde dont les lois ou autres exigences régissant la collecte, l\'utilisation ou la divulgation de données personnelles diffèrent des lois applicables aux États-Unis, alors, par votre utilisation continue des Services, vous transférez vos données aux États-Unis et vous consentez expressément à ce que vos données soient transférées et traitées aux États-Unis.',
    },
    '3ngk6cou': {
      'en': '11. TERMS AND TERMINATION',
      'es': '11. TÉRMINOS Y TERMINACIÓN',
      'fr': '11. CONDITIONS ET RÉSILIATION',
    },
    'l8emd0v7': {
      'en':
          'These Legal Terms shall remain in full force and effect while you use the Services. WITHOUT LIMITING ANY OTHER PROVISION OF THESE LEGAL TERMS, WE RESERVE THE RIGHT TO, IN OUR SOLE DISCRETION AND WITHOUT NOTICE OR LIABILITY, DENY ACCESS TO AND USE OF THE SERVICES (INCLUDING BLOCKING CERTAIN IP ADDRESSES), TO ANY PERSON FOR ANY REASON OR FOR NO REASON, INCLUDING WITHOUT LIMITATION FOR BREACH OF ANY REPRESENTATION, WARRANTY, OR COVENANT CONTAINED IN THESE LEGAL TERMS OR OF ANY APPLICABLE LAW OR REGULATION. WE MAY TERMINATE YOUR USE OR PARTICIPATION IN THE SERVICES OR DELETE YOUR ACCOUNT AND ANY CONTENT OR INFORMATION THAT YOU POSTED AT ANY TIME, WITHOUT WARNING, IN OUR SOLE DISCRETION.\n\nIf we terminate or suspend your account for any reason, you are prohibited from registering and creating a new account under your name, a fake or borrowed name, or the name of any third party, even if you may be acting on behalf of the third party. In addition to terminating or suspending your account, we reserve the right to take appropriate legal action, including without limitation pursuing civil, criminal, and injunctive redress.',
      'es':
          'Estos Términos legales permanecerán en pleno vigor y efecto mientras usted utilice los Servicios. SIN LIMITAR NINGUNA OTRA DISPOSICIÓN DE ESTOS TÉRMINOS LEGALES, NOS RESERVAMOS EL DERECHO, A NUESTRA ENTERA DISCRECIÓN Y SIN PREVIO AVISO NI RESPONSABILIDAD, DE NEGAR EL ACCESO Y EL USO DE LOS SERVICIOS (INCLUIDO EL BLOQUEO DE CIERTAS DIRECCIONES IP), A CUALQUIER PERSONA POR CUALQUIER MOTIVO O SIN MOTIVO ALGUNO, INCLUYENDO, SIN LIMITACIÓN, POR INCUMPLIMIENTO DE CUALQUIER REPRESENTACIÓN, GARANTÍA O PACTO CONTENIDO EN ESTOS TÉRMINOS LEGALES O DE CUALQUIER LEY O REGLAMENTO APLICABLE. PODEMOS TERMINAR SU USO O PARTICIPACIÓN EN LOS SERVICIOS O ELIMINAR SU CUENTA Y CUALQUIER CONTENIDO O INFORMACIÓN QUE HAYA PUBLICADO EN CUALQUIER MOMENTO, SIN PREVIO AVISO, A NUESTRA ENTERA DISCRECIÓN.\n\n\n\nSi cancelamos o suspendemos su cuenta por cualquier motivo, no podrá registrarse ni crear una nueva cuenta con su nombre, un nombre falso o prestado, o el nombre de un tercero, incluso si actúa en nombre de dicho tercero. Además de cancelar o suspender su cuenta, nos reservamos el derecho de tomar las medidas legales correspondientes, incluidas, entre otras, las acciones civiles, penales y cautelares.',
      'fr':
          'Les présentes conditions juridiques resteront pleinement en vigueur tant que vous utiliserez les services. SANS LIMITER TOUTE AUTRE DISPOSITION DES PRÉSENTES CONDITIONS JURIDIQUES, NOUS NOUS RÉSERVONS LE DROIT, À NOTRE SEULE DISCRÉTION ET SANS PRÉAVIS NI RESPONSABILITÉ, DE REFUSER L\'ACCÈS ET L\'UTILISATION DES SERVICES (Y COMPRIS LE BLOCAGE DE CERTAINES ADRESSES IP), À TOUTE PERSONNE POUR QUELQUE RAISON QUE CE SOIT OU SANS RAISON, Y COMPRIS SANS LIMITATION POUR VIOLATION DE TOUTE REPRÉSENTATION, GARANTIE OU ENGAGEMENT CONTENU DANS LES PRÉSENTES CONDITIONS JURIDIQUES OU DE TOUTE LOI OU RÉGLEMENTATION APPLICABLE. NOUS POUVONS METTRE FIN À VOTRE UTILISATION OU PARTICIPATION AUX SERVICES OU SUPPRIMER VOTRE COMPTE ET TOUT CONTENU OU INFORMATION QUE VOUS AVEZ PUBLIÉ À TOUT MOMENT, SANS AVERTISSEMENT, À NOTRE SEULE DISCRÉTION.\n\n\n\nSi nous résilions ou suspendons votre compte pour quelque raison que ce soit, il vous est interdit de vous inscrire et de créer un nouveau compte sous votre nom, un nom fictif ou emprunté, ou le nom d\'un tiers, même si vous agissez au nom de ce tiers. En plus de résilier ou de suspendre votre compte, nous nous réservons le droit de prendre les mesures juridiques appropriées, y compris, sans limitation, de demander réparation civile, pénale et injonctive.',
    },
    'v6o0w818': {
      'en': '12. MODIFICATIONS AND INTERRUPTIONS',
      'es': '12. MODIFICACIONES E INTERRUPCIONES',
      'fr': '12. MODIFICATIONS ET INTERRUPTIONS',
    },
    'hrcz3eh5': {
      'en':
          'We reserve the right to change, modify, or remove the contents of the Services at any time or for any reason at our sole discretion without notice. However, we have no obligation to update any information on our Services. We will not be liable to you or any third party for any modification, price change, suspension, or discontinuance of the Services.\n\nWe cannot guarantee the Services will be available at all times. We may experience hardware, software, or other problems or need to perform maintenance related to the Services, resulting in interruptions, delays, or errors. We reserve the right to change, revise, update, suspend, discontinue, or otherwise modify the Services at any time or for any reason without notice to you. You agree that we have no liability whatsoever for any loss, damage, or inconvenience caused by your inability to access or use the Services during any downtime or discontinuance of the Services. Nothing in these Legal Terms will be construed to obligate us to maintain and support the Services or to supply any corrections, updates, or releases in connection therewith.',
      'es':
          'Nos reservamos el derecho de cambiar, modificar o eliminar el contenido de los Servicios en cualquier momento o por cualquier motivo, a nuestra entera discreción y sin previo aviso. Sin embargo, no tenemos obligación de actualizar ninguna información sobre nuestros Servicios. No seremos responsables ante usted ni ante ningún tercero por ninguna modificación, cambio de precio, suspensión o interrupción de los Servicios.\n\n\nNo podemos garantizar que los Servicios estén disponibles en todo momento. Podemos experimentar problemas de hardware, software u otros, o necesitar realizar tareas de mantenimiento relacionadas con los Servicios, lo que resultaría en interrupciones, demoras o errores. Nos reservamos el derecho de cambiar, revisar, actualizar, suspender, interrumpir o modificar de otro modo los Servicios en cualquier momento o por cualquier motivo sin previo aviso. Usted acepta que no tenemos responsabilidad alguna por ninguna pérdida, daño o inconveniente causado por su incapacidad para acceder o usar los Servicios durante cualquier tiempo de inactividad o interrupción de los Servicios. Nada de lo dispuesto en estos Términos legales se interpretará como una obligación para nosotros de mantener y respaldar los Servicios o de proporcionar correcciones, actualizaciones o publicaciones en relación con los mismos.',
      'fr':
          'Nous nous réservons le droit de modifier ou de supprimer le contenu des Services à tout moment ou pour quelque raison que ce soit, à notre seule discrétion et sans préavis. Cependant, nous n\'avons aucune obligation de mettre à jour les informations sur nos Services. Nous ne serons pas responsables envers vous ou tout tiers de toute modification, changement de prix, suspension ou interruption des Services.\n\n\nNous ne pouvons pas garantir que les Services seront disponibles à tout moment. Nous pouvons rencontrer des problèmes matériels, logiciels ou autres ou avoir besoin d\'effectuer une maintenance liée aux Services, entraînant des interruptions, des retards ou des erreurs. Nous nous réservons le droit de modifier, réviser, mettre à jour, suspendre, interrompre ou modifier de toute autre manière les Services à tout moment ou pour quelque raison que ce soit sans préavis. Vous acceptez que nous n\'ayons aucune responsabilité pour toute perte, dommage ou inconvénient causé par votre incapacité à accéder ou à utiliser les Services pendant toute période d\'indisponibilité ou interruption des Services. Rien dans les présentes Conditions légales ne sera interprété comme nous obligeant à maintenir et à prendre en charge les Services ou à fournir des corrections, mises à jour ou versions en rapport avec ceux-ci.',
    },
    't1id21cy': {
      'en': '13. GOVERNING LAW',
      'es': '13. LEY APLICABLE',
      'fr': '13. LOI APPLICABLE',
    },
    'mmp0xf2c': {
      'en':
          'These Legal Terms and your use of the Services are governed by and construed in accordance with the laws of the State of Georgia applicable to agreements made and to be entirely performed within the State of Georgia, without regard to its conflict of law principles.',
      'es':
          'Estos Términos legales y su uso de los Servicios se rigen e interpretan de conformidad con las leyes del Estado de __________ aplicables a los acuerdos celebrados y que se ejecutarán íntegramente dentro del Estado de __________, sin tener en cuenta sus principios de conflicto de leyes.',
      'fr':
          'Les présentes conditions juridiques et votre utilisation des services sont régies et interprétées conformément aux lois de l\'État de __________ applicables aux accords conclus et devant être entièrement exécutés dans l\'État de __________, sans égard à ses principes de conflit de lois.',
    },
    '8bni2r03': {
      'en': '14. DISPUTE RESOLUTION',
      'es': '14. RESOLUCIÓN DE DISPUTAS',
      'fr': '14. RÉSOLUTION DES LITIGES',
    },
    'ne0tosf9': {
      'en': 'Informal Negotiations',
      'es': 'Negociaciones informales',
      'fr': 'Négociations informelles',
    },
    'v7vn76na': {
      'en':
          'To expedite resolution and control the cost of any dispute, controversy, or claim related to these Legal Terms (each a \"Dispute\" and collectively, the \"Disputes\") brought by either you or us (individually, a \"Party\" and collectively, the \"Parties\"), the Parties agree to first attempt to negotiate any Dispute (except those Disputes expressly provided below) informally for at least 30 days before initiating arbitration. Such informal negotiations commence upon written notice from one Party to the other Party.',
      'es':
          'Para acelerar la resolución y controlar el costo de cualquier disputa, controversia o reclamo relacionado con estos Términos legales (cada uno una \"Disputa\" y colectivamente, las \"Disputas\") presentada por usted o por nosotros (individualmente, una \"Parte\" y colectivamente, las \"Partes\"), las Partes acuerdan primero intentar negociar cualquier Disputa (excepto aquellas Disputas expresamente previstas a continuación) de manera informal durante al menos ______30____ días antes de iniciar el arbitraje. Dichas negociaciones informales comienzan mediante una notificación por escrito de una Parte a la otra Parte.',
      'fr':
          'Afin d\'accélérer la résolution et de contrôler le coût de tout litige, controverse ou réclamation lié aux présentes Conditions juridiques (chacun étant un « Litige » et collectivement, les « Litiges ») porté par vous ou par nous (individuellement, une « Partie » et collectivement, les « Parties »), les Parties conviennent de tenter d\'abord de négocier tout Litige (à l\'exception des Litiges expressément prévus ci-dessous) de manière informelle pendant au moins ______30____ jours avant d\'engager l\'arbitrage. Ces négociations informelles commencent sur notification écrite d\'une Partie à l\'autre Partie.',
    },
    '61qmabt5': {
      'en': 'Binding Arbitration',
      'es': 'Arbitraje vinculante',
      'fr': 'Arbitrage exécutoire',
    },
    'fe4xmvnu': {
      'en':
          'Any dispute, claim, or controversy arising out of or relating to these Legal Terms, including the breach, termination, enforcement, interpretation, or validity thereof, shall be resolved exclusively through final and binding arbitration administered by the American Arbitration Association (AAA) under its Commercial Arbitration Rules. The number of arbitrators shall be two (2), unless otherwise agreed by the parties. The seat, or legal place, of arbitration shall be Alpharetta, Georgia, and the arbitration shall be conducted in the English language. The governing law of these Legal Terms shall be the substantive law of the State of Georgia, without regard to conflict of laws principles. Each party shall bear its own costs, except as otherwise required by the arbitrator\'s award. The parties agree that any arbitration under these terms shall be conducted on an individual basis and not as a class action or other representative proceeding.',
      'es':
          'Cualquier disputa que surja de o en relación con estos Términos legales, incluida cualquier cuestión relativa a su existencia, validez o terminación, se remitirá y resolverá de forma definitiva al Tribunal de Arbitraje Comercial Internacional de la Cámara de Arbitraje Europea (Bélgica, Bruselas, Avenue Louise, 146) de acuerdo con el Reglamento de este ICAC, que, como resultado de la remisión a él, se considera parte de esta cláusula. El número de árbitros será __________. La sede, o lugar legal, del arbitraje será __________. El idioma de los procedimientos será __________. La ley aplicable a estos Términos legales será la ley sustantiva de __________.',
      'fr':
          'Tout litige découlant des présentes Conditions légales ou en rapport avec celles-ci, y compris toute question relative à leur existence, leur validité ou leur résiliation, sera soumis et définitivement résolu par la Cour d\'arbitrage commercial international de la Chambre d\'arbitrage européenne (Belgique, Bruxelles, Avenue Louise, 146) conformément aux règles de la présente ICAC, qui, en conséquence de sa saisine, est considérée comme faisant partie de la présente clause. Le nombre d\'arbitres sera de __________. Le siège, ou lieu juridique, de l\'arbitrage sera de __________. La langue de la procédure sera __________. Le droit applicable aux présentes Conditions légales sera le droit matériel de __________.',
    },
    'ft7jg3k8': {
      'en': 'Restrictions',
      'es': 'Restricciones',
      'fr': 'Restrictions',
    },
    'wxqq6157': {
      'en':
          'The Parties agree that any arbitration shall be limited to the Dispute between the Parties individually. To the full extent permitted by law, (a) no arbitration shall be joined with any other proceeding; (b) there is no right or authority for any Dispute to be arbitrated on a class-action basis or to utilize class action procedures; and (c) there is no right or authority for any Dispute to be brought in a purported representative capacity on behalf of the general public or any other persons.',
      'es':
          'Las Partes acuerdan que cualquier arbitraje se limitará a la Disputa entre las Partes individualmente. En la medida máxima permitida por la ley, (a) ningún arbitraje se combinará con ningún otro procedimiento; (b) no existe ningún derecho ni autoridad para que ninguna Disputa sea arbitrada sobre la base de una demanda colectiva o para utilizar procedimientos de demanda colectiva; y (c) no existe ningún derecho ni autoridad para que ninguna Disputa sea presentada en una supuesta capacidad representativa en nombre del público en general o de cualquier otra persona.',
      'fr':
          'Les Parties conviennent que tout arbitrage sera limité au litige entre les Parties individuellement. Dans toute la mesure permise par la loi, (a) aucun arbitrage ne sera joint à une autre procédure ; (b) il n\'existe aucun droit ni aucune autorité pour qu\'un litige soit arbitré sur la base d\'un recours collectif ou pour utiliser des procédures de recours collectif ; et (c) il n\'existe aucun droit ni aucune autorité pour qu\'un litige soit porté devant une instance à titre de représentant présumé au nom du grand public ou de toute autre personne.',
    },
    'nx1yaez4': {
      'en': 'Exceptions to Informal Negotiations and Arbitration',
      'es': 'Excepciones a las negociaciones informales y al arbitraje',
      'fr': 'Exceptions aux négociations informelles et à l’arbitrage',
    },
    'yaavkt9n': {
      'en':
          'The Parties agree that the following Disputes are not subject to the above provisions concerning informal negotiations binding arbitration: (a) any Disputes seeking to enforce or protect, or concerning the validity of, any of the intellectual property rights of a Party; (b) any Dispute related to, or arising from, allegations of theft, piracy, invasion of privacy, or unauthorized use; and (c) any claim for injunctive relief. If this provision is found to be illegal or unenforceable, then neither Party will elect to arbitrate any Dispute falling within that portion of this provision found to be illegal or unenforceable and such Dispute shall be decided by a court of competent jurisdiction within the courts listed for jurisdiction above, and the Parties agree to submit to the personal jurisdiction of that court.',
      'es':
          'Las Partes acuerdan que las siguientes Disputas no están sujetas a las disposiciones anteriores relativas a las negociaciones informales vinculantes al arbitraje: (a) cualquier Disputa que busque hacer cumplir o proteger, o que se refiera a la validez de, cualquiera de los derechos de propiedad intelectual de una Parte; (b) cualquier Disputa relacionada con, o que surja de, acusaciones de robo, piratería, invasión de la privacidad o uso no autorizado; y (c) cualquier reclamo de medidas cautelares. Si se determina que esta disposición es ilegal o inaplicable, entonces ninguna de las Partes optará por arbitrar ninguna Disputa que se encuentre dentro de la parte de esta disposición que se determine que es ilegal o inaplicable y dicha Disputa será decidida por un tribunal de jurisdicción competente dentro de los tribunales enumerados para la jurisdicción anteriormente, y las Partes acuerdan someterse a la jurisdicción personal de ese tribunal.',
      'fr':
          'Les Parties conviennent que les Litiges suivants ne sont pas soumis aux dispositions ci-dessus concernant les négociations informelles et l\'arbitrage exécutoire : (a) tout Litige visant à faire respecter ou à protéger, ou concernant la validité de l\'un des droits de propriété intellectuelle d\'une Partie ; (b) tout Litige lié à, ou découlant d\'allégations de vol, de piratage, d\'atteinte à la vie privée ou d\'utilisation non autorisée ; et (c) toute demande de mesures injonctives. Si cette disposition est jugée illégale ou inapplicable, aucune des Parties ne choisira d\'arbitrer tout Litige relevant de la partie de cette disposition jugée illégale ou inapplicable et ce Litige sera tranché par un tribunal compétent parmi les tribunaux énumérés ci-dessus pour la compétence, et les Parties conviennent de se soumettre à la compétence personnelle de ce tribunal.',
    },
    'mflm4v1q': {
      'en': '15. CORRECTIONS',
      'es': '15. CORRECCIONES',
      'fr': '15. RECTIFICATIONS',
    },
    'utqqjcjx': {
      'en':
          'There may be information on the Services that contains typographical errors, inaccuracies, or omissions, including descriptions, pricing, availability, and various other information. We reserve the right to correct any errors, inaccuracies, or omissions and to change or update the information on the Services at any time, without prior notice.',
      'es':
          'Es posible que haya información en los Servicios que contenga errores tipográficos, inexactitudes u omisiones, incluidas descripciones, precios, disponibilidad y otra información diversa. Nos reservamos el derecho de corregir cualquier error, inexactitud u omisión y de cambiar o actualizar la información en los Servicios en cualquier momento, sin previo aviso.',
      'fr':
          'Il est possible que certaines informations contenues dans les Services contiennent des erreurs typographiques, des inexactitudes ou des omissions, notamment en ce qui concerne les descriptions, les prix, la disponibilité et diverses autres informations. Nous nous réservons le droit de corriger toute erreur, inexactitude ou omission et de modifier ou de mettre à jour les informations contenues dans les Services à tout moment, sans préavis.',
    },
    '66n4qiae': {
      'en': '16. DISCLAIMER',
      'es': '16. DESCARGO DE RESPONSABILIDAD',
      'fr': '16. AVERTISSEMENT',
    },
    '2nwb0eqa': {
      'en':
          'THE SERVICES ARE PROVIDED ON AN AS-IS AND AS-AVAILABLE BASIS. YOU AGREE THAT YOUR USE OF THE SERVICES WILL BE AT YOUR SOLE RISK. TO THE FULLEST EXTENT PERMITTED BY LAW, WE DISCLAIM ALL WARRANTIES, EXPRESS OR IMPLIED, IN CONNECTION WITH THE SERVICES AND YOUR USE THEREOF, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, AND NON-INFRINGEMENT. WE MAKE NO WARRANTIES OR REPRESENTATIONS ABOUT THE ACCURACY OR COMPLETENESS OF THE SERVICES\' CONTENT OR THE CONTENT OF ANY WEBSITES OR MOBILE APPLICATIONS LINKED TO THE SERVICES AND WE WILL ASSUME NO LIABILITY OR RESPONSIBILITY FOR ANY (1) ERRORS, MISTAKES, OR INACCURACIES OF CONTENT AND MATERIALS, (2) PERSONAL INJURY OR PROPERTY DAMAGE, OF ANY NATURE WHATSOEVER, RESULTING FROM YOUR ACCESS TO AND USE OF THE SERVICES, (3) ANY UNAUTHORIZED ACCESS TO OR USE OF OUR SECURE SERVERS AND/OR ANY AND ALL PERSONAL INFORMATION AND/OR FINANCIAL INFORMATION STORED THEREIN, (4) ANY INTERRUPTION OR CESSATION OF TRANSMISSION TO OR FROM THE SERVICES, (5) ANY BUGS, VIRUSES, TROJAN HORSES, OR THE LIKE WHICH MAY BE TRANSMITTED TO OR THROUGH THE SERVICES BY ANY THIRD PARTY, AND/OR (6) ANY ERRORS OR OMISSIONS IN ANY CONTENT AND MATERIALS OR FOR ANY LOSS OR DAMAGE OF ANY KIND INCURRED AS A RESULT OF THE USE OF ANY CONTENT POSTED, TRANSMITTED, OR OTHERWISE MADE AVAILABLE VIA THE SERVICES. WE DO NOT WARRANT, ENDORSE, GUARANTEE, OR ASSUME RESPONSIBILITY FOR ANY PRODUCT OR SERVICE ADVERTISED OR OFFERED BY A THIRD PARTY THROUGH THE SERVICES, ANY HYPERLINKED WEBSITE, OR ANY WEBSITE OR MOBILE APPLICATION FEATURED IN ANY BANNER OR OTHER ADVERTISING, AND WE WILL NOT BE A PARTY TO OR IN ANY WAY BE RESPONSIBLE FOR MONITORING ANY TRANSACTION BETWEEN YOU AND ANY THIRD-PARTY PROVIDERS OF PRODUCTS OR SERVICES. AS WITH THE PURCHASE OF A PRODUCT OR SERVICE THROUGH ANY MEDIUM OR IN ANY ENVIRONMENT, YOU SHOULD USE YOUR BEST JUDGMENT AND EXERCISE CAUTION WHERE APPROPRIATE.',
      'es':
          'LOS SERVICIOS SE PROPORCIONAN EN EL ESTADO EN QUE SE ENCUENTRAN Y SEGÚN DISPONIBILIDAD. USTED ACEPTA QUE SU USO DE LOS SERVICIOS SERÁ BAJO SU PROPIA RESPONSABILIDAD. EN LA MEDIDA EN QUE LA LEY LO PERMITA, RENUNCIAMOS A TODAS LAS GARANTÍAS, EXPRESAS O IMPLÍCITAS, EN RELACIÓN CON LOS SERVICIOS Y SU USO DE LOS MISMOS, INCLUYENDO, SIN LIMITACIÓN, LAS GARANTÍAS IMPLÍCITAS DE COMERCIABILIDAD, IDONEIDAD PARA UN PROPÓSITO PARTICULAR Y NO INFRACCIÓN. NO OFRECEMOS GARANTÍAS NI REPRESENTACIONES SOBRE LA PRECISIÓN O INTEGRIDAD DEL CONTENIDO DE LOS SERVICIOS O EL CONTENIDO DE CUALQUIER SITIO WEB O APLICACIÓN MÓVIL VINCULADA A LOS SERVICIOS Y NO ASUMIREMOS NINGUNA RESPONSABILIDAD U OBLIGACIÓN POR (1) ERRORES, EQUIVOCACIONES O INEXACTITUDES DEL CONTENIDO Y MATERIALES, (2) LESIONES PERSONALES O DAÑOS MATERIALES, DE CUALQUIER NATURALEZA QUE SEAN, RESULTANTES DE SU ACCESO Y USO DE LOS SERVICIOS, (3) CUALQUIER ACCESO NO AUTORIZADO O USO DE NUESTROS SERVIDORES SEGUROS Y/O TODA Y CUALQUIER INFORMACIÓN PERSONAL Y/O INFORMACIÓN FINANCIERA ALMACENADA EN LOS MISMOS, (4) CUALQUIER INTERRUPCIÓN O CESE DE LA TRANSMISIÓN HACIA O DESDE LOS SERVICIOS, (5) CUALQUIER ERROR, VIRUS, TROYANOS O LOS SIMILARES QUE PUEDAN SER TRANSMITIDOS A O A TRAVÉS DE LOS SERVICIOS POR CUALQUIER TERCERO, Y/O (6) CUALQUIER ERROR U OMISIÓN EN CUALQUIER CONTENIDO Y MATERIALES O POR CUALQUIER PÉRDIDA O DAÑO DE CUALQUIER TIPO INCURRIDO COMO RESULTADO DEL USO DE CUALQUIER CONTENIDO PUBLICADO, TRANSMITIDO O HECHO DISPONIBLE DE OTRA MANERA A TRAVÉS DE LOS SERVICIOS. NO GARANTIZAMOS, RESPALDAMOS, GARANTIZAMOS NI ASUMIMOS RESPONSABILIDAD POR NINGÚN PRODUCTO O SERVICIO PUBLICITADO U OFRECIDO POR UN TERCERO A TRAVÉS DE LOS SERVICIOS, CUALQUIER SITIO WEB CON HIPERVÍNCULO O CUALQUIER SITIO WEB O APLICACIÓN MÓVIL QUE APAREZCA EN CUALQUIER BANNER U OTRO ANUNCIO, Y NO SEREMOS PARTE NI SEREMOS RESPONSABLES DE NINGUNA MANERA DE MONITOREAR CUALQUIER TRANSACCIÓN ENTRE USTED Y CUALQUIER TERCERO PROVEEDOR DE PRODUCTOS O SERVICIOS. AL IGUAL QUE CON LA COMPRA DE UN PRODUCTO O SERVICIO A TRAVÉS DE CUALQUIER MEDIO O EN CUALQUIER ENTORNO, DEBE USAR SU MEJOR JUICIO Y TENER PRECAUCIÓN CUANDO SEA APROPIADO.',
      'fr':
          'LES SERVICES SONT FOURNIS « TELS QUELS » ET « TELS QUE DISPONIBLES ». VOUS CONVENEZ QUE VOUS UTILISEZ LES SERVICES À VOS PROPRES RISQUES. DANS TOUTE LA MESURE PERMISE PAR LA LOI, NOUS DÉCLINONS TOUTE GARANTIE, EXPRESSE OU IMPLICITE, EN RELATION AVEC LES SERVICES ET VOTRE UTILISATION DE CEUX-CI, Y COMPRIS, SANS LIMITATION, LES GARANTIES IMPLICITES DE QUALITÉ MARCHANDE, D\'ADÉQUATION À UN USAGE PARTICULIER ET DE NON-CONTREFAÇON. NOUS NE FAISONS AUCUNE GARANTIE OU REPRÉSENTATION QUANT À L\'EXACTITUDE OU À L\'EXHAUSTIVITÉ DU CONTENU DES SERVICES OU DU CONTENU DE TOUT SITE WEB OU APPLICATION MOBILE LIÉ AUX SERVICES ET NOUS N\'ASSUMONS AUCUNE RESPONSABILITÉ POUR (1) TOUTE ERREUR, FAUTE OU INEXACTITUDE DU CONTENU ET DES MATÉRIAUX, (2) TOUTE BLESSURE CORPORELLE OU DOMMAGE MATÉRIEL, DE QUELQUE NATURE QUE CE SOIT, RÉSULTANT DE VOTRE ACCÈS ET DE VOTRE UTILISATION DES SERVICES, (3) TOUT ACCÈS OU UTILISATION NON AUTORISÉ DE NOS SERVEURS SÉCURISÉS ET/OU DE TOUTES LES INFORMATIONS PERSONNELLES ET/OU FINANCIÈRES QUI Y SONT STOCKÉES, (4) TOUTE INTERRUPTION OU CESSATION DE TRANSMISSION VERS OU DEPUIS LES SERVICES, (5) TOUT BOGUE, VIRUS, CHEVAL DE TROIE OU LES ÉLÉMENTS SIMILAIRES POUVANT ÊTRE TRANSMIS AUX SERVICES OU PAR LEUR INTERMÉDIAIRE PAR UN TIERS, ET/OU (6) TOUTE ERREUR OU OMISSION DANS TOUT CONTENU ET MATÉRIEL OU POUR TOUTE PERTE OU DOMMAGE DE QUELQUE NATURE QUE CE SOIT RÉSULTANT DE L\'UTILISATION DE TOUT CONTENU PUBLIÉ, TRANSMIS OU AUTREMENT RENDU DISPONIBLE VIA LES SERVICES. NOUS NE GARANTISSONS PAS, N\'APPROUVONS PAS, ET N\'ASSUMONS AUCUNE RESPONSABILITÉ POUR TOUT PRODUIT OU SERVICE ANNONCÉ OU OFFERT PAR UN TIERS PAR LE BIAIS DES SERVICES, DE TOUT SITE WEB HYPERLIÉ, OU DE TOUT SITE WEB OU APPLICATION MOBILE PRÉSENTÉ DANS UNE BANNIÈRE OU AUTRE PUBLICITÉ, ET NOUS NE SERONS PAS PARTIE À OU EN AUCUNE MANIÈRE RESPONSABLES DE LA SURVEILLANCE DE TOUTE TRANSACTION ENTRE VOUS ET TOUT FOURNISSEUR TIERS DE PRODUITS OU SERVICES. COMME POUR L\'ACHAT D\'UN PRODUIT OU D\'UN SERVICE PAR TOUT MOYEN OU DANS TOUT ENVIRONNEMENT, VOUS DEVEZ FAIRE PREUVE DE JUGEMENT ET DE PRUDENCE LE CAS ÉCHÉANT.',
    },
    'b4wti0cx': {
      'en': '17. LIMITATIONS OF LIABILITY',
      'es': '17. LIMITACIONES DE RESPONSABILIDAD',
      'fr': '17. LIMITATIONS DE RESPONSABILITÉ',
    },
    'n89mebga': {
      'en':
          'IN NO EVENT WILL WE OR OUR DIRECTORS, EMPLOYEES, OR AGENTS BE LIABLE TO YOU OR ANY THIRD PARTY FOR ANY DIRECT, INDIRECT, CONSEQUENTIAL, EXEMPLARY, INCIDENTAL, SPECIAL, OR PUNITIVE DAMAGES, INCLUDING LOST PROFIT, LOST REVENUE, LOSS OF DATA, OR OTHER DAMAGES ARISING FROM YOUR USE OF THE SERVICES, EVEN IF WE HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.',
      'es':
          'EN NINGÚN CASO NOSOTROS O NUESTROS DIRECTORES, EMPLEADOS O AGENTES SEREMOS RESPONSABLES ANTE USTED O CUALQUIER TERCERO POR CUALQUIER DAÑO DIRECTO, INDIRECTO, DERIVADO, EJEMPLAR, INCIDENTAL, ESPECIAL O PUNITIVO, INCLUYENDO PÉRDIDA DE BENEFICIOS, PÉRDIDA DE INGRESOS, PÉRDIDA DE DATOS U OTROS DAÑOS QUE SURJAN DE SU USO DE LOS SERVICIOS, INCLUSO SI HEMOS SIDO ADVERTIDOS DE LA POSIBILIDAD DE DICHOS DAÑOS.',
      'fr':
          'EN AUCUN CAS, NOUS OU NOS ADMINISTRATEURS, EMPLOYÉS OU AGENTS NE SERONS RESPONSABLES ENVERS VOUS OU TOUT TIERS DE TOUT DOMMAGE DIRECT, INDIRECT, CONSÉCUTIF, EXEMPLAIRE, ACCESSOIRE, SPÉCIAL OU PUNITIF, Y COMPRIS LA PERTE DE PROFIT, LA PERTE DE REVENUS, LA PERTE DE DONNÉES OU AUTRES DOMMAGES RÉSULTANT DE VOTRE UTILISATION DES SERVICES, MÊME SI NOUS AVONS ÉTÉ INFORMÉS DE LA POSSIBILITÉ DE TELS DOMMAGES.',
    },
    'qu6iliks': {
      'en': '18. INDEMNIFICATION',
      'es': '18. INDEMNIZACIÓN',
      'fr': '18. INDEMNISATION',
    },
    'x0t1lbys': {
      'en':
          'You agree to defend, indemnify, and hold us harmless, including our subsidiaries, affiliates, and all of our respective officers, agents, partners, and employees, from and against any loss, damage, liability, claim, or demand, including reasonable attorneys’ fees and expenses, made by any third party due to or arising out of: (1) use of the Services; (2) breach of these Legal Terms; (3) any breach of your representations and warranties set forth in these Legal Terms; (4) your violation of the rights of a third party, including but not limited to intellectual property rights; or (5) any overt harmful act toward any other user of the Services with whom you connected via the Services. Notwithstanding the foregoing, we reserve the right, at your expense, to assume the exclusive defense and control of any matter for which you are required to indemnify us, and you agree to cooperate, at your expense, with our defense of such claims. We will use reasonable efforts to notify you of any such claim, action, or proceeding which is subject to this indemnification upon becoming aware of it.',
      'es':
          'Usted acepta defendernos, indemnizarnos y eximirnos de responsabilidad, incluidas nuestras subsidiarias, afiliadas y todos nuestros respectivos funcionarios, agentes, socios y empleados, de y contra cualquier pérdida, daño, responsabilidad, reclamo o demanda, incluidos los honorarios y gastos razonables de abogados, realizados por un tercero debido a o que surja de: (1) el uso de los Servicios; (2) el incumplimiento de estos Términos legales; (3) cualquier incumplimiento de sus declaraciones y garantías establecidas en estos Términos legales; (4) su violación de los derechos de un tercero, incluidos, entre otros, los derechos de propiedad intelectual; o (5) cualquier acto dañino manifiesto hacia cualquier otro usuario de los Servicios con el que se conectó a través de los Servicios. Sin perjuicio de lo anterior, nos reservamos el derecho, a su cargo, de asumir la defensa y el control exclusivos de cualquier asunto por el que deba indemnizarnos, y usted acepta cooperar, a su cargo, con nuestra defensa de tales reclamos. Haremos todos los esfuerzos razonables para notificarle sobre cualquier reclamo, acción o procedimiento que esté sujeto a esta indemnización al tener conocimiento de ello.',
      'fr':
          'Vous acceptez de nous défendre, de nous indemniser et de nous dégager de toute responsabilité, y compris nos filiales, sociétés affiliées et tous nos dirigeants, agents, partenaires et employés respectifs, contre toute perte, tout dommage, toute responsabilité, toute réclamation ou toute demande, y compris les honoraires et frais d\'avocat raisonnables, formulés par un tiers en raison ou découlant de : (1) l\'utilisation des Services ; (2) la violation des présentes Conditions légales ; (3) toute violation de vos déclarations et garanties énoncées dans les présentes Conditions légales ; (4) votre violation des droits d\'un tiers, y compris, mais sans s\'y limiter, les droits de propriété intellectuelle ; ou (5) tout acte manifestement préjudiciable envers tout autre utilisateur des Services avec lequel vous vous êtes connecté via les Services. Nonobstant ce qui précède, nous nous réservons le droit, à vos frais, d\'assumer la défense et le contrôle exclusifs de toute question pour laquelle vous êtes tenu de nous indemniser, et vous acceptez de coopérer, à vos frais, à notre défense de telles réclamations. Nous déploierons des efforts raisonnables pour vous informer de toute réclamation, action ou procédure faisant l’objet de cette indemnisation dès que nous en aurons connaissance.',
    },
    'h1lk5fs4': {
      'en': '19. USER DATA',
      'es': '19. DATOS DEL USUARIO',
      'fr': '19. DONNÉES UTILISATEUR',
    },
    's3omg4wi': {
      'en':
          'We will maintain certain data that you transmit to the Services for the purpose of managing the performance of the Services, as well as data relating to your use of the Services. Although we perform regular routine backups of data, you are solely responsible for all data that you transmit or that relates to any activity you have undertaken using the Services. You agree that we shall have no liability to you for any loss or corruption of any such data, and you hereby waive any right of action against us arising from any such loss or corruption of such data.',
      'es':
          'Conservaremos determinados datos que transmita a los Servicios con el fin de gestionar el rendimiento de los Servicios, así como los datos relacionados con su uso de los Servicios. Aunque realizamos copias de seguridad periódicas de los datos, usted es el único responsable de todos los datos que transmita o que se relacionen con cualquier actividad que haya realizado utilizando los Servicios. Usted acepta que no tendremos ninguna responsabilidad ante usted por la pérdida o corrupción de dichos datos y, por la presente, renuncia a cualquier derecho de acción contra nosotros que surja de dicha pérdida o corrupción de dichos datos.',
      'fr':
          'Nous conserverons certaines données que vous transmettez aux Services dans le but de gérer les performances des Services, ainsi que les données relatives à votre utilisation des Services. Bien que nous effectuions régulièrement des sauvegardes de routine des données, vous êtes seul responsable de toutes les données que vous transmettez ou qui se rapportent à toute activité que vous avez entreprise en utilisant les Services. Vous acceptez que nous ne soyons pas responsables envers vous de toute perte ou corruption de ces données, et vous renoncez par la présente à tout droit d\'action contre nous découlant d\'une telle perte ou corruption de ces données.',
    },
    'vg0lefyv': {
      'en': '20.\tELECTRONIC COMMUNICATIONS, TRANSACTIONS, AND SIGNATURES',
      'es': '20. COMUNICACIONES, TRANSACCIONES Y FIRMAS ELECTRÓNICAS',
      'fr': '20. COMMUNICATIONS, TRANSACTIONS ET SIGNATURES ÉLECTRONIQUES',
    },
    '0gewmm5p': {
      'en':
          'Visiting the Services, sending us emails, and completing online forms constitute electronic communications. You consent to receive electronic communications, and you agree that all agreements, notices, disclosures, and other communications we provide to you electronically, via email and on the Services, satisfy any legal requirement that such communication be in writing. YOU HEREBY AGREE TO THE USE OF ELECTRONIC SIGNATURES, CONTRACTS, ORDERS, AND OTHER RECORDS, AND TO ELECTRONIC DELIVERY OF NOTICES, POLICIES, AND RECORDS OF TRANSACTIONS INITIATED OR COMPLETED BY US OR VIA THE SERVICES. You hereby waive any rights or requirements under any statutes, regulations, rules, ordinances, or other laws in any jurisdiction which require an original signature or delivery or retention of non-electronic records, or to payments or the granting of credits by any means other than electronic means.',
      'es':
          'Visitar los Servicios, enviarnos correos electrónicos y completar formularios en línea constituyen comunicaciones electrónicas. Usted acepta recibir comunicaciones electrónicas y acepta que todos los acuerdos, avisos, divulgaciones y otras comunicaciones que le proporcionamos electrónicamente, por correo electrónico y en los Servicios, satisfacen cualquier requisito legal de que dicha comunicación sea por escrito. USTED ACEPTA EL USO DE FIRMAS ELECTRÓNICAS, CONTRATOS, PEDIDOS Y OTROS REGISTROS, Y LA ENTREGA ELECTRÓNICA DE AVISOS, POLÍTICAS Y REGISTROS DE TRANSACCIONES INICIADAS O COMPLETADAS POR NOSOTROS O A TRAVÉS DE LOS SERVICIOS. Por la presente, usted renuncia a cualquier derecho o requisito bajo cualquier estatuto, reglamento, norma, ordenanza u otra ley en cualquier jurisdicción que requiera una firma original o la entrega o retención de registros no electrónicos, o a pagos u otorgamiento de créditos por cualquier medio que no sea electrónico.',
      'fr':
          'La visite des Services, l\'envoi de courriers électroniques et le remplissage de formulaires en ligne constituent des communications électroniques. Vous consentez à recevoir des communications électroniques et vous acceptez que tous les accords, avis, divulgations et autres communications que nous vous fournissons par voie électronique, par courrier électronique et sur les Services, satisfassent à toute exigence légale selon laquelle une telle communication doit être faite par écrit. VOUS ACCEPTEZ PAR LA PRÉSENTE L\'UTILISATION DE SIGNATURES, CONTRATS, COMMANDES ET AUTRES ENREGISTREMENTS ÉLECTRONIQUES, ET LA LIVRAISON ÉLECTRONIQUE D\'AVIS, POLITIQUES ET ENREGISTREMENTS DE TRANSACTIONS INITIÉES OU TERMINÉES PAR NOUS OU VIA LES SERVICES. Vous renoncez par la présente à tout droit ou exigence en vertu de toute loi, réglementation, règle, ordonnance ou autre loi dans toute juridiction qui exige une signature originale ou la livraison ou la conservation de documents non électroniques, ou à des paiements ou à l\'octroi de crédits par tout moyen autre que des moyens électroniques.',
    },
    '747e528t': {
      'en': '21.\tCALIFORNIA USERS AND RESIDENTS',
      'es': '21. USUARIOS Y RESIDENTES DE CALIFORNIA',
      'fr': '21. UTILISATEURS ET RÉSIDENTS DE CALIFORNIE',
    },
    'di1511ty': {
      'en':
          'If any complaint with us is not satisfactorily resolved, you can contact the Complaint Assistance Unit of the Division of Consumer Services of the California Department of Consumer Affairs in writing at 1625 North Market Blvd., Suite N 112, Sacramento, California 95834 or by telephone at (800) 952-5210 or (916) 445-1254.',
      'es':
          'Si alguna queja con nosotros no se resuelve satisfactoriamente, puede comunicarse con la Unidad de Asistencia de Quejas de la División de Servicios al Consumidor del Departamento de Asuntos del Consumidor de California por escrito a 1625 North Market Blvd., Suite N 112, Sacramento, California 95834 o por teléfono al (800) 952-5210 o (916) 445-1254.',
      'fr':
          'Si une réclamation auprès de nous n\'est pas résolue de manière satisfaisante, vous pouvez contacter l\'unité d\'assistance aux réclamations de la Division des services aux consommateurs du Département des affaires des consommateurs de Californie par écrit au 1625 North Market Blvd., Suite N 112, Sacramento, Californie 95834 ou par téléphone au (800) 952-5210 ou (916) 445-1254.',
    },
    'q7hu6eyu': {
      'en': '22.\tMISCELLANEOUS',
      'es': '22. MISCELÁNEOS',
      'fr': '22. DIVERS',
    },
    'c68imp0y': {
      'en':
          'These Legal Terms and any policies or operating rules posted by us on the Services or in respect to the Services constitute the entire agreement and understanding between you and us. Our failure to exercise or enforce any right or provision of these Legal Terms shall not operate as a waiver of such right or provision. These Legal Terms operate to the fullest extent permissible by law. We may assign any or all of our rights and obligations to others at any time. We shall not be responsible or liable for any loss, damage, delay, or failure to act caused by any cause beyond our reasonable control. If any provision or part of a provision of these Legal Terms is determined to be unlawful, void, or unenforceable, that provision or part of the provision is deemed severable from these Legal Terms and does not affect the validity and enforceability of any remaining provisions. There is no joint venture, partnership, employment or agency relationship created between you and us as a result of these Legal Terms or use of the Services. You agree that these Legal Terms will not be construed against us by virtue of having drafted them. You hereby waive any and all defenses you may have based on the electronic form of these Legal Terms and the lack of signing by the parties hereto to execute these Legal Terms.',
      'es':
          'Estos Términos legales y cualquier política o regla de funcionamiento publicada por nosotros en los Servicios o con respecto a los Servicios constituyen el acuerdo y entendimiento completo entre usted y nosotros. Nuestra falta de ejercicio o aplicación de cualquier derecho o disposición de estos Términos legales no funcionará como una renuncia a dicho derecho o disposición. Estos Términos legales operan en la máxima medida permitida por la ley. Podemos ceder cualquiera o todos nuestros derechos y obligaciones a otros en cualquier momento. No seremos responsables de ninguna pérdida, daño, demora o falta de acción causada por cualquier causa fuera de nuestro control razonable. Si alguna disposición o parte de una disposición de estos Términos legales se determina que es ilegal, nula o inaplicable, esa disposición o parte de la disposición se considerará separable de estos Términos legales y no afectará la validez y aplicabilidad de las disposiciones restantes. No se crea ninguna relación de empresa conjunta, sociedad, empleo o agencia entre usted y nosotros como resultado de estos Términos legales o el uso de los Servicios. Usted acepta que estos Términos legales no se interpretarán en nuestra contra en virtud de haberlos redactado. Por la presente, usted renuncia a todas y cada una de las defensas que pueda tener basadas en la forma electrónica de estos Términos Legales y la falta de firma de las partes para ejecutar estos Términos Legales.',
      'fr':
          'Les présentes Conditions légales et toutes les politiques ou règles de fonctionnement que nous publions sur les Services ou concernant les Services constituent l\'intégralité de l\'accord et de l\'entente entre vous et nous. Notre incapacité à exercer ou à appliquer un droit ou une disposition des présentes Conditions légales ne doit pas être interprétée comme une renonciation à ce droit ou à cette disposition. Les présentes Conditions légales s\'appliquent dans toute la mesure permise par la loi. Nous pouvons céder tout ou partie de nos droits et obligations à des tiers à tout moment. Nous ne serons pas responsables de toute perte, dommage, retard ou défaut d\'action causé par toute cause indépendante de notre volonté raisonnable. Si une disposition ou une partie d\'une disposition des présentes Conditions légales est jugée illégale, nulle ou inapplicable, cette disposition ou partie de la disposition est réputée dissociable des présentes Conditions légales et n\'affecte pas la validité et l\'applicabilité des dispositions restantes. Aucune relation de coentreprise, de partenariat, d\'emploi ou d\'agence n\'est créée entre vous et nous en raison des présentes Conditions légales ou de l\'utilisation des Services. Vous acceptez que les présentes Conditions légales ne soient pas interprétées à notre encontre du fait de les avoir rédigées. Vous renoncez par la présente à toute défense que vous pourriez avoir sur la base de la forme électronique des présentes Conditions juridiques et de l\'absence de signature par les parties aux présentes pour exécuter les présentes Conditions juridiques.',
    },
    'zrpry6r4': {
      'en': '23.\tCONTACT US',
      'es': '23. CONTÁCTENOS',
      'fr': '23. CONTACTEZ-NOUS',
    },
    'qev3kgow': {
      'en':
          'In order to resolve a complaint regarding the Services or to receive further information regarding use of the Services, please contact us at:',
      'es':
          'Para resolver una queja relacionada con los Servicios o para recibir más información sobre el uso de los Servicios, contáctenos a:',
      'fr':
          'Afin de résoudre une réclamation concernant les Services ou de recevoir de plus amples informations concernant l\'utilisation des Services, veuillez nous contacter à l\'adresse suivante :',
    },
    '88ivas4j': {
      'en':
          'LVTLABS\n13010 Morris Rd suite 650, Alpharetta, GA 30004, USA\nAlpharetta, GA 30004\nUnited States\nPhone: (+1)404-287-2384\ncontactus@lvtlabs.com',
      'es':
          'LVTLABS\n\n13010 Morris Rd suite 650, Alpharetta, GA 30004, EE. UU.\n\nAlpharetta, GA 30004\n\nEstados Unidos\n\nTeléfono: (+1)404-287-2384\n\ncontactus@lvtlabs.com',
      'fr':
          'LVTLABS\n\n13010 Morris Rd suite 650, Alpharetta, GA 30004, États-Unis\n\nAlpharetta, Géorgie 30004\n\nÉtats-Unis\n\nTéléphone : (+1)404-287-2384\n\ncontactus@lvtlabs.com',
    },
    'osu0pqrv': {
      'en': 'Contact Privacy Team',
      'es': 'Contactar al equipo de privacidad',
      'fr': 'Contactez l\'équipe de confidentialité',
    },
  },
  // NavigationBar
  {
    '9s67fm7k': {
      'en': 'Home',
      'es': '',
      'fr': '',
    },
    'sr8vrmdx': {
      'en': 'Home',
      'es': '',
      'fr': '',
    },
    '0edrwqbc': {
      'en': 'Profile',
      'es': '',
      'fr': '',
    },
    '7dtyor0r': {
      'en': 'Profile',
      'es': '',
      'fr': '',
    },
  },
  // Reminders
  {
    'p9iidnxh': {
      'en': 'Set Reminder',
      'es': '',
      'fr': '',
    },
    '3gq5rsqt': {
      'en': 'Choose any one reminder of your choice',
      'es': '',
      'fr': '',
    },
    '0zy8gcut': {
      'en': 'Enter reminder time',
      'es': '',
      'fr': '',
    },
    'bo4amt4y': {
      'en': 'Field is required...',
      'es': '',
      'fr': '',
    },
    '2bj2z8a7': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'oe4i1xms': {
      'en': 'Unit',
      'es': '',
      'fr': '',
    },
    '0y4o9723': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    'zasa75w5': {
      'en': 'min(s)',
      'es': '',
      'fr': '',
    },
    '0ienrzsm': {
      'en': 'hr(s)',
      'es': '',
      'fr': '',
    },
    'fefvyqhk': {
      'en': 'day(s)',
      'es': '',
      'fr': '',
    },
    'rd48a7s3': {
      'en': 'Set Reminder',
      'es': '',
      'fr': '',
    },
    '7g44nvun': {
      'en': 'Reminder set successfully...',
      'es': 'Informe enviado exitosamente...',
      'fr': 'Rapport envoyé avec succès...',
    },
    'mkowekse': {
      'en': 'There was an error. Try again...',
      'es': 'Se ha producido un error. Inténtalo de nuevo...',
      'fr': 'Une erreur s\'est produite. Réessayez...',
    },
  },
  // Deactivate
  {
    'jful9fqy': {
      'en': 'Enter your details',
      'es': '',
      'fr': '',
    },
    '43f84oiy': {
      'en': 'Enter your full name',
      'es': 'Ingresar OTP',
      'fr': 'Entrez OTP',
    },
    '2nx8k70v': {
      'en': 'Enter email address',
      'es': 'Ingresar OTP',
      'fr': 'Entrez OTP',
    },
    'xztl8gt5': {
      'en': 'Enter email OTP',
      'es': 'Ingresar OTP',
      'fr': 'Entrez OTP',
    },
    'fmtqiejd': {
      'en': 'Enter phone number',
      'es': 'Nueva contraseña',
      'fr': 'Nouveau mot de passe',
    },
    '95ev0f2v': {
      'en': 'Enter phone OTP',
      'es': 'Confirmar nueva contraseña',
      'fr': 'Confirmer le nouveau mot de passe',
    },
    'z61wwlpx': {
      'en': 'Submit',
      'es': 'Ver detalles',
      'fr': 'Voir les détails',
    },
    'pja5twbb': {
      'en': 'Phone Number is required',
      'es': 'El número de teléfono es obligatorio',
      'fr': 'Le numéro de téléphone est obligatoire',
    },
    'hygqsiu8': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '6f94sqgk': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    '5ghwgdu1': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'g8f2j4my': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'e01f5knv': {
      'en':
          'Password should contain:\n- At least one lower case letter\n- At least one upper case letter\n- At least one digit and\n- At least one special character',
      'es':
          'La contraseña debe contener:\n- Al menos una letra minúscula\n- Al menos una letra mayúscula\n- Al menos un dígito y\n- Al menos un carácter especial',
      'fr':
          'Le mot de passe doit contenir :\n- Au moins une lettre minuscule\n- Au moins une lettre majuscule\n- Au moins un chiffre et\n- Au moins un caractère spécial',
    },
    'hu8vjfj1': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'vlfg7ndi': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'xgayslvk': {
      'en':
          'Password should contain:\n- At least one lower case letter\n- At least one upper case letter\n- At least one digit and\n- At least one special character',
      'es':
          'La contraseña debe contener:\n- Al menos una letra minúscula\n- Al menos una letra mayúscula\n- Al menos un dígito y\n- Al menos un carácter especial',
      'fr':
          'Le mot de passe doit contenir :\n- Au moins une lettre minuscule\n- Au moins une lettre majuscule\n- Au moins un chiffre et\n- Au moins un caractère spécial',
    },
    '0bj20i8n': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
  },
  // LinkSearch
  {
    '8sbtl9hj': {
      'en': 'Request Link',
      'es': 'Buscar detalles del cliente',
      'fr': 'Rechercher les détails du client',
    },
    '2bat2i65': {
      'en': 'Email',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
    },
    '8p7uhr1t': {
      'en': 'Email Address',
      'es': 'Dirección de correo electrónico',
      'fr': 'Adresse email',
    },
    'vd1woxow': {
      'en': 'Search',
      'es': 'Buscar',
      'fr': 'Recherche',
    },
    '9dz86vgo': {
      'en': 'Email Address is required',
      'es': 'La dirección de correo electrónico es obligatoria',
      'fr': 'L\'adresse e-mail est obligatoire',
    },
    'f7tejv7m': {
      'en': 'Enter a valid email address...',
      'es': 'Introduzca una dirección de correo electrónico válida...',
      'fr': 'Entrez une adresse email valide...',
    },
    '0edd7kt6': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'u8kyxwag': {
      'en': 'Retrieving details...',
      'es': 'Detalles del cliente recuperados exitosamente...',
      'fr': 'Détails du client récupérés avec succès...',
    },
    'qkzk5a1w': {
      'en': 'Phone',
      'es': 'Teléfono',
      'fr': 'Téléphone',
    },
    'cz1lm2jg': {
      'en': 'Phone Number',
      'es': 'Número de teléfono',
      'fr': 'Numéro de téléphone',
    },
    '4qymudpq': {
      'en': 'Search',
      'es': 'Buscar',
      'fr': 'Recherche',
    },
    '9vlvr5w5': {
      'en': 'Field is required...',
      'es': 'El campo es obligatorio...',
      'fr': 'Le champ est obligatoire...',
    },
    'tnmn75iy': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '4ju70wos': {
      'en': 'Retrieving details...',
      'es': 'Detalles del cliente recuperados exitosamente...',
      'fr': 'Détails du client récupérés avec succès...',
    },
  },
  // Miscellaneous
  {
    'a1ad3fqc': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'v6m4s6am': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '0mvu5x9k': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'bnea0015': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'nso77vg1': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'zqdsrpk9': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'e2v18guf': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'h13xir9w': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'c7zwkyqe': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'j57slwy4': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'aysyn9y0': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'gbhqp0hw': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '0cxdyqe3': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'o5tqv9e4': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'bxpgie7z': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'vn13kpc8': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '93kjbg1r': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'rx5phi1t': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'ol2jviz2': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'hqfgihi1': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'dq6nuil5': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'rkmjmux0': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'kct3e159': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '41x5ywjr': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '9ufhbwba': {
      'en': '',
      'es': '',
      'fr': '',
    },
    's7j384qp': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'ouiluewt': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'lyjv1es6': {
      'en': '',
      'es': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
