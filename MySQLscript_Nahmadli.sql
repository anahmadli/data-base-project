CREATE DATABASE SOCCER_LEAGUE_AN;
USE SOCCER_LEAGUE_AN;

CREATE TABLE SEASON_AN (
    SEASON_ID_AN       INT AUTO_INCREMENT PRIMARY KEY,
    SEASON_TERM_AN     VARCHAR(10) NOT NULL,
    SEASON_YEAR_AN     YEAR NOT NULL,
    REGISTRATION_START_DATE_AN DATE NOT NULL,
    REGISTRATION_END_DATE_AN   DATE NOT NULL,
    SEASON_START_DATE_AN       DATE NOT NULL,
    SEASON_END_DATE_AN         DATE NOT NULL,
    UNIQUE (SEASON_TERM_AN, SEASON_YEAR_AN)
);

CREATE TABLE CLUB_AN (
    CLUB_ID_AN   INT AUTO_INCREMENT PRIMARY KEY,
    CLUB_NAME_AN VARCHAR(24) NOT NULL,
    CLUB_ABBR_AN VARCHAR(5) NOT NULL UNIQUE,
    CLUB_EMAIL_AN VARCHAR(35) NOT NULL,
    CLUB_PHONE_AN VARCHAR(13) NOT NULL
);

CREATE TABLE PERSON_AN (
    PERSON_ID_AN   INT AUTO_INCREMENT PRIMARY KEY,
    FIRST_NAME_AN  VARCHAR(30) NOT NULL,
    LAST_NAME_AN   VARCHAR(30) NOT NULL,
    SEX_AN         CHAR(1) NOT NULL,
    BIRTH_YEAR_AN  YEAR,
    PERSON_TYPE_AN VARCHAR(10) NOT NULL
);

CREATE TABLE DIVISION_AN (
    DIVISION_ID_AN   INT AUTO_INCREMENT PRIMARY KEY,
    AGE_GROUP_AN     VARCHAR(4) NOT NULL,   
    DIVISION_SEX_AN  VARCHAR(5) NOT NULL,   
    DIVISION_RANK_AN INT NOT NULL,           
    CONTACT_EMAIL_AN VARCHAR(35) NOT NULL,
    CONTACT_PHONE_AN VARCHAR(13) NOT NULL,
    SEASON_ID_AN     INT NOT NULL,
    FOREIGN KEY (SEASON_ID_AN) REFERENCES SEASON_AN(SEASON_ID_AN),
    UNIQUE (SEASON_ID_AN, AGE_GROUP_AN, DIVISION_SEX_AN, DIVISION_RANK_AN)
);


CREATE TABLE COACH_AN (
    PERSON_ID_AN INT PRIMARY KEY,
    FOREIGN KEY (PERSON_ID_AN) REFERENCES PERSON_AN(PERSON_ID_AN)
);


CREATE TABLE TEAM_AN (
    TEAM_ID_AN    INT AUTO_INCREMENT PRIMARY KEY,
    TEAM_NAME_AN  VARCHAR(20) NOT NULL,   
    BIRTH_YEAR_AN YEAR NOT NULL,          
    TEAM_SEX_AN   VARCHAR(5) NOT NULL,    
    TEAM_EMAIL_AN VARCHAR(35) NOT NULL,
    TEAM_PHONE_AN VARCHAR(13) NOT NULL,
    CLUB_ID_AN    INT NOT NULL,
    COACH_ID_AN   INT,
    FOREIGN KEY (CLUB_ID_AN)  REFERENCES CLUB_AN(CLUB_ID_AN),
    FOREIGN KEY (COACH_ID_AN) REFERENCES COACH_AN(PERSON_ID_AN),
    UNIQUE (CLUB_ID_AN, TEAM_NAME_AN)
);

CREATE TABLE PLAYER_AN (
    PERSON_ID_AN INT PRIMARY KEY,
    TEAM_ID_AN   INT NOT NULL,
    FOREIGN KEY (PERSON_ID_AN) REFERENCES PERSON_AN(PERSON_ID_AN),
    FOREIGN KEY (TEAM_ID_AN)   REFERENCES TEAM_AN(TEAM_ID_AN)
);

