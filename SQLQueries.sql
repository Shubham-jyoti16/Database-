-- Query 1
Select TourID, TourName, concat('$', TourCost) as TourCost, concat(TourDuration, ' hours') as TourDuration from Tour
order by TourCost desc;

-- Query 2
Select B.BookingID, B.BookingTime as 'Tour Start Time', ADDTIME(B.BookingTime, SEC_TO_TIME(T.TourDuration * 3600)) as 'Tour End Time' from Booking B
join Tour T on B.TourID = T.TourID
Order by T.TourID asc;



-- Query 3
select B.BookingID, B.BookingDate, R.ReserveName
from Booking B
join Reserve R on B.ReserveID = R.ReserveID
join Vehicle V on B.VehicleID = V.VehicleID and B.ReserveID = V.ReserveID
Where R.ReserveSize > 300
and V.VehicleCapacity >= 7
and DATEDIFF(B.BookingDate, CURDATE()) > 6 * 30;


-- Query 4
Select R.ReserveName, CONCAT(ReserveSize, ' hectares') as Size from Reserve R
Where R.ReserveID IN (
Select distinct V.ReserveID from Vehicle V 
Where UPPER(V.VehicleRegoNum) LIKE '%B%')
order by ReserveSize desc;

-- Query 5
Select B.ReserveID, COUNT(*) AS `Bookings Per Reserve` from Booking B
Where TIME(B.BookingTime) < '10:00:00'
group by B.ReserveID
order by B.ReserveID asc;

-- Query 6
SELECT S.StaffName, IFNULL(B.BookingDate, 'No Booking') as BookingDate from Staff S
Left Join Booking B on S.StaffID = B.StaffID and MONTH(B.BookingDate) = 10
where (S.StaffPosition = 'Reserve Manager' or (S.StaffPosition = 'Senior Tour Guide' and S.StaffSalary >= 70000))
order by S.StaffName asc, BookingDate;

-- Query 7
Select distinct VG.VisGroupCountry, S.StaffName from Booking B
join VisitorGroup VG on B.VisGroupID = VG.VisGroupID
join Staff S ON B.StaffID = S.StaffID
join Tour T ON B.TourID = T.TourID
where T.TourDuration > 2
and S.StaffID IN 
(
select StaffID
from Booking
group by StaffID
having COUNT(*) >= 2)
and S.StaffSalary <= 
(
select AVG(StaffSalary) from Staff);


-- Query 8
Select T1.TourName AS Package_Tour,  T2.TourName AS Component_Tour  from TourPackage TP
join Tour T1 ON TP.PackageTourID = T1.TourID
join Tour T2 ON TP.ComponentTourID = T2.TourID
Where TP.PackageTourID IN (
select TP.PackageTourID from TourPackage TP
group by TP.PackageTourID
having COUNT(TP.ComponentTourID) > 2)
order by Package_Tour, Component_Tour;







