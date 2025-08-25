// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cep_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cepRepositoryHash() => r'be98043e5c8084a9a240341230dc2e21c1b9e40e';

/// See also [cepRepository].
@ProviderFor(cepRepository)
final cepRepositoryProvider = AutoDisposeProvider<CepRepository>.internal(
  cepRepository,
  name: r'cepRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$cepRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CepRepositoryRef = AutoDisposeProviderRef<CepRepository>;
String _$cepNotifierHash() => r'34e38fe29fb5ef22dcc7d752aadff73133175dc8';

/// See also [CepNotifier].
@ProviderFor(CepNotifier)
final cepNotifierProvider =
    AutoDisposeAsyncNotifierProvider<CepNotifier, CepModel?>.internal(
      CepNotifier.new,
      name: r'cepNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$cepNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$CepNotifier = AutoDisposeAsyncNotifier<CepModel?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
