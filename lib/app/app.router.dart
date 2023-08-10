// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i15;
import 'package:stacked/stacked.dart' as _i14;
import 'package:stacked_services/stacked_services.dart' as _i13;

import '../ui/views/dashboard/dashboard_view.dart' as _i2;
import '../ui/views/dosen/dosen_view.dart' as _i6;
import '../ui/views/fakultas/fakultas_view.dart' as _i8;
import '../ui/views/home/home_view.dart' as _i4;
import '../ui/views/kelas/kelas_view.dart' as _i10;
import '../ui/views/matakuliah/matakuliah_view.dart' as _i5;
import '../ui/views/pengampu/pengampu_view.dart' as _i11;
import '../ui/views/pengaturan/pengaturan_view.dart' as _i12;
import '../ui/views/program_studi/program_studi_view.dart' as _i7;
import '../ui/views/ruangan/ruangan_view.dart' as _i9;
import '../ui/views/startup/startup_view.dart' as _i1;
import '../ui/views/unknown/unknown_view.dart' as _i3;

final stackedRouter =
    StackedRouterWeb(navigatorKey: _i13.StackedService.navigatorKey);

class StackedRouterWeb extends _i14.RootStackRouter {
  StackedRouterWeb({_i15.GlobalKey<_i15.NavigatorState>? navigatorKey})
      : super(navigatorKey);

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    StartupViewRoute.name: (routeData) {
      return _i14.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.StartupView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    DashboardViewRoute.name: (routeData) {
      return _i14.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.DashboardView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    UnknownViewRoute.name: (routeData) {
      return _i14.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.UnknownView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeViewRoute.name: (routeData) {
      return _i14.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i4.HomeView(),
        transitionsBuilder: _i14.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    MatakuliahViewRoute.name: (routeData) {
      return _i14.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i5.MatakuliahView(),
        transitionsBuilder: _i14.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    DosenViewRoute.name: (routeData) {
      return _i14.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i6.DosenView(),
        transitionsBuilder: _i14.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ProgramStudiViewRoute.name: (routeData) {
      return _i14.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i7.ProgramStudiView(),
        transitionsBuilder: _i14.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    FakultasViewRoute.name: (routeData) {
      return _i14.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i8.FakultasView(),
        transitionsBuilder: _i14.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    RuanganViewRoute.name: (routeData) {
      return _i14.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i9.RuanganView(),
        transitionsBuilder: _i14.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    KelasViewRoute.name: (routeData) {
      return _i14.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i10.KelasView(),
        transitionsBuilder: _i14.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    PengampuViewRoute.name: (routeData) {
      return _i14.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i11.PengampuView(),
        transitionsBuilder: _i14.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    PengaturanViewRoute.name: (routeData) {
      return _i14.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i12.PengaturanView(),
        transitionsBuilder: _i14.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i14.RouteConfig> get routes => [
        _i14.RouteConfig(
          StartupViewRoute.name,
          path: '/',
        ),
        _i14.RouteConfig(
          DashboardViewRoute.name,
          path: '/dashboard-view',
          children: [
            _i14.RouteConfig(
              '#redirect',
              path: '',
              parent: DashboardViewRoute.name,
              redirectTo: 'home',
              fullMatch: true,
            ),
            _i14.RouteConfig(
              HomeViewRoute.name,
              path: '',
              parent: DashboardViewRoute.name,
            ),
            _i14.RouteConfig(
              MatakuliahViewRoute.name,
              path: 'matakuliah-view',
              parent: DashboardViewRoute.name,
            ),
            _i14.RouteConfig(
              DosenViewRoute.name,
              path: 'dosen-view',
              parent: DashboardViewRoute.name,
            ),
            _i14.RouteConfig(
              ProgramStudiViewRoute.name,
              path: 'program-studi-view',
              parent: DashboardViewRoute.name,
            ),
            _i14.RouteConfig(
              FakultasViewRoute.name,
              path: 'fakultas-view',
              parent: DashboardViewRoute.name,
            ),
            _i14.RouteConfig(
              RuanganViewRoute.name,
              path: 'ruangan-view',
              parent: DashboardViewRoute.name,
            ),
            _i14.RouteConfig(
              KelasViewRoute.name,
              path: 'kelas-view',
              parent: DashboardViewRoute.name,
            ),
            _i14.RouteConfig(
              PengampuViewRoute.name,
              path: 'pengampu-view',
              parent: DashboardViewRoute.name,
            ),
            _i14.RouteConfig(
              PengaturanViewRoute.name,
              path: 'pengaturan-view',
              parent: DashboardViewRoute.name,
            ),
          ],
        ),
        _i14.RouteConfig(
          UnknownViewRoute.name,
          path: '/404',
        ),
        _i14.RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '/404',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [_i1.StartupView]
class StartupViewRoute extends _i14.PageRouteInfo<void> {
  const StartupViewRoute()
      : super(
          StartupViewRoute.name,
          path: '/',
        );

  static const String name = 'StartupView';
}

/// generated route for
/// [_i2.DashboardView]
class DashboardViewRoute extends _i14.PageRouteInfo<void> {
  const DashboardViewRoute({List<_i14.PageRouteInfo>? children})
      : super(
          DashboardViewRoute.name,
          path: '/dashboard-view',
          initialChildren: children,
        );

  static const String name = 'DashboardView';
}

/// generated route for
/// [_i3.UnknownView]
class UnknownViewRoute extends _i14.PageRouteInfo<void> {
  const UnknownViewRoute()
      : super(
          UnknownViewRoute.name,
          path: '/404',
        );

  static const String name = 'UnknownView';
}

/// generated route for
/// [_i4.HomeView]
class HomeViewRoute extends _i14.PageRouteInfo<void> {
  const HomeViewRoute()
      : super(
          HomeViewRoute.name,
          path: '',
        );

  static const String name = 'HomeView';
}

/// generated route for
/// [_i5.MatakuliahView]
class MatakuliahViewRoute extends _i14.PageRouteInfo<void> {
  const MatakuliahViewRoute()
      : super(
          MatakuliahViewRoute.name,
          path: 'matakuliah-view',
        );

  static const String name = 'MatakuliahView';
}

/// generated route for
/// [_i6.DosenView]
class DosenViewRoute extends _i14.PageRouteInfo<void> {
  const DosenViewRoute()
      : super(
          DosenViewRoute.name,
          path: 'dosen-view',
        );

  static const String name = 'DosenView';
}

/// generated route for
/// [_i7.ProgramStudiView]
class ProgramStudiViewRoute extends _i14.PageRouteInfo<void> {
  const ProgramStudiViewRoute()
      : super(
          ProgramStudiViewRoute.name,
          path: 'program-studi-view',
        );

  static const String name = 'ProgramStudiView';
}

/// generated route for
/// [_i8.FakultasView]
class FakultasViewRoute extends _i14.PageRouteInfo<void> {
  const FakultasViewRoute()
      : super(
          FakultasViewRoute.name,
          path: 'fakultas-view',
        );

  static const String name = 'FakultasView';
}

/// generated route for
/// [_i9.RuanganView]
class RuanganViewRoute extends _i14.PageRouteInfo<void> {
  const RuanganViewRoute()
      : super(
          RuanganViewRoute.name,
          path: 'ruangan-view',
        );

  static const String name = 'RuanganView';
}

/// generated route for
/// [_i10.KelasView]
class KelasViewRoute extends _i14.PageRouteInfo<void> {
  const KelasViewRoute()
      : super(
          KelasViewRoute.name,
          path: 'kelas-view',
        );

  static const String name = 'KelasView';
}

/// generated route for
/// [_i11.PengampuView]
class PengampuViewRoute extends _i14.PageRouteInfo<void> {
  const PengampuViewRoute()
      : super(
          PengampuViewRoute.name,
          path: 'pengampu-view',
        );

  static const String name = 'PengampuView';
}

/// generated route for
/// [_i12.PengaturanView]
class PengaturanViewRoute extends _i14.PageRouteInfo<void> {
  const PengaturanViewRoute()
      : super(
          PengaturanViewRoute.name,
          path: 'pengaturan-view',
        );

  static const String name = 'PengaturanView';
}

extension RouterStateExtension on _i13.RouterService {
  Future<dynamic> navigateToStartupView(
      {void Function(_i14.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const StartupViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToDashboardView(
      {void Function(_i14.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const DashboardViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToUnknownView(
      {void Function(_i14.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const UnknownViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToHomeView(
      {void Function(_i14.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToMatakuliahView(
      {void Function(_i14.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const MatakuliahViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToDosenView(
      {void Function(_i14.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const DosenViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToProgramStudiView(
      {void Function(_i14.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const ProgramStudiViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToFakultasView(
      {void Function(_i14.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const FakultasViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToRuanganView(
      {void Function(_i14.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const RuanganViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToKelasView(
      {void Function(_i14.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const KelasViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToPengampuView(
      {void Function(_i14.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const PengampuViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToPengaturanView(
      {void Function(_i14.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const PengaturanViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithStartupView(
      {void Function(_i14.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const StartupViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithDashboardView(
      {void Function(_i14.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const DashboardViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithUnknownView(
      {void Function(_i14.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const UnknownViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithHomeView(
      {void Function(_i14.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithMatakuliahView(
      {void Function(_i14.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const MatakuliahViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithDosenView(
      {void Function(_i14.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const DosenViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithProgramStudiView(
      {void Function(_i14.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const ProgramStudiViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithFakultasView(
      {void Function(_i14.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const FakultasViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithRuanganView(
      {void Function(_i14.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const RuanganViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithKelasView(
      {void Function(_i14.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const KelasViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithPengampuView(
      {void Function(_i14.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const PengampuViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithPengaturanView(
      {void Function(_i14.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const PengaturanViewRoute(),
      onFailure: onFailure,
    );
  }
}
