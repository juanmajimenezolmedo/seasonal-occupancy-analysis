# Análisis de Ocupación Estacional

## Contexto
[Breve descripción del "rol": eres analista de datos para una empresa 
de gestión hotelera, y el equipo de Revenue te ha pedido un análisis 
sobre patrones de reservas, cancelaciones y rendimiento por canal, 
de cara a la planificación de la próxima temporada.]

## Dataset
· Fuente: Hotel Booking Demand (Kaggle)
· 119.384 registros tras limpieza, 34 columnas
· Rango temporal: julio 2015 - agosto 2017

## Stack utilizado
Python (pandas) para limpieza · PostgreSQL para análisis · Power BI / Tableau para visualización

## Preguntas de negocio e insights

### 1. Estacionalidad

**Pregunta:** ¿Cómo varían las reservas (volumen e ingresos) a lo largo 
del año? ¿Hay meses claramente fuertes/débiles?

**Hallazgos:**
· El dataset cubre julio 2015 - agosto 2017 (26 meses).
· Los meses de verano (junio-agosto) muestran consistentemente el ADR 
  (precio medio) más alto de cada año.
· Octubre suele tener el mayor volumen de reservas, aunque no el ADR 
  más alto, lo que indica que volumen alto no siempre coincide con 
  mayor rentabilidad por reserva.
· Hay una tendencia de crecimiento interanual clara, tanto en ADR como 
  en ingresos (ej. julio: 97,83€ en 2015 → 143,04€ en 2017).

**Recomendación:** las campañas de marketing en temporada baja 
(enero-febrero) podrían enfocarse en captar volumen, mientras que en 
temporada alta el foco debería estar en revenue management 
(optimización de precios) más que en captación adicional.

### 2. Cancelaciones
[Pendiente]

### 3. Canales de venta
[Pendiente]

### 4. Segmentos de cliente
[Pendiente]

## Dashboard
[Capturas/enlaces cuando estén listos]

## Recomendaciones generales
[Resumen final, una vez completadas todas las preguntas]
