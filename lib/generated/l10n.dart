// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Protection of Account`
  String get protection {
    return Intl.message(
      'Protection of Account',
      name: 'protection',
      desc: '',
      args: [],
    );
  }

  /// `Please input your PIN`
  String get pinInput {
    return Intl.message(
      'Please input your PIN',
      name: 'pinInput',
      desc: '',
      args: [],
    );
  }

  /// `How to use`
  String get help {
    return Intl.message(
      'How to use',
      name: 'help',
      desc: '',
      args: [],
    );
  }

  /// `Tips`
  String get tips {
    return Intl.message(
      'Tips',
      name: 'tips',
      desc: '',
      args: [],
    );
  }

  /// `PIN error`
  String get pinError {
    return Intl.message(
      'PIN error',
      name: 'pinError',
      desc: '',
      args: [],
    );
  }

  /// `Record`
  String get record {
    return Intl.message(
      'Record',
      name: 'record',
      desc: '',
      args: [],
    );
  }

  /// `Todo`
  String get todo {
    return Intl.message(
      'Todo',
      name: 'todo',
      desc: '',
      args: [],
    );
  }

  /// `Cloud`
  String get cloud {
    return Intl.message(
      'Cloud',
      name: 'cloud',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Login/Register`
  String get loginOrRegister {
    return Intl.message(
      'Login/Register',
      name: 'loginOrRegister',
      desc: '',
      args: [],
    );
  }

  /// `Hello :)`
  String get hello {
    return Intl.message(
      'Hello :)',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Miaodi`
  String get appName {
    return Intl.message(
      'Miaodi',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Markdown record software`
  String get appDescription {
    return Intl.message(
      'Markdown record software',
      name: 'appDescription',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Input username or password please`
  String get userInput {
    return Intl.message(
      'Input username or password please',
      name: 'userInput',
      desc: '',
      args: [],
    );
  }

  /// `Logging in`
  String get loggingIn {
    return Intl.message(
      'Logging in',
      name: 'loggingIn',
      desc: '',
      args: [],
    );
  }

  /// `Use email to login`
  String get emailLogin {
    return Intl.message(
      'Use email to login',
      name: 'emailLogin',
      desc: '',
      args: [],
    );
  }

  /// `Forget password?`
  String get forgetPassword {
    return Intl.message(
      'Forget password?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `meant agree`
  String get meansAgree {
    return Intl.message(
      'meant agree',
      name: 'meansAgree',
      desc: '',
      args: [],
    );
  }

  /// `UserAgreement`
  String get userAgreement {
    return Intl.message(
      'UserAgreement',
      name: 'userAgreement',
      desc: '',
      args: [],
    );
  }

  /// `Privacy`
  String get privacy {
    return Intl.message(
      'Privacy',
      name: 'privacy',
      desc: '',
      args: [],
    );
  }

  /// ` successfully`
  String get successfully {
    return Intl.message(
      ' successfully',
      name: 'successfully',
      desc: '',
      args: [],
    );
  }

  /// ` unsuccessfully`
  String get unsuccessfully {
    return Intl.message(
      ' unsuccessfully',
      name: 'unsuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Error happened`
  String get error {
    return Intl.message(
      'Error happened',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `reason is`
  String get reason {
    return Intl.message(
      'reason is',
      name: 'reason',
      desc: '',
      args: [],
    );
  }

  /// ` please wait a second`
  String get wait {
    return Intl.message(
      ' please wait a second',
      name: 'wait',
      desc: '',
      args: [],
    );
  }

  /// `Safety`
  String get safety {
    return Intl.message(
      'Safety',
      name: 'safety',
      desc: '',
      args: [],
    );
  }

  /// `PIN Lock`
  String get pinLock {
    return Intl.message(
      'PIN Lock',
      name: 'pinLock',
      desc: '',
      args: [],
    );
  }

  /// `Data`
  String get data {
    return Intl.message(
      'Data',
      name: 'data',
      desc: '',
      args: [],
    );
  }

  /// `Import`
  String get import {
    return Intl.message(
      'Import',
      name: 'import',
      desc: '',
      args: [],
    );
  }

  /// `Export`
  String get export {
    return Intl.message(
      'Export',
      name: 'export',
      desc: '',
      args: [],
    );
  }

  /// `Feedback`
  String get feedback {
    return Intl.message(
      'Feedback',
      name: 'feedback',
      desc: '',
      args: [],
    );
  }

  /// `Propose & Feedback`
  String get propose {
    return Intl.message(
      'Propose & Feedback',
      name: 'propose',
      desc: '',
      args: [],
    );
  }

  /// `Current version`
  String get currentVersion {
    return Intl.message(
      'Current version',
      name: 'currentVersion',
      desc: '',
      args: [],
    );
  }

  /// `developer`
  String get developer {
    return Intl.message(
      'developer',
      name: 'developer',
      desc: '',
      args: [],
    );
  }

  /// `website`
  String get website {
    return Intl.message(
      'website',
      name: 'website',
      desc: '',
      args: [],
    );
  }

  /// `telegram: t.me/miaodi`
  String get public {
    return Intl.message(
      'telegram: t.me/miaodi',
      name: 'public',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Choose Book & Chapter`
  String get chooseBookAndChapter {
    return Intl.message(
      'Choose Book & Chapter',
      name: 'chooseBookAndChapter',
      desc: '',
      args: [],
    );
  }

  /// `Book`
  String get chooseBook {
    return Intl.message(
      'Book',
      name: 'chooseBook',
      desc: '',
      args: [],
    );
  }

  /// `Chapter`
  String get chooseChapter {
    return Intl.message(
      'Chapter',
      name: 'chooseChapter',
      desc: '',
      args: [],
    );
  }

  /// `Info`
  String get basicInfo {
    return Intl.message(
      'Info',
      name: 'basicInfo',
      desc: '',
      args: [],
    );
  }

  /// `Id`
  String get accountId {
    return Intl.message(
      'Id',
      name: 'accountId',
      desc: '',
      args: [],
    );
  }

  /// `Loading`
  String get loading {
    return Intl.message(
      'Loading',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Exit`
  String get accountExit {
    return Intl.message(
      'Exit',
      name: 'accountExit',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Membership`
  String get membership {
    return Intl.message(
      'Membership',
      name: 'membership',
      desc: '',
      args: [],
    );
  }

  /// `Level`
  String get level {
    return Intl.message(
      'Level',
      name: 'level',
      desc: '',
      args: [],
    );
  }

  /// `Function`
  String get function {
    return Intl.message(
      'Function',
      name: 'function',
      desc: '',
      args: [],
    );
  }

  /// `only support picture bed now`
  String get functionTips {
    return Intl.message(
      'only support picture bed now',
      name: 'functionTips',
      desc: '',
      args: [],
    );
  }

  /// `had been activated，and expired in {time}`
  String activated(Object time) {
    return Intl.message(
      'had been activated，and expired in $time',
      name: 'activated',
      desc: '',
      args: [time],
    );
  }

  /// `your membership is forever, enjoy it`
  String get foreverMembership {
    return Intl.message(
      'your membership is forever, enjoy it',
      name: 'foreverMembership',
      desc: '',
      args: [],
    );
  }

  /// `no membership`
  String get needActivate {
    return Intl.message(
      'no membership',
      name: 'needActivate',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Sure`
  String get sure {
    return Intl.message(
      'Sure',
      name: 'sure',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Grant`
  String get grant {
    return Intl.message(
      'Grant',
      name: 'grant',
      desc: '',
      args: [],
    );
  }

  /// `Modify Username`
  String get changeUsername {
    return Intl.message(
      'Modify Username',
      name: 'changeUsername',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your new username`
  String get inputNewUsername {
    return Intl.message(
      'Please enter your new username',
      name: 'inputNewUsername',
      desc: '',
      args: [],
    );
  }

  /// `changing`
  String get changing {
    return Intl.message(
      'changing',
      name: 'changing',
      desc: '',
      args: [],
    );
  }

  /// `Modify Email`
  String get changeEmail {
    return Intl.message(
      'Modify Email',
      name: 'changeEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the verification code`
  String get inputVerifyCode {
    return Intl.message(
      'Please enter the verification code',
      name: 'inputVerifyCode',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your new email`
  String get inputNewEmail {
    return Intl.message(
      'Please enter your new email',
      name: 'inputNewEmail',
      desc: '',
      args: [],
    );
  }

  /// `Applying for verification code`
  String get verifyCodeApplication {
    return Intl.message(
      'Applying for verification code',
      name: 'verifyCodeApplication',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the old password`
  String get inputOldPassword {
    return Intl.message(
      'Please enter the old password',
      name: 'inputOldPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a new password`
  String get inputNewPassword {
    return Intl.message(
      'Please enter a new password',
      name: 'inputNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter new password again`
  String get inputNewPasswordAgain {
    return Intl.message(
      'Please enter new password again',
      name: 'inputNewPasswordAgain',
      desc: '',
      args: [],
    );
  }

  /// `Your two new passwords do not match, please check again`
  String get checkTwoPasswordAgain {
    return Intl.message(
      'Your two new passwords do not match, please check again',
      name: 'checkTwoPasswordAgain',
      desc: '',
      args: [],
    );
  }

  /// `Once you log out, it cannot be recovered. If you confirm, please enter the account password again`
  String get logoutWarning {
    return Intl.message(
      'Once you log out, it cannot be recovered. If you confirm, please enter the account password again',
      name: 'logoutWarning',
      desc: '',
      args: [],
    );
  }

  /// `Applying for account cancellation`
  String get loggingOut {
    return Intl.message(
      'Applying for account cancellation',
      name: 'loggingOut',
      desc: '',
      args: [],
    );
  }

  /// `There are currently no recoverable purchases`
  String get noneCanRecover {
    return Intl.message(
      'There are currently no recoverable purchases',
      name: 'noneCanRecover',
      desc: '',
      args: [],
    );
  }

  /// `Membership Purchase`
  String get membershipActivated {
    return Intl.message(
      'Membership Purchase',
      name: 'membershipActivated',
      desc: '',
      args: [],
    );
  }

  /// `Advanced member advanced function`
  String get advancedFunction {
    return Intl.message(
      'Advanced member advanced function',
      name: 'advancedFunction',
      desc: '',
      args: [],
    );
  }

  /// `Multi-device automatic backup & automatic pull`
  String get cloudIntro {
    return Intl.message(
      'Multi-device automatic backup & automatic pull',
      name: 'cloudIntro',
      desc: '',
      args: [],
    );
  }

  /// `Multi-Device`
  String get multiDevice {
    return Intl.message(
      'Multi-Device',
      name: 'multiDevice',
      desc: '',
      args: [],
    );
  }

  /// `One account can log in to multiple devices at the same time`
  String get multiDeviceIntro {
    return Intl.message(
      'One account can log in to multiple devices at the same time',
      name: 'multiDeviceIntro',
      desc: '',
      args: [],
    );
  }

  /// `Open Platform Api`
  String get openApi {
    return Intl.message(
      'Open Platform Api',
      name: 'openApi',
      desc: '',
      args: [],
    );
  }

  /// `Using Api, you can develop a robot that supports QQ & WeChat to record data and synchronize it to the App. At present, other small partners have developed it and you can try it out`
  String get openApiIntro {
    return Intl.message(
      'Using Api, you can develop a robot that supports QQ & WeChat to record data and synchronize it to the App. At present, other small partners have developed it and you can try it out',
      name: 'openApiIntro',
      desc: '',
      args: [],
    );
  }

  /// `Cloud trash bin`
  String get cloudTrashbin {
    return Intl.message(
      'Cloud trash bin',
      name: 'cloudTrashbin',
      desc: '',
      args: [],
    );
  }

  /// `The article backed up to the cloud can be retrieved in the recycle bin after deletion, and will not be automatically deleted after expiration`
  String get cloudTrashbinIntro {
    return Intl.message(
      'The article backed up to the cloud can be retrieved in the recycle bin after deletion, and will not be automatically deleted after expiration',
      name: 'cloudTrashbinIntro',
      desc: '',
      args: [],
    );
  }

  /// `And subsequent new functions`
  String get moreFunction {
    return Intl.message(
      'And subsequent new functions',
      name: 'moreFunction',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to give us new inspiration`
  String get welcomePropose {
    return Intl.message(
      'Welcome to give us new inspiration',
      name: 'welcomePropose',
      desc: '',
      args: [],
    );
  }

  /// `Membership Specifications`
  String get membershipType {
    return Intl.message(
      'Membership Specifications',
      name: 'membershipType',
      desc: '',
      args: [],
    );
  }

  /// `Please be patient, in-app purchase is in progress, if there is no response for a long time, please try again`
  String get buying {
    return Intl.message(
      'Please be patient, in-app purchase is in progress, if there is no response for a long time, please try again',
      name: 'buying',
      desc: '',
      args: [],
    );
  }

  /// `Buy Now`
  String get buyNow {
    return Intl.message(
      'Buy Now',
      name: 'buyNow',
      desc: '',
      args: [],
    );
  }

  /// `Exchange Code Exchange`
  String get activateByCode {
    return Intl.message(
      'Exchange Code Exchange',
      name: 'activateByCode',
      desc: '',
      args: [],
    );
  }

  /// `If you encounter payment problems, please contact us by email: libv@miaodiapp.com, we will solve it for you within 24 hours`
  String get encounterPayProblems {
    return Intl.message(
      'If you encounter payment problems, please contact us by email: libv@miaodiapp.com, we will solve it for you within 24 hours',
      name: 'encounterPayProblems',
      desc: '',
      args: [],
    );
  }

  /// `Recovery Purchases`
  String get payRecovery {
    return Intl.message(
      'Recovery Purchases',
      name: 'payRecovery',
      desc: '',
      args: [],
    );
  }

  /// `Already purchased?`
  String get hadPaid {
    return Intl.message(
      'Already purchased?',
      name: 'hadPaid',
      desc: '',
      args: [],
    );
  }

  /// `Please be patient, we are querying`
  String get querying {
    return Intl.message(
      'Please be patient, we are querying',
      name: 'querying',
      desc: '',
      args: [],
    );
  }

  /// `Activating, please be patient`
  String get activating {
    return Intl.message(
      'Activating, please be patient',
      name: 'activating',
      desc: '',
      args: [],
    );
  }

  /// `Enter the redeem code you got`
  String get inputActivatedCode {
    return Intl.message(
      'Enter the redeem code you got',
      name: 'inputActivatedCode',
      desc: '',
      args: [],
    );
  }

  /// `Verifying the redemption code`
  String get activatedCodeVerifying {
    return Intl.message(
      'Verifying the redemption code',
      name: 'activatedCodeVerifying',
      desc: '',
      args: [],
    );
  }

  /// `PicBed Configuration`
  String get settingsOfPicBed {
    return Intl.message(
      'PicBed Configuration',
      name: 'settingsOfPicBed',
      desc: '',
      args: [],
    );
  }

  /// `Your picture bed token`
  String get tokenOfPicBed {
    return Intl.message(
      'Your picture bed token',
      name: 'tokenOfPicBed',
      desc: '',
      args: [],
    );
  }

  /// `Your service address`
  String get serviceAddress {
    return Intl.message(
      'Your service address',
      name: 'serviceAddress',
      desc: '',
      args: [],
    );
  }

  /// `Save Settings`
  String get saveSettings {
    return Intl.message(
      'Save Settings',
      name: 'saveSettings',
      desc: '',
      args: [],
    );
  }

  /// `Save successfully`
  String get saveSuccessfully {
    return Intl.message(
      'Save successfully',
      name: 'saveSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Verify Code`
  String get verifyCode {
    return Intl.message(
      'Verify Code',
      name: 'verifyCode',
      desc: '',
      args: [],
    );
  }

  /// `Get Verification Code`
  String get getVerifyCode {
    return Intl.message(
      'Get Verification Code',
      name: 'getVerifyCode',
      desc: '',
      args: [],
    );
  }

  /// `Please fill in the email address first`
  String get fillEmail {
    return Intl.message(
      'Please fill in the email address first',
      name: 'fillEmail',
      desc: '',
      args: [],
    );
  }

  /// `Registering`
  String get registering {
    return Intl.message(
      'Registering',
      name: 'registering',
      desc: '',
      args: [],
    );
  }

  /// `Username, password, email and email verification code cannot be empty`
  String get canNotNull {
    return Intl.message(
      'Username, password, email and email verification code cannot be empty',
      name: 'canNotNull',
      desc: '',
      args: [],
    );
  }

  /// `Registered successfully`
  String get registerSuccessfully {
    return Intl.message(
      'Registered successfully',
      name: 'registerSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Registration failed`
  String get registerUnsuccessfully {
    return Intl.message(
      'Registration failed',
      name: 'registerUnsuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Cloud Article: {name}`
  String cloudPassageTitle(Object name) {
    return Intl.message(
      'Cloud Article: $name',
      name: 'cloudPassageTitle',
      desc: '',
      args: [name],
    );
  }

  /// `Are you sure to share? Your content may be searched by search engines after sharing`
  String get shareTips {
    return Intl.message(
      'Are you sure to share? Your content may be searched by search engines after sharing',
      name: 'shareTips',
      desc: '',
      args: [],
    );
  }

  /// `Sharing`
  String get sharing {
    return Intl.message(
      'Sharing',
      name: 'sharing',
      desc: '',
      args: [],
    );
  }

  /// `Shared successfully, the shared content has been copied to the clipboard`
  String get shareSuccessfully {
    return Intl.message(
      'Shared successfully, the shared content has been copied to the clipboard',
      name: 'shareSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `UnSharing`
  String get unSharing {
    return Intl.message(
      'UnSharing',
      name: 'unSharing',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to unshare?`
  String get unShareTips {
    return Intl.message(
      'Are you sure you want to unshare?',
      name: 'unShareTips',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `UnShare`
  String get unShare {
    return Intl.message(
      'UnShare',
      name: 'unShare',
      desc: '',
      args: [],
    );
  }

  /// `No data yet :)`
  String get noData {
    return Intl.message(
      'No data yet :)',
      name: 'noData',
      desc: '',
      args: [],
    );
  }

  /// `Uploading image`
  String get imageUploading {
    return Intl.message(
      'Uploading image',
      name: 'imageUploading',
      desc: '',
      args: [],
    );
  }

  /// `You have not configured the uploading picture function, please log in and configure it in the member function`
  String get noPicBedSetting {
    return Intl.message(
      'You have not configured the uploading picture function, please log in and configure it in the member function',
      name: 'noPicBedSetting',
      desc: '',
      args: [],
    );
  }

  /// `Exporting`
  String get exporting {
    return Intl.message(
      'Exporting',
      name: 'exporting',
      desc: '',
      args: [],
    );
  }

  /// `New Book`
  String get newBook {
    return Intl.message(
      'New Book',
      name: 'newBook',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the book title, you will add a brand new book, happy writing :)`
  String get inputNewBook {
    return Intl.message(
      'Please enter the book title, you will add a brand new book, happy writing :)',
      name: 'inputNewBook',
      desc: '',
      args: [],
    );
  }

  /// `New Chapter`
  String get newChapter {
    return Intl.message(
      'New Chapter',
      name: 'newChapter',
      desc: '',
      args: [],
    );
  }

  /// `Chapter`
  String get chapter {
    return Intl.message(
      'Chapter',
      name: 'chapter',
      desc: '',
      args: [],
    );
  }

  /// `Add Book or Chapter`
  String get AddNewBookOrChapter {
    return Intl.message(
      'Add Book or Chapter',
      name: 'AddNewBookOrChapter',
      desc: '',
      args: [],
    );
  }

  /// `Please fill in your chapter name:)`
  String get inputNewChapter {
    return Intl.message(
      'Please fill in your chapter name:)',
      name: 'inputNewChapter',
      desc: '',
      args: [],
    );
  }

  /// `Edit Settings`
  String get editSettings {
    return Intl.message(
      'Edit Settings',
      name: 'editSettings',
      desc: '',
      args: [],
    );
  }

  /// `The current book is`
  String get currentBook {
    return Intl.message(
      'The current book is',
      name: 'currentBook',
      desc: '',
      args: [],
    );
  }

  /// `Current Chapter`
  String get currentChapter {
    return Intl.message(
      'Current Chapter',
      name: 'currentChapter',
      desc: '',
      args: [],
    );
  }

  /// `Current PassageTitle`
  String get currentPassageTitle {
    return Intl.message(
      'Current PassageTitle',
      name: 'currentPassageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Total {num} characters`
  String passageContentLength(Object num) {
    return Intl.message(
      'Total $num characters',
      name: 'passageContentLength',
      desc: '',
      args: [num],
    );
  }

  /// `Tools`
  String get tools {
    return Intl.message(
      'Tools',
      name: 'tools',
      desc: '',
      args: [],
    );
  }

  /// `Search and Replace`
  String get searchAndReplace {
    return Intl.message(
      'Search and Replace',
      name: 'searchAndReplace',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Warning`
  String get warning {
    return Intl.message(
      'Warning',
      name: 'warning',
      desc: '',
      args: [],
    );
  }

  /// `Once deleted, it cannot be recovered (the articles that have been backed up in the cloud can be recovered from the cloud recycle bin)`
  String get deletePassageWarning {
    return Intl.message(
      'Once deleted, it cannot be recovered (the articles that have been backed up in the cloud can be recovered from the cloud recycle bin)',
      name: 'deletePassageWarning',
      desc: '',
      args: [],
    );
  }

  /// `Post Settings`
  String get passageSettings {
    return Intl.message(
      'Post Settings',
      name: 'passageSettings',
      desc: '',
      args: [],
    );
  }

  /// `Move article to new book`
  String get move2NewBook {
    return Intl.message(
      'Move article to new book',
      name: 'move2NewBook',
      desc: '',
      args: [],
    );
  }

  /// `Move article to new chapter`
  String get move2NewChapter {
    return Intl.message(
      'Move article to new chapter',
      name: 'move2NewChapter',
      desc: '',
      args: [],
    );
  }

  /// `Share article as web page`
  String get shareAsUrl {
    return Intl.message(
      'Share article as web page',
      name: 'shareAsUrl',
      desc: '',
      args: [],
    );
  }

  /// `Export as Markdown`
  String get exportAsMarkdown {
    return Intl.message(
      'Export as Markdown',
      name: 'exportAsMarkdown',
      desc: '',
      args: [],
    );
  }

  /// `Export as Text`
  String get exportAsText {
    return Intl.message(
      'Export as Text',
      name: 'exportAsText',
      desc: '',
      args: [],
    );
  }

  /// `The article has been migrated to the book 「{book}」`
  String move2BookSuccessfully(Object book) {
    return Intl.message(
      'The article has been migrated to the book 「$book」',
      name: 'move2BookSuccessfully',
      desc: '',
      args: [book],
    );
  }

  /// `Please select the book to move to`
  String get chooseBook2Move {
    return Intl.message(
      'Please select the book to move to',
      name: 'chooseBook2Move',
      desc: '',
      args: [],
    );
  }

  /// `Please select the chapter to move to`
  String get chooseChapter2Move {
    return Intl.message(
      'Please select the chapter to move to',
      name: 'chooseChapter2Move',
      desc: '',
      args: [],
    );
  }

  /// `The article has been migrated to 「{chapter}」 of 「{book}」`
  String move2ChapterSuccessfully(Object chapter, Object book) {
    return Intl.message(
      'The article has been migrated to 「$chapter」 of 「$book」',
      name: 'move2ChapterSuccessfully',
      desc: '',
      args: [chapter, book],
    );
  }

  /// `Please activate the membership to use this function`
  String get need2Activate {
    return Intl.message(
      'Please activate the membership to use this function',
      name: 'need2Activate',
      desc: '',
      args: [],
    );
  }

  /// `Please wait until the article is uploaded to the cloud to use this function`
  String get afterUpload2Use {
    return Intl.message(
      'Please wait until the article is uploaded to the cloud to use this function',
      name: 'afterUpload2Use',
      desc: '',
      args: [],
    );
  }

  /// `Content Search`
  String get searchContent {
    return Intl.message(
      'Content Search',
      name: 'searchContent',
      desc: '',
      args: [],
    );
  }

  /// `Text to be replaced`
  String get text2Replace {
    return Intl.message(
      'Text to be replaced',
      name: 'text2Replace',
      desc: '',
      args: [],
    );
  }

  /// `Text after replacement`
  String get textAfterReplace {
    return Intl.message(
      'Text after replacement',
      name: 'textAfterReplace',
      desc: '',
      args: [],
    );
  }

  /// `Search Results`
  String get searchResult {
    return Intl.message(
      'Search Results',
      name: 'searchResult',
      desc: '',
      args: [],
    );
  }

  /// `Search for replaced text`
  String get searchTheReplaceText {
    return Intl.message(
      'Search for replaced text',
      name: 'searchTheReplaceText',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Replace`
  String get sure2Replace {
    return Intl.message(
      'Confirm Replace',
      name: 'sure2Replace',
      desc: '',
      args: [],
    );
  }

  /// `APP Safety Lock`
  String get appSafetyLock {
    return Intl.message(
      'APP Safety Lock',
      name: 'appSafetyLock',
      desc: '',
      args: [],
    );
  }

  /// `Not open`
  String get closed {
    return Intl.message(
      'Not open',
      name: 'closed',
      desc: '',
      args: [],
    );
  }

  /// `Opened`
  String get opened {
    return Intl.message(
      'Opened',
      name: 'opened',
      desc: '',
      args: [],
    );
  }

  /// `Set Account Password`
  String get setAccountPin {
    return Intl.message(
      'Set Account Password',
      name: 'setAccountPin',
      desc: '',
      args: [],
    );
  }

  /// `Close account password`
  String get closeAccountPin {
    return Intl.message(
      'Close account password',
      name: 'closeAccountPin',
      desc: '',
      args: [],
    );
  }

  /// `Select the md and txt files to be imported, and the content will be imported into 「Default」 under 「Default」`
  String get importTips {
    return Intl.message(
      'Select the md and txt files to be imported, and the content will be imported into 「Default」 under 「Default」',
      name: 'importTips',
      desc: '',
      args: [],
    );
  }

  /// `Importing data`
  String get importing {
    return Intl.message(
      'Importing data',
      name: 'importing',
      desc: '',
      args: [],
    );
  }

  /// `Export to the 「Miaodi」 folder of the device, which can be viewed through the 「File」 that comes with the system`
  String get exportTips {
    return Intl.message(
      'Export to the 「Miaodi」 folder of the device, which can be viewed through the 「File」 that comes with the system',
      name: 'exportTips',
      desc: '',
      args: [],
    );
  }

  /// `Together with other friends, face to face with developers`
  String get proposeTips {
    return Intl.message(
      'Together with other friends, face to face with developers',
      name: 'proposeTips',
      desc: '',
      args: [],
    );
  }

  /// `The export is complete, a total of {length} articles have been exported`
  String exportPassagesLength(Object length) {
    return Intl.message(
      'The export is complete, a total of $length articles have been exported',
      name: 'exportPassagesLength',
      desc: '',
      args: [length],
    );
  }

  /// `The file was imported successfully`
  String get loadFileSuccessfully {
    return Intl.message(
      'The file was imported successfully',
      name: 'loadFileSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `File import canceled or failed`
  String get loadFileFailed {
    return Intl.message(
      'File import canceled or failed',
      name: 'loadFileFailed',
      desc: '',
      args: [],
    );
  }

  /// `TodoEdit`
  String get todoEdit {
    return Intl.message(
      'TodoEdit',
      name: 'todoEdit',
      desc: '',
      args: [],
    );
  }

  /// `Delete Todo`
  String get deleteTodo {
    return Intl.message(
      'Delete Todo',
      name: 'deleteTodo',
      desc: '',
      args: [],
    );
  }

  /// `This delete operation is irreversible, do you want to continue?`
  String get deleteTodoTips {
    return Intl.message(
      'This delete operation is irreversible, do you want to continue?',
      name: 'deleteTodoTips',
      desc: '',
      args: [],
    );
  }

  /// `Time (optional)`
  String get time {
    return Intl.message(
      'Time (optional)',
      name: 'time',
      desc: '',
      args: [],
    );
  }

  /// `Modify Time`
  String get modifyTime {
    return Intl.message(
      'Modify Time',
      name: 'modifyTime',
      desc: '',
      args: [],
    );
  }

  /// `Todo Content`
  String get todoContent {
    return Intl.message(
      'Todo Content',
      name: 'todoContent',
      desc: '',
      args: [],
    );
  }

  /// `Save Changes`
  String get saveChange {
    return Intl.message(
      'Save Changes',
      name: 'saveChange',
      desc: '',
      args: [],
    );
  }

  /// `Loading at full capacity, please be patient`
  String get webLoading {
    return Intl.message(
      'Loading at full capacity, please be patient',
      name: 'webLoading',
      desc: '',
      args: [],
    );
  }

  /// `Book Operation`
  String get bookOperation {
    return Intl.message(
      'Book Operation',
      name: 'bookOperation',
      desc: '',
      args: [],
    );
  }

  /// `Please choose your operation`
  String get chooseOperation {
    return Intl.message(
      'Please choose your operation',
      name: 'chooseOperation',
      desc: '',
      args: [],
    );
  }

  /// `Export Book`
  String get exportBook {
    return Intl.message(
      'Export Book',
      name: 'exportBook',
      desc: '',
      args: [],
    );
  }

  /// `Delete or rename`
  String get deleteOrModify {
    return Intl.message(
      'Delete or rename',
      name: 'deleteOrModify',
      desc: '',
      args: [],
    );
  }

  /// `Exporting books may take a while to prepare, do you want to start now?`
  String get exportBookTips {
    return Intl.message(
      'Exporting books may take a while to prepare, do you want to start now?',
      name: 'exportBookTips',
      desc: '',
      args: [],
    );
  }

  /// `Book`
  String get book {
    return Intl.message(
      'Book',
      name: 'book',
      desc: '',
      args: [],
    );
  }

  /// `Change Book Name`
  String get changeBookName {
    return Intl.message(
      'Change Book Name',
      name: 'changeBookName',
      desc: '',
      args: [],
    );
  }

  /// `Update or delete chapter`
  String get modifyOrDeleteChapter {
    return Intl.message(
      'Update or delete chapter',
      name: 'modifyOrDeleteChapter',
      desc: '',
      args: [],
    );
  }

  /// `Change to`
  String get change2 {
    return Intl.message(
      'Change to',
      name: 'change2',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Are you about to move the article to the trash?`
  String get move2Trashbin {
    return Intl.message(
      'Are you about to move the article to the trash?',
      name: 'move2Trashbin',
      desc: '',
      args: [],
    );
  }

  /// `Unshared`
  String get unshare {
    return Intl.message(
      'Unshared',
      name: 'unshare',
      desc: '',
      args: [],
    );
  }

  /// `Shared`
  String get shared {
    return Intl.message(
      'Shared',
      name: 'shared',
      desc: '',
      args: [],
    );
  }

  /// `position`
  String get position {
    return Intl.message(
      'position',
      name: 'position',
      desc: '',
      args: [],
    );
  }

  /// `Hello friends, welcome to use Miaodi iOS, please be sure to agree to the user agreement and privacy policy below before use, you can click to view it :)`
  String get welcome {
    return Intl.message(
      'Hello friends, welcome to use Miaodi iOS, please be sure to agree to the user agreement and privacy policy below before use, you can click to view it :)',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Remember to look here before using it👀`
  String get appIntroTitle {
    return Intl.message(
      'Remember to look here before using it👀',
      name: 'appIntroTitle',
      desc: '',
      args: [],
    );
  }

  /// `# What I want to say to my friends😆\n\nHello Duck, I'm Miaodi App, your daily helper for study and work🔧.\n\nIn this complex and fast paced World, Miaodi hopes that my friends can have time to record their hearts every day, in the most primitive way - text. Of course, you can also use Miaodi to help you achieve higher work efficiency 💪\n\n# A must-see function introduction before using ♥️\n\n* Meow Meow Quickly Save⚠️\nHere, Meow Die will treat each paragraph of your text with the most attentive method, and the content you write will hardly be lost,* *Even if you power off the device in an instant, unless you actively delete it**.\n\n* Meow writing🆙\nIn addition, we have specially configured a writing mode for you who like to write. You are more comfortable writing. You can also use the focus mode to devote yourself to your writing. We also provide a three-level classification of book-chapter-article, where you can mobilize your articles as you like , unlimited.\n\n* System-level reminders⏰\nMiaodi also provides system-level Todo reminder services, so that you no longer miss any important thing, your time, and come back to you in the hand.\n\n* UI customization💡\nMiaodi not only optimizes the daily arrangement, but also provides a lot of customization functions. You can use many customized functions for you to use. For example, **self Define font**, **custom background**, **custom CSS style**, **custom shortcut input**, etc. These are all provided for free, just to make small partners feel more comfortable to use Comfortable.\n\n# Advanced service 🔓\n\nOf course, we also provide more advanced functions for users who need it, but you need to log in and register to use it 📱\n\n* Quick record in the notification bar 💡\nProvide resident notifications in the notification bar, click to enter editing, and capture the moment of inspiration Switch\n\n* clipboard record📋\nAfter copying the data, open Miaodi and record it directly into the software, no need to paste again, more worry-free 💗\n\n* QQ robot record📝\nSend to the robot Every sentence will be automatically saved in the Miaodi App, even in QQ, you are not afraid to record inspiration instantly\n\n* More functions\nMember functions will continue to increase 😯\n\nWith love, everything will change Beautiful.\n\n> More detailed instructions: https://www.miaodiapp.com/help.html or the official WeChat account of Libv Studio: Libv\n\n`
  String get appIntroContent {
    return Intl.message(
      '# What I want to say to my friends😆\n\nHello Duck, I\'m Miaodi App, your daily helper for study and work🔧.\n\nIn this complex and fast paced World, Miaodi hopes that my friends can have time to record their hearts every day, in the most primitive way - text. Of course, you can also use Miaodi to help you achieve higher work efficiency 💪\n\n# A must-see function introduction before using ♥️\n\n* Meow Meow Quickly Save⚠️\nHere, Meow Die will treat each paragraph of your text with the most attentive method, and the content you write will hardly be lost,* *Even if you power off the device in an instant, unless you actively delete it**.\n\n* Meow writing🆙\nIn addition, we have specially configured a writing mode for you who like to write. You are more comfortable writing. You can also use the focus mode to devote yourself to your writing. We also provide a three-level classification of book-chapter-article, where you can mobilize your articles as you like , unlimited.\n\n* System-level reminders⏰\nMiaodi also provides system-level Todo reminder services, so that you no longer miss any important thing, your time, and come back to you in the hand.\n\n* UI customization💡\nMiaodi not only optimizes the daily arrangement, but also provides a lot of customization functions. You can use many customized functions for you to use. For example, **self Define font**, **custom background**, **custom CSS style**, **custom shortcut input**, etc. These are all provided for free, just to make small partners feel more comfortable to use Comfortable.\n\n# Advanced service 🔓\n\nOf course, we also provide more advanced functions for users who need it, but you need to log in and register to use it 📱\n\n* Quick record in the notification bar 💡\nProvide resident notifications in the notification bar, click to enter editing, and capture the moment of inspiration Switch\n\n* clipboard record📋\nAfter copying the data, open Miaodi and record it directly into the software, no need to paste again, more worry-free 💗\n\n* QQ robot record📝\nSend to the robot Every sentence will be automatically saved in the Miaodi App, even in QQ, you are not afraid to record inspiration instantly\n\n* More functions\nMember functions will continue to increase 😯\n\nWith love, everything will change Beautiful.\n\n> More detailed instructions: https://www.miaodiapp.com/help.html or the official WeChat account of Libv Studio: Libv\n\n',
      name: 'appIntroContent',
      desc: '',
      args: [],
    );
  }

  /// `Here, play Miaodi 👍`
  String get useIntroTitle {
    return Intl.message(
      'Here, play Miaodi 👍',
      name: 'useIntroTitle',
      desc: '',
      args: [],
    );
  }

  /// `# Quick typesetting😁\nIn Miaodi, you can use Markdown syntax for rapid typesetting, remember that it must be in non-text mode, of course, Miaodi defaults to non-text mode, as long as you do not Modification.\n\nFirst of all, you need to be familiar with the Markdown syntax👀, the detailed link🔗 is here: https://www.miaodiapp.com/markdown.html\n\nThen you can quickly typesetting here, what , you can't see the effect, just see a bunch of symbols? It doesn't matter, you ⬅️ swipe left to see the preview effect, then select the upper right corner and export to pdf. But there is a small problem, before exporting , remember to blacken the font of the editing interface first 😯, otherwise you will be invisible 🦆.\n\nFor more information, please see: https://www.miaodiapp.com/help.html\n`
  String get useIntroContent {
    return Intl.message(
      '# Quick typesetting😁\nIn Miaodi, you can use Markdown syntax for rapid typesetting, remember that it must be in non-text mode, of course, Miaodi defaults to non-text mode, as long as you do not Modification.\n\nFirst of all, you need to be familiar with the Markdown syntax👀, the detailed link🔗 is here: https://www.miaodiapp.com/markdown.html\n\nThen you can quickly typesetting here, what , you can\'t see the effect, just see a bunch of symbols? It doesn\'t matter, you ⬅️ swipe left to see the preview effect, then select the upper right corner and export to pdf. But there is a small problem, before exporting , remember to blacken the font of the editing interface first 😯, otherwise you will be invisible 🦆.\n\nFor more information, please see: https://www.miaodiapp.com/help.html\n',
      name: 'useIntroContent',
      desc: '',
      args: [],
    );
  }

  /// `Here is a Todo, you can record some more important things like this`
  String get todoIntro {
    return Intl.message(
      'Here is a Todo, you can record some more important things like this',
      name: 'todoIntro',
      desc: '',
      args: [],
    );
  }

  /// `Ding! Friends, please stay`
  String get rateTitle {
    return Intl.message(
      'Ding! Friends, please stay',
      name: 'rateTitle',
      desc: '',
      args: [],
    );
  }

  /// `Do your friends like Miaodi? If so, can you take some time to call us in the app store? This is very important to us! Thank you for your support to Miaodi!`
  String get rateTContent {
    return Intl.message(
      'Do your friends like Miaodi? If so, can you take some time to call us in the app store? This is very important to us! Thank you for your support to Miaodi!',
      name: 'rateTContent',
      desc: '',
      args: [],
    );
  }

  /// `Fine`
  String get fine {
    return Intl.message(
      'Fine',
      name: 'fine',
      desc: '',
      args: [],
    );
  }

  /// `Next time definitely`
  String get nextTime {
    return Intl.message(
      'Next time definitely',
      name: 'nextTime',
      desc: '',
      args: [],
    );
  }

  /// `Remind later`
  String get remindLater {
    return Intl.message(
      'Remind later',
      name: 'remindLater',
      desc: '',
      args: [],
    );
  }

  /// `Default`
  String get defaults {
    return Intl.message(
      'Default',
      name: 'defaults',
      desc: '',
      args: [],
    );
  }

  /// `Fill in the content to be retrieved`
  String get searchContentTips {
    return Intl.message(
      'Fill in the content to be retrieved',
      name: 'searchContentTips',
      desc: '',
      args: [],
    );
  }

  /// `Said preview`
  String get saidPreview {
    return Intl.message(
      'Said preview',
      name: 'saidPreview',
      desc: '',
      args: [],
    );
  }

  /// `Share to Said`
  String get shareToSaid {
    return Intl.message(
      'Share to Said',
      name: 'shareToSaid',
      desc: '',
      args: [],
    );
  }

  /// `Said`
  String get Said {
    return Intl.message(
      'Said',
      name: 'Said',
      desc: '',
      args: [],
    );
  }

  /// `Author`
  String get author {
    return Intl.message(
      'Author',
      name: 'author',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get apply {
    return Intl.message(
      'Apply',
      name: 'apply',
      desc: '',
      args: [],
    );
  }

  /// `Too much words, please simply it!`
  String get tooMuchText {
    return Intl.message(
      'Too much words, please simply it!',
      name: 'tooMuchText',
      desc: '',
      args: [],
    );
  }

  /// `Applying`
  String get applying {
    return Intl.message(
      'Applying',
      name: 'applying',
      desc: '',
      args: [],
    );
  }

  /// `M-Bits`
  String get assets {
    return Intl.message(
      'M-Bits',
      name: 'assets',
      desc: '',
      args: [],
    );
  }

  /// `"Know more about membership"`
  String get aboutMembership {
    return Intl.message(
      '"Know more about membership"',
      name: 'aboutMembership',
      desc: '',
      args: [],
    );
  }

  /// `Buy`
  String get purchase {
    return Intl.message(
      'Buy',
      name: 'purchase',
      desc: '',
      args: [],
    );
  }

  /// `Privilege`
  String get myPrivilege {
    return Intl.message(
      'Privilege',
      name: 'myPrivilege',
      desc: '',
      args: [],
    );
  }

  /// `Renewal`
  String get continueVIP {
    return Intl.message(
      'Renewal',
      name: 'continueVIP',
      desc: '',
      args: [],
    );
  }

  /// `Passages`
  String get passageNum {
    return Intl.message(
      'Passages',
      name: 'passageNum',
      desc: '',
      args: [],
    );
  }

  /// `Days`
  String get usedDays {
    return Intl.message(
      'Days',
      name: 'usedDays',
      desc: '',
      args: [],
    );
  }

  /// `Cloud services`
  String get cloudService {
    return Intl.message(
      'Cloud services',
      name: 'cloudService',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get moreService {
    return Intl.message(
      'More',
      name: 'moreService',
      desc: '',
      args: [],
    );
  }

  /// `Support platforms`
  String get platformSupport {
    return Intl.message(
      'Support platforms',
      name: 'platformSupport',
      desc: '',
      args: [],
    );
  }

  /// `Premium membership service`
  String get seniorMemberServices {
    return Intl.message(
      'Premium membership service',
      name: 'seniorMemberServices',
      desc: '',
      args: [],
    );
  }

  /// `Config pic-bed`
  String get configPicBed {
    return Intl.message(
      'Config pic-bed',
      name: 'configPicBed',
      desc: '',
      args: [],
    );
  }

  /// `Config`
  String get config {
    return Intl.message(
      'Config',
      name: 'config',
      desc: '',
      args: [],
    );
  }

  /// `Miaodi Membership`
  String get miaodiMembership {
    return Intl.message(
      'Miaodi Membership',
      name: 'miaodiMembership',
      desc: '',
      args: [],
    );
  }

  /// `membership will expired in {time}`
  String expiredTime(Object time) {
    return Intl.message(
      'membership will expired in $time',
      name: 'expiredTime',
      desc: '',
      args: [time],
    );
  }

  /// `Explore Miaodi cloud services, cross-device Markdown writing, article link sharing and other functions`
  String get questMembership {
    return Intl.message(
      'Explore Miaodi cloud services, cross-device Markdown writing, article link sharing and other functions',
      name: 'questMembership',
      desc: '',
      args: [],
    );
  }

  /// `Norm`
  String get norm {
    return Intl.message(
      'Norm',
      name: 'norm',
      desc: '',
      args: [],
    );
  }

  /// `More payment`
  String get morePaymemt {
    return Intl.message(
      'More payment',
      name: 'morePaymemt',
      desc: '',
      args: [],
    );
  }

  /// `Unlock all features of Miaodi monthly as low as`
  String get unlockMembershipLowTo {
    return Intl.message(
      'Unlock all features of Miaodi monthly as low as',
      name: 'unlockMembershipLowTo',
      desc: '',
      args: [],
    );
  }

  /// ` dollar `
  String get dollar {
    return Intl.message(
      ' dollar ',
      name: 'dollar',
      desc: '',
      args: [],
    );
  }

  /// ` 0.99 `
  String get price {
    return Intl.message(
      ' 0.99 ',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `No data or fail to load, click to retry`
  String get noDataAndTry {
    return Intl.message(
      'No data or fail to load, click to retry',
      name: 'noDataAndTry',
      desc: '',
      args: [],
    );
  }

  /// `Wait too long, click to retry`
  String get waitTooLong {
    return Intl.message(
      'Wait too long, click to retry',
      name: 'waitTooLong',
      desc: '',
      args: [],
    );
  }

  /// `Exchange by Mbit`
  String get exchangeByMbits {
    return Intl.message(
      'Exchange by Mbit',
      name: 'exchangeByMbits',
      desc: '',
      args: [],
    );
  }

  /// `Exchange by Code`
  String get exchangeByCode {
    return Intl.message(
      'Exchange by Code',
      name: 'exchangeByCode',
      desc: '',
      args: [],
    );
  }

  /// `You have {bits} Mbits`
  String currentMbits(Object bits) {
    return Intl.message(
      'You have $bits Mbits',
      name: 'currentMbits',
      desc: '',
      args: [bits],
    );
  }

  /// `You can get code by activities`
  String get getCodeTips {
    return Intl.message(
      'You can get code by activities',
      name: 'getCodeTips',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
