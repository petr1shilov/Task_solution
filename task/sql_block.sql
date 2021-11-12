#################### задача №1
SELECT name,COUNT(Trip.id) AS count   
FROM Passenger 
JOIN Pass_in_trip ON Passenger.id = Pass_in_trip.passenger 
JOIN Trip ON Trip.id = Pass_in_trip.trip
GROUP BY Passenger.name
HAVING count >= 1
ORDER BY count DESC ,name ASC

#################### задача №2

SELECT DISTINCT TIMEDIFF(
(SELECT end_pair FROM  Timepair WHERE id = 4), 
(SELECT start_pair FROM Timepair WHERE id = 2)
)AS time_of_lesson
FROM Timepair

#################### задача №3
SELECT DISTINCT Rooms.*
FROM Rooms
JOIN Reservations ON Reservations.room_id = Rooms.id
WHERE WEEK(start_date, 1) = 12 AND YEAR(start_date) = 2020 

#################### задача №4
SELECT classroom FROM Schedule
GROUP BY classroom
HAVING COUNT(classroom) = (SELECT COUNT(classroom)  FROM Schedule
                                GROUP  BY classroom
                                ORDER BY COUNT(classroom) DESC LIMIT 1) 


#################### задача №5
SELECT point,
       "date" income_date,
       "date" + nvl(
                  min(CASE WHEN diff > cnt THEN cnt ELSE),
                  max(cnt)+1
                ) incass_date
FROM (SELECT i.point,
             i."date",
             (trunc(o."date") - trunc(i."date")) diff,
            JOIN (SELECT point, "date", 1 disabled FROM outcome_o
                     UNION
                     SELECT point, trunc("date"+7,'DAY'), 1 disabled FROM income_o) o
                 ON i.point = o.point
      WHERE o."date" > = i."date")
GROUP BY point, "date"