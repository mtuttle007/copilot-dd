-- define a sql select statement to get all students enrolls in a course
SELECT students.first_name, students.last_name, students.email, students.phone, locations.location_name, registrations.registration_status, registrations.registration_date, registrations.required_date, registrations.completion_date

-- write an index to improve the performance of the query
CREATE INDEX idx_registration_status ON courses.registrations (registration_status);

-- define a table for student attendance to capture attendance by class
CREATE TABLE courses.attendance (
    attendance_id INT IDENTITY (1, 1) PRIMARY KEY,
    registration_id INT NOT NULL,
    attendance_date DATE NOT NULL,
    attendance_status tinyint NOT NULL,
    -- Attendance status: 1 = Present; 2 = Absent; 3 = Excused; 4 = Tardy
    FOREIGN KEY (registration_id) REFERENCES courses.registrations (registration_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Define a stored procedure to get course enrollment by location
CREATE PROCEDURE GetCourseEnrollmentByLocation
    @locationName VARCHAR(100)
AS
BEGIN
    SELECT students.first_name, students.last_name, students.email, students.phone, locations.location_name, registrations.registration_status, registrations.registration_date, registrations.required_date, registrations.completion_date
    FROM courses.students
    JOIN courses.registrations ON students.student_id = registrations.student_id
    JOIN courses.locations ON registrations.location_id = locations.location_id
    WHERE locations.location_name = @locationName;
END;

CREATE PROCEDURE GetInstructorDetailsByLocation
    @instructorId INT
AS
BEGIN
    SELECT instructors.first_name, instructors.last_name, instructors.email, instructors.phone, locations.location_name, courses.course_name
    FROM instructors
    JOIN instructor_courses ON instructors.instructor_id = instructor_courses.instructor_id
    JOIN courses ON instructor_courses.course_id = courses.course_id
    JOIN locations ON instructors.location_id = locations.location_id
    WHERE instructors.instructor_id = @instructorId;
END;

SELECT *
FROM courses.registration
WHERE registration_date >= '2023-09-01' AND registration_date < '2023-10-01'

