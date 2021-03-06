import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin/api/userInfoApi.dart';
import 'package:flutter_admin/components/cryButton.dart';
import 'package:flutter_admin/components/form2/crySelectDate.dart';
import 'package:flutter_admin/components/form2/crySelect.dart';
import 'package:flutter_admin/components/form2/cryInput.dart';
import 'package:flutter_admin/constants/constantDict.dart';
import 'package:flutter_admin/models/responseBodyApi.dart';
import 'package:flutter_admin/models/userInfo.dart';
import 'package:flutter_admin/utils/dictUtil.dart';
import '../../generated/l10n.dart';

class UserInfoEdit extends StatefulWidget {
  UserInfoEdit({this.userInfo});

  final UserInfo userInfo;

  @override
  _UserInfoEditState createState() => _UserInfoEditState();
}

class _UserInfoEditState extends State<UserInfoEdit> {
  UserInfo userInfo;
  bool isAdd;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    this.isAdd = widget.userInfo == null;
    this.userInfo = widget.userInfo ?? UserInfo();
  }

  @override
  Widget build(BuildContext context) {
    var form = Form(
      key: formKey,
      child: Wrap(
        children: <Widget>[
          CryInput(
            label: '账号',
            value: userInfo.userName,
            onSaved: (v) => {userInfo.userName = v},
            validator: (v) => this.isAdd && v.isEmpty ? '必填' : null,
            enable: this.isAdd,
          ),
          CryInput(
            label: S.of(context).personName,
            value: userInfo.name,
            onSaved: (v) => {userInfo.name = v},
          ),
          CryInput(
            label: S.of(context).personNickname,
            value: userInfo.nickName,
            onSaved: (v) => {userInfo.nickName = v},
          ),
          CrySelectDate(
            label: S.of(context).personBirthday,
            context: context,
            value: userInfo.birthday,
            onSaved: (v) => {userInfo.birthday = v},
          ),
          CrySelect(
            label: S.of(context).personGender,
            dataList: DictUtil.getDictSelectOptionList(ConstantDict.CODE_GENDER),
            value: userInfo.gender,
            onSaved: (v) => {userInfo.gender = v},
          ),
          CrySelect(
              label: S.of(context).personDepartment,
              dataList: DictUtil.getDictSelectOptionList(ConstantDict.CODE_DEPT),
              value: userInfo.deptId,
              onSaved: (v) => {userInfo.deptId = v}),
          // CryInput(label: '籍贯'),
        ],
      ),
    );
    var buttonBar = ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        CryButton(
          label: S.of(context).save,
          onPressed: () {
            FormState form = formKey.currentState;
            if (!form.validate()) {
              return;
            }
            form.save();
            UserInfoApi.saveOrUpdate(userInfo.toMap()).then((ResponseBodyApi res) {
              if (!res.success) {
                return;
              }
              BotToast.showText(text: S.of(context).saved);
              Navigator.pop(context, true);
            });
          },
          iconData: Icons.save,
        ),
        CryButton(
          label: S.of(context).cancel,
          onPressed: () {
            Navigator.pop(context);
          },
          iconData: Icons.cancel,
        )
      ],
    );
    var result = Scaffold(
      appBar: AppBar(
        title: Text(this.isAdd ? S.of(context).increase : S.of(context).modify),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [form],
        ),
      ),
      bottomNavigationBar: buttonBar,
    );
    return SizedBox(
      width: 650,
      height: 580,
      child: result,
    );
    // return result;
  }
}
