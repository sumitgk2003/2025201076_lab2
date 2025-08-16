use streaming;

delimiter //
create procedure SendWatchTimeReport()
begin
	declare subid int default 1;
    declare maxid int default 0;
    declare watchCount int default 0;
    select max(subscriberid) into maxid from subscribers;
    watchReportLoop: loop
					if(subid>maxid)then
						leave watchReportLoop;
                    end if;
                    select count(*) into watchCount 
                    from watchhistory w
                    where w.SubscriberID=subid;
                    if watchCount>0 then
						call GetWatchHistoryBySubscriber(subid);
                    end if;
                    set subid=subid+1;
					end loop;
end //
delimiter ;

call SendWatchTimeReport();
