import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'edit_profile_widget.dart' show EditProfileWidget;
import 'package:flutter/material.dart';

class EditProfileModel extends FlutterFlowModel<EditProfileWidget> {
  ///  Local state fields for this page.

  bool isSendOTPClicked = false;

  bool showSendOTP = false;

  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  bool isDataUploading_profilePictureEP = false;
  FFUploadedFile uploadedLocalFile_profilePictureEP =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (upload_profile_picture_clients_me_profile_picture_put)] action in Button widget.
  ApiCallResponse? uploadProfilePicture;
  // Stores action output result for [Backend Call - API (delete_profile_picture_clients_me_profile_picture_delete)] action in Button widget.
  ApiCallResponse? deleteProfilePicture;
  // State field(s) for fname_EP widget.
  FocusNode? fnameEPFocusNode;
  TextEditingController? fnameEPTextController;
  String? Function(BuildContext, String?)? fnameEPTextControllerValidator;
  String? _fnameEPTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'pwxndrnp' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for lname_EP widget.
  FocusNode? lnameEPFocusNode;
  TextEditingController? lnameEPTextController;
  String? Function(BuildContext, String?)? lnameEPTextControllerValidator;
  String? _lnameEPTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '47hl795e' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for gender_EP widget.
  String? genderEPValue;
  FormFieldController<String>? genderEPValueController;
  DateTime? datePicked1;
  // State field(s) for timezone_practitionerCA widget.
  String? timezonePractitionerCAValue;
  FormFieldController<String>? timezonePractitionerCAValueController;
  // State field(s) for contact_EP widget.
  FocusNode? contactEPFocusNode;
  TextEditingController? contactEPTextController;
  String? Function(BuildContext, String?)? contactEPTextControllerValidator;
  // Stores action output result for [Backend Call - API (otp_email_send_otp_email_send_post)] action in Button_send widget.
  ApiCallResponse? requestContactUpdateOTP;
  // State field(s) for OTP_EP widget.
  FocusNode? otpEpFocusNode;
  TextEditingController? otpEpTextController;
  String? Function(BuildContext, String?)? otpEpTextControllerValidator;
  // Stores action output result for [Backend Call - API (update_my_phone_me_phone_put)] action in Button_send widget.
  ApiCallResponse? updateContactNumber;
  // Stores action output result for [Backend Call - API (update_profile_clients_me_patch)] action in saveChanges_EP widget.
  ApiCallResponse? updateUserResponse;
  bool isDataUploading_profilePicturePracEP = false;
  FFUploadedFile uploadedLocalFile_profilePicturePracEP =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (upload_profile_picture_practitioners_me_profile_picture_put)] action in Button widget.
  ApiCallResponse? uploadProfilePicturePrac;
  // Stores action output result for [Backend Call - API (delete_profile_picture_practitioners_me_profile_picture_delete)] action in Button widget.
  ApiCallResponse? deleteProfilePicturePrac;
  // State field(s) for fnamePrac_EP widget.
  FocusNode? fnamePracEPFocusNode;
  TextEditingController? fnamePracEPTextController;
  String? Function(BuildContext, String?)? fnamePracEPTextControllerValidator;
  String? _fnamePracEPTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '0vehavkm' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for lnamePrac_EP widget.
  FocusNode? lnamePracEPFocusNode;
  TextEditingController? lnamePracEPTextController;
  String? Function(BuildContext, String?)? lnamePracEPTextControllerValidator;
  String? _lnamePracEPTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'xxd8xk9c' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for genderPrac_EP widget.
  String? genderPracEPValue;
  FormFieldController<String>? genderPracEPValueController;
  DateTime? datePicked2;
  // State field(s) for timezone_pracCA widget.
  String? timezonePracCAValue;
  FormFieldController<String>? timezonePracCAValueController;
  // State field(s) for contactPrac_EP widget.
  FocusNode? contactPracEPFocusNode;
  TextEditingController? contactPracEPTextController;
  String? Function(BuildContext, String?)? contactPracEPTextControllerValidator;
  // Stores action output result for [Backend Call - API (otp_email_send_otp_email_send_post)] action in Button_send widget.
  ApiCallResponse? requestContactUpdatePracOTP;
  // State field(s) for OTPPrac_EP widget.
  FocusNode? oTPPracEPFocusNode;
  TextEditingController? oTPPracEPTextController;
  String? Function(BuildContext, String?)? oTPPracEPTextControllerValidator;
  // Stores action output result for [Backend Call - API (update_my_phone_me_phone_put)] action in Button_send widget.
  ApiCallResponse? updateContactNumberPrac;
  // Stores action output result for [Backend Call - API (update_practitioner_profile_practitioners_me_patch)] action in saveChangesPrac_EP widget.
  ApiCallResponse? updateUserPracResponse;

  @override
  void initState(BuildContext context) {
    fnameEPTextControllerValidator = _fnameEPTextControllerValidator;
    lnameEPTextControllerValidator = _lnameEPTextControllerValidator;
    fnamePracEPTextControllerValidator = _fnamePracEPTextControllerValidator;
    lnamePracEPTextControllerValidator = _lnamePracEPTextControllerValidator;
  }

  @override
  void dispose() {
    fnameEPFocusNode?.dispose();
    fnameEPTextController?.dispose();

    lnameEPFocusNode?.dispose();
    lnameEPTextController?.dispose();

    contactEPFocusNode?.dispose();
    contactEPTextController?.dispose();

    otpEpFocusNode?.dispose();
    otpEpTextController?.dispose();

    fnamePracEPFocusNode?.dispose();
    fnamePracEPTextController?.dispose();

    lnamePracEPFocusNode?.dispose();
    lnamePracEPTextController?.dispose();

    contactPracEPFocusNode?.dispose();
    contactPracEPTextController?.dispose();

    oTPPracEPFocusNode?.dispose();
    oTPPracEPTextController?.dispose();
  }
}
