# 🧹 Bitácora de Limpieza y Exploración de Datos: Hojas de Cálculo

## 📌 Contexto del Laboratorio
Este laboratorio documenta el ciclo completo de saneamiento, auditoría de calidad y exploración multinivel de datos en Google Sheets sobre dos conjuntos de datos comerciales: **Afiliaciones de Logística** y **Cosmetics Inc.**.

---

## 🛠️ Fase 1: Saneamiento Estructural y Normalización
1. **Auditoría de Vacíos:** Reglas de formato condicional para detección visual de celdas nulas en campos no opcionales.
2. **Desduplicación:** Preservación de pestañas de respaldo y eliminación de registros idénticos con la herramienta nativa de desduplicación.
3. **Estandarización Temporal:** Ajuste de configuración regional a Estados Unidos y conversión de números de serie enteros (ej. `44492`) a tipo de dato `DATE`.
4. **Dividir Texto en Columnas:** Separación de atributos compuestos y corrección de celdas numéricas formateadas como cadena de texto para resolver errores de cálculo (`#¡VALOR!`).

---

## 🛠️ Fase 2: Control de Calidad y Fórmulas Avanzadas
1. **Auditoría de Cuotas (`COUNTIF` / `CONTAR.SI`):** Identificación y corrección de valores atípicos negativos (`-$200` $\rightarrow$ `$200`) y fuera de rango (`$1,000` $\rightarrow$ `$100`).
2. **Validación de Identificadores (`LEN` / `LARGO`):** Creación de columna auxiliar `LEN` y regla de formato condicional para valores $\neq 6$, detectando el error de digitación en la celda `B36` (7 caracteres).
3. **Ingeniería de Características y Limpieza de Cadenas:**
   - Extracción de subcadenas con `LEFT`, `RIGHT` y `MID`.
   - Reconstrucción de claves limpias mediante `CONCATENATE`.
   - Eliminación de espacios sobrantes mediante `TRIM` / `ESPACIOS`.

---

## 🛠️ Fase 3: Exploración Multidimensional y Corrección Visual
1. **Agregación con Tablas Dinámicas:** Resumen sintético en nueva pestaña ordenado descendentemente por la columna `Total`, identificando como productos líderes a **`15143Exfo`** ($15,671.28) y **`32729Masc`** ($12,762.36).
2. **Cruce de Tablas (`VLOOKUP` / `BUSCARV`):** Mapeo de códigos clave contra nombres descriptivos almacenados en la tabla secundaria (`Sheet 2`) para asociar nombres como *SoSoft Scrub* y *Darkest Lashes Mascara*.
3. **Detección de Valores Atípicos mediante Gráficos:** Identificación de un error de punto decimal en el precio de la celda `B14` ($0.73 $\rightarrow$ $7.30) utilizando un gráfico de columnas de inspección.

---

## 📊 Resultados Obtenidos
- Base de datos 100% desduplicada, estandarizada e integrada.
- Eliminación de errores de tipeo y punto decimal que distorsionaban el análisis de ingresos.
- Generación de datasets `.csv` estructurados y limpios para su posterior ingesta y modelado en Google BigQuery.
