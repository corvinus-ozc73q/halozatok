CREATE TABLE [Stadium] (
	StadiumSK integer NOT NULL,
	Name varchar(50) NOT NULL,
	City varchar(50) NOT NULL,
	Capacity float NOT NULL,
	Built datetime NOT NULL,
  CONSTRAINT [PK_STAIDUM] PRIMARY KEY CLUSTERED
  (
  [StadiumSK] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)

GO
CREATE TABLE [Match] (
	MatchID integer NOT NULL,
	Home_TeamFK integer NOT NULL,
	Away_TeamFK integer NOT NULL,
	HT_Scored binary,
	AT_Scored binary,
	Attendance float,
  CONSTRAINT [PK_MATCH] PRIMARY KEY CLUSTERED
  (
  [MatchID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Player] (
	PlayerSK integer NOT NULL,
	Name varchar(30) NOT NULL,
	TeamFK integer NOT NULL,
	Position varchar(12) NOT NULL,
	Age binary NOT NULL,
	Height binary NOT NULL,
	Weight binary NOT NULL,
	PrefFoot varchar(5) NOT NULL,
	Scored binary,
	Assist binary
)
GO
CREATE TABLE [Coach] (
	CoachID integer NOT NULL,
	Name varchar(30) NOT NULL,
	Age binary NOT NULL,
	Trophies binary,
  CONSTRAINT [PK_COACH] PRIMARY KEY CLUSTERED
  (
  [CoachID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Team] (
	TeamSK integer NOT NULL,
	Name varchar(50) NOT NULL,
	CoachFK integer NOT NULL,
	Position binary NOT NULL,
	StadiumFK binary NOT NULL,
	Won_League_Ever boolean NOT NULL,
  CONSTRAINT [PK_TEAM] PRIMARY KEY CLUSTERED
  (
  [TeamSK] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO

ALTER TABLE [Team] WITH CHECK ADD CONSTRAINT [Team_fk0] FOREIGN KEY ([CoachFK]) REFERENCES [Coach]([CoachID])
ON UPDATE CASCADE
GO
ALTER TABLE [Team] CHECK CONSTRAINT [Team_fk0]
GO
ALTER TABLE [Team] WITH CHECK ADD CONSTRAINT [Team_fk1] FOREIGN KEY ([StadiumFK]) REFERENCES [Staidum]([StadiumSK])
ON UPDATE CASCADE
GO
ALTER TABLE [Team] CHECK CONSTRAINT [Team_fk1]
GO

ALTER TABLE [Match] WITH CHECK ADD CONSTRAINT [Match_fk0] FOREIGN KEY ([Home_TeamFK]) REFERENCES [Team]([TeamSK])
ON UPDATE CASCADE
GO
ALTER TABLE [Match] CHECK CONSTRAINT [Match_fk0]
GO
ALTER TABLE [Match] WITH CHECK ADD CONSTRAINT [Match_fk1] FOREIGN KEY ([Away_TeamFK]) REFERENCES [Team]([TeamSK])
ON UPDATE CASCADE
GO
ALTER TABLE [Match] CHECK CONSTRAINT [Match_fk1]
GO

ALTER TABLE [Player] WITH CHECK ADD CONSTRAINT [Player_fk0] FOREIGN KEY ([TeamFK]) REFERENCES [Team]([TeamSK])
ON UPDATE CASCADE
GO
ALTER TABLE [Player] CHECK CONSTRAINT [Player_fk0]
GO

