use streaming;
delimiter //
create procedure SendWatchTimeReport1()
begin
	declare subid int default 1;
    declare done int default 0;
    declare cursor_subid cursor for 
		select distinct SubscriberID from watchhistory;
    declare continue handler for not found set done=1;
    open cursor_subid;
    watchReportLoop: loop
					fetch cursor_subid into subid;
                    if done=1 then
						leave watchReportLoop;
					end if;
					call GetWatchHistoryBySubscriber(subid);
					end loop;
	close cursor_subid;
end //
delimiter ;

call SendWatchTimeReport1();