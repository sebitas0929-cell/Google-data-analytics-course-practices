# 🚖 Análisis de Zonas de Alto Rendimiento: NYC Taxi (Subqueries & HAVING)

## 📌 Contexto del Proyecto
Laboratorio práctico sobre el dataset público de viajes en taxi de la ciudad de Nueva York (`bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2022`). El objetivo es identificar las zonas de recogida (*pick-up locations*) con mayor rentabilidad en propinas mediante la combinación de agregaciones grupales, filtros post-agregación (`HAVING`) y una subconsulta escalar para comparar el rendimiento local contra el promedio global de la ciudad.

---

## 📐 Reglas de Negocio y Lógica de Filtrado
- **Limpieza a nivel de fila (`WHERE`):** Exclusión de viajes con distancia o tarifa nula/negativa (`trip_distance > 0 AND fare_amount > 0`).
- **Subconsulta Escalar:** Cálculo dinámico de la propina promedio de toda la ciudad de Nueva York en 2022.
- **Filtro de Grupo (`HAVING`):** Selección exclusiva de zonas con representatividad estadística (`total_trips > 500`) y cuyo promedio de propina supere la media global.

---

## 🛠️ Consulta Ejecutada

```sql
SELECT 
  pickup_location_id,
  COUNT(vendor_id) AS total_trips,
  ROUND(AVG(fare_amount), 2) AS avg_fare,
  ROUND(AVG(tip_amount), 2) AS avg_tip
FROM 
  `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2022`
WHERE 
  trip_distance > 0 
  AND fare_amount > 0
GROUP BY 
  pickup_location_id
HAVING 
  total_trips > 500
  AND avg_tip > (
    -- Subconsulta: Propina promedio global de toda la ciudad
    SELECT AVG(tip_amount) 
    FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2022`
    WHERE trip_distance > 0 AND fare_amount > 0
  )
ORDER BY 
  avg_tip DESC
LIMIT 10;
```
## 📊 Top 10 Zonas de Recogida por Propina Promedio (2022)

| *Zona de Recogida (Location ID)** | *Total de Viajes** | *Tarifa Promedio (USD)** | *Propina Promedio (USD)** |
| :--- | :---: |:---: | ---: |
| 1 | 2,154 | $88.01 | $12.65 |
| 93 | 5,261 | $49.85 | $8.39 |
| 216 | 5,564 | $55.68 | $8.17 |
| 10 | 11,033 | $52.83 | $7.98 | 
| 194 | 1,650 | $40.49 | $7.46 |
| 132 | 1,679,752 | $47.08 | $7.14 |
| 215 | 3,749 | $51.11 | $6.83 |
| 207 | 789 | $32.19 | $6.70 |
| 219 | 3,318 | $53.91 | $6.29 |
| 124 | 615 | $47.44 | $6.26|

## 💡 Lecciones Técnicas

* **Diferencia entre WHERE y HAVING**: `WHERE` filtra registros fila por fila antes de agrupar, mientras que `HAVING` aplica condiciones lógicas sobre los resultados agregados (`COUNT`, `AVG`).

* **Subconsultas Escalares Dinámicas**: Permite evaluar métricas relativas (por zona) frente a un estándar global consolidado sin requerir pasos de exportación o variables manuales.

* **Control de Representatividad**: El umbral `total_trips > 500` previene distorsiones estadísticas causadas por zonas atípicas con un solo viaje de monto elevado.
