CREATE TABLE players (
  player_id INTEGER PRIMARY KEY,
  player_name TEXT,
  touchdowns INTEGER
);

INSERT INTO players (player_id, player_name, touchdowns)
VALUES
  (1, 'Tom Brady', 10),
  (2, 'Aaron Rodgers', 5),
  (3, 'Patrick Mahomes', 8),
  (4, 'Payton Manning', 7);
  
 CREATE TABLE teams (
  team_id INTEGER PRIMARY KEY,
  team_name TEXT,
  team_wins INTEGER
);

INSERT INTO teams (team_id, team_name, team_wins)
VALUES
  (1, 'Tampa Bay Buccaneers', 12),
  (2, 'Green Bay Packers', 8),
  (3, 'Kansas City Chiefs', 10);



CREATE TABLE stadiums (
  stadium_id INTEGER PRIMARY KEY,
  stadium_name TEXT,
  capacity INTEGER
);

INSERT INTO stadiums (stadium_id, stadium_name, capacity)
VALUES
  (1, 'Raymond James Stadium', 65000),
  (2, 'Lambeau Field', 81565),
  (3, 'Arrowhead Stadium', 76416);
  
SELECT players.player_name, teams.team_name
    FROM players
    LEFT OUTER JOIN teams
    ON players.player_id = teams.team_id;
    

SELECT players.player_name, teams.team_name, stadiums.stadium_name
    FROM players
    JOIN teams
    ON players.player_id = teams.team_id
    JOIN stadiums
    ON teams.team_id = stadiums.stadium_id;
