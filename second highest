select max(marks) from smarks where marks not in(select max(marks) from smarks)
select top 1 marks from smarks where marks<(select max(marks) from smarks) order by marks desc
