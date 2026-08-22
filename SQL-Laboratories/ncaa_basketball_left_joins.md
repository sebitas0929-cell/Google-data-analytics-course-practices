# 🏀 Análisis Histórico NCAA & Rendimiento de Equipos (SQL LEFT JOINs)

## 📌 Contexto del Proyecto
Laboratorio práctico sobre el dataset público de baloncesto universitario de la NCAA (`bigquery-public-data.ncaa_basketball`). El objetivo principal es evaluar el rendimiento deportivo de las universidades durante la década de 1990 (1990–1999) mediante el uso de `LEFT JOIN` para preservar todas las instituciones, independientemente de si cuentan con una mascota oficial registrada en la tabla dimensional.

---

## 📐 Claves Relacionales e Integridad de Datos
- **Tabla de Hechos (Histórico):** `mbb_historical_teams_seasons` (`market`, `name`, `wins`, `losses`, `ties`, `season`).
- **Tabla Dimensional (Mascotas):** `mascots` (`mascot`).
- **Llave Relacional (`ON`):** `seasons.team_id = mascots.id`.

---

## 🛠️ Consulta Ejecutada

```sql
SELECT 
  seasons.market AS university, 
  seasons.name AS team_name, 
  mascots.mascot AS team_mascot, 
  ROUND(AVG(seasons.wins), 2) AS avg_wins, 
  ROUND(AVG(seasons.losses), 2) AS avg_losses, 
  ROUND(AVG(seasons.ties), 2) AS avg_ties 
FROM 
  `bigquery-public-data.ncaa_basketball.mbb_historical_teams_seasons` AS seasons 
LEFT JOIN 
  `bigquery-public-data.ncaa_basketball.mascots` AS mascots 
  ON seasons.team_id = mascots.id
WHERE 
  seasons.season BETWEEN 1990 AND 1999
GROUP BY 
  university, 
  team_name, 
  team_mascot
ORDER BY 
  avg_wins DESC;
```
---

## 📊 Top Equipos por Promedio de Victorias (1990–1999)

| **Universidad** | **Equipo** | **Mascota** |
| :--- | :---: | ---: |
| University of Kentucky | Wildcats | Wildcat |
| University of Kansas | Jayhawks | Jayhawk |
| Duke University | Blue Devils | Devil |
| University of North Carolina ,Chapel Hill | Tar Heels | Ram / Sheep |
| University of Arizona | Wildcats | Wildcat |
| University of Utah | Utes | Red-tailed Hawk |
| University of Cincinnati | Bearcats | Bearcat |
| University of Connecticut | Huskies | Husky |

## 💡 Lecciones Técnicas
* **Preservación de Datos con LEFT JOIN**: A diferencia de un `INNER JOIN`, el `LEFT JOIN` garantiza que los equipos sin coincidencia en la tabla dimensional de mascotas no sean excluidos del análisis de rendimiento.

* **Filtrado Temporal**: Uso de la cláusula `BETWEEN 1990 AND 1999` para acotar la agregación al periodo de interés sin alterar la integridad relacional.

* **Agregaciones Múltiples**: Cálculo simultáneo de métricas de desempeño (`AVG(wins), AVG(losses), AVG(ties)`) agrupadas por múltiples dimensiones (`university, team_name, team_mascot`).
