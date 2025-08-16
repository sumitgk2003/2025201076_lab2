github repo link: https://github.com/sumitgk2003/2025201076_lab2

Database name: streaming

q1: In the first question procedure created is ListAllSubscribers(). In this procedure I have used cursor to iterate through all names in Subscribers.
  for execution :
    call ListAllSubscribers();
  output:
    it outputs all the subscribers names in different tables.

q2: In the Second question procedure created is  GetWatchHistoryBySubscriber(IN sub_id INT).This procedure returns all shows watched by the subscriber along with its watchtime.
  for execution:
    e.g. : consider subscriber with sub_id=1
    call GetWatchHistoryBySubscriber(1);
  output:
    It returns all the shows watched by subscriber along with watchtime in one table;

q3: In the third question procedure created is AddSubscriberIfNotExists(IN subName VARCHAR(100)). In this procedure we add subscriber if it is not already present.
Here I store the max sub_id in a variable and then increment it by 1 and use it as primary key while storing the subscriber. In subscription date I use current date
  for execution:
    e.g. :consider subscriber with subName="Sumit";
    call AddSubscriberIfNotExists("Sumit");
  output :it adds the subscriber in the subscribers table if it was not present and prints "subName added Successfully" and if the subscriber with subName is already present then it prints "subName already exists".

q4: In the fourth question the procedure created is SendWatchTimeReport(). Internally it calls GetWatchHistoryBySubscriber() for each subscriber using sub_id.
  for execution: 
    call SendWatchTimeReport();
  output:
    it gives the shows and watchtime of each subscriber in different table only if that subscriber has watched something.


q5: In the fifth question the procedure created is SendWatchTimeReport1(). Internally it calls GetWatchHistoryBySubscriber() for each subscriber using sub_id and cursor is used to loop through each subscriber.
  for execution: 
    call SendWatchTimeReport1();
  output:
    it gives the shows and watchtime of each subscriber in different table irrespective of he has watched something or not.

I have used the below table structures :
  -- Create Tables
  CREATE TABLE Shows (
  ShowID INT PRIMARY KEY,
  Title VARCHAR(100),
  Genre VARCHAR(50),
  ReleaseYear INT
  );
  CREATE TABLE Subscribers (
  SubscriberID INT PRIMARY KEY,
  SubscriberName VARCHAR(100),
  SubscriptionDate DATE
  );
  CREATE TABLE WatchHistory (
  HistoryID INT PRIMARY KEY,
  ShowID INT,
  SubscriberID INT,
  WatchTime INT, -- Duration in minutes
  FOREIGN KEY (ShowID) REFERENCES Shows(ShowID),
  FOREIGN KEY (SubscriberID) REFERENCES
  Subscribers(SubscriberID)
  );
