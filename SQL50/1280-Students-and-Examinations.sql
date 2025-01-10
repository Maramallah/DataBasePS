# Write your MySQL query statement below
select s.student_id , s.student_name , t.subject_name , count(e.student_id) as attended_exams
from Students s 
#generate all combinations to help with the left join
cross join 
Subjects t 
# all the students and subjects and if null just write it so when count u get 0 for those who didn`t attent 
 left join 
  Examinations e
on 
s.student_id= e.student_id and t.subject_name= e.subject_name
group by 
   s.student_id,
   # s.student_name,
    t.subject_name
ORDER BY
    s.student_id,
    t.subject_name;
