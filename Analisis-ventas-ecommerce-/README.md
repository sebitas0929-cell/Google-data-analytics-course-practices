# 🛒 Análisis y Limpieza de Datos de E-Commerce (Shopee Marketplace)

## 📌 1. Descripción del Proyecto
Este proyecto analiza el catálogo de productos, patrones de ventas e ingresos estimados de una plataforma de comercio electrónico. El objetivo principal es realizar un proceso riguroso de **auditoría, saneamiento y transformación de datos** para convertir registros no estructurados (textos combinados, precios en rangos y unidades abreviadas) en una base de datos analítica lista para la toma de decisiones de negocio.

El proyecto se aborda mediante una **metodología por fases**, iniciando con la ingeniería de datos y limpieza en **Google Sheets**, seguido del almacenamiento y consultas analíticas con **SQL en BigQuery**.

---

## 🛠️ Herramientas e Infraestructura
* **Google Sheets:** Inspección de datos, expresiones regulares (`REGEXEXTRACT`), validación de formatos, tratamiento de errores con `SI.ERROR` y tablas dinámicas.
* **Google BigQuery:** Almacenamiento en la nube, consultas analíticas avanzadas en SQL y funciones de agregación.
* **GitHub:** Control de versiones, documentación y estructuración del repositorio.

---

## 📂 Estructura del Repositorio
```text
ecommerce-data-cleaning/
│
├── README.md                           <-- Documentación principal del proyecto
├── data/
│   ├── raw_ecommerce_data.csv          <-- Dataset original
│   └── cleaned_ecommerce_data_v1.csv   <-- Dataset limpio exportado desde Google Sheets
├── sql/
│   └── 01_analysis_queries.sql         <-- Consultas analíticas en BigQuery
└── docs/
    └── log_de_limpieza.md              <-- Bitácora de transformaciones
```
## 📋 Estructura Final del Dataset (`cleaned_ecommerce_data_v1.csv`)

| Nombre de la Columna | Tipo de Dato | Origen / Tipo | Descripción y Reglas de Negocio Aplicadas | Ejemplo de Registro |
| :--- | :--- | :--- | :--- | :--- |
| `Product_Name` | String (Texto) | Original limpia | Nombre del producto saneado con `=NOMPROPIO(ESPACIOS())`. | `GPS Tracker Internet Data` |
| `Product_Price` | String (Texto) | Original | Valor original del precio o rango de precios en moneda local (`RM`). | `RM90.00 - RM120.00` |
| `Product_Sold` | String (Texto) | Original | Registro original de ventas en formato de texto abreviado. | `4.6k sold` |
| `Product_Place` | String (Texto) | Original limpia | Ubicación o estado del vendedor estandarizado. | `Selangor` |
| `Product_Category` | String (Texto) | Original limpia | Categoría principal del producto sin caracteres especiales. | `Mobile Accessories` |
| `Product_Subcategory` | String (Texto) | Original limpia | Subcategoría de producto para análisis de nicho. | `Mobile Reloads Sim Cards` |
| `Ventas_Limpias` | Integer (Número) | Calculada | Unidades vendidas convertidas a número entero (`4.6k` $\rightarrow$ `4600`). Celdas vacías/errores imputados con `0`. | `4600` |
| `Precio_Limpio` | Float (Decimal) | Calculada | Valor numérico base extraído con `REGEXEXTRACT` para habilitar cálculos matemáticos. | `90.00` |
| `Estimado_Ingresos_Totales` | Float (Decimal) | Calculada | Métrica de negocio resultante de la multiplicación `=Precio_Limpio * Ventas_Limpias`. | `414000.00` |
---



### 📐 Columnas Calculadas Generadas

Posterior a la limpieza base, se crearon las siguientes columnas en Sheets para habilitar análisis cuantitativos:



1. **`Precio_Limpio`:** Extraído de `Product_Price` mediante expresión regular.

2. **`Ventas_Limpias`:** Unidades vendidas convertidas de texto abreviado a números enteros.

3. **`Estimado_Ingresos_Totales`:** Multiplicación directa (`=Precio_Limpio * Ventas_Limpias`).



## 📊 3. Hallazgos e Insights de Negocio (Tablas Dinámicas)



Tras la fase de limpieza e integración de columnas calculadas en Google Sheets, el análisis agrupado arrojó los siguientes hallazgos clave:



* **Métricas Globales del Catálogo:**

  * **Total de Productos Analizados:** 106,711 artículos.

  * **Volumen Total de Unidades Vendidas:** +921.5 millones de unidades.

  * **Ingresos Estimados Totales:** ~RM 10,125 millones.



* **Top 3 Categorías con Mayor Volumen de Ventas:**

  1. **Home & Living:** 204.8M unidades vendidas.

  2. **Health & Beauty:** 153.8M unidades vendidas.

  3. **Groceries & Pets:** 124.8M unidades vendidas.



* **Concentración Geográfica de Facturación (Top Regiones):**

  1. **Selangor:** Lidera ampliamente la generación de ingresos con más del 48% del total estimado (~RM 4,958M).

  2. **Johor:** Representa la segunda región con mayor facturación (~RM 755M).

  3. **Kuala Lumpur:** Ocupa la tercera posición (~RM 726M).



* **Categorías con Mayor Precio Promedio por Artículo:**

  1. **Computer Accessories:** Precio base promedio de RM 80.63.

  2. **Home Appliances:** Precio base promedio de RM 77.63.

  3. **Mobile Accessories:** Precio base promedio de RM 61.92.
     
## 💡 4. Próximos Pasos (Fases Completadas)
- [x] Completar las transformaciones de texto, precio y unidades en Google Sheets.
- [x] Crear las columnas calculadas e integrar las métricas clave de negocio.
- [x] Exportar el archivo final como `cleaned_ecommerce_data_v1.csv`.
- [x] Subir el dataset procesado a **BigQuery** y ejecutar consultas analíticas en SQL (`sql/01_analysis_queries.sql`).
- [x] Conectar los datos con **Looker Studio** y diseñar el dashboard ejecutivo e interactivo.

---

## 🔗 Enlaces del Proyecto
* 📊 [Ver Dashboard Interactivo en Looker Studio](https://datastudio.google.com/reporting/758406a6-5c76-4b2f-a101-275fde7a8310)
* <img width="1016" height="890" alt="image" src="https://github.com/user-attachments/assets/126cc48e-b396-49e6-97bc-e1063a121c31" />

* 🗃️ [Ver Script de Consultas SQL en BigQuery](./sql/01_analysis_queries.sql)
