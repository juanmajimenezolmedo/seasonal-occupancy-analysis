# Análisis de Ocupación Estacional - Hotel Booking Demand

## Contexto
[Breve descripción del "rol": eres analista de datos para una empresa 
de gestión hotelera, y el equipo de Revenue te ha pedido un análisis 
sobre patrones de reservas, cancelaciones y rendimiento por canal, 
de cara a la planificación de la próxima temporada.]

## Dataset
- Fuente: Hotel Booking Demand (Kaggle)
- 119.384 registros tras limpieza, 34 columnas
- Rango temporal: julio 2015 - agosto 2017

## Stack utilizado
Python (pandas) para limpieza · PostgreSQL para análisis · Power BI / Tableau para visualización

## Preguntas de negocio e insights

### 1. Estacionalidad
### 1. Estacionalidad

**Pregunta:** ¿Cómo varían las reservas (volumen e ingresos) a lo largo 
del año? ¿Hay meses claramente fuertes/débiles?

**Hallazgos:**
- El dataset cubre julio 2015 - agosto 2017 (26 meses).
- Los meses de verano (junio-agosto) muestran consistentemente el ADR 
  (precio medio) más alto de cada año.
- Octubre suele tener el mayor volumen de reservas, aunque no el ADR 
  más alto, lo que indica que volumen alto no siempre coincide con 
  mayor rentabilidad por reserva.
- Hay una tendencia de crecimiento interanual clara, tanto en ADR como 
  en ingresos (ej. julio: 97,83€ en 2015 → 143,04€ en 2017).

**Recomendación:** las campañas de marketing en temporada baja 
(enero-febrero) podrían enfocarse en captar volumen, mientras que en 
temporada alta el foco debería estar en revenue management 
(optimización de precios) más que en captación adicional.

### 2. Cancelaciones

**Pregunta:** ¿Qué porcentaje de reservas se cancela, y varía según 
canal de distribución, tipo de hotel o antelación de la reserva?

**Hallazgos:**
- La tasa global de cancelación es del 37%, un valor muy elevado que 
  impacta directamente en los ingresos previstos.
- Por canal: TA/TO (agencias/touroperadores) concentra la mayor tasa 
  de cancelación (41,03%), mientras que las reservas directas son las 
  más estables (17,46%).
- Por tipo de hotel: City Hotel (41,72%) cancela casi el doble que 
  Resort Hotel (27,76%).
- Por antelación (lead time): existe una relación directa muy clara 
  entre antelación y cancelación. Las reservas hechas con más de 6 
  meses de antelación cancelan un 57%, frente a solo un 9,62% en las 
  reservas de última semana.

**Recomendación:** revisar las políticas de cancelación en los canales 
TA/TO y para reservas con alta antelación (>90 días), considerando 
depósitos no reembolsables o confirmaciones escalonadas. El canal 
directo, al ser el más estable, debería potenciarse mediante campañas 
de fidelización y promociones exclusivas.

### 3. Canales de venta

**Pregunta:** ¿Qué canal genera más reservas/ingresos? ¿Cuál tiene 
mejor "calidad" (menos cancelaciones, mayor ADR)?

**Hallazgos:**
- Por canal de distribución: TA/TO domina en volumen absoluto 
  (97.869 reservas, 5,86M€ en ingresos), pero es el canal con peor 
  tasa de confirmación (58,97%). Direct, aunque con menor volumen 
  (14.645 reservas), confirma el 82,54% y tiene un ADR superior 
  (106,04€ vs. 101,62€ de TA/TO).
- Por segmento de mercado: Online TA lidera en ingresos totales 
  (4,07M€) con un ADR alto (113,86€), pero confirma solo el 63,28%. 
  Direct tiene un ADR casi idéntico (113,88€) con una confirmación 
  del 84,66%, lo que lo convierte en el segmento de mayor calidad.
- Groups es el segmento más problemático: solo confirma el 38,94% 
  con el ADR más bajo (77,12€).
- Complementary tiene la mayor tasa de confirmación (86,94%) pero un 
  ADR simbólico (3,08€), coherente con reservas cortesía/gratuitas.

**Recomendación:** potenciar el canal directo (web propia, email 
marketing, fidelización) dado que ofrece el mejor equilibrio entre 
ADR alto y baja cancelación. Para TA/TO, negociar condiciones de 
cancelación más estrictas o depósitos anticipados para reducir la 
tasa del 41%. Revisar la estrategia con el segmento Groups, cuyo 
volumen es alto pero la conversión es muy baja.

### 4. Segmentos de cliente

**Pregunta:** ¿Qué países o tipos de cliente generan más ingresos? 
¿Hay segmentos con alto potencial poco explotados?

**Hallazgos:**

Por país:
- Portugal lidera ampliamente en volumen (48.584 reservas) e ingresos 
  (1,9M€), pero tiene la peor tasa de confirmación de todo el top 10 
  (43,37%), lo que sugiere un problema específico de cancelación en 
  el mercado local.
- Francia (81,43% confirmación, ADR 105,75€) y Alemania (83,29%, ADR 
  101,26€) ofrecen un equilibrio sólido entre volumen, calidad y precio.
- USA y Bélgica destacan por tener los ADR más altos del top 10 
  (118,98€ y 111,48€ respectivamente) con volúmenes aún moderados, 
  lo que los convierte en mercados con potencial de crecimiento 
  rentable.

Por tipo de cliente:
- Transient (cliente individual sin contrato) domina con 89.611 
  reservas y 5,56M€ en ingresos, pero confirma solo el 59,25%.
- Transient-Party (grupos informales) confirma mejor (74,58%) con 
  un ADR algo inferior (88,18€).
- Group tiene la mejor tasa de confirmación (89,77%) pero representa 
  un volumen muy pequeño (577 reservas).

**Recomendación:** investigar las causas de la alta cancelación en 
el mercado portugués (¿políticas de cancelación gratuita?, ¿reservas 
especulativas?). Invertir en captación de mercados con ADR alto y 
buena confirmación como USA, Bélgica y Francia. Para el tipo de 
cliente Transient, aplicar estrategias de reducción de cancelación 
similares a las recomendadas para TA/TO (depósitos, confirmaciones 
escalonadas).

## Dashboard
[Capturas/enlaces cuando estén listos]

## Recomendaciones generales
[Resumen final, una vez completadas todas las preguntas]