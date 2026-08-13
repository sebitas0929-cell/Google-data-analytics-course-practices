# 🚗 Saneamiento y Limpieza de Datos Relacionales con SQL (Google BigQuery)

## 📌 Contexto del Proyecto
Laboratorio práctico de auditoría, limpieza e imputación de datos de ventas de automóviles (`automobile_data.csv`) almacenados en Google BigQuery en la tabla `ecommerce-analytics-shopee.cars.car_info`, preparando la base de datos para análisis de inventario y demanda.

---

## 🛠️ Procedimiento de Limpieza SQL Paso a Paso

### 1. Auditoría Inicial y Verificación de Rangos
- **Tipos de Combustible**: Confirmación de valores de cadena únicos (`gas`, `diesel`) mediante `SELECT DISTINCT`.
- **Dimensiones (`length`)**: Validación de rangos mínimos (`141.1`) y máximos (`208.1`) mediante `MIN()` y `MAX()`.

```sql
-- Verificar tipos de combustible únicos
SELECT DISTINCT fuel_type
FROM `ecommerce-analytics-shopee.cars.car_info`;

-- Inspección de rango de longitud
SELECT 
  MIN(length) AS min_length, 
  MAX(length) AS max_length
FROM `ecommerce-analytics-shopee.cars.car_info`;
```
### 2. Tratamiento de Valores Faltantes (NULL)
Detección de celdas nulas en la columna num_of_doors e imputación mediante consultas condicionales UPDATE:
```sql
-- Detección de filas con valores nulos en puertas
SELECT *
FROM `ecommerce-analytics-shopee.cars.car_info`
WHERE num_of_doors IS NULL;

-- Imputación de 4 puertas para sedanes Dodge de gasolina
UPDATE `ecommerce-analytics-shopee.cars.car_info`
SET num_of_doors = 'four'
WHERE make = 'dodge' AND fuel_type = 'gas' AND body_style = 'sedan';

-- Imputación de 4 puertas para sedanes Mazda diésel
UPDATE `ecommerce-analytics-shopee.cars.car_info`
SET num_of_doors = 'four'
WHERE make = 'mazda' AND fuel_type = 'diesel' AND body_style = 'sedan';
```
### 3. Corrección de Errores Tipográficos
Detección de inconsistencias en cadenas de texto como valores mal escritos (tow en lugar de two en la columna num_of_cylinders):
```sql
-- Inspección de valores únicos de cilindros
SELECT DISTINCT num_of_cylinders
FROM `ecommerce-analytics-shopee.cars.car_info`;

-- Corrección tipográfica en cilindros (tow -> two)
UPDATE `ecommerce-analytics-shopee.cars.car_info`
SET num_of_cylinders = 'two'
WHERE num_of_cylinders = 'tow';
```
### 4. Eliminación de Valores Atípicos (Outliers)
Identificación de datos numéricos fuera del rango lógico o de la industria (p. ej., compression_ratio con valor 70 cuando el máximo esperado es 23):

```SQL
-- Identificación de rango de relación de compresión
SELECT 
  MIN(compression_ratio) AS min_ratio, 
  MAX(compression_ratio) AS max_ratio
FROM `ecommerce-analytics-shopee.cars.car_info`;

-- Eliminación de la fila anómala con valor 70
DELETE FROM `ecommerce-analytics-shopee.cars.car_info`
WHERE compression_ratio = 70;
```
### 5. Saneamiento de Cadenas y Espacios Invisibles (TRIM & LENGTH)
Identificación de entradas duplicadas en la columna drive_wheels causadas por espacios sobrantes en el texto:
```sql
-- Detección de longitud anómala (4 caracteres en lugar de 3)
SELECT DISTINCT 
  drive_wheels, 
  LENGTH(drive_wheels) AS char_len
FROM `ecommerce-analytics-shopee.cars.car_info`;

-- Eliminación de espacios con TRIM
UPDATE `ecommerce-analytics-shopee.cars.car_info`
SET drive_wheels = TRIM(drive_wheels)
WHERE LENGTH(drive_wheels) > 3;

-- Verificación final de valores únicos depurados
SELECT DISTINCT drive_wheels
FROM `ecommerce-analytics-shopee.cars.car_info`;
```
## 📊 Resultados Obtenidos
- Tabla ecommerce-analytics-shopee.cars.car_info 100% depurada sin valores nulos ni errores tipográficos.
- Valores numéricos acotados dentro de los rangos mecánicos esperados.
- Eliminación de inconsistencias invisibles de formato (espacios en blanco) para garantizar agrupaciones precisas en consultas analíticas posteriores.
