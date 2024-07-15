WITH LastBooking AS (
  SELECT h.city_id, MAX(b.booking_date) AS last_booking
  FROM booking b
  JOIN hotel h ON h.id = b.hotel_id
  GROUP BY h.city_id
),
BookingCounts AS (
  SELECT h.city_id, h.id AS hotel_id, COUNT(b.id) AS booking_count
  FROM hotel h
  JOIN booking b ON h.id = b.hotel_id
  GROUP BY h.city_id, h.id
),
TopHotels AS (
  SELECT city_id, hotel_id
  FROM BookingCounts
  WHERE (city_id, booking_count) IN (
    SELECT city_id, MAX(booking_count)
    FROM BookingCounts
    GROUP BY city_id
  )
),
HotelPhotos AS (
  SELECT id AS hotel_id, photos->>0 AS main_photo
  FROM hotel
)
SELECT 
  city.name AS city_name,
  LastBooking.last_booking,
  TopHotels.hotel_id,
  HotelPhotos.main_photo
FROM city
JOIN LastBooking ON city.id = LastBooking.city_id
JOIN TopHotels ON city.id = TopHotels.city_id
JOIN HotelPhotos ON TopHotels.hotel_id = HotelPhotos.hotel_id
ORDER BY city.name, TopHotels.hotel_id;
