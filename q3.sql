use streaming;
delimiter //
create procedure AddSubscriberIfNotExists(in subName varchar(100))
begin 
	declare flag int default 0;
    declare maxid int default 0;
    select count(*) into flag
    from subscribers s
    where s.SubscriberName=subName;
    if flag=0 then
    select max(SubscriberID) into maxid from subscribers;
    set maxid=maxid+1;
    insert into subscribers values(maxid,subName,curdate());
    select concat(subName," added successfully.") as output;
    else 
    select concat(subName," already exists.") as output;
    end if;
end //
delimiter ;
call AddSubscriberIfNotExists("parth");