CREATE TABLE TEAM_SEASON_AN (
    TEAM_ID_AN     INT NOT NULL,
    DIVISION_ID_AN INT NOT NULL,
    PRIMARY KEY (TEAM_ID_AN, DIVISION_ID_AN),
    FOREIGN KEY (TEAM_ID_AN)     REFERENCES TEAM_AN(TEAM_ID_AN),
    FOREIGN KEY (DIVISION_ID_AN) REFERENCES DIVISION_AN(DIVISION_ID_AN)
);


CREATE TABLE GAME_AN (
    GAME_CODE_AN   INT PRIMARY KEY,        
    GAME_DATE_AN   DATE NOT NULL,
    GAME_TIME_AN   TIME NOT NULL,
    DIVISION_ID_AN INT NOT NULL,
    TEAM1_ID_AN    INT NOT NULL,
    TEAM2_ID_AN    INT NOT NULL,
    TEAM1_SCORE_AN TINYINT UNSIGNED NOT NULL,
    TEAM2_SCORE_AN TINYINT UNSIGNED NOT NULL,
    FOREIGN KEY (DIVISION_ID_AN) REFERENCES DIVISION_AN(DIVISION_ID_AN),
    FOREIGN KEY (TEAM1_ID_AN)    REFERENCES TEAM_AN(TEAM_ID_AN),
    FOREIGN KEY (TEAM2_ID_AN)    REFERENCES TEAM_AN(TEAM_ID_AN)
  
);

INSERT INTO SEASON_AN VALUES
(1, 'FALL',   2018, '2018-07-01', '2018-08-01', '2018-09-01', '2018-12-01'),
(2, 'SPRING', 2019, '2019-02-01', '2019-03-01', '2019-04-01', '2019-06-01'),
(3, 'SUMMER', 2019, '2019-05-01', '2019-06-01', '2019-07-01', '2019-08-15'),
(4, 'WINTER', 2019, '2019-09-01', '2019-10-01', '2019-11-01', '2020-02-01'),
(5, 'SPRING', 2020, '2020-01-01', '2020-02-01', '2020-03-01', '2020-06-01'),
(6, 'FALL',   2025, '2025-07-01', '2025-08-01', '2025-09-01', '2025-12-01');  

INSERT INTO CLUB_AN VALUES
(1, 'Warriors', 'WAR', 'warriors@club.com', '(123) 1234567'),
(2, 'Tigers',   'TGR', 'tigers@club.com',   '(234) 2345678'),
(3, 'Dragons',  'DRG', 'dragons@club.com',  '(345) 3456789'),
(4, 'Lions',    'LIO', 'lions@club.com',    '(456) 4567890'),
(5, 'Hawks',    'HWK', 'hawks@club.com',    '(567) 5678901');

INSERT INTO PERSON_AN VALUES
(1, 'Ali',    'Nahmadli', 'M', 1985, 'Coach'),
(2, 'John',   'Doe',      'M', 2010, 'Player'),
(3, 'Jane',   'Smith',    'F', 2011, 'Player'),
(4, 'Mike',   'Brown',    'M', 2010, 'Player'),
(5, 'Emily',  'Davis',    'F', 2009, 'Player'),
(6, 'Sarah',  'Johnson',  'F', 2008, 'Player'),
(7, 'Robert', 'Wilson',   'M', 2009, 'Player'),
(8, 'Kevin',    'Walker',   'M', 2009, 'Player'),
(9, 'Samantha', 'Hall',     'F', 2010, 'Player'),
(10,'Daniel',   'Allen',    'M', 2010, 'Player'),
(11,'Laura',    'Young',    'F', 2009, 'Player'),
(12,'Sophia',   'Hernandez','F', 2008, 'Player'),
(13,'Ryan',     'Lewis',    'M', 2011, 'Player'),
(14,'Chloe',    'Clark',    'F', 2008, 'Player'),
(15,'Ethan',    'Robinson', 'M', 2011, 'Player'),
(16,'Andrew',   'Scott',    'M', 2015, 'Player'),
(17,'Megan',    'Adams',    'F', 2015, 'Player'),
(18,'Joshua',   'Baker',    'M', 2015, 'Player'),
(19,'Amy',      'Gonzalez', 'F', 2015, 'Player'),
(20,'Matthew',  'Perez',    'M', 2015, 'Player'),
(21,'Natalie',  'Howard',   'F', 2015, 'Player'),
(22,'Justin',   'Brooks',   'M', 2016, 'Player'),
(23,'Emma',     'Kelly',    'F', 2016, 'Player'),
(24,'Benjamin', 'Sanders',  'M', 2016, 'Player'),
(25,'Ava',      'Price',    'F', 2016, 'Player'),
(26,'Samuel',   'Ross',     'M', 2016, 'Player'),
(27,'Lily',     'Foster',   'F', 2016, 'Player'),
(28,'Tom',       'Miller',   'M', 1980, 'Coach'),
(29,'Mary',      'Taylor',   'F', 1981, 'Coach'),
(30,'James',     'Anderson', 'M', 1975, 'Coach'),
(31,'Patricia',  'Thomas',   'F', 1983, 'Coach'),
(32,'Michael',   'Harris',   'M', 1978, 'Coach'),
(33,'Linda',     'Martin',   'F', 1977, 'Coach'),
(34,'Robert',    'Thompson', 'M', 1984, 'Coach'),
(35,'Barbara',   'Garcia',   'F', 1982, 'Coach'),
(36,'William',   'Moore',    'M', 1979, 'Coach'),
(37,'Elizabeth', 'Lee',      'F', 1976, 'Coach'),
(38,'David',     'King',     'M', 1985, 'Coach'),
(39,'Susan',     'White',    'F', 1980, 'Coach');

INSERT INTO COACH_AN VALUES
(1),    
(28), (29), (30), (31), (32),
(33), (34), (35), (36), (37),
(38), (39);   

INSERT INTO TEAM_AN VALUES
(1, 'Blue',   2009, 'boys',  'blue@team.com',   '(101) 1010101', 1, 1),  
(2, 'Red',    2008, 'girls', 'red@team.com',    '(202) 2020202', 2, 28), 
(3, 'Green',  2010, 'boys',  'green@team.com',  '(303) 3030303', 3, 29),  
(4, 'Violet', 2009, 'girls', 'violet@team.com', '(404) 4040404', 4, 30),  
(5, 'Orange', 2009, 'girls', 'orange@team.com', '(505) 5050505', 4, 31),  
(6, 'Yellow', 2011, 'boys',  'yellow@team.com', '(606) 6060606', 4, 32),  
(7, 'Gray',   2010, 'boys',  'gray@team.com',   '(707) 7070707', 1, 33),  
(8, 'Black',  2015, 'boys',  'black@team.com',  '(808) 8080808', 1, 34),  
(9, 'White',  2015, 'boys',  'white@team.com',  '(909) 9090909', 2, 35), 
(10,'Pink',   2015, 'boys',  'pink@team.com',   '(818) 1818181', 3, 36),  
(11,'Gold',   2015, 'girls', 'gold@team.com',   '(919) 1919191', 5, 37),  
(12,'Silver', 2015, 'girls','silver@team.com',  '(010) 1010101', 4, 38),  
(13,'Purple', 2015, 'girls','purple@team.com',  '(020) 2020202', 2, 39);  


INSERT INTO PLAYER_AN VALUES
(2, 1), (3, 1),         
(4, 2), (8, 2),         
(9, 3), (10, 3),        
(5, 4), (11, 4),       
(6, 5), (12, 5),      
(7, 6), (13, 6),       
(14, 7), (15, 7),       
(16, 8), (17, 8),      
(18, 9), (19, 9),     
(20, 10),(21, 10),     
(22, 11),(23, 11),    
(24, 12),(25, 12),    
(26, 13),(27, 13);      

INSERT INTO TEAM_SEASON_AN VALUES
(1, 1), (6, 1),                   
(2, 2), (4, 2), (5, 2),         
(3, 3), (6, 3),                  
(2, 4), (4, 4), (5, 4),          
(8, 5), (9, 5), (10, 5),          
(11, 6), (12, 6), (13, 6);       

INSERT INTO GAME_AN VALUES

(10000001, '2025-09-20', '10:00:00', 5, 8,  9,  3, 1), 
(10000002, '2025-10-04', '09:00:00', 5, 8,  10, 2, 0),  
(10000003, '2025-10-18', '09:00:00', 5, 9,  10, 1, 0),  
(10000004, '2025-09-27', '10:00:00', 6, 11, 12, 3, 2), 
(10000005, '2025-10-04', '11:00:00', 6, 11, 13, 4, 1),  
(10000006, '2025-10-25', '09:00:00', 6, 12, 13, 2, 1);  

SELECT GAME_DATE_AN AS GameDate, COUNT(*) AS NumGames
FROM GAME_AN
GROUP BY GAME_DATE_AN
ORDER BY GAME_DATE_AN;


SELECT C.CLUB_NAME_AN AS ClubName, COUNT(DISTINCT T.TEAM_ID_AN) AS Teams_CurrentSeason
FROM CLUB_AN C
JOIN TEAM_AN T       ON C.CLUB_ID_AN = T.CLUB_ID_AN
JOIN TEAM_SEASON_AN TS ON T.TEAM_ID_AN = TS.TEAM_ID_AN
JOIN DIVISION_AN D   ON TS.DIVISION_ID_AN = D.DIVISION_ID_AN
JOIN SEASON_AN S     ON D.SEASON_ID_AN = S.SEASON_ID_AN
WHERE S.SEASON_TERM_AN = 'FALL' AND S.SEASON_YEAR_AN = 2025
GROUP BY C.CLUB_NAME_AN
ORDER BY C.CLUB_NAME_AN;


SELECT CONCAT(S.SEASON_TERM_AN, ' ', S.SEASON_YEAR_AN) AS Season,
       CONCAT(D.AGE_GROUP_AN, ' ', D.DIVISION_SEX_AN, ' (Rank ', D.DIVISION_RANK_AN, ')') AS Division,
       COUNT(TS.TEAM_ID_AN) AS TeamCount
FROM DIVISION_AN D
JOIN SEASON_AN S ON D.SEASON_ID_AN = S.SEASON_ID_AN
LEFT JOIN TEAM_SEASON_AN TS ON D.DIVISION_ID_AN = TS.DIVISION_ID_AN
GROUP BY D.DIVISION_ID_AN, S.SEASON_START_DATE_AN
ORDER BY S.SEASON_START_DATE_AN;


SELECT P.FIRST_NAME_AN || ' ' || P.LAST_NAME_AN AS CoachName,
       -- Count wins where this coach's team was the winner
       (
         SELECT COUNT(*) 
         FROM GAME_AN G 
         JOIN TEAM_AN T1 ON G.TEAM1_ID_AN = T1.TEAM_ID_AN 
         WHERE T1.COACH_ID_AN = C.PERSON_ID_AN AND G.TEAM1_SCORE_AN > G.TEAM2_SCORE_AN
       )
       +
       (
         SELECT COUNT(*) 
         FROM GAME_AN G 
         JOIN TEAM_AN T2 ON G.TEAM2_ID_AN = T2.TEAM_ID_AN 
         WHERE T2.COACH_ID_AN = C.PERSON_ID_AN AND G.TEAM2_SCORE_AN > G.TEAM1_SCORE_AN
       ) AS Wins
FROM COACH_AN C
JOIN PERSON_AN P ON C.PERSON_ID_AN = P.PERSON_ID_AN
ORDER BY P.LAST_NAME_AN, P.FIRST_NAME_AN;


