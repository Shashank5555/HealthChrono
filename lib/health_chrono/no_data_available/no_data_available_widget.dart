import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'no_data_available_model.dart';
export 'no_data_available_model.dart';

class NoDataAvailableWidget extends StatefulWidget {
  const NoDataAvailableWidget({super.key});

  @override
  State<NoDataAvailableWidget> createState() => _NoDataAvailableWidgetState();
}

class _NoDataAvailableWidgetState extends State<NoDataAvailableWidget> {
  late NoDataAvailableModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoDataAvailableModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 600.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Lottie.network(
                'https://lottie.host/8c5ade68-6f81-42ad-b056-0709fd92c400/QX04dggvIr.json',
                width: 440.0,
                height: 200.0,
                fit: BoxFit.contain,
                animate: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
