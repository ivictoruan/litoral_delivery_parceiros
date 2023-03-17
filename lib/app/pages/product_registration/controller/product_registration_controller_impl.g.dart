// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_registration_controller_impl.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension RegisterProductStatusMatch on RegisterProductStatus {
  T match<T>(
      {required T Function() initial,
      required T Function() success,
      required T Function() register,
      required T Function() loading,
      required T Function() registerError,
      required T Function() error}) {
    final v = this;
    if (v == RegisterProductStatus.initial) {
      return initial();
    }

    if (v == RegisterProductStatus.success) {
      return success();
    }

    if (v == RegisterProductStatus.register) {
      return register();
    }

    if (v == RegisterProductStatus.loading) {
      return loading();
    }

    if (v == RegisterProductStatus.registerError) {
      return registerError();
    }

    if (v == RegisterProductStatus.error) {
      return error();
    }

    throw Exception(
        'RegisterProductStatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? initial,
      T Function()? success,
      T Function()? register,
      T Function()? loading,
      T Function()? registerError,
      T Function()? error}) {
    final v = this;
    if (v == RegisterProductStatus.initial && initial != null) {
      return initial();
    }

    if (v == RegisterProductStatus.success && success != null) {
      return success();
    }

    if (v == RegisterProductStatus.register && register != null) {
      return register();
    }

    if (v == RegisterProductStatus.loading && loading != null) {
      return loading();
    }

    if (v == RegisterProductStatus.registerError && registerError != null) {
      return registerError();
    }

    if (v == RegisterProductStatus.error && error != null) {
      return error();
    }

    return any();
  }
}
