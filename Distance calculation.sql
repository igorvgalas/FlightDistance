SELECT 
    DepartureCode,
    ArrivalCode,
    (((ACOS(SIN((Arrival_lat * PI() / 180)) * SIN((Departure_lat * PI() / 180)) + COS((Arrival_lat * PI() / 180)) * COS((Departure_lat * PI() / 180)) * COS(((Arrival_lon - Departure_lon) * PI() / 180)))) * 180 / PI()) * 60 * 1.1515) AS distanceIATA,
    (((ACOS(SIN((t2.Airport_lat * PI() / 180)) * SIN((t.Airport_lat * PI() / 180)) + COS((t2.Airport_lat * PI() / 180)) * COS((t.Airport_lat * PI() / 180)) * COS(((t2.Airport_lon - t.Airport_lon) * PI() / 180)))) * 180 / PI()) * 60 * 1.1515) AS distanceAirport
FROM
    flightdistanceclean AS f
        LEFT JOIN
    iata_airport_data AS t ON t.IATA_airport_code = f.DepartureCode
        LEFT JOIN
    iata_airport_data AS t2 ON t2.IATA_airport_code = f.ArrivalCode