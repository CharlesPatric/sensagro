@echo off

:: Crear carpetas
mkdir lib\models
mkdir lib\services
mkdir lib\screens
mkdir lib\widgets
mkdir lib\providers
mkdir lib\utils

:: Crear archivos
type nul > lib\screens\splash_screen.dart
type nul > lib\screens\home_screen.dart
type nul > lib\screens\about_screen.dart
type nul > lib\providers\theme_provider.dart
type nul > lib\utils\app_theme.dart
type nul > lib\main.dart

echo ? Estructura Flutter creada correctamente.
pause