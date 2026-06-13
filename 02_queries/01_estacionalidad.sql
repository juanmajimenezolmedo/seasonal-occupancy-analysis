/*

· Pregunta de negocio: 
¿Cómo varían las reservas (volumen e ingresos) a lo largo del año? ¿Hay meses claramente fuertes/débiles?

*/

SELECT
    arrival_date_year,
    arrival_date_month,
    COUNT(*) AS total_reservas,
    SUM(CASE WHEN is_canceled = 0 THEN 1 ELSE 0 END) AS reservas_confirmadas,
    ROUND(AVG(adr), 2) AS adr_promedio,
    ROUND(SUM(CASE WHEN is_canceled = 0 THEN adr ELSE 0 END), 2) AS ingresos_estimados
FROM hotel_bookings
GROUP BY arrival_date_year, arrival_date_month
ORDER BY arrival_date_year,
    CASE arrival_date_month
        WHEN 'January' THEN 1
        WHEN 'February' THEN 2
        WHEN 'March' THEN 3
        WHEN 'April' THEN 4
        WHEN 'May' THEN 5
        WHEN 'June' THEN 6
        WHEN 'July' THEN 7
        WHEN 'August' THEN 8
        WHEN 'September' THEN 9
        WHEN 'October' THEN 10
        WHEN 'November' THEN 11
        WHEN 'December' THEN 12
    END;

/*

· Resultado: 
1) El dataset cubre julio 2015 - agosto 2017 (26 meses).
2) Los meses de verano (jun-ago) muestran el ADR más alto cada año, con crecimiento interanual claro en ADR e ingresos.
3) Octubre suele tener el mayor volumen de reservas, aunque no el ADR más alto.

*/