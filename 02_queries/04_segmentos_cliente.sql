/*

· Pregunta de negocio:
¿Qué países o tipos de cliente generan más ingresos? ¿Hay segmentos 
con alto potencial poco explotados?

*/

-- Top 10 países por ingresos (solo reservas confirmadas)
SELECT
    country,
    COUNT(*) AS total_reservas,
    SUM(CASE WHEN is_canceled = 0 THEN 1 ELSE 0 END) AS reservas_confirmadas,
    ROUND(100.0 * SUM(CASE WHEN is_canceled = 0 THEN 1 ELSE 0 END) / COUNT(*), 2) AS pct_confirmacion,
    ROUND(AVG(CASE WHEN is_canceled = 0 THEN adr END), 2) AS adr_promedio,
    ROUND(SUM(CASE WHEN is_canceled = 0 THEN adr ELSE 0 END), 2) AS ingresos_estimados
FROM hotel_bookings
GROUP BY country
ORDER BY ingresos_estimados DESC
LIMIT 10;

-- Rendimiento por tipo de cliente
SELECT
    customer_type,
    COUNT(*) AS total_reservas,
    SUM(CASE WHEN is_canceled = 0 THEN 1 ELSE 0 END) AS reservas_confirmadas,
    ROUND(100.0 * SUM(CASE WHEN is_canceled = 0 THEN 1 ELSE 0 END) / COUNT(*), 2) AS pct_confirmacion,
    ROUND(AVG(CASE WHEN is_canceled = 0 THEN adr END), 2) AS adr_promedio,
    ROUND(SUM(CASE WHEN is_canceled = 0 THEN adr ELSE 0 END), 2) AS ingresos_estimados
FROM hotel_bookings
GROUP BY customer_type
ORDER BY ingresos_estimados DESC;

/*

· Resultado:
1) Portugal lidera en volumen (48.584 reservas) pero tiene la peor tasa de confirmación (43,37%). Francia y Alemania confirman >81% con ADR superiores.
2) USA y Bélgica tienen ADR altos (118,98€ y 111,48€) con volumen moderado: mercados con potencial de crecimiento.
3) Transient domina en ingresos (5,56M€) pero confirma solo el 59,25%.Group tiene la mejor confirmación (89,77%) pero volumen muy bajo.


*/