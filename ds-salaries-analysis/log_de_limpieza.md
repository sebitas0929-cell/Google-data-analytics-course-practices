# 📋 Bitácora de Limpieza y Análisis de Datos: DS Salaries

## 📌 1. Información General del Dataset
* **Nombre del Dataset:** `ds_salaries.csv` (Data Science Job Salaries)
* **Fuente:** Kaggle (subido por *Ruchi798*)
* **Volumen Original:** 607 filas × 12 columnas
* **Herramienta Utilizada:** Google Sheets
* **Objetivo del Proyecto:** Saneamiento, estandarización de categorías salariales y análisis exploratorio del margen de error / dispersión en sueldos dentro del sector de datos.

---

## 🛠️ 2. Registro de Transformaciones y Limpieza

| # | Columna Afectada | Problema Identificado | Acción / Función Aplicada | Resultado |
| :-: | :--- | :--- | :--- | :--- |
| **1** | `experience_level` | Valores codificados en formato corto (`EN`, `MI`, `SE`, `EX`). | Categorización con `=SI(...)` anidado. | Nombres legibles para reportes ejecutivos (ej. `Junior / Entry-level`, `Senior-level`). |
| **2** | `company_size` | Tamaño de empresa representado con siglas (`S`, `M`, `L`). | Estandarización con `=SI(...)` anidado. | Categorías descriptivas (ej. `Pequeña (<50 empl)`, `Mediana (50-250 empl)`). |
| **3** | `salary_in_usd` | Valores salariales expresados únicamente de forma anual. | Creación de columna calculada `=REDONDEAR(G2 / 12; 2)`. | Obtención del salario estimado mensual en USD. |
| **4** | Rango del Dataset | Filas vacías al final de la hoja generaban errores `#DIV/0!` en la tabla dinámica. | Aplicación de Filtros en la Tabla Dinámica desmarcando la opción `(Vacío)`. | Eliminación de errores de cálculo y estandarización del total de la muestra en $N = 607$. |

---

## 📖 3. Diccionario de Datos

| Nombre de Columna | Tipo de Dato | Origen | Descripción y Valores Válidos |
| :--- | :--- | :--- | :--- |
| `work_year` | Entero | Original | Año en que se pagó el salario (`2020`, `2021`, `2022`). |
| `experience_level` | Categórico | Transformado | Nivel de experiencia (`EN`, `MI`, `SE`, `EX`). |
| `employment_type` | Categórico | Original | Tipo de contrato (`FT` = Full-time, `PT` = Part-time, `CT` = Contract, `FL` = Freelance). |
| `job_title` | Texto | Original | Título del puesto en la empresa. |
| `salary_in_usd` | Float (Decimal) | Original | Salario bruto anual estandarizado en USD. |
| `salary_monthly_usd`| Float (Decimal) | Calculado | Salario bruto mensual estimado en USD (`salary_in_usd / 12`). |
| `company_size` | Categórico | Transformado | Tamaño de la empresa (`S`, `M`, `L`). |

---

## 📊 4. Análisis de Margen de Error e Incertidumbre Salarial

Para medir la confiabilidad de los salarios promedios por nivel de experiencia, se aplicó la fórmula del **Margen de Error al 95% de confianza**:

$$\text{Margen de Error} = 1.96 \times \left( \frac{\text{STDEV}}{\sqrt{N}} \right)$$

### Resumen de Métricas Agregadas:

| Nivel de Experiencia | Muestra ($N$) | Promedio Salarial | Desviación Estándar | Margen de Error ($\pm$) | % Incertidumbre |
| :--- | :---: | :---: | :---: | :---: | :---: |
| **`EN` (Junior / Entry)** | 88 | $\$61,643.32$ | $\$44,395.54$ | $\pm \$9,275.86$ | **15.05%** |
| **`MI` (Mid-level)** | 213 | $\$87,996.06$ | $\$63,901.06$ | $\pm \$8,581.72$ | **9.75%** |
| **`SE` (Senior)** | 280 | $\$138,617.29$ | $\$57,691.98$ | $\pm \$6,757.60$ | **4.88%** |
| **`EX` (Executive)** | 26 | $\$199,392.04$ | $\$117,071.26$ | $\pm \$45,000.74$ | **22.57%** |

### 💡 Hallazgos Clave de Negocio:
* **Estandarización en Senior Level:** Puestos `SE` presentan la menor incertidumbre (**4.88%**), indicando bandas salariales muy consistentes y predecibles en la industria.
* **Sensibilidad por Tamaño de Muestra:** Puestos `EX` presentan la mayor dispersión (**22.57%**) debido a una muestra reducida ($N=26$) y una alta variación entre bonos ejecutivos.
