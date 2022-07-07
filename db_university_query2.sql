-- Contare quanti iscritti ci sono stati ogni anno (la data di iscrizione sulla tabella students è enrolment_date)
SELECT year(enrolment_date) ,count(year(enrolment_date)) 
FROM STUDENTS S 
group by year(enrolment_date); 

-- Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
select *
from students s
inner join `degrees` d 
on s.degree_id = d.id
where d.department_id = 9;

-- Selezionare tutti i corsi in cui insegna Fulvio Amato
select c.name, c.description, c.period, t.name, t.surname, t.email 
from courses c 
inner join course_teacher ct 
on c.id = ct.course_id 
inner join teachers t 
on ct.teacher_id = t.id
where t.name = 'fulvio' and t.surname = 'amato';

-- Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento,
-- in ordine alfabetico per cognome e nome
select s.name ,s.surname,d.name ,d.`level` ,d2.name 
from students s 
inner join `degrees` d 
on s.degree_id = d.id
inner join departments d2 
on d.id = d2.id
order by s.name, s.surname;

-- Contare quanti corsi di laurea ci sono per ogni dipartimento e mostrare nome dipartimento e numero di corsi
select d2.name, count(d.department_id) 
from `degrees` d 
inner join departments d2  
on d.department_id = d2.id
group by d2.name; 