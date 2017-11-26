--Author: Alexander Stigliano--
--Date Created: 11/22/17--

--The PreReqsFor, aka the first stored procedure asked to be written.--
create or replace function PreReqsFor(int, REFCURSOR) returns refcursor as 
$$
declare
   course_Number int      := $1;
   resultset   REFCURSOR := $2;
begin
   open resultset for 
      select preReqNum
      from   PreRequisites
       where  courseNum = course_Number;
   return resultset;
end;
$$ 
language plpgsql;

select PreReqsFor(499, 'results');
Fetch all from results;


--The IsPreReqFor, the second stored procedure to be written--
create or replace function IsPreReqFor(int, REFCURSOR) returns refcursor as 
$$
declare
   PreReq int      := $1;
   resultset   REFCURSOR := $2;
begin
   open resultset for 
      select courseNum
      from   PreRequisites
       where  preReqNum= PreReq;
   return resultset;
end;
$$ 
language plpgsql;

select IsPreReqFor(120, 'results');
Fetch all from results;