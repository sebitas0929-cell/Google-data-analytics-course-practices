# 📦 Control de Devoluciones y Pérdidas Operativas en Retail

## 📌 Contexto del Proyecto
Auditoría y control de pérdidas financieras derivadas de devoluciones de producto en una cadena omnicanal. El flujo cubre desde el saneamiento de datos transaccionales crudos en Google Sheets hasta el diseño de un cuadro de mando ejecutivo interactivo en Tableau Public.

---

## 🛠️ Procedimiento Técnico

### 1. Saneamiento en Hojas de Cálculo (Google Sheets)
* **Normalización de Cadenas:** Eliminación de espacios invisibles con `ESPACIOS()` / `TRIM()` y tratamiento de mayúsculas/minúsculas.
* **Tratamiento de Nulos:** Estandarización de celdas vacías en órdenes conservadas asignando la etiqueta `"Sin Devolucion"`.
* **Métricas Financieras:**
  * $\text{Venta Bruta} = \text{Precio Unitario} \times \text{Cantidad}$
  * $\text{Es Devolucion Num} = \text{SI}(\text{Devuelto} = \text{"SI"}, 1, 0)$
  * $\text{Pérdida Financiera} = \text{SI}(\text{Devuelto} = \text{"SI"}, \text{Venta Bruta} + \text{Costo Envío}, 0)$

---

## 📈 Dashboard Ejecutivo Interactivo

[![Dashboard Devoluciones Tableau](https://img.shields.io/badge/Tableau-Dashboard%20Interactivo-E97627?style=for-the-badge&logo=tableau&logoColor=white)](https://public.tableau.com/shared/TGPGGCZYD)

><img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/8e57a60a-896c-4220-938c-4bc8738fef57" />

> 🔗 **Explorar Tablero:** [Ver en Tableau Public (Enlace Compartido)](https://public.tableau.com/shared/TGPGGCZYD)

---

## 💡 Hallazgos y Acciones Operativas (Fase Act)
1. **Fallas de Fábrica:** El motivo `Defectuoso` lidera las pérdidas totales con **$711.00 USD**, concentrado en unidades de tecnología y mobiliario (auditoría de proveedor requerida).
2. **Confusión de Tallas en Moda:** Representa **$661.00 USD** de merma (implementar guía de tallaje en cm en la tienda web).
3. **Puntualidad Logística (Norte):** Pérdida de **$345.00 USD** por retraso en monitores de alta gama (revisión de SLAs con el operador logístico de última milla).
