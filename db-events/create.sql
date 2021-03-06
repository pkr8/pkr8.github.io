CREATE TABLE DukeGroup
(name VARCHAR(256) NOT NULL PRIMARY KEY,
websiteURL VARCHAR(1024));
--Assumed to be linked to Shibboleth, so no current need for name info.  Can get emails from concatenating netid to$
CREATE TABLE DukeUser
(netid VARCHAR(10) NOT NULL PRIMARY KEY,
dateJoined TIMESTAMP NOT NULL,
dateLastUpdated TIMESTAMP,
password VARCHAR(256) NOT NULL);
--Assume eventid is a simple index, set by webpage code
CREATE TABLE DukeEvent
(eventid INTEGER NOT NULL PRIMARY KEY,
eventname VARCHAR(256) NOT NULL,
starttime TIMESTAMP NOT NULL,
location VARCHAR(256),
hostURL VARCHAR(1024),
timecreated TIMESTAMP NOT NULL);
CREATE TABLE Hosting
(eventid INTEGER NOT NULL REFERENCES DukeEvent(eventid),
groupname VARCHAR(256) NOT NULL REFERENCES DukeGroup(name),
PRIMARY KEY (eventid, groupname));
CREATE TABLE Attending
(netid VARCHAR(10) NOT NULL REFERENCES DukeUser(netid),
eventid INTEGER NOT NULL REFERENCES DukeEvent(eventid),
PRIMARY KEY (netid, eventid));
CREATE TABLE Favorite
(netid VARCHAR(10) NOT NULL REFERENCES DukeUser(netid),
groupname VARCHAR(256) NOT NULL REFERENCES DukeGroup(name),
PRIMARY KEY(netid, groupname));
