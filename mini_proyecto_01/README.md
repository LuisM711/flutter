# Mini Proyecto 01 - Calculadora IMC

Esta aplicación Flutter permite calcular el Índice de Masa Corporal (IMC) con una interfaz atractiva y funcional.

## Características

### ✅ Splash Screen
- Pantalla de carga con animaciones
- Timer de 3 segundos antes de navegar a la calculadora
- Animación de escala y opacidad para el logo
- Indicador de carga
- Navegación automática

### ✅ Calculadora IMC
- Campos para peso (kg) y estatura (m)
- Validación de datos ingresados
- Interfaz moderna con gradientes
- Diseño responsivo

### ✅ Resultados y Clasificación
- Cálculo automático del IMC
- Clasificación según rangos médicos estándar
- Descripción detallada de cada clasificación
- Colores y iconos según el resultado
- Información de datos ingresados

## Fórmula IMC

```
IMC = Peso (kg) / Estatura² (m)
```

## Clasificaciones IMC

| IMC | Clasificación |
|-----|---------------|
| < 18 | Peso Bajo. Necesario valorar signos de desnutrición |
| 18 - 24.9 | Normal |
| 25 - 26.9 | Sobrepeso |
| 27 - 29.9 | Obesidad Grado I. Riesgo relativo para desarrollar enfermedades cardiovasculares |
| 30 - 39.9 | Obesidad Grado II. Riesgo relativo muy alto para el desarrollo de enfermedades cardiovasculares |
| > 40 | Obesidad Grado III. (Extrema o mórbida). Riesgo relativo extremadamente alto |

## Estructura del Proyecto

```
lib/
├── main.dart                 # Punto de entrada
└── src/
    ├── splash_screen.dart    # Pantalla de carga
    ├── imc_calculator.dart   # Calculadora principal
    └── imc_result.dart       # Pantalla de resultados
```

## Instalación y Uso

### 1. Instalar dependencias
```bash
flutter pub get
```

### 2. Ejecutar la aplicación
```bash
flutter run
```

## Funcionalidades Implementadas

### Splash Screen
- Duración: 3 segundos
- Animaciones: Escala y opacidad
- Colores: Verde médico (#2E7D32)
- Logo: Icono de corazón

### Calculadora
- Validación de campos obligatorios
- Validación de rangos (peso: 0-300kg, estatura: 0-3m)
- Interfaz con gradientes verdes
- Botón de cálculo estilizado

### Resultados
- Cálculo preciso del IMC
- Clasificación automática
- Colores dinámicos según resultado
- Iconos representativos
- Descripción médica
- Botón para nuevo cálculo

## Personalización

### Cambiar duración del splash
```dart
await Future.delayed(const Duration(seconds: 3), () {}); // Cambiar 3 por valor deseado
```

### Modificar colores
```dart
backgroundColor: const Color(0xFF2E7D32), // Cambiar por color preferido
```

### Ajustar validaciones
Modificar los rangos en `imc_calculator.dart`:
```dart
if (peso > 300) {
  return 'El peso debe ser menor a 300 kg';
}
```

## Comandos Útiles

```bash
# Instalar dependencias
flutter pub get

# Ejecutar en modo debug
flutter run

# Ejecutar en modo release
flutter run --release

# Limpiar proyecto
flutter clean

# Verificar configuración
flutter doctor
```

## Notas Técnicas

- Usa `SingleTickerProviderStateMixin` para animaciones
- Validación con `GlobalKey<FormState>`
- Navegación con `Navigator.push` y `pushReplacement`
- Colores adaptativos según clasificación IMC
- Diseño responsivo con `SingleChildScrollView`

## Solución de Problemas

### Error de validación
- Asegúrate de ingresar números válidos
- El peso debe estar entre 0.1 y 300 kg
- La estatura debe estar entre 0.1 y 3 metros

### Problemas de navegación
- Verifica que no hay errores de compilación
- Revisa la consola para mensajes de error
- Asegúrate de que todos los archivos están importados correctamente

### Errores de assets
- Verifica que la carpeta `assets/images/` existe
- Asegúrate de que `pubspec.yaml` tiene la configuración de assets
- Ejecuta `flutter clean` si hay problemas de caché

## Disclaimer

Esta aplicación es solo para fines educativos. El IMC es una medida de referencia y no reemplaza la consulta médica profesional. Siempre consulta con un profesional de la salud para una evaluación completa de tu estado de salud.