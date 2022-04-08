explain
select address
from customer c
where c.address  '555';


explain
select name
from customer c
where c.address = '%ew%';

explain
select name
from customer c
where c.review = 'life';


--create index querry1 on customer(address); 
--create index querry2 on customer using btree (address) ; 
--create index qerry3 on customer(review)