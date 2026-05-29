@echo off

:: Crear carpetas
mkdir assets\images
mkdir assets\icons

:: Crear archivos
type nul > assets\images\logo.png
type nul > assets\images\splash_logo.png
type nul > assets\icons\app_icon.png

echo ? Estructura assets creada correctamente.
pause