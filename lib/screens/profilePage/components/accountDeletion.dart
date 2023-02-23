import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class AccountDeletionDialog extends StatefulWidget {
  final String userEmail;
  final int deletionPeriodInDays;

  const AccountDeletionDialog(
      {Key? key, required this.userEmail, required this.deletionPeriodInDays})
      : super(key: key);

  @override
  _AccountDeletionDialogState createState() => _AccountDeletionDialogState();
}

class _AccountDeletionDialogState extends State<AccountDeletionDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isDeleting = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onDeletePressed() {
    setState(() {
      _isDeleting = true;
    });
    _animationController.forward().whenComplete(() {
      // Do something to delete the user's account
      _animationController.reverse().whenComplete(() {
        setState(() {
          _isDeleting = false;
        });
        Navigator.of(context, rootNavigator: true).pop();

        // Use a separate context for the AwesomeDialog
        BuildContext topContext =
            context.findAncestorStateOfType<NavigatorState>()!.overlay!.context;
        AwesomeDialog(
          context: topContext,
          dialogType: DialogType.success,
          animType: AnimType.rightSlide,
          title: 'Request Raised Successful',
          desc: 'Account will be Deleted automatically after 7 Business Days',
          btnOkOnPress: () {
            Navigator.of(topContext, rootNavigator: true).pop();
          },
        )..show();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Delete Account?'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('This action is permanent and cannot be undone.'),
            SizedBox(height: 16),
            Text(
                'Your account and all its associated data will be deleted in ${widget.deletionPeriodInDays} days.'),
            SizedBox(height: 16),
            Text('Email: ${widget.userEmail}'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('CANCEL'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          child: _isDeleting
              ? SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                    strokeWidth: 2.0,
                  ),
                )
              : Text('PROCEED'),
          onPressed: _isDeleting ? null : _onDeletePressed,
        ),
      ],
    );
  }
}
