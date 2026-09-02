# 🚗 Automotive Market Intelligence & Price Valuation

## 📌 Resumen Ejecutivo
Estudio econométrico y de ingeniería vehicular sobre el conjunto de datos `cars.car_info` (Google BigQuery) para identificar las variables críticas que impulsan el precio de venta (`Price`) y evaluar la eficiencia energética por tipo de tracción (`Drive Wheels`). Se combinó saneamiento relacional mediante sentencias DML en SQL y modelado analítico de tendencias en Tableau Public.

---

## 📐 Metodología Aplicada (Ciclo de Vida de Google)

### 1. Preguntar (Ask)
- **Problema de Negocio:** Determinar qué especificaciones técnicas justifican el valor de venta de un vehículo y cómo balancear la eficiencia de combustible frente al costo de inventario para concesionarios de autos usados.
- **Variables Críticas:** Peso en vacío (`curb_weight`), precio de lista (`price`), tipo de combustible (`fuel_type`), estilo de carrocería (`body_style`) y rendimiento en ciudad (`city_mpg`).

### 2. Preparar & Procesar (Prepare & Process)
- **Origen de Datos:** Google BigQuery (`ecommerce-analytics-shopee.cars.car_info`).
- **Saneamiento Relacional (SQL DML):**
  - Imputación de puertas faltantes (`num_of_doors`) en sedanes Dodge y Mazda mediante sentencias `UPDATE`.
  - Corrección tipográfica en cilindros (`tow` $\rightarrow$ `two`).
  - Eliminación de registros con valores atípicos imposibles (`compression_ratio = 70`) con `DELETE`.
  - Depuración de espacios en blanco en tipos de tracción mediante `TRIM` y `LENGTH`.
  - Filtrado de registros válidos para análisis comercial (`WHERE price IS NOT NULL`).

```sql
SELECT 
  make,
  fuel_type,
  body_style,
  drive_wheels,
  curb_weight,
  horsepower,
  city_mpg,
  highway_mpg,
  price
FROM 
  `ecommerce-analytics-shopee.cars.car_info`
WHERE 
  price IS NOT NULL;
```
### 📊 3. Analizar (Analyze - Hallazgos Principales)

* **Correlación Peso vs. Precio:** Existe una relación lineal positiva directa entre el peso en vacío (`curb_weight`) y el precio de venta. Los vehículos de mayor masa incorporan componentes de gama alta y motores más grandes que elevan su cotización de mercado.

* **Segmentación por Tracción:**
  * **Tracción Delantera (`fwd`):** Ofrece la mayor eficiencia energética media (~28.2 MPG en ciudad) a un precio promedio accesible (~$9,200 USD), representando el segmento de volumen y economía.

  * **Tracción Trasera (`rwd`):** Concentra el segmento deportivo y de lujo, con un precio medio superior (~$19,700 USD) a expensas de un menor rendimiento (~20.5 MPG).

  * **Tracción Total (`4wd`):** Se posiciona como opción de balance (~23.3 MPG y ~$10,200 USD).

* **Comportamiento por Combustible:** Las unidades diésel muestran una tendencia de costo superior en pesos medios debido a la complejidad de sus sistemas de inyección, manteniendo una pendiente de valoración más pronunciada.

### 📈 4. Compartir (Dashboard Ejecutivo en Tableau)
Se diseñó un tablero analítico en Tableau Public que integra:

Diagrama de Dispersión (Scatter Plot): Distribución individual de cada vehículo (`curb_weight` vs. `price`) desagregado a nivel fila, con codificación de color por `fuel_type` y formas por `body_style`.

Modelado de Tendencias: Línea de tendencia lineal (Linear Trend Line) que cuantifica la trayectoria del precio.

Comparativa Agregada: Gráfico de doble métrica promedio (`AVG(city_mpg)` y `AVG(price)`) por tipo de tracción.

Interactividad: Acción de filtrado interactivo que permite segmentar el mercado automotriz con un solo clic.

## 📈 4. Compartir (Dashboard Ejecutivo en Tableau)

[![Tableau Public](https://img.shields.io/badge/Tableau%20Public-Interactive%20Dashboard-E97627?style=for-the-badge&logo=tableau&logoColor=white)](https://public.tableau.com/views/AutomotiveMarketIntelligenceDashboard_17878684237480/Dashboard1)

## 📖 5. Storytelling Ejecutivo (Historia de Datos en Tableau)

Presentación interactiva estructurada bajo los principios de diseño visual y las fases **Share $\rightarrow$ Act** de Google:

* **Punto 1:** Diagnóstico de capital inmovilizado en unidades de alto costo (`rwd`).
* **Punto 2:** Foco visual preatentivo sobre la eficiencia y economía de la tracción delantera (`fwd`).
* **Punto 3:** Plan de acción operativo con cuotas de compra y límites presupuestarios.

> 🔗 **Explorar Historia Ejecutiva:** [Ver Presentación en Tableau Public](https://public.tableau.com/views/AutomotiveMarketIntelligenceDashboard_17878684237480/Historia1)

> 🔗 **Explorar Dashboard Interactivo:** [Ver Dashboard en Tableau Public](https://public.tableau.com/views/AutomotiveMarketIntelligenceDashboard_17878684237480/Dashboard1)
>
> <img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/09bdc6f6-20aa-46b3-89f6-8f1a2376d246" />
