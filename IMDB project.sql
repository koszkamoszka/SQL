CREATE TABLE titleBasic (
	titleBasic_id SERIAL PRIMARY KEY,
	originalTitle TEXT, 
	promotionTitle TEXT,
	region TEXT,
	type TEXT,
	language TEXT,
	startYear DATE,
	endYear DATE,
	runtimeMinutes INTEGER,
	genres TEXT,
	isAdult VARCHAR (1)
);

CREATE TABLE titleCrew (
	titleCrew_id SERIAL PRIMARY KEY,
	director TEXT,
	writers TEXT,
	actors TEXT,
	wholeCrew TEXT,
	CONSTRAINT fk_titleCrew_id FOREIGN KEY (titleCrew_id) REFERENCES titleBasic(titleBasic_id)
);

CREATE TABLE episodesTVShow (
	episodesTVShow_id SERIAL PRIMARY KEY,
	numberOfEpisodes INTEGER,
	seasonNumber INTEGER,
	episodesNumber INTEGER,
	isWatched VARCHAR (1),
	CONSTRAINT fk_episodesTVShow_id FOREIGN KEY (episodesTVShow_id) REFERENCES titleBasic(titleBasic_id)
);

CREATE TABLE ratings (
	ratings_id SERIAL PRIMARY KEY REFERENCES titleBasic,
	averageRating INTEGER,
	numOFVotes INTEGER
);

CREATE TABLE nameBasics (
	nameBasics_id SERIAL PRIMARY KEY,
	primaryName TEXT,
	birthDate DATE,
	deathDate DATE,
	primaryProfession TEXT,
	knownForShows TEXT,
	CONSTRAINT fk_nameBasics_id FOREIGN KEY (nameBasics_id) REFERENCES titleCrew(titleCrew_id)
);

CREATE TABLE userProfile (
	userProfile_id SERIAL PRIMARY KEY,
	username TEXT,
	Reviews TEXT,
	reviewsAmount INTEGER, 
	watchedMovies TEXT
);

ALTER TABLE ratings ADD CONSTRAINT fk_ratings_id FOREIGN KEY (ratings_id) REFERENCES userProfile(userProfile_id);

CREATE TABLE watchedMovies (
	watchedMovies_id SERIAL PRIMARY KEY,
	movies TEXT,
	reviews TEXT,
	wantToWatch TEXT,
	CONSTRAINT fk_watchedMovies_id FOREIGN KEY (watchedMovies_id) REFERENCES userProfile(userProfile_id)
);


INSERT INTO titleBasic 
VALUES (1,'Guardians of the Galaxy', 'Guardians of the Galaxy', 'USA', 'movie', 'english', '2014-01-01', '2014-01-01', 121, 'Comedy', 'N'),
(2, 'Black Mirror', 'Black Mirror', 'USA', 'TV-Show', 'english', '2011-01-01', '2019-01-01', 1, 'Drama', 'Y');
select * from titleBasic;

INSERT INTO titleCrew 
VALUES (1, 'James Gunn', 'James Gunn, Nicole Perlman, Dan Abnett', 'Chris Pratt, Zoe Saldana', 'executive producer: Victoria Alonso'),
(2, 'Owen Harris', 'Charlie Brooker', 'Charles Babalola, Michaela Coel, Hannah John-Kamen', 'executive producer: Annabel Jones');
select * from titleCrew;


DROP TABLE titlebasic CASCADE;
DROP TABLE titleCrew CASCADE;
DROP TABLE episodesTVShow CASCADE;
DROP TABLE ratings CASCADE;
DROP TABLE nameBasics CASCADE;
DROP TABLE userProfile CASCADE;
DROP TABLE watchedMovies CASCADE;
