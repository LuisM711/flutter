# 🏥 Mini Proyecto 01 - Calculadora IMC

## 📋 Instrucciones de Instalación y Uso

### 🚀 Pasos para ejecutar la aplicación:

1. **Navegar al directorio del proyecto:**
   ```bash
   cd mini_proyecto_01
   ```

2. **Instalar dependencias:**
   ```bash
   flutter pub get
   ```

3. **Ejecutar la aplicación:**
   ```bash
   flutter run
   ```

### 📱 Funcionalidades Implementadas:

#### ✅ Splash Screen
- Pantalla de carga con animaciones
- Duración: 3 segundos
- Logo animado con icono de corazón
- Colores verdes médicos
- Navegación automática

#### ✅ Calculadora IMC
- Campos para peso (kg) y estatura (m)
- Validación completa de datos
- Interfaz moderna con gradientes
- Botón de cálculo estilizado

#### ✅ Resultados y Clasificación
- Cálculo automático del IMC
- Clasificación según rangos médicos
- Colores dinámicos según resultado
- Iconos representativos
- Descripción médica detallada

### 🎯 Rangos de IMC Implementados:

| IMC | Clasificación | Color |
|-----|---------------|-------|
| < 18 | Peso Bajo | Azul |
| 18-24.9 | Normal | Verde |
| 25-26.9 | Sobrepeso | Naranja |
| 27-29.9 | Obesidad Grado I | Naranja Oscuro |
| 30-39.9 | Obesidad Grado II | Rojo |
| > 40 | Obesidad Grado III | Morado |

### 🔧 Estructura del Proyecto:

```
mini_proyecto_01/
├── lib/
│   ├── main.dart                 # Punto de entrada
│   └── src/
│       ├── splash_screen.dart    # Pantalla de carga
│       ├── imc_calculator.dart   # Calculadora principal
│       └── imc_result.dart       # Pantalla de resultados
├── pubspec.yaml                  # Configuración del proyecto
└── README.md                     # Documentación completa
```

### ⚡ Comandos Útiles:

```bash
# Limpiar proyecto
flutter clean

# Verificar configuración
flutter doctor

# Ejecutar en modo release
flutter run --release

# Ver análisis de código
flutter analyze
```

### 🎨 Características de Diseño:

- **Colores**: Paleta verde médica
- **Animaciones**: Transiciones suaves
- **Responsive**: Adaptable a diferentes tamaños
- **Validación**: Campos obligatorios y rangos
- **UX**: Interfaz intuitiva y clara

### 📊 Ejemplo de Uso:

1. **Abrir la app** → Splash screen (3 segundos)
2. **Ingresar datos:**
   - Peso: 70.5 kg
   - Estatura: 1.75 m
3. **Calcular** → Resultado: IMC 23.0 (Normal)
4. **Ver clasificación** → Descripción médica

### 🛠️ Personalización:

Para modificar la duración del splash screen:
```dart
// En splash_screen.dart línea 40
await Future.delayed(const Duration(seconds: 3), () {}); // Cambiar 3
```

Para ajustar validaciones:
```dart
// En imc_calculator.dart líneas 90-95
if (peso > 300) {
  return 'El peso debe ser menor a 300 kg';
}
```

### 📝 Notas Importantes:

- La aplicación usa iconos de Material Design
- No requiere imágenes externas
- Compatible con Android e iOS
- Código limpio y bien documentado
- Siguiendo las mejores prácticas de Flutter

### 🔍 Solución de Problemas:

**Error: "flutter: command not found"**
- Instalar Flutter SDK
- Agregar Flutter al PATH

**Error de dependencias:**
```bash
flutter clean
flutter pub get
```

**Error de compilación:**
- Verificar que todas las importaciones son correctas
- Ejecutar `flutter analyze`

¡La aplicación está lista para usar! 🎉
