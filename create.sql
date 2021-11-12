
CREATE TABLE Developer
(
    developer_name char(50) UNIQUE NOT NULL
);
CREATE TABLE Game
(
    appid          int UNIQUE NOT NULL,
    name           char(50)   NOT NULL,
    release_year   int        NOT NULL,
    price          int        NOT NULL,

    developer_name char(50)   NOT NULL
);
CREATE TABLE Steam_Sale
(
    sale_id int UNIQUE NOT NULL,
    appid    int        NOT NULL,
    discount    int        NOT NULL

);
CREATE TABLE Game_Addon
(
    addon_id int UNIQUE NOT NULL,
    price    int        NOT NULL,
    appid    int        NOT NULL

);
ALTER TABLE Developer
    ADD CONSTRAINT PK_Developer PRIMARY
        KEY (developer_name);
ALTER TABLE Game
    ADD CONSTRAINT PK_Game PRIMARY
        KEY (appid);
ALTER TABLE Steam_Sale
    ADD CONSTRAINT PK_Steam_Sale PRIMARY
        KEY (sale_id);
ALTER TABLE Game_Addon
    ADD CONSTRAINT PK_Game_Addon PRIMARY KEY
        (addon_id);


ALTER TABLE Game
    ADD CONSTRAINT FK_Developer_Game FOREIGN KEY
        (developer_name) REFERENCES Developer (developer_name);
ALTER TABLE Steam_Sale
    ADD CONSTRAINT FK_Game_Steam_Sale FOREIGN KEY
        (appid) REFERENCES Game (appid);
ALTER TABLE Game_Addon
    ADD CONSTRAINT FK_Game_Game_Addon FOREIGN KEY
        (appid) REFERENCES Game (appid);