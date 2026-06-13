/*

· Pregunta de negocio:
¿Qué canal genera más reservas/ingresos? ¿Cuál tiene mejor "calidad" 
(menos cancelaciones, mayor ADR)?

*/

-- Rendimiento general por canal de distribución
SELECT
    distribution_channel,
    COUNT(*) AS total_reservas,
    SUM(CASE WHEN is_canceled = 0 THEN 1 ELSE 0 END) AS reservas_confirmadas,
    ROUND(100.0 * SUM(CASE WHEN is_canceled = 0 THEN 1 ELSE 0 END) / COUNT(*), 2) AS pct_confirmacion,
    ROUND(AVG(CASE WHEN is_canceled = 0 THEN adr END), 2) AS adr_promedio_confirmadas,
    ROUND(SUM(CASE WHEN is_canceled = 0 THEN adr ELSE 0 END), 2) AS ingresos_estimados
FROM hotel_bookings
GROUP BY distribution_channel
ORDER BY ingresos_estimados DESC;

-- Rendimiento por segmento de mercado
SELECT
    market_segment,
    COUNT(*) AS total_reservas,
    SUM(CASE WHEN is_canceled = 0 THEN 1 ELSE 0 END) AS reservas_confirmadas,
    ROUND(100.0 * SUM(CASE WHEN is_canceled = 0 THEN 1 ELSE 0 END) / COUNT(*), 2) AS pct_confirmacion,
    ROUND(AVG(CASE WHEN is_canceled = 0 THEN adr END), 2) AS adr_promedio_confirmadas,
    ROUND(SUM(CASE WHEN is_canceled = 0 THEN adr ELSE 0 END), 2) AS ingresos_estimados
FROM hotel_bookings
GROUP BY market_segment
ORDER BY ingresos_estimados DESC;

/*

· Resultado: 
1) TA/TO genera el mayor volumen de ingresos (5,86M€), pero tiene la tasa de confirmación más baja (58,97%). Direct confirma el 82,54% y tiene un ADR superior (106,04€).
2) Por segmento, Online TA lidera en ingresos (4,07M€) con un ADR de 113,86€, pero solo confirma el 63,28%. Direct confirma el 84,66% con ADR similar (113,88€). Groups tiene la peor confirmación (38,94%).

*/