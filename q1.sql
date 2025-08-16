use streaming;

delimiter $$
create procedure ListAllSubscribers()
begin
	declare done int default 0;
	declare subscriber varchar(100);
    declare cursor_sub cursor for
		select SubscriberName from subscribers;
    declare continue handler for not found set done=1;	
	open cursor_sub;
	sub_loop: loop
		fetch cursor_sub into subscriber;
        if done=1 then
			leave sub_loop;
		end if;
        select subscriber;
    end loop;
	close cursor_sub;
end $$
delimiter ;

call ListAllSubscribers();