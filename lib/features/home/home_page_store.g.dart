// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomePageStore on _HomePageStore, Store {
  late final _$clickAdAtom =
      Atom(name: '_HomePageStore.clickAd', context: context);

  @override
  bool get clickAd {
    _$clickAdAtom.reportRead();
    return super.clickAd;
  }

  @override
  set clickAd(bool value) {
    _$clickAdAtom.reportWrite(value, super.clickAd, () {
      super.clickAd = value;
    });
  }

  late final _$setClickAdAsyncAction =
      AsyncAction('_HomePageStore.setClickAd', context: context);

  @override
  Future<void> setClickAd() {
    return _$setClickAdAsyncAction.run(() => super.setClickAd());
  }

  @override
  String toString() {
    return '''
clickAd: ${clickAd}
    ''';
  }
}
