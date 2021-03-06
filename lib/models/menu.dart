import 'dart:convert';

import 'package:flutter_admin/vo/treeVO.dart';

class Menu extends TreeData {
   String id;
   String pid;
   bool checked;
   String name;
   String nameEn;
   String icon;
   String url;
   String pname;
   int orderBy;
   String module;
   String remark;
   String createTime;
   String updateTime;
  Menu({
    this.id,
    this.pid,
    this.checked,
    this.name,
    this.nameEn,
    this.icon,
    this.url,
    this.pname,
    this.orderBy,
    this.module,
    this.remark,
    this.createTime,
    this.updateTime,
  }) : super(id, pid);

  Menu copyWith({
    String id,
    String pid,
    bool checked,
    String name,
    String nameEn,
    String icon,
    String url,
    String pname,
    int orderBy,
    String module,
    String remark,
    String createTime,
    String updateTime,
  }) {
    return Menu(
      id: id ?? this.id,
      pid: pid ?? this.pid,
      checked: checked ?? this.checked,
      name: name ?? this.name,
      nameEn: nameEn ?? this.nameEn,
      icon: icon ?? this.icon,
      url: url ?? this.url,
      pname: pname ?? this.pname,
      orderBy: orderBy ?? this.orderBy,
      module: module ?? this.module,
      remark: remark ?? this.remark,
      createTime: createTime ?? this.createTime,
      updateTime: updateTime ?? this.updateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'pid': pid,
      'checked': checked,
      'name': name,
      'nameEn': nameEn,
      'icon': icon,
      'url': url,
      'pname': pname,
      'orderBy': orderBy,
      'module': module,
      'remark': remark,
      'createTime': createTime,
      'updateTime': updateTime,
    };
  }

  factory Menu.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Menu(
      id: map['id'],
      pid: map['pid'],
      checked: map['checked'],
      name: map['name'],
      nameEn: map['nameEn'],
      icon: map['icon'],
      url: map['url'],
      pname: map['pname'],
      orderBy: map['orderBy']?.toInt(),
      module: map['module'],
      remark: map['remark'],
      createTime: map['createTime'],
      updateTime: map['updateTime'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Menu.fromJson(String source) => Menu.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Menu(id: $id, pid: $pid, checked: $checked, name: $name, nameEn: $nameEn, icon: $icon, url: $url, pname: $pname, orderBy: $orderBy, module: $module, remark: $remark, createTime: $createTime, updateTime: $updateTime)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Menu &&
        o.id == id &&
        o.pid == pid &&
        o.checked == checked &&
        o.name == name &&
        o.nameEn == nameEn &&
        o.icon == icon &&
        o.url == url &&
        o.pname == pname &&
        o.orderBy == orderBy &&
        o.module == module &&
        o.remark == remark &&
        o.createTime == createTime &&
        o.updateTime == updateTime;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        pid.hashCode ^
        checked.hashCode ^
        name.hashCode ^
        nameEn.hashCode ^
        icon.hashCode ^
        url.hashCode ^
        pname.hashCode ^
        orderBy.hashCode ^
        module.hashCode ^
        remark.hashCode ^
        createTime.hashCode ^
        updateTime.hashCode;
  }
}
