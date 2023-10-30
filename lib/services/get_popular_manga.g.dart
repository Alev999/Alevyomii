// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_popular_manga.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getPopularMangaHash() => r'6dbb566dffd311195e5e98b2c49470435a6da8dd';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [getPopularManga].
@ProviderFor(getPopularManga)
const getPopularMangaProvider = GetPopularMangaFamily();

/// See also [getPopularManga].
class GetPopularMangaFamily extends Family<AsyncValue<MPages?>> {
  /// See also [getPopularManga].
  const GetPopularMangaFamily();

  /// See also [getPopularManga].
  GetPopularMangaProvider call({
    required Source source,
    required int page,
  }) {
    return GetPopularMangaProvider(
      source: source,
      page: page,
    );
  }

  @override
  GetPopularMangaProvider getProviderOverride(
    covariant GetPopularMangaProvider provider,
  ) {
    return call(
      source: provider.source,
      page: provider.page,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getPopularMangaProvider';
}

/// See also [getPopularManga].
class GetPopularMangaProvider extends AutoDisposeFutureProvider<MPages?> {
  /// See also [getPopularManga].
  GetPopularMangaProvider({
    required Source source,
    required int page,
  }) : this._internal(
          (ref) => getPopularManga(
            ref as GetPopularMangaRef,
            source: source,
            page: page,
          ),
          from: getPopularMangaProvider,
          name: r'getPopularMangaProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getPopularMangaHash,
          dependencies: GetPopularMangaFamily._dependencies,
          allTransitiveDependencies:
              GetPopularMangaFamily._allTransitiveDependencies,
          source: source,
          page: page,
        );

  GetPopularMangaProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.source,
    required this.page,
  }) : super.internal();

  final Source source;
  final int page;

  @override
  Override overrideWith(
    FutureOr<MPages?> Function(GetPopularMangaRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetPopularMangaProvider._internal(
        (ref) => create(ref as GetPopularMangaRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        source: source,
        page: page,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<MPages?> createElement() {
    return _GetPopularMangaProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetPopularMangaProvider &&
        other.source == source &&
        other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, source.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetPopularMangaRef on AutoDisposeFutureProviderRef<MPages?> {
  /// The parameter `source` of this provider.
  Source get source;

  /// The parameter `page` of this provider.
  int get page;
}

class _GetPopularMangaProviderElement
    extends AutoDisposeFutureProviderElement<MPages?> with GetPopularMangaRef {
  _GetPopularMangaProviderElement(super.provider);

  @override
  Source get source => (origin as GetPopularMangaProvider).source;
  @override
  int get page => (origin as GetPopularMangaProvider).page;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
