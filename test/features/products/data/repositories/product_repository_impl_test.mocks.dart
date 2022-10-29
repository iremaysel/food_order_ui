// Mocks generated by Mockito 5.3.2 from annotations
// in food_order_ui/test/features/products/data/repositories/product_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:food_order_ui/features/products/domain/entities/product.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

import 'product_repository_impl_test.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeProduct_0 extends _i1.SmartFake implements _i2.Product {
  _FakeProduct_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [FakeProductRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockFakeProductRemoteDataSource extends _i1.Mock
    implements _i3.FakeProductRemoteDataSource {
  MockFakeProductRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<List<_i2.Product>> getAllProducts() => (super.noSuchMethod(
        Invocation.method(
          #getAllProducts,
          [],
        ),
        returnValue: _i4.Future<List<_i2.Product>>.value(<_i2.Product>[]),
      ) as _i4.Future<List<_i2.Product>>);
  @override
  _i4.Future<_i2.Product> createProduct(_i2.Product? product) =>
      (super.noSuchMethod(
        Invocation.method(
          #createProduct,
          [product],
        ),
        returnValue: _i4.Future<_i2.Product>.value(_FakeProduct_0(
          this,
          Invocation.method(
            #createProduct,
            [product],
          ),
        )),
      ) as _i4.Future<_i2.Product>);
  @override
  _i4.Future<_i2.Product> getProductById(String? id) => (super.noSuchMethod(
        Invocation.method(
          #getProductById,
          [id],
        ),
        returnValue: _i4.Future<_i2.Product>.value(_FakeProduct_0(
          this,
          Invocation.method(
            #getProductById,
            [id],
          ),
        )),
      ) as _i4.Future<_i2.Product>);
}

/// A class which mocks [FakeNetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockFakeNetworkInfo extends _i1.Mock implements _i3.FakeNetworkInfo {
  MockFakeNetworkInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<bool> get isConnected => (super.noSuchMethod(
        Invocation.getter(#isConnected),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
}