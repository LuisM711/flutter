# Practica 04 - Splash Screen & App Icon

Esta práctica implementa un Splash Screen con animaciones y configuración de App Icon para Flutter.

## Características Implementadas

### ✅ Splash Screen
- Pantalla de carga con animaciones
- Timer de 3 segundos antes de navegar a la pantalla principal
- Animación de escala y opacidad para el logo
- Indicador de carga (CircularProgressIndicator)
- Navegación automática a la pantalla principal

### ✅ Pantalla Principal
- Diseño moderno con gradientes
- Botón de información con diálogo
- Tema consistente con colores azules
- Interfaz responsiva y atractiva

### ✅ Configuración de App Icon
- Configuración de `flutter_launcher_icons` en pubspec.yaml
- Soporte para Android, iOS, Web, Windows y macOS
- Generador de iconos incluido (icon_generator.html)

## Estructura del Proyecto

```
lib/
├── main.dart                 # Punto de entrada de la aplicación
└── src/
    ├── splash_screen.dart    # Pantalla de carga con animaciones
    └── home_screen.dart      # Pantalla principal
```

## Instrucciones de Uso

### 1. Instalar Dependencias
```bash
flutter pub get
```

### 2. Generar Iconos de la App (Opcional)

#### Opción A: Usar el generador incluido
1. Abre `assets/icon_generator.html` en tu navegador
2. Haz clic en "Descargar Icono"
3. Guarda el archivo como `app_icon.png` en la carpeta `assets/`
4. Ejecuta:
```bash
flutter pub run flutter_launcher_icons:main
```

#### Opción B: Crear tu propio icono
1. Crea una imagen de 512x512 píxeles
2. Guárdala como `app_icon.png` en la carpeta `assets/`
3. Ejecuta:
```bash
flutter pub run flutter_launcher_icons:main
```

#### Opción C: Usar icono por defecto
Si no quieres un icono personalizado, comenta la sección `flutter_launcher_icons` en `pubspec.yaml`.

### 3. Ejecutar la Aplicación
```bash
flutter run
```

## Configuración del Splash Screen

El splash screen incluye:
- **Duración**: 3 segundos
- **Animaciones**: Escala y opacidad del logo
- **Colores**: Gradiente azul (#2196F3 a #1976D2)
- **Logo**: Icono de Flutter Dash
- **Indicador**: CircularProgressIndicator blanco

## Configuración del App Icon

La configuración en `pubspec.yaml` incluye:
- **Android**: Icono personalizado con nombre "launcher_icon"
- **iOS**: Habilitado
- **Web**: Con colores de tema azul
- **Windows**: Icono de 48x48 píxeles
- **macOS**: Habilitado

## Personalización

### Cambiar duración del splash screen
Edita el valor en `splash_screen.dart`:
```dart
await Future.delayed(const Duration(seconds: 3), () {}); // Cambia 3 por el valor deseado
```

### Cambiar colores
Modifica los colores en `splash_screen.dart` y `home_screen.dart`:
```dart
backgroundColor: Colors.blue[600], // Cambia por tu color preferido
```

### Cambiar logo
Reemplaza el icono en `splash_screen.dart`:
```dart
child: const Icon(
  Icons.flutter_dash, // Cambia por tu icono preferido
  size: 80,
  color: Colors.blue,
),
```

## Comandos Útiles

```bash
# Instalar dependencias
flutter pub get

# Generar iconos
flutter pub run flutter_launcher_icons:main

# Limpiar y reconstruir
flutter clean
flutter pub get
flutter run

# Verificar configuración
flutter doctor
```

## Notas Técnicas

- El splash screen usa `SingleTickerProviderStateMixin` para las animaciones
- La navegación usa `Navigator.pushReplacement` para reemplazar el splash screen
- Los iconos se generan automáticamente para todas las plataformas
- El tema usa Material Design 3 con colores personalizados

## Solución de Problemas

### Error al generar iconos
- Asegúrate de que `app_icon.png` existe en la carpeta `assets/`
- Verifica que la imagen sea de al menos 512x512 píxeles
- Ejecuta `flutter clean` antes de regenerar iconos

### El splash screen no aparece
- Verifica que `main.dart` tenga `home: const SplashScreen()`
- Asegúrate de que no hay errores de compilación
- Revisa la consola para mensajes de error

### Iconos no se actualizan
- Ejecuta `flutter clean`
- Elimina la carpeta `build/`
- Ejecuta `flutter pub get` y luego `flutter run`