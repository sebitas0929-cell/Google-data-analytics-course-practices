# 🧹 Bitácora de Limpieza de Datos: Funciones en Hojas de Cálculo

## 📌 Contexto del Ejercicio
Este laboratorio aborda las técnicas esenciales de saneamiento de datos en Google Sheets utilizando herramientas nativas de menú. Se trabajaron dos conjuntos de datos: **Afiliaciones a la Asociación Internacional de Logística** y **Cosmetics Inc.**.

---

## 🛠️ Procedimiento de Limpieza Paso a Paso

### 1. Auditoría Visual con Formato Condicional
- **Objetivo**: Identificar rápidamente celdas vacías sin alterar la estructura original.
- **Rango Aplicado**: Columnas `A:E` y `G, I, J, K, L` (excluyendo columnas con valores opcionales `F` y `H`).
- **Configuración**: Regla *La celda está vacía* con un estilo de relleno amarillo/rojo claro para alto contraste.

### 2. Preservación de Respaldo y Eliminación de Duplicados
- **Objetivo**: Garantizar la unicidad de los registros de miembros de la asociación.
- **Acción**: Duplicación de la pestaña (`Copia de miembros`) como buena práctica de seguridad y aplicación de `Datos > Limpieza de datos > Eliminar duplicados`.

### 3. Estandarización de Fechas y Números de Serie
- **Objetivo**: Corregir inconsistencias de tipo texto en campos temporales e interpretar números de serie internos de fecha (ej. valor entero `44492`).
- **Acción**: Ajuste de configuración regional a *Estados Unidos* y formateo explícito mediante `Formato > Número > Fecha`.

### 4. Separación de Cadenas Compuestas (`Dividir texto en columnas`)
- **Objetivo**: Descomponer cadenas de texto compuestas en variables independientes.
- **Columna**: `L` (`Certificación`).
- **Acción**: `Datos > Dividir texto en columnas` con detección automática de delimitadores.

### 5. Corrección de Números Almacenados como Texto
- **Objetivo**: Resolver errores de cálculo (ej. en celda `F12`) causados por comillas o texto en campos numéricos.
- **Dataset**: *Cosmetics Inc.* (Columna `E` - `Pedidos`).
- **Acción**: Aplicación de `Dividir texto en columnas` sobre la columna `E` para forzar la conversión a número entero.

---

## 📊 Resultados Obtenidos
- Base de datos de logística libre de registros duplicados e inconsistencias temporales.
- Eliminación de errores numéricos tipo `#¡VALOR!` al transformar cadenas formateadas como texto a valores numéricos reales.
