# Telemedicine Project - File Rules & Architecture Guidelines

> **Last Updated:** May 15, 2026  
> **Project Type:** Flutter Mobile Application (Clean Architecture)  
> **Minimum Dart Version:** 3.10.0+

---

## Table of Contents

1. [Project Overview](#project-overview)
2. [Directory Structure](#directory-structure)
3. [File Naming Conventions](#file-naming-conventions)
4. [Clean Architecture Layers](#clean-architecture-layers)
5. [Feature Module Structure](#feature-module-structure)
6. [Core (Shared Infrastructure)](#core-shared-infrastructure)
7. [Routing Guidelines](#routing-guidelines)
8. [State Management (BLoC)](#state-management-bloc)
9. [Internationalization](#internationalization)
10. [API Integration](#api-integration)
11. [Error Handling](#error-handling)
12. [Assets Management](#assets-management)
13. [Dependencies & Versions](#dependencies--versions)
14. [Code Quality Standards](#code-quality-standards)
15. [Best Practices Checklist](#best-practices-checklist)

---

## Project Overview

**Architecture:** Clean Architecture with Domain-Driven Design  
**State Management:** BLoC (flutter_bloc 9.1.1)  
**Dependency Injection:** GetIt (get_it 9.2.0)  
**HTTP Client:** Dio (5.9.2)  
**Localization:** easy_localization (3.0.7)  
**Backend:** Azure REST API  
**Platforms Supported:** Android, iOS, Windows, Linux, macOS, Web

---

## Directory Structure

```
telemedicine/
├── lib/
│   ├── main.dart                          # App entry point
│   ├── core/                              # Shared infrastructure
│   │   ├── bloc_obs.dart
│   │   ├── constants/
│   │   ├── error/
│   │   ├── helper/
│   │   ├── network/
│   │   ├── routes/
│   │   ├── shared_models/
│   │   ├── si/                            # Service locator (Dependency Injection)
│   │   ├── theme/
│   │   ├── utils/
│   │   └── widgets/
│   │
│   └── features/                          # Feature modules (7 total)
│       ├── auth/                          # Authentication
│       ├── home/                          # Home dashboard
│       ├── book_doctor/                   # Doctor booking
│       ├── patient_appointments/          # User appointments
│       ├── settings/                      # User settings
│       ├── check ur self/                 # Self-diagnosis
│       └── on_boarding/                   # Onboarding flow
│
├── assets/
│   ├── icons/                             # Symptom & app icons
│   ├── images/                            # Onboarding & media
│   └── translations/
│       ├── ar.json                        # Arabic translations
│       └── en.json                        # English translations
│
├── android/                               # Android native code
├── ios/                                   # iOS native code
├── windows/                               # Windows desktop support
├── linux/                                 # Linux desktop support
├── macos/                                 # macOS desktop support
├── web/                                   # Web support
│
├── pubspec.yaml                           # Dependencies & assets
├── analysis_options.yaml                  # Dart linter rules
├── firebase.json                          # Firebase config
├── flutter_launcher_icons.yaml            # Icon generation
├── devtools_options.yaml                  # DevTools settings
└── README.md                              # Project documentation
```

---

## File Naming Conventions

### **Dart Files**

| Component Type | Naming Pattern | Example | Location |
|---|---|---|---|
| **Screen** | `*_screen.dart` | `login_screen.dart` | `presentation/screens/` |
| **Widget** | `*_widget.dart` or descriptive | `custom_app_label.dart` | `presentation/widgets/` |
| **Cubit** | `*_cubit.dart` | `auth_cubit.dart` | `presentation/cubit/` |
| **Bloc** | `*_bloc.dart` | `auth_bloc.dart` | `presentation/bloc/` |
| **Repository** | `*_repo.dart` | `auth_repo.dart` | `data/repo/` |
| **Data Source** | `*_api_data_source.dart` or `*_remote_data_source.dart` | `auth_api_data_source.dart` | `data/datasource/` |
| **Model** | `*_model.dart` | `doctor_model.dart` | `data/models/` |
| **Entity** | `*_entity.dart` | `doctor_entity.dart` | `domain/entities/` |
| **Use Case** | Descriptive with no suffix | `login.dart`, `get_all_doctors.dart` | `domain/use_cases/` |
| **Mapper** | `*_mapper.dart` | `doctor_mapper.dart` | `data/mapper/` or `domain/mapper/` |
| **Constants** | `constants_*.dart` | `constants_assets.dart` | `core/constants/` |
| **Service** | `*_service.dart` | `dio_services.dart` | `core/network/` |
| **Utility** | `*_utils.dart` | `ui_utils.dart` | `core/utils/` |

### **Case Convention**

- **File names:** `snake_case` ✅
- **Class names:** `PascalCase` ✅
- **Variables/functions:** `camelCase` ✅
- **Constants:** `UPPER_SNAKE_CASE` ✅

✗ **DO NOT USE:** `kebab-case`, `CAMEL_CASE`, `MixedCase` in file names

---

## Clean Architecture Layers

### **1. Presentation Layer** (UI & State Management)
```
feature/
└── presentation/
    ├── cubit/
    │   ├── *_cubit.dart       # State management logic
    │   └── *_state.dart       # States (if using Bloc instead)
    ├── screens/
    │   └── *_screen.dart      # Full-page UI
    └── widgets/
        └── *.dart             # Reusable UI components
```

**Responsibilities:**
- Handle user interactions
- Display UI based on state
- Call use cases through cubits

### **2. Domain Layer** (Business Logic)
```
feature/
└── domain/
    ├── entities/
    │   └── *_entity.dart      # Core business models
    ├── repo/
    │   └── *_repo.dart        # Abstract repository interfaces
    └── use_cases/
        └── *.dart             # Business logic operations
```

**Responsibilities:**
- Define business rules
- Abstract repository contracts
- Define use cases

### **3. Data Layer** (Data Sources & Repository Implementation)
```
feature/
└── data/
    ├── datasource/
    │   ├── *_api_data_source.dart        # Remote API calls
    │   └── *_remote_data_source.dart     # Data source abstraction
    ├── models/
    │   └── *_model.dart       # JSON serializable models
    ├── mapper/
    │   └── *_mapper.dart      # Model ↔ Entity conversion
    └── repo/
        └── *_repo.dart        # Repository implementation
```

**Responsibilities:**
- Fetch data from remote/local sources
- Convert models to entities
- Implement repository interfaces

---

## Feature Module Structure

Each feature follows this **mandatory** structure:

```
feature_name/
├── data/
│   ├── datasource/
│   │   ├── {feature}_api_data_source.dart
│   │   └── {feature}_remote_data_source.dart
│   ├── models/
│   │   └── {feature}_model.dart
│   ├── mapper/
│   │   └── {feature}_mapper.dart
│   └── repo/
│       └── {feature}_repo.dart
├── domain/
│   ├── entities/
│   │   └── {feature}_entity.dart
│   ├── repo/
│   │   └── {feature}_repo_imp.dart
│   └── use_cases/
│       └── *.dart
└── presentation/
    ├── cubit/
    │   └── {feature}_cubit.dart
    ├── screens/
    │   └── *_screen.dart
    └── widgets/
        └── *.dart
```

### **Current Features (7 Total)**

| Feature | Path | Purpose |
|---|---|---|
| Authentication | `lib/features/auth/` | User login, signup, password reset |
| Home | `lib/features/home/` | Dashboard with top doctors |
| Book Doctor | `lib/features/book_doctor/` | Browse & book appointments |
| Patient Appointments | `lib/features/patient_appointments/` | View user's appointments |
| Settings | `lib/features/settings/` | Profile, password, language settings |
| Check Yourself | `lib/features/check ur self/` | Self-diagnosis tool |
| On-boarding | `lib/features/on_boarding/` | Initial app tutorial |

---

## Core (Shared Infrastructure)

### **bloc_obs.dart**
- Global BLoC observer for logging state changes
- Used in `main.dart` for debugging

### **constants/**
- `constants_assets.dart` - Image & icon paths
- `constants_text.dart` - UI text strings

### **error/**
- `failure.dart` - Error/exception handling model
- Used in domain layer for error propagation

### **helper/validations/app_validations.dart**
- Email validation
- Password validation
- Phone number validation
- Input sanitization functions

### **network/**
- `api_constants.dart` - Base URL, endpoints, headers
- `api_services.dart` - Abstract API interface
- `dio_services.dart` - Dio HTTP client implementation
- `dio_interceptor.dart` - Request/response interceptors (logging, auth tokens)
- `methods.dart` - HTTP helper utilities

### **routes/app_routes.dart**
Contains 16 named routes for all screens. Always use named routes for navigation.

### **shared_models/**
Reusable models used across features:
- `doctor/` - Doctor entity, model, mapper
- `user/` - User entity, model, mapper

### **si/service_locator.dart**
GetIt dependency injection setup:
- Registers data sources
- Registers repositories
- Registers use cases
- Registers cubits

**RULE:** All services must be registered here before use.

### **theme/**
- `app_text_styles.dart` - Typography (headline, body, button styles)
- `app_theme.dart` - Light/dark theme configuration
- `color_manger.dart` - Color palette

### **utils/**
- `ui_utils.dart` - Helper functions for UI operations

### **widgets/**
- `custom_app_label.dart` - Reusable custom widgets

---

## Routing Guidelines

### **Named Routes Pattern**
```dart
// In app_routes.dart
static const String loginRoute = '/login';
static const String homeRoute = '/home';
```

### **Navigation**
```dart
// Use named routes
Navigator.of(context).pushNamed(AppRoutes.homeRoute);

// Or with arguments
Navigator.of(context).pushNamed(
  AppRoutes.doctorProfileRoute,
  arguments: doctorId,
);
```

### **Route Mapping**
All routes must be registered in `onGenerateRoute` in `AppRouter` class.

---

## State Management (BLoC)

### **Cubit vs Bloc**

This project uses **Cubits** (simpler) for state management.

### **Cubit File Structure**
```dart
part 'auth_cubit.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase _loginUseCase;
  
  AuthCubit(this._loginUseCase) : super(AuthInitial());
  
  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    final result = await _loginUseCase(email, password);
    
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (success) => emit(AuthSuccess(success)),
    );
  }
}
```

### **State Classes**
```dart
part of 'auth_cubit.dart';

abstract class AuthState {}
class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}
class AuthSuccess extends AuthState {
  final User user;
  AuthSuccess(this.user);
}
class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}
```

### **Global Cubits in main.dart**
6 cubits are pre-registered globally:
- `AuthCubit` - Authentication
- `DoctorsCubit` - All doctors
- `SpecialtiesCubit` - Specialties
- `AppointmentCubit` - User appointments
- `HomeCubit` - Top doctors
- `SettingsCubit` - User profile

---

## Internationalization

### **Supported Languages**
- English (`en.json`)
- Arabic (`ar.json`)

### **Adding New Strings**
1. Add key-value pair to `assets/translations/en.json`
2. Add Arabic translation to `assets/translations/ar.json`

### **Usage in Code**
```dart
import 'package:easy_localization/easy_localization.dart';

Text('hello_world'.tr())  // Translates based on current locale
```

### **Changing Language**
```dart
context.setLocale(Locale('ar'));  // Switch to Arabic
context.setLocale(Locale('en'));  // Switch to English
```

---

## API Integration

### **Base URL**
```
https://telemedicineapp20260326150133-cvdyaqbdcucsfmfh.uaenorth-01.azurewebsites.net/api/
```

### **Key API Endpoints**

**Authentication:**
- `POST /Auth/login`
- `POST /Auth/RegisterPatient`
- `POST /Auth/logout`

**Doctors:**
- `GET /Doctor` - All doctors
- `GET /Doctor/specialties` - Specialties list
- `GET /Doctor/{id}` - Doctor details
- `POST /Doctor/book` - Book appointment

**Patient:**
- `GET /Patients/profile`
- `PUT /Patients/update-profile`
- `PUT /Patients/change-password`
- `GET /Patients/appointments`

### **HTTP Client Configuration**
Managed by `DioServices` in `core/network/`:
- Base URL set automatically
- Request/response logging via interceptors
- Auth token injection in headers
- Timeout: 30 seconds

### **Making API Calls**
```dart
// In data source
class AuthApiDataSource {
  final ApiServices _apiServices;
  
  Future<LoginResponse> login(String email, String password) async {
    final response = await _apiServices.post(
      '/Auth/login',
      data: {'email': email, 'password': password},
    );
    return LoginResponse.fromJson(response.data);
  }
}
```

---

## Error Handling

### **Failure Model** (core/error/failure.dart)
```dart
abstract class Failure {
  final String message;
  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(String message) : super(message);
}

class LocalFailure extends Failure {
  LocalFailure(String message) : super(message);
}
```

### **Error Propagation Pattern**
```dart
// Use Either<Failure, Success>
Either<Failure, User> result = await loginUseCase(email, password);

result.fold(
  (failure) => emit(LoginError(failure.message)),
  (user) => emit(LoginSuccess(user)),
);
```

---

## Assets Management

### **Image Assets** (`assets/images/`)
```
on_boarding_1.png
on_boarding_2.png
on_boarding_3.png
kero.jpg
```

**Rule:** Reference in `constants_assets.dart`:
```dart
class Assets {
  static const String onBoarding1 = 'assets/images/on_boarding_1.png';
}
```

### **Icon Assets** (`assets/icons/`)
Symptom icons:
- `cough.png`
- `fever.png`
- `difficulty-breathing.png`
- `nausea.png`
- `stress.png`
- `weakness.png`

### **Asset Declaration** (pubspec.yaml)
```yaml
flutter:
  assets:
    - assets/icons/
    - assets/images/
    - assets/translations/
```

---

## Dependencies & Versions

### **Key Dependencies**

| Package | Version | Purpose |
|---|---|---|
| flutter_bloc | 9.1.1 | State management |
| get_it | 9.2.0 | Dependency injection |
| dio | 5.9.2 | HTTP client |
| easy_localization | 3.0.7 | Internationalization |
| firebase_core | Latest | Firebase |
| firebase_auth | Latest | Authentication |
| image_picker | Latest | Image selection |
| shared_preferences | Latest | Local storage |
| flutter_lints | Latest | Linting |

---

## Code Quality Standards

### **Linting**
- Enforced via `analysis_options.yaml`
- Based on Flutter lints
- Use `flutter analyze` to check

### **Format Code**
```bash
dart format lib/
```

### **Null Safety**
✅ Project uses null safety (Dart 3.0+)
- All types must be explicitly nullable or non-nullable
- Use `?` for nullable types
- Use `??` for null coalescing

### **Comments**
```dart
/// This is a doc comment (use for public APIs)
// This is a regular comment

/// Usage example:
/// ```dart
/// final result = await myFunction();
/// ```
```

---

## Best Practices Checklist

### **Before Creating New Feature**
- [ ] Create feature folder in `lib/features/`
- [ ] Implement all 3 layers (Data, Domain, Presentation)
- [ ] Create entity, model, mapper
- [ ] Create repository interface and implementation
- [ ] Create use cases
- [ ] Create cubit(s)
- [ ] Create screen(s) and widgets
- [ ] Register in service locator (`lib/core/si/service_locator.dart`)
- [ ] Add route in `lib/core/routes/app_routes.dart`

### **File & Class Naming**
- [ ] File names use `snake_case`
- [ ] Class names use `PascalCase`
- [ ] Variables use `camelCase`
- [ ] Named routes follow pattern: `feature + Route`
- [ ] Cubit files: `*_cubit.dart`
- [ ] Screen files: `*_screen.dart`

### **Architecture**
- [ ] Presentation layer depends only on domain
- [ ] Domain layer has no external dependencies
- [ ] Data layer implements domain contracts
- [ ] No business logic in presentation
- [ ] Use use cases for all business operations

### **State Management**
- [ ] All side effects go through cubits
- [ ] Cubits emit specific states
- [ ] Error states include error messages
- [ ] Loading states are explicit

### **Error Handling**
- [ ] Use Failure model for errors
- [ ] Display user-friendly messages
- [ ] Log errors for debugging
- [ ] Handle network errors gracefully

### **Code Quality**
- [ ] No compiler warnings
- [ ] No analyzer warnings
- [ ] Properly formatted code
- [ ] Meaningful variable/function names
- [ ] Documented complex logic

### **Performance**
- [ ] Minimize rebuilds (use BLoC properly)
- [ ] Lazy load data where possible
- [ ] Dispose streams/cubits properly
- [ ] Cache API responses when appropriate

---

## Common Patterns

### **Adding New Feature Step-by-Step**

1. **Create folder structure:**
   ```
   lib/features/new_feature/
   ├── data/
   ├── domain/
   └── presentation/
   ```

2. **Create entity (domain/entities/):**
   ```dart
   class NewEntity {
     final String id;
     final String name;
     
     NewEntity({required this.id, required this.name});
   }
   ```

3. **Create model (data/models/):**
   ```dart
   @JsonSerializable()
   class NewModel {
     @JsonKey(name: 'id')
     final String id;
     // ...
     factory NewModel.fromJson(Map<String, dynamic> json) => 
       _$NewModelFromJson(json);
   }
   ```

4. **Create mapper (data/mapper/):**
   ```dart
   class NewMapper {
     static NewEntity toEntity(NewModel model) => NewEntity(
       id: model.id,
     );
   }
   ```

5. **Create data source (data/datasource/):**
   ```dart
   class NewApiDataSource {
     Future<NewModel> fetch() async {
       final response = await _apiServices.get('/new');
       return NewModel.fromJson(response.data);
     }
   }
   ```

6. **Create repository (data/repo/):**
   ```dart
   class NewRepoImpl implements NewRepo {
     final NewApiDataSource _dataSource;
     
     @override
     Future<Either<Failure, NewEntity>> fetch() async {
       try {
         final model = await _dataSource.fetch();
         return Right(NewMapper.toEntity(model));
       } catch (e) {
         return Left(ServerFailure(e.toString()));
       }
     }
   }
   ```

7. **Create use case (domain/use_cases/):**
   ```dart
   class FetchNewUseCase implements UseCase<NewEntity, NoParams> {
     final NewRepo _repo;
     
     @override
     Future<Either<Failure, NewEntity>> call(NoParams params) {
       return _repo.fetch();
     }
   }
   ```

8. **Create cubit (presentation/cubit/):**
   ```dart
   class NewCubit extends Cubit<NewState> {
     final FetchNewUseCase _fetchUseCase;
     
     Future<void> fetch() async {
       emit(NewLoading());
       final result = await _fetchUseCase(NoParams());
       result.fold(
         (f) => emit(NewError(f.message)),
         (data) => emit(NewSuccess(data)),
       );
     }
   }
   ```

9. **Register in service locator:**
   ```dart
   // In lib/core/si/service_locator.dart
   sl.registerSingleton<NewApiDataSource>(NewApiDataSource(sl()));
   sl.registerSingleton<NewRepo>(NewRepoImpl(sl()));
   sl.registerSingleton<FetchNewUseCase>(FetchNewUseCase(sl()));
   sl.registerSingleton<NewCubit>(NewCubit(sl()));
   ```

10. **Add route:**
    ```dart
    // In lib/core/routes/app_routes.dart
    static const String newRoute = '/new';
    
    case newRoute:
      return MaterialPageRoute(builder: (_) => const NewScreen());
    ```

---

## Troubleshooting

### **Service Not Found Error**
- Check if service is registered in `lib/core/si/service_locator.dart`
- Verify service is called with `sl<ServiceName>()`

### **State Not Updating**
- Ensure cubit emits new state instances
- Check BLoC observer logs
- Verify widget is listening with `BlocBuilder`

### **Navigation Not Working**
- Verify route exists in `app_routes.dart`
- Check route name spelling
- Ensure `onGenerateRoute` is set in MaterialApp

### **API Call Failed**
- Check network connectivity
- Verify endpoint URL in `api_constants.dart`
- Check request/response logs in Dio interceptor
- Validate token in auth interceptor

---

## Resources

- [Clean Architecture in Flutter](https://resocoder.com/clean-architecture-tdd)
- [BLoC Pattern](https://bloclibrary.dev/)
- [Dio HTTP Client](https://pub.dev/packages/dio)
- [Easy Localization](https://pub.dev/packages/easy_localization)
- [GetIt Service Locator](https://pub.dev/packages/get_it)

---

## Project Maintainers

- **Architecture:** Clean Architecture (Domain-Driven Design)
- **Last Updated:** May 15, 2026
- **Dart Version:** 3.10.0+
- **Flutter Version:** 3.x+

