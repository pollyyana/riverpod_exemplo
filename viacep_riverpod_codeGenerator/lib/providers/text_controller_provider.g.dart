// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_controller_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cepFormatterHash() => r'4eb9504c33ee6cef8d529e84894532327b7b2884';

/// See also [cepFormatter].
@ProviderFor(cepFormatter)
final cepFormatterProvider =
    AutoDisposeProvider<MaskTextInputFormatter>.internal(
      cepFormatter,
      name: r'cepFormatterProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$cepFormatterHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CepFormatterRef = AutoDisposeProviderRef<MaskTextInputFormatter>;
String _$cepTextControllerHash() => r'5ff77ff0dda0ba0c8371dca89a684b671971ba54';

/// See also [CepTextController].
@ProviderFor(CepTextController)
final cepTextControllerProvider =
    AutoDisposeNotifierProvider<
      CepTextController,
      TextEditingController
    >.internal(
      CepTextController.new,
      name: r'cepTextControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$cepTextControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$CepTextController = AutoDisposeNotifier<TextEditingController>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
