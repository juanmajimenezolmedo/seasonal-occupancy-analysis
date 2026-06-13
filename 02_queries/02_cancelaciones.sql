/*

· Pregunta de negocio:
¿Qué porcentaje de reservas se cancela, y varía según canal de 
distribución, tipo de hotel, o antelación de la reserva (lead time)?

*/

-- Cancelaciones por canal de distribución
SELECT
    distribution_channel,
    COUNT(*) AS total_reservas,
    SUM(is_canceled) AS reservas_canceladas,
    ROUND(100.0 * SUM(is_canceled) / COUNT(*), 2) AS pct_cancelacion
FROM hotel_bookings
GROUP BY distribution_channel
ORDER BY pct_cancelacion DESC;

-- Cancelaciones por tipo de hotel
SELECT
    hotel,
    COUNT(*) AS total_reservas,
    SUM(is_canceled) AS reservas_canceladas,
    ROUND(100.0 * SUM(is_canceled) / COUNT(*), 2) AS pct_cancelacion
FROM hotel_bookings
GROUP BY hotel
ORDER BY pct_cancelacion DESC;

-- Cancelaciones por rango de lead time (antelación)
SELECT
    CASE
        WHEN lead_time <= 7 THEN '1. Última semana (0-7 días)'
        WHEN lead_time <= 30 THEN '2. Último mes (8-30 días)'
        WHEN lead_time <= 90 THEN '3. 1-3 meses (31-90 días)'
        WHEN lead_time <= 180 THEN '4. 3-6 meses (91-180 días)'
        ELSE '5. Más de 6 meses (>180 días)'
    END AS rango_lead_time,
    COUNT(*) AS total_reservas,
    SUM(is_canceled) AS reservas_canceladas,
    ROUND(100.0 * SUM(is_canceled) / COUNT(*), 2) AS pct_cancelacion
FROM hotel_bookings
GROUP BY rango_lead_time
ORDER BY rango_lead_time;

/*

· Resultado: 
1) El canal TA/TO tiene la tasa de cancelación más alta (41,03%), mientras que Direct es el más estable (17,46%).
2) City Hotel cancela significativamente más (41,72%) que Resort Hotel (27,76%).
3) A mayor antelación, mayor cancelación: reservas con más de 6 meses de antelación cancelan un 57%, frente a un 9,62% en la última semana.

*/