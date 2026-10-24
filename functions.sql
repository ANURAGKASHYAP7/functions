use functions;
SELECT name, score,
RANK() OVER (ORDER BY score DESC) AS rank

USE functions;

SELECT
    name,
    score,
    RANK() OVER (ORDER BY score DESC)  AS student_rank
FROM Student_Performance;
#Question 2 : Show each student's score and the previous student’s score (based on score order)
select name, score,
lag(score) over(order by score desc) as previous_score
from Student_Performance;
# Question 3 : Convert all student names to uppercase and extract the month name from join_date
select upper(name),
MONTHNAME(join_date) AS month_name
from Student_Performance;
#  : 4 Show each student's name and the next student’s attendance (ordered by attendance)
select name,
lead(attendance) over(order by attendance) as next_attendance 
from Student_Performance;
# Question 5 : Assign students into 4 performance groups using NTILE().
select name,score ,ntile(4) over (order by score desc)  as performance_group from Student_Performance;
# Question 6 : For each course, assign a row number based on attendance (highest first).
select
 name,
 course,
 attendance,
 row_number() over(partition by course 
 order by attendance desc) as row_num
from Student_Performance;
# Question 7 : Calculate the number of days each student has been enrolled (from join_date to today).
#(Assume current date = '2025-01-01')
select name ,datediff('2025-01-01',join_date) as number_of_days
from Student_Performance;
#Question 8 : Format join_date as “Month Year” (e.g., “June 2023”).
SELECT
    name,
    join_date,
    DATE_FORMAT(join_date, '%M %Y') AS formatted_date
FROM Student_Performance;
# Question 9 : Replace the city ‘Mumbai’ with ‘MUM’ for display purposes.
select name,
case
	when city = 'Mumbai' Then 'MUM'
    else city
end as city
FROM student_performance;
#Question 10 : For each course, find the highest score using FIRST_VALUE().
SELECT
    name,
    course,
    score,
    FIRST_VALUE(score) OVER (
        PARTITION BY course
        ORDER BY score DESC
    ) AS highest_score
FROM Student_Performance;