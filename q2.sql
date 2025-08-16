use streaming;

delimiter //

create procedure GetWatchHistoryBySubscriber(in sub_id int)
begin 
	select s.title,w.watchtime 
    from shows s
    inner join watchhistory w
    on s.ShowID=w.ShowID
    where w.SubscriberID=sub_id;
    
end //

delimiter ;

call getwatchhistorybysubscriber(2);