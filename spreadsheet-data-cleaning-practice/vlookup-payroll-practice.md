# 💼 Saneamiento y Consolidación de Nóminas con BUSCARV (Google Sheets)

## 📌 Contexto del Negocio
Consolidación y cálculo de nómina semanal para una firma contable. El proyecto requirió depurar un registro de horas con inconsistencias de formato, realizar un cruce relacional entre pestañas para obtener la tarifa horaria correspondiente por ID de empleado y resumir los costos laborales mediante una tabla dinámica.

---

## 🛠️ Procedimiento Paso a Paso y Fórmulas Aplicadas

### 1. Limpieza de Texto y Estandarización de Datos
* **Eliminación de espacios irregulares (`ESPACIOS` / `TRIM`):**
  
   ```excel
  =ESPACIOS(B2)
   
  ```
* **Conversión de valores numéricos de horas (VALOR / VALUE):**
  
   ```excel
  =VALOR(C2)
   
  ```
* **Cálculo de horas semanales totales (SUMA / SUM):**

     ```excel
   =SUMA(C15:H15)

  ```     
### 2. Cruce Relacional de Tablas (BUSCARV / VLOOKUP)
* **Para traer la tarifa salarial desde la hoja de referencia (Hoja2) a partir del ID de empleado, fijando el rango de búsqueda con referencias absolutas ($):**
   
  ```excel
  =BUSCARV(A2; Hoja2!$A$2:$D$6; 4; FALSO)

  ```
### 3. Cálculo de Remuneración Total
* **Cálculo de la paga semanal multiplicando horas totales por tarifa por hora:**
  
  ```excel
   =PRODUCTO(I15; J15)

  ```
## 📊 Tabla Dinámica: Resumen de Nómina por Empleado
| Empleado | Tarifa Salarial | Remuneración Total Semanal |
| :--- | :---: | :---: |
| Ali, Dana | $75.00 | $3,450.00 |
| Chan, Daniel | $100.50 | $3,919.50 |
| Fischer, Wolfgang | $65.00 | $2,730.00 |
| Patel, Anika | $3,000.00 | $88,500.00 |
| Sanchez, Alexis | $150.00 | $6,600.00 |
| **Total General** | **$3,390.50** | **$105,199.50** |

## 💡 Lecciones Clave
* **1. Referencias Absolutas ($A$2:$D$6):** Fundamentales en funciones de búsqueda para permitir el arrastre de fórmulas sin desplazar la matriz de consulta.

* **2. Coincidencia Exacta (FALSO):** Evita la asignación errónea de salarios por proximidad alfabética o numérica en identificadores.
