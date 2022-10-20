USE master
DROP DATABASE IF EXISTS OnlineShop
CREATE DATABASE OnlineShop;
GO
USE [OnlineShop]
GO
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE UserStatus (
	ID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	StatusName nvarchar(1000)
) ON [PRIMARY]
GO
INSERT INTO UserStatus VALUES (N'Active');
INSERT INTO UserStatus VALUES (N'Locked');
INSERT INTO UserStatus VALUES (N'Gmail Login');
INSERT INTO UserStatus VALUES (N'Unverified');
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
Create table [Role](
	RoleID int IDENTITY(1, 1) primary key,
	RoleName nvarchar (20),
	-- Admin, seller, customer, shipper
);
GO
INSERT INTO [Role] VALUES (N'Admin');
INSERT INTO [Role] VALUES (N'Seller');
INSERT INTO [Role] VALUES (N'Customer');
INSERT INTO [Role] VALUES (N'Shipper');
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE [Users] (
	UserID int PRIMARY KEY identity(1,1),
	Username nvarchar(500),
	Password varchar(1000),
	email nvarchar(1000),
	[RoleID] int,
	StatusID int,
	constraint Status_ID_in_Status FOREIGN KEY(StatusID) REFERENCES UserStatus(ID),
	constraint RoleID_in_Role FOREIGN KEY(RoleID) REFERENCES [Role](RoleID)
);
GO
INSERT INTO Users VALUES(N'admin','123456','admin@fpt.edu.vn',1,1);
INSERT INTO Users VALUES(N'bean','bean','DucTVHE141699@fpt.edu.vn',2,1);
INSERT INTO Users VALUES(N'ngp','ngp','PhuNGHE150108@fpt.edu.vn',2,1);
INSERT INTO Users VALUES(N'mai','mai','MaiNTNHE151402@fpt.edu.vn',3,1);
INSERT INTO Users VALUES(N'bnmc','bnmc','ChauBNMHE153019@fpt.edu.vn',3,1);
INSERT INTO Users VALUES(N'dtl','dtl','LamDTHE153097@fpt.edu.vn',3,1);
INSERT INTO Users VALUES(N'mkt','mkt','mkt@fpt.edu.vn',4,1);
INSERT INTO Users VALUES(N'shipper','shipper','shipper@fpt.edu.vn',4,1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('jjellico0', 'Jellico', 'wjellico0@npr.org', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('dimpson1', 'Impson', 'simpson1@wiley.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('cdahlen2', 'Dahlen', 'adahlen2@unblog.fr', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('jstote3', 'Stote', 'ostote3@zimbio.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('jjanku4', 'Janku', 'jjanku4@yahoo.co.jp', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('gseckom5', 'Seckom', 'pseckom5@amazon.co.uk', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('nstainburn6', 'Stainburn', 'astainburn6@edublogs.org', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('snewlands7', 'Newlands', 'dnewlands7@intel.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('mrowesby8', 'Rowesby', 'erowesby8@oracle.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('sbridgwood9', 'Bridgwood', 'sbridgwood9@businessweek.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('afranca', 'Franc', 'mfranca@hibu.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('wingyonb', 'Ingyon', 'wingyonb@oakley.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('jbenallackc', 'Benallack', 'abenallackc@admin.ch', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('ksellickd', 'Sellick', 'lsellickd@unicef.org', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('ggurwoode', 'Gurwood', 'ngurwoode@examiner.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('mallinghamf', 'Allingham', 'tallinghamf@examiner.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('hmedfordg', 'Medford', 'bmedfordg@smh.com.au', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('kelstobh', 'Elstob', 'zelstobh@accuweather.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('rnouchi', 'Nouch', 'pnouchi@msu.edu', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('ecurromj', 'Currom', 'kcurromj@mayoclinic.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('nmcturkk', 'McTurk', 'lmcturkk@webeden.co.uk', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('clathwoodl', 'Lathwood', 'nlathwoodl@theatlantic.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('rsincockm', 'Sincock', 'isincockm@jimdo.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('drobyn', 'Roby', 'mrobyn@toplist.cz', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('awolterso', 'Wolters', 'rwolterso@google.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('criallp', 'Riall', 'kriallp@stanford.edu', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('rscurryq', 'Scurry', 'oscurryq@who.int', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('gbadwickr', 'Badwick', 'jbadwickr@time.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('zclinkards', 'Clinkard', 'gclinkards@vinaora.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('jmaberleyt', 'Maberley', 'rmaberleyt@biblegateway.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('lcahanu', 'Cahan', 'dcahanu@kickstarter.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('hgowersv', 'Gowers', 'cgowersv@google.com.br', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('bdallaw', 'Dalla', 'sdallaw@360.cn', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('caubinx', 'Aubin', 'laubinx@twitter.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('wdesantosy', 'De Santos', 'ldesantosy@cyberchimps.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('abedfordz', 'Bedford', 'ebedfordz@scribd.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('bjerromes10', 'Jerromes', 'sjerromes10@cbsnews.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('mbakey11', 'Bakey', 'hbakey11@huffingtonpost.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('dlocke12', 'Locke', 'elocke12@princeton.edu', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('sgabbitus13', 'Gabbitus', 'mgabbitus13@sfgate.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('tkauffman14', 'Kauffman', 'mkauffman14@thetimes.co.uk', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('kgodard15', 'Godard', 'egodard15@walmart.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('rburdess16', 'Burdess', 'eburdess16@uol.com.br', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('ralejandri17', 'Alejandri', 'lalejandri17@sakura.ne.jp', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('klutwyche18', 'Lutwyche', 'slutwyche18@vk.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('gdelete19', 'Delete', 'ddelete19@businesswire.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('cduns1a', 'Duns', 'aduns1a@wsj.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('bfallanche1b', 'Fallanche', 'rfallanche1b@last.fm', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('mderx1c', 'Derx', 'oderx1c@ning.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('lnewsome1d', 'Newsome', 'fnewsome1d@tiny.cc', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('hrhubottom1e', 'Rhubottom', 'arhubottom1e@sciencedaily.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('dkofax1f', 'Kofax', 'fkofax1f@unc.edu', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('vlandeg1g', 'Landeg', 'nlandeg1g@dailymotion.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('zlammiman1h', 'Lammiman', 'rlammiman1h@xing.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('kiverson1i', 'Iverson', 'siverson1i@amazonaws.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('cnudde1j', 'Nudde', 'hnudde1j@acquirethisname.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('astempe1k', 'Stempe', 'dstempe1k@dedecms.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('craund1l', 'Raund', 'traund1l@yellowbook.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('abottleson1m', 'Bottleson', 'tbottleson1m@about.me', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('tbart1n', 'Bart', 'sbart1n@miibeian.gov.cn', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('dopdenort1o', 'Opdenort', 'lopdenort1o@myspace.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('dredolfi1p', 'Redolfi', 'sredolfi1p@umich.edu', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('doldridge1q', 'Oldridge', 'soldridge1q@newsvine.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('kbarrell1r', 'Barrell', 'abarrell1r@twitpic.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('cscott1s', 'Scott', 'dscott1s@github.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('doman1t', 'Oman', 'moman1t@google.ca', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('mdixon1u', 'Dixon', 'tdixon1u@army.mil', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('iyouthead1v', 'Youthead', 'ayouthead1v@sbwire.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('amidlar1w', 'Midlar', 'tmidlar1w@moonfruit.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('ggrimmolby1x', 'Grimmolby', 'mgrimmolby1x@cocolog-nifty.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('zphilp1y', 'Philp', 'kphilp1y@google.cn', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('mgiannini1z', 'Giannini', 'rgiannini1z@rambler.ru', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('qmersey20', 'Mersey', 'fmersey20@samsung.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('fellwood21', 'Ellwood', 'eellwood21@loc.gov', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('bconstable22', 'Constable', 'fconstable22@studiopress.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('hsaffill23', 'Saffill', 'dsaffill23@huffingtonpost.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('toxbie24', 'Oxbie', 'goxbie24@webmd.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('ykoppeck25', 'Koppeck', 'wkoppeck25@spiegel.de', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('raveray26', 'Averay', 'aaveray26@alibaba.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('lwhitewood27', 'Whitewood', 'fwhitewood27@tinyurl.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('cbilston28', 'Bilston', 'abilston28@webnode.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('ltiner29', 'Tiner', 'ptiner29@studiopress.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('lgregine2a', 'Gregine', 'kgregine2a@bloglovin.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('fparsell2b', 'Parsell', 'mparsell2b@si.edu', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('fwolfe2c', 'Wolfe', 'rwolfe2c@intel.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('lbellis2d', 'Bellis', 'cbellis2d@icq.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('gwittke2e', 'Wittke', 'mwittke2e@marketwatch.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('lisaacson2f', 'Isaacson', 'wisaacson2f@fc2.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('anovotni2g', 'Novotni', 'dnovotni2g@unblog.fr', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('jclough2h', 'Clough', 'cclough2h@bloglines.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('bibotson2i', 'Ibotson', 'aibotson2i@usatoday.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('drichardin2j', 'Richardin', 'lrichardin2j@businessinsider.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('lchew2k', 'Chew', 'tchew2k@hhs.gov', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('wmackeeg2l', 'MacKeeg', 'mmackeeg2l@narod.ru', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('cgarz2m', 'Garz', 'ngarz2m@berkeley.edu', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('dmanagh2n', 'Managh', 'wmanagh2n@tinypic.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('bgiraudoux2o', 'Giraudoux', 'agiraudoux2o@hud.gov', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('astyan2p', 'Styan', 'bstyan2p@va.gov', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('dgillford2q', 'Gillford', 'bgillford2q@noaa.gov', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('nknappen2r', 'Knappen', 'kknappen2r@usa.gov', 3, 1);
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Ship (
	id int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	CityName nvarchar(1000) ,
	ShipPrice int
) ON [PRIMARY]
GO
INSERT INTO Ship VALUES (N'An Giang', 30000);
INSERT INTO Ship VALUES (N'Bà Rịa-Vũng Tàu', 30000);
INSERT INTO Ship VALUES (N'Bạc Liêu', 30000);
INSERT INTO Ship VALUES (N'Bắc Kạn', 30000);
INSERT INTO Ship VALUES (N'Bắc Giang', 30000);
INSERT INTO Ship VALUES (N'Bắc Ninh', 30000);
INSERT INTO Ship VALUES (N'Bến Tre', 30000);
INSERT INTO Ship VALUES (N'Bình Dương', 30000);
INSERT INTO Ship VALUES (N'Bình Định', 30000);
INSERT INTO Ship VALUES (N'Bình Phước', 30000);
INSERT INTO Ship VALUES (N'Bình Thuận', 30000);
INSERT INTO Ship VALUES (N'Cà Mau', 30000);
INSERT INTO Ship VALUES (N'Cao Bằng', 30000);
INSERT INTO Ship VALUES (N'Cần Thơ', 30000);
INSERT INTO Ship VALUES (N'Đà Nẵng', 30000);
INSERT INTO Ship VALUES (N'Đắk Lắk', 30000);
INSERT INTO Ship VALUES (N'Đắk Nông', 30000);
INSERT INTO Ship VALUES (N'Điện Biên', 30000);
INSERT INTO Ship VALUES (N'Đồng Nai', 30000);
INSERT INTO Ship VALUES (N'Đồng Tháp', 30000);
INSERT INTO Ship VALUES (N'Gia Lai', 30000);
INSERT INTO Ship VALUES (N'Hà Giang', 30000);
INSERT INTO Ship VALUES (N'Hà Nam', 30000);
INSERT INTO Ship VALUES (N'Hà Nội', 20000);
INSERT INTO Ship VALUES (N'Hà Tĩnh', 30000);
INSERT INTO Ship VALUES (N'Hải Dương', 30000);
INSERT INTO Ship VALUES (N'Hải Phòng', 30000);
INSERT INTO Ship VALUES (N'Hòa Bình', 30000);
INSERT INTO Ship VALUES (N'Hồ Chí Minh', 30000);
INSERT INTO Ship VALUES (N'Hậu Giang', 30000);
INSERT INTO Ship VALUES (N'Hưng Yên', 30000);
INSERT INTO Ship VALUES (N'Khánh Hòa', 30000);
INSERT INTO Ship VALUES (N'Kiên Giang', 30000);
INSERT INTO Ship VALUES (N'Kon Tum', 30000);
INSERT INTO Ship VALUES (N'Lai Châu', 30000);
INSERT INTO Ship VALUES (N'Lào Cai', 30000);
INSERT INTO Ship VALUES (N'Lạng Sơn', 30000);
INSERT INTO Ship VALUES (N'Lâm Đồng', 30000);
INSERT INTO Ship VALUES (N'Long An', 30000);
INSERT INTO Ship VALUES (N'Nam Định', 30000);
INSERT INTO Ship VALUES (N'Nghệ An', 30000);
INSERT INTO Ship VALUES (N'Ninh Bình', 30000);
INSERT INTO Ship VALUES (N'Ninh Thuận', 30000);
INSERT INTO Ship VALUES (N'Phú Thọ', 30000);
INSERT INTO Ship VALUES (N'Phú Yên', 30000);
INSERT INTO Ship VALUES (N'Quảng Bình', 30000);
INSERT INTO Ship VALUES (N'Quảng Nam', 30000);
INSERT INTO Ship VALUES (N'Quảng Ngãi', 30000);
INSERT INTO Ship VALUES (N'Quảng Ninh', 30000);
INSERT INTO Ship VALUES (N'Quảng Trị', 30000);
INSERT INTO Ship VALUES (N'Sóc Trăng', 30000);
INSERT INTO Ship VALUES (N'Sơn La', 30000);
INSERT INTO Ship VALUES (N'Tây Ninh', 30000);
INSERT INTO Ship VALUES (N'Thái Bình', 30000);
INSERT INTO Ship VALUES (N'Thái Nguyên', 30000);
INSERT INTO Ship VALUES (N'Thanh Hóa', 30000);
INSERT INTO Ship VALUES (N'Thừa Thiên - Huế', 30000);
INSERT INTO Ship VALUES (N'Tiền Giang', 30000);
INSERT INTO Ship VALUES (N'Trà Vinh', 30000);
INSERT INTO Ship VALUES (N'Tuyên Quang', 30000);
INSERT INTO Ship VALUES (N'Vĩnh Long', 30000);
INSERT INTO Ship VALUES (N'Vĩnh Phúc', 30000);
INSERT INTO Ship VALUES (N'Yên Bái', 30000);
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE UserAddress (
	ID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	UserID int,
	ShipName nvarchar(500),
	ShipAddress nvarchar(1000),
	ShipCityID int,
	PhoneNum varchar(20),
	constraint userID_in_user_address FOREIGN KEY(UserID) REFERENCES Users(UserID),
	constraint ship_city_in_ship_address FOREIGN KEY(ShipCityID) REFERENCES Ship(id)
) ON [PRIMARY]
GO

insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (1, 'Tracie', '1609 Redwing Junction', 21);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (2, 'Shellysheldon', '80 Homewood Pass', 45);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (3, 'Joletta', '180 Evergreen Circle', 61);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (4, 'Tammi', '920 Melby Trail', 1);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID],[PhoneNum]) values (5, N'Bạch Ngọc Minh Châu', N'Đại Học FPT', 24,'0123456789');
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (6, 'Eba', '0 Dovetail Park', 38);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (7, 'Farica', '39269 Calypso Place', 20);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (8, 'Vevay', '730 Walton Crossing', 6);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (9, 'Caitrin', '61811 Oak Trail', 54);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (10, 'Hamlin', '48603 Cordelia Pass', 7);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (11, 'Hortense', '443 Eastwood Drive', 30);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (12, 'Ilario', '87 Luster Drive', 9);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (13, 'Rici', '13953 Gateway Trail', 43);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (14, 'Nola', '79435 Pawling Center', 49);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (15, 'Sax', '7501 Doe Crossing Place', 40);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (16, 'Dulcie', '266 High Crossing Way', 4);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (17, 'Beulah', '723 Summit Way', 18);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (18, 'Lexine', '405 Aberg Pass', 37);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (19, 'Manfred', '19 Village Circle', 7);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (20, 'Calhoun', '310 Talmadge Terrace', 8);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (21, 'Karin', '739 Fallview Crossing', 8);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (22, 'Lisha', '878 Anniversary Alley', 46);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (23, 'Minne', '574 Hayes Road', 40);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (24, 'Loise', '63382 Hagan Terrace', 7);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (25, 'Keane', '07 Village Green Plaza', 58);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (26, 'Elden', '196 4th Road', 45);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (27, 'Lorette', '26 Hoepker Crossing', 5);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (28, 'Marylou', '9768 Monterey Terrace', 52);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (29, 'Kaiser', '48783 Gina Terrace', 8);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (30, 'Hermia', '9 Dorton Point', 57);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (31, 'Eddy', '8060 Debra Circle', 8);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (32, 'Abram', '649 Darwin Road', 34);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (33, 'Val', '418 Park Meadow Pass', 2);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (34, 'Shirlee', '7241 Drewry Way', 31);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (35, 'Cherye', '082 Rutledge Point', 6);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (36, 'Danica', '574 South Parkway', 2);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (37, 'Luca', '14365 Northview Alley', 1);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (38, 'Giselbert', '62 Thackeray Trail', 10);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (39, 'Salomon', '3 Walton Alley', 14);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (40, 'Augustina', '3762 Clarendon Point', 15);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (41, 'Jonell', '443 Anderson Way', 6);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (42, 'Otes', '51123 Sunbrook Point', 28);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (43, 'Kienan', '403 Welch Street', 3);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (44, 'Hubey', '6 Barnett Trail', 49);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (45, 'Joan', '12 Talisman Street', 10);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (46, 'Faydra', '2971 Algoma Court', 47);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (47, 'Joyous', '034 Anderson Terrace', 55);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (48, 'Wang', '70 Little Fleur Center', 26);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (49, 'Toddie', '24706 Artisan Junction', 10);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (50, 'Ernie', '60612 Kings Avenue', 36);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (51, 'Steve', '29440 Elgar Plaza', 6);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (52, 'Derk', '9 Summer Ridge Hill', 40);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (53, 'Marvin', '9828 Monterey Way', 44);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (54, 'Bliss', '5594 Jenifer Circle', 8);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (55, 'Amabel', '4658 Killdeer Alley', 53);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (56, 'Launce', '060 Westridge Junction', 45);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (57, 'Juliette', '9003 Magdeline Circle', 45);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (58, 'Shane', '395 Dryden Trail', 38);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (59, 'Archy', '0 Eagle Crest Circle', 9);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (60, 'Olive', '06 Bashford Crossing', 23);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (61, 'Natal', '66388 Del Mar Circle', 34);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (62, 'Kellie', '92 Dayton Point', 11);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (63, 'Gusella', '1 Glendale Center', 52);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (64, 'Keely', '721 Steensland Street', 59);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (65, 'Ware', '27 Lindbergh Circle', 9);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (66, 'Jsandye', '7143 Anhalt Court', 29);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (67, 'Inez', '91 Calypso Crossing', 63);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (68, 'Bernadina', '84 Reinke Plaza', 57);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (69, 'Cristian', '10 Magdeline Pass', 9);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (70, 'Lanie', '8904 Lillian Point', 7);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (71, 'Lynne', '62546 Meadow Valley Junction', 50);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (72, 'Quentin', '77437 Armistice Plaza', 4);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (73, 'Jeanette', '859 Del Mar Crossing', 4);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (74, 'Anthe', '2878 Hansons Junction', 9);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (75, 'Wolfie', '5 Hintze Circle', 7);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (76, 'Elaine', '3 Comanche Avenue', 2);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (77, 'Alejoa', '08 Toban Crossing', 12);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (78, 'Renate', '6 Farmco Court', 10);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (79, 'Rustin', '96 Lillian Park', 14);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (80, 'Demetris', '8 Rusk Street', 44);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (81, 'Monica', '7206 Corben Pass', 26);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (82, 'Thalia', '45 Park Meadow Plaza', 2);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (83, 'Say', '27075 Brown Crossing', 7);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (84, 'Babette', '686 Oakridge Court', 8);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (85, 'Eleonora', '84 Roth Place', 4);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (86, 'Bailie', '295 Lyons Road', 48);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (87, 'Adi', '2 Gale Alley', 47);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (88, 'Tish', '7922 Eliot Plaza', 7);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (89, 'Lester', '22667 Jenifer Crossing', 37);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (90, 'Arthur', '5382 Lien Trail',5);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (91, 'Vince', '767 Esker Street', 24);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (92, 'Clerkclaude', '58 Rigney Court', 8);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (93, 'Alanah', '0 Mockingbird Place', 6);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (94, 'Cybill', '89 Duke Park', 1);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (95, 'Darbee', '3720 Hollow Ridge Crossing', 33);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (96, 'Hercules', '60 Schmedeman Alley', 6);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (97, 'Deloris', '7901 Randy Alley', 1);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (98, 'Clary', '6 Gateway Point', 21);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (99, 'Patrizia', '3 Melrose Center', 13);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (100, 'Maxie', '92158 Utah Park', 7);
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Category (
	CategoryID int PRIMARY KEY identity(1,1),
	CategoryName nvarchar(1000),
) ON [PRIMARY]
GO
INSERT INTO dbo.Category(CategoryName)VALUES(N'Hat')
INSERT INTO dbo.Category(CategoryName)VALUES(N'Shirt')
INSERT INTO dbo.Category(CategoryName)VALUES(N'Legwear')
INSERT INTO dbo.Category(CategoryName)VALUES(N'Footwear')
INSERT INTO dbo.Category(CategoryName)VALUES(N'Accessories');
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[SubCategory](
	[SubCategoryID] [int] PRIMARY KEY  IDENTITY(1,1) ,
	[SubCategoryName] [nvarchar](255),
	[CategoryID] [int] ,
	constraint CategoryID FOREIGN KEY (CategoryID)  REFERENCES Category(CategoryID)
	)
GO
INSERT INTO dbo.SubCategory(SubCategoryName,CategoryID)VALUES(N'Fedora',1)
INSERT INTO dbo.SubCategory(SubCategoryName,CategoryID)VALUES(N'Panama',1)
INSERT INTO dbo.SubCategory(SubCategoryName,CategoryID)VALUES(N'T-Shirt',2)
INSERT INTO dbo.SubCategory(SubCategoryName,CategoryID)VALUES(N'Sweater',2)
INSERT INTO dbo.SubCategory(SubCategoryName,CategoryID)VALUES(N'Jean',3)
INSERT INTO dbo.SubCategory(SubCategoryName,CategoryID)VALUES(N'Skirt',3)
INSERT INTO dbo.SubCategory(SubCategoryName,CategoryID)VALUES(N'Shoe',4)
INSERT INTO dbo.SubCategory(SubCategoryName,CategoryID)VALUES(N'Sock',4)
INSERT INTO dbo.SubCategory(SubCategoryName,CategoryID)VALUES (N'Backpacks',5);
INSERT INTO dbo.SubCategory(SubCategoryName,CategoryID)VALUES (N'Rings and Chains',5);
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE ProductStatus (
	StatusID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	StatusName nvarchar(1000)
) ON [PRIMARY]
GO

INSERT INTO ProductStatus VALUES ( N'Available');
INSERT INTO ProductStatus VALUES ( N'StopBusiness');
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
--https://www.stylight.com/Brands/
CREATE TABLE Brand (
	BrandID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	BrandName nvarchar(1000)
) ON [PRIMARY]
GO

INSERT INTO dbo.Brand(BrandName)VALUES(N'Borsalino')
INSERT INTO dbo.Brand(BrandName)VALUES(N'Bailey')
INSERT INTO dbo.Brand(BrandName)VALUES(N'Mayser')
INSERT INTO dbo.Brand(BrandName)VALUES(N'Tokyo Life')
INSERT INTO dbo.Brand(BrandName)VALUES(N'Zombie')
INSERT INTO dbo.Brand(BrandName)VALUES(N'FREAKERS')
INSERT INTO dbo.Brand(BrandName)VALUES(N'Karihada')
INSERT INTO dbo.Brand(BrandName)VALUES(N'Icon Denim')
INSERT INTO dbo.Brand(BrandName)VALUES(N'Hyperdenim VN')
INSERT INTO dbo.Brand(BrandName)VALUES(N'Davies')
INSERT INTO dbo.Brand(BrandName)VALUES(N'EnvyLook')
INSERT INTO dbo.Brand(BrandName)VALUES(N'Nike')
INSERT INTO dbo.Brand(BrandName)VALUES(N'Vans')
INSERT INTO dbo.Brand(BrandName)VALUES(N'Adidas')
INSERT INTO dbo.Brand(BrandName)VALUES(N'Flaans')
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Product (
	ProductID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	ProductName nvarchar(1000),
	Description nvarchar(2000),
	OriginalPrice int, 
	SellPrice int,	
	SalePercent int CHECK (SalePercent>=0 AND SalePercent<=100),
	SubCategoryID int,
	SellerID int,
	Amount int,
	StatusID int,
	BrandID int,
	height float,
	width float,
	weight float,
	constraint product_in_subCategory FOREIGN KEY(SubCategoryID) REFERENCES SubCategory(SubCategoryID),
	constraint SellerID_in_Users FOREIGN KEY(SellerID) REFERENCES Users(UserID),
	constraint StatusID_in_Status FOREIGN KEY(StatusID) REFERENCES ProductStatus(StatusID),
	constraint BrandID_in_Brand FOREIGN KEY(BrandID) REFERENCES Brand(BrandID)
) ON [PRIMARY]
GO
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Product VALUES (N'Borsalino Bogart Fur Felt Fedora',N'Borsalino celebrates its deep and long-lasting connection to the world of cinema with a special hat dedicated to Humphrey Bogart, the great Hollywood actor who loved the legendary felt hats produced in Alessandria.  The Bogart by Borsalino is created in collaboration with the Humphrey Bogart Estate.  This Limited Edition fedora features a 2 1/2" brim, 4 3/4" crown with centerdent, wide 2" grosgrain hat band, Alessandria brushed felt, decorative windcord, and bow with gold logo.  The interior has a black leather band with the gold-stamped Bogart phrase - Do everything. One thing may turn out right - and grey satin-lined interior with a printed silhouette of Humphrey Bogart and the Borsalino logo.  Made by hand in Italy, in the workshop in Alessandria.',9600000,7400000,23,1,2,100,1,1,0,0,0)
INSERT INTO Product VALUES (N'Borsalino Seta Bicolore Fedora',N'The Borsalnio Seta Bicolore Fedora is a luxurious fur felt fedora with a brushed silk finish. With a 2 3/8" brim and a 4 1/4" crown, this is truly a classic fedora shape. Trimmed with a grosgrain hat band, this hat is a stylish option for any outfit! Fully lined and finished with a grosgrain sweatband for a soft fit. Made in Italy',6700000,5700000,15,1,2,100,1,1,0,0,0)
INSERT INTO Product VALUES (N'Bailey Tate Braided Fedora',N'The Bailey Tate Braided Fedora is a soft, flexible braided fedora with a matching band for a clean summertime look. A short 2 inch turned up brim can be snapped down in front or worn up all around, and the interior is unlined for a breezy feel. Lightweight and flattering, this hat will become part of your everyday look.',1500000,1500000,0,1,2,100,1,2,0,0,0)
INSERT INTO Product VALUES (N'Bailey Archer Braid Fedora',N'The Bailey Archer Braid Fedora is a short brimmed trilby fedora with a teardrop crown and stingy 1 5/8" snap brim for a modern silhouette. There is a two-tone stripe around the top of the crown that matches the hat band for a unique look that is flattering and fashionable. Soft and packable, this is a perfect lightweight hat for any occasion.',1700000 ,1700000 ,0,1,2,100,1,2,0,0,0)
INSERT INTO Product VALUES (N'Bailey Craig Braided Fedora',N'The Breed collection from Bailey of Hollywood represents the spirit of free-thinking sophistication. The Craig Braided Fedora is a great example of that notion with its spectacular Milan braid design and array of color options. Details include a center dent crown, a 2" snap brim, a comfort sweatband, and a grosgrain ribbon hatband.',1700000 ,1700000 ,0,1,2,100,1,2,0,0,0)
INSERT INTO Product VALUES (N'Mayser Calas Panama Straw Hat',N'The Mayser Calas Panama Straw Hat is a perfect summer hat made from natural straw. This straw hat features a 3 3/4" crown, 2 3/4" brim on sides and back and 2 7/8" in front, unique rope hatband with leather tabs, cloth sweatband, and sewn logo pin. Adhesive reinforcement at the crown protects the straw from cracking. Mayser is a premier German hatmaker that we are pleased to offer to our customers. Designed in Germany, hand-woven in Ecuador, finished in Slovakia.',2850000,2850000,0,2,2,100,1,3,0,0,0)
INSERT INTO Product VALUES (N'Mayser Piero Panama Straw Hat',N'The Mayser Piero Panama Straw Hat is a handsome downbrim hat made from genuine panama straw. This panama features a 4" crown with open weave design, 2 1/2" brim on the sides and 2 5/8" front and back, leather hatband, cloth sweatband, and sewn logo pin. Adhesive reinforcement at the crown protects the straw from cracking. Mayser is a premier German hatmaker that we are pleased to offer to our customers. Designed in Germany, hand-woven in Ecuador, finished in Slovakia.',4000000 ,3800000,5,2,2,100,1,3,0,0,0)
INSERT INTO Product VALUES (N'Mayser Nizza Panama Straw Hat',N'The Mayser Nizza Panama Straw Hat is a beautiful wide-brim fedora hat with a brisa fino weave. This panama fedora features a 4" crown, 3 1/8" brim, grosgrain band, cloth sweatband, sewn logo pin at the ribbon, and UV 60 sun protection. Adhesive reinforcement at the crown protects the straw from cracking. Mayser is a premier German hatmaker that we are pleased to offer to our customers. Designed in Germany, hand-woven in Ecuador, finished in Slovakia.',5500000 ,4950000 ,10,2,2,100,1,3,0,0,0)
INSERT INTO Product VALUES (N'Bailey Rockett Endura Telescope Crown Hat',N'The Bailey Rockett Endura Telescope Crown Hat is an exciting new hat for the summer season made from a revolutionary Endura straw- a paper straw woven with a thermosetting yarn that allows the hat to get wet and keep its shape, making it totally rainproof! The classic telescope crown and wide 3 1/8 inch brim are a timeless fashionable look, with the hand rolled edge giving it a unique twist. The braided hat band is a beautifully made finishing touch to this handsome hat. Proudly Made in the USA.',2500000 ,2500000 ,0,2,2,100,1, 2,0,0,0)
INSERT INTO Product VALUES (N'Bailey Hanson Shantung Hat',N'The Bailey Hanson Shantung Hat is a light Shantung fedora with a center dent crown and 2 1/2 inch snap brim. A crisp classic look, this hat is finished with a slim ribbon hat band and a removable feather. A smart choice for summer. Made in the USA.',2950000 ,2950000 ,0,2,2,100,1,2,0,0,0)
INSERT INTO Product VALUES (N'Male T-Shirt I7TSH545I',N'Male T-Shirt I7TSH545I',190000,133000,30,3,2,100,1, 4,0,0,0)
INSERT INTO Product VALUES (N'Male T-Shirt I7TSH535I',N'Male T-Shirt I7TSH535I',250000 ,250000,0,3,2,100,1,4,0,0,0)
INSERT INTO Product VALUES (N'Female T-Shirt I9TSH553I',N'Female T-Shirt I9TSH553I',250000,25000,0,3,2,100,1,4,0,0,0)
INSERT INTO Product VALUES (N'Female T-Shirt I9TSH569I',N'Female T-Shirt I9TSH569I',190000,190000,0,3,2,100,1,4,0,0,0)
INSERT INTO Product VALUES (N'Female T-Shirt I9TSH545I',N'Female T-Shirt I9TSH545I',190000,57000 ,70,3,2,100,1,4,0,0,0)
INSERT INTO Product VALUES (N'BLUE STRIPES SWEATER - WHITE',N'BLUE STRIPES SWEATER - WHITE',350000,350000,0,4,2,100,1,5,0,0,0)
INSERT INTO Product VALUES (N'YELLOW STRIPES SWEATER - BLACK',N'YELLOW STRIPES SWEATER - BLACK',350000,350000,0,4,2,100,1,5,0,0,0)
INSERT INTO Product VALUES (N'CLASSIC LOGO SWEATERS (NAVY)',N'CLASSIC LOGO SWEATERS (NAVY)',450000,450000,0,4,2,100,1,6,0,0,0)
INSERT INTO Product VALUES (N'CLASSIC LOGO SWEATERS (SPORT GREY)',N'CLASSIC LOGO SWEATERS (SPORT GREY)',450000 ,450000 ,0 ,4 ,2 ,100 ,1 ,6 ,0,0,0)
INSERT INTO Product VALUES (N'Oops_I_did_it_again_2002',N'Oops_I_did_it_again_2002',390000,312000,20,4,2,100,1,7,0,0,0)
INSERT INTO Product VALUES (N'Jean Slim-fit Dark Blue W Butterfly Charms',N'Jean Slim-fit Dark Blue W Butterfly Charms',550000,275000,50,5,2,100,1,8,0,0,0)
INSERT INTO Product VALUES (N'Jean Skinny Wash',N'Jean Skinny Wash',500000,400000,20,5,2,100,1,8,0,0,0)
INSERT INTO Product VALUES (N'Jean Slim Dark Blue Wash W ICON DENIM Pocket',N'Jean Slim Dark Blue Wash W ICON DENIM Pocket',550000,385000 ,30,5,2,100,1,8,0,0,0)
INSERT INTO Product VALUES (N'Black Gnu Zipper Jean',N'Black Gnu Zipper Jean',1253000,1253000,0,5,2,100,1,9,0,0, 0)
INSERT INTO Product VALUES (N'Black Gao Zipper Jean',N'Black Gao Zipper Jean',1253000,1253000,0,5,2,100,1,9,0,0,0)
INSERT INTO Product VALUES (N'DSS Skirt D Buckle',N'DSS Skirt D Buckle',285000,285000,0,6,2,100,1,10,0,0,0)
INSERT INTO Product VALUES (N'DSS Skirt Davies Label',N'DSS Skirt Davies Label',285000,285000,0,6,2,100,1,10,0,0,0)
INSERT INTO Product VALUES (N'ENVYLOOK A Long Skirt',N'ENVYLOOK A Long Skirt',750000,350000,53,6,2,100,1,11,0,0,0)
INSERT INTO Product VALUES (N'ENVYLOOK Eilett Skirt',N'ENVYLOOK Eilett Skirt',399000 ,199000,50,6,2,100,1,11, 0, 0,0 )
INSERT INTO Product VALUES (N'ENVYLOOK Linen-Belt Skirt',N'ENVYLOOK Linen-Belt Skirt',570000,299000,47,6,2,100,1,11, 0, 0, 0)
INSERT INTO Product VALUES (N'Nike Air Zoom Winflo 7 CJ0291-005',N'Nike Air Zoom Winflo 7 CJ0291-005',2929000 ,2196750 ,25 ,7 ,2 ,100 ,1 ,12 ,0,0,0)
INSERT INTO Product VALUES (N'Nike Benassi Slip Shoe 882410-010',N'Nike Benassi Slip Shoe 882410-010',1923000 ,961500 ,50 ,7 ,2 ,100 ,1 ,12 ,0 ,0 ,0 )
INSERT INTO Product VALUES (N'Nike Benassi Slp 882410-008',N'Nike Benassi Slp 882410-008',1569000 , 784500,50 ,7 ,2 ,100 ,1 ,12 ,0 ,0 ,0 )
INSERT INTO Product VALUES (N'Vans Slip-On Label Mix',N'Vans Slip-On Label Mix',1450000 ,1450000 ,0 ,7 ,2 ,100 ,1 ,13 ,0 ,0 ,0 )
INSERT INTO Product VALUES (N'Vans Sk8-Hi',N'Vans Sk8-Hi',1850000 ,1850000 ,0,7,2,100,1,13, 0, 0, 0)
INSERT INTO Product VALUES (N'Male Sock Pack 3 I7SOK201H',N'Male Sock Pack 3 I7SOK201H',50000 ,50000 ,0 ,8 ,2 ,100 ,1 ,4 ,0 ,0 ,0 )
INSERT INTO Product VALUES (N'Male Sock I7SOK213E',N'Male Sock I7SOK213E', 15000, 15000, 0, 8, 2,100 ,1 ,4 ,0 ,0 ,0 )
INSERT INTO Product VALUES (N'Male Sock I7SOK217E',N'Male Sock I7SOK217E',15000 ,15000 ,0 ,8 ,2 ,100 ,1 ,4 ,0 ,0 ,0 )
INSERT INTO Product VALUES (N'Female Sock I9SOK015E',N'Female Sock I9SOK015E',15000 ,15000 ,0 ,8 ,2 ,100 ,1 ,4 ,0 ,0 ,0 )
INSERT INTO Product VALUES (N'Female Sock I9SOK222E',N'Female Sock I9SOK222E',15000 ,15000 ,0 ,8 ,2 ,100 ,1 ,4,0 ,0 ,0 )
INSERT INTO Product VALUES (N'Backpack V8BPK302I',N'Backpack V8BPK302I',690000 ,690000 ,0 ,9 ,2 ,100 ,1 ,4 ,0 ,0 ,0 )
INSERT INTO Product VALUES (N'Backpack V8BPK300I',N'Backpack V8BPK300I',590000 ,590000 ,0 ,9 ,2 ,100 ,1 ,4 ,0 ,0 ,0 )
INSERT INTO Product VALUES (N'Waterproof Backpack I7BPK003I',N'Waterproof Backpack I7BPK003I', 399000, 399000, 0, 9, 2, 100, 1, 4,0 ,0 ,0 )
INSERT INTO Product VALUES (N'Unisex Adidas 4Athlts Id Bp FJ3924',N'Unisex Adidas 4Athlts Id Bp FJ3924', 1200000, 780000,35 ,9 ,2 ,100 ,1 ,14,0 ,0 ,0 )
INSERT INTO Product VALUES (N'Unisex Adidas Clas Bp Fabric GL0890',N'Unisex Adidas Clas Bp Fabric GL0890',700000 ,700000 ,0 ,9 ,2 ,100 ,1 ,14 ,0 ,0 ,0 )
INSERT INTO Product VALUES (N'FLAANS 925 SharpStar N',N'FLAANS 925 SharpStar N',356000 ,356000 ,0 ,10 ,2 ,100 ,1 ,15 ,0 ,0 ,0 )
INSERT INTO Product VALUES (N'FLAANS Bauli R',N'FLAANS Bauli R',156000 ,156000 ,0 ,10 ,2 ,100 ,1 ,15 ,0 ,0 ,0 )
INSERT INTO Product VALUES (N'FLAANS Vin Bold R',N'FLAANS Vin Bold R',156000 ,156000 ,0 ,10 ,2 ,100 ,1 ,15 ,0,0,0)
INSERT INTO Product VALUES (N'FLAANS ChainBZ_N',N'FLAANS ChainBZ_N',516000 ,516000 ,0 ,10 ,2 ,100 ,1 ,15 ,0 ,0 ,0 )
INSERT INTO Product VALUES (N'FLAANS 925 NewMoon N',N'FLAANS 925 NewMoon N',356000 ,356000 ,0 ,10 ,2 ,100 ,1 ,15 ,0 ,0 ,0 )
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[ProductImg](
	[ProductID] [int]  ,
	[ProductImgURL] [varchar](255) ,
	constraint ProductImg_ID FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
	)
	go

INSERT INTO dbo.ProductImg VALUES (1,'Borsalino-Bogart.jpg');
INSERT INTO dbo.ProductImg VALUES (2,'390310-Brosalino-Hats-Brown.jpg');
INSERT INTO dbo.ProductImg VALUES (3,'81711BH-Bailey-Latte.jpg');
INSERT INTO dbo.ProductImg VALUES (3,'81711BH-Bailey-LtGrey.jpg');
INSERT INTO dbo.ProductImg VALUES (3,'81711BH-Bailey-White.jpg');
INSERT INTO dbo.ProductImg VALUES (4,'81802-Bailey-Hats-Smoke.jpg');
INSERT INTO dbo.ProductImg VALUES (4,'81802-Bailey-Hats-Coffee.jpg');
INSERT INTO dbo.ProductImg VALUES (5,'81717BHGRAPHITE.jpg');
INSERT INTO dbo.ProductImg VALUES (5,'81717BHWHITE.jpg');
INSERT INTO dbo.ProductImg VALUES (5,'81717BHBLACK.jpg');
INSERT INTO dbo.ProductImg VALUES (6,'1270891-MayserCalas-2.jpg');
INSERT INTO dbo.ProductImg VALUES (7,'1230091-MayserPiero.jpg');
INSERT INTO dbo.ProductImg VALUES (8,'1212551-Nizza.jpg');
INSERT INTO dbo.ProductImg VALUES (8,'HatBox.jpg');
INSERT INTO dbo.ProductImg VALUES (9,'5000BH_TAN.jpg');
INSERT INTO dbo.ProductImg VALUES (10,'63112-Bailey-Hats-Black.jpg');
INSERT INTO dbo.ProductImg VALUES (10,'63112-NATURALPEACOCK.jpg');
INSERT INTO dbo.ProductImg VALUES (10,'63112-Bailey-Hats-Cloud.jpg');
INSERT INTO dbo.ProductImg VALUES (11,'_o_t-shirt_nam_c_tr_n_i7tsh545i_ghi_m-xanh_ng_c_190000.jpg');
INSERT INTO dbo.ProductImg VALUES (11,'_o_t-shirt_nam_c_tr_n_i7tsh545i_t_m_than-ghi_190000.jpg');
INSERT INTO dbo.ProductImg VALUES (12,'_o_t-shirt_nam_c_tr_n_i7tsh535i_xanh_r_u_250000.jpg.jpg');
INSERT INTO dbo.ProductImg VALUES (12,'_o_t-shirt_nam_c_tr_n_i7tsh535i_xanh_c_v_t_250000.jpg');
INSERT INTO dbo.ProductImg VALUES (13,'_o_t_shirt_n_c_tr_n_i9tsh553i_en_b_c_250k.jpg');
INSERT INTO dbo.ProductImg VALUES (14,'_o_t_shirt_n_c_tr_n_i9tsh569i_en_190k.jpg');
INSERT INTO dbo.ProductImg VALUES (15,'_o_t-shirt_n_c_tr_n_tay_xo_n_i9tsh545i_k_cam_190000.jpg');
INSERT INTO dbo.ProductImg VALUES (16,'dosiin-zombie-blue-stripes-sweater-white-109071109071.jpg');
INSERT INTO dbo.ProductImg VALUES (17,'dosiin-zombie-yellow-stripes-sweater-black-109091109091.jpg');
INSERT INTO dbo.ProductImg VALUES (18,'dosiin-freakers-classic-logo-sweatersnavy-223758223758.jpg');
INSERT INTO dbo.ProductImg VALUES (19,'dosiin-freakers-classic-logo-sweaterssport-grey-223763223763.jpg');
INSERT INTO dbo.ProductImg VALUES (20,'dosiin-karihada-oops-i-did-it-again-115992115992.jpg');
INSERT INTO dbo.ProductImg VALUES (20,'dosiin-karihada-oops-i-did-it-again-115995115995.jpg');
INSERT INTO dbo.ProductImg VALUES (21,'dosiin-icon-denim-quan-jean-slim-fit-dark-blue-wbutterfly-charms-143605143605.jpg');
INSERT INTO dbo.ProductImg VALUES (21,'dosiin-icon-denim-quan-jean-slim-fit-dark-blue-wbutterfly-charms-143607143607.jpg');
INSERT INTO dbo.ProductImg VALUES (22,'dosiin-icon-denim-quan-jean-skinny-wash-tron-143621143621.jpg');
INSERT INTO dbo.ProductImg VALUES (22,'dosiin-icon-denim-quan-jean-skinny-wash-tron-143622143622.jpg');
INSERT INTO dbo.ProductImg VALUES (23,'dosiin-icon-denim-quan-jean-slim-dark-blue-wash-w-icon-denim-pocket-143645143645.jpg');
INSERT INTO dbo.ProductImg VALUES (23,'dosiin-icon-denim-quan-jean-slim-dark-blue-wash-w-icon-denim-pocket-143646143646.jpg');
INSERT INTO dbo.ProductImg VALUES (24,'dosiin-hyperdenim-vn-black-gnu-zipper-jean-202558202558.jpg');
INSERT INTO dbo.ProductImg VALUES (24,'dosiin-hyperdenim-vn-black-gnu-zipper-jean-202559202559.jpg');
INSERT INTO dbo.ProductImg VALUES (25,'dosiin-hyperdenim-vn-black-gao-zipper-jean-202799202799.jpg');
INSERT INTO dbo.ProductImg VALUES (25,'dosiin-hyperdenim-vn-black-gao-zipper-jean-202800202800.jpg');
INSERT INTO dbo.ProductImg VALUES (26,'dosiin-davies-dss-skirt-d-buckle-103410103410.jpeg');
INSERT INTO dbo.ProductImg VALUES (26,'dosiin-davies-dss-skirt-d-buckle-103411103411.jpeg');
INSERT INTO dbo.ProductImg VALUES (27,'dosiin-davies-dss-skirt-davies-label-103403103403.jpeg');
INSERT INTO dbo.ProductImg VALUES (27,'dosiin-davies-dss-skirt-davies-label-103405103405.jpeg');
INSERT INTO dbo.ProductImg VALUES (28,'dosiin-envylook-chan-vay-dai-arong-mau-mustard-envylook-a-long-skirt-8968989689.jpg');
INSERT INTO dbo.ProductImg VALUES (28,'dosiin-envylook-chan-vay-dai-arong-mau-navy-envylook-a-long-skirtclone-8967689676.jpg');
INSERT INTO dbo.ProductImg VALUES (29,'dosiin-envylook-chan-vay-cotton-dai-chun-co-dan-mau-black-envylook-eilett-skirt-8957789577.jpg');
INSERT INTO dbo.ProductImg VALUES (29,'dosiin-envylook-chan-vay-cotton-dai-chun-co-dan-mau-black-envylook-eilett-skirt-8957889578.jpg');
INSERT INTO dbo.ProductImg VALUES (30,'dosiin-envylook-quan-vay-vai-lanh-that-lung-mau-beige-envylook-linen-belt-skirtclone-7705877058.jpg');
INSERT INTO dbo.ProductImg VALUES (30,'dosiin-envylook-quan-vay-vai-lanh-that-lung-mau-beige-envylook-linen-belt-skirtclone-7706277062.jpg');
INSERT INTO dbo.ProductImg VALUES (31,'dosiin-nike-giay-chay-nam-nike-nike-air-zoom-winflo-cj-216832216832.jpg');
INSERT INTO dbo.ProductImg VALUES (31,'dosiin-nike-giay-chay-nam-nike-nike-air-zoom-winflo-cj-216833216833.jpg');
INSERT INTO dbo.ProductImg VALUES (32,'dosiin-nike-giay-nam-nike-benassi-slip-shoe-215487215487.jpg');
INSERT INTO dbo.ProductImg VALUES (32,'dosiin-nike-giay-nam-nike-benassi-slip-shoe-215488215488.jpg');
INSERT INTO dbo.ProductImg VALUES (33,'dosiin-nike-giay-nam-nike-benassi-slp-215474215474.jpg');
INSERT INTO dbo.ProductImg VALUES (33,'dosiin-nike-giay-nam-nike-benassi-slp-215475215475.jpg');
INSERT INTO dbo.ProductImg VALUES (34,'dosiin-vans-vans-slip-on-label-mix-209123209123.jpg');
INSERT INTO dbo.ProductImg VALUES (34,'dosiin-vans-vans-slip-on-label-mix-209124209124.jpg');
INSERT INTO dbo.ProductImg VALUES (35,'dosiin-vans-vans-skhi-208636208636.jpg');
INSERT INTO dbo.ProductImg VALUES (35,'dosiin-vans-vans-skhi-208637208637.jpg');
INSERT INTO dbo.ProductImg VALUES (36,'t_t_ch_n_nam_c_ng_n_pack_3_i7sok201h_mixed_freesize_50k_1.jpg');
INSERT INTO dbo.ProductImg VALUES (37,'t_t_ch_n_nam_c_trung_17sok213_-_50k_2.jpg');
INSERT INTO dbo.ProductImg VALUES (38,'t_t_ch_n_nam_c_ng_n_17sok217e-40k_2.jpg');
INSERT INTO dbo.ProductImg VALUES (39,'t_t_ch_n_n_c_trung_-_19sok015e_-_35k_2.jpg');
INSERT INTO dbo.ProductImg VALUES (40,'t_t_ch_n_n_c_ng_n_19sok222e-30k_2.jpg');
INSERT INTO dbo.ProductImg VALUES (41,'img_8595.jpg');
INSERT INTO dbo.ProductImg VALUES (41,'ba_l_ch_ng_g_m_vai_v8bpk302i_45x28x17_-_v_ng_-_690.000_3_.jpg');
INSERT INTO dbo.ProductImg VALUES (42,'img_8597.jpg');
INSERT INTO dbo.ProductImg VALUES (42,'ba_l_ch_ng_g_m_vai_v8bpk300i_36x25x10_en_-_590.000_2_.jpg');
INSERT INTO dbo.ProductImg VALUES (43,'ba_l_ch_ng_s_c_ch_ng_th_m_n_c_i7bpk003i-001_29.14.43_-_en_-_590.000_.jpg');
INSERT INTO dbo.ProductImg VALUES (43,'ba_l_ch_ng_s_c_ch_ng_th_m_n_c_i7bpk003i-001_29.14.43_-_en_-_590.000_2_.jpg');
INSERT INTO dbo.ProductImg VALUES (44,'dosiin-adidas-ba-lo-tap-luyen-unisex-adidasathlts-id-bp-fj-152063152063.jpg');
INSERT INTO dbo.ProductImg VALUES (44,'dosiin-adidas-ba-lo-tap-luyen-unisex-adidasathlts-id-bp-fj-152065152065.jpg');
INSERT INTO dbo.ProductImg VALUES (45,'dosiin-adidas-ba-lo-tap-luyen-unisex-adidas-clas-bp-fabric-gl-220622220622.jpg');
INSERT INTO dbo.ProductImg VALUES (45,'dosiin-adidas-ba-lo-tap-luyen-unisex-adidas-clas-bp-fabric-gl-220624220624.jpg');
INSERT INTO dbo.ProductImg VALUES (46,'dosiin-flaans-day-chuyen-flaans-sharpstar-n-9458094580.jpg');
INSERT INTO dbo.ProductImg VALUES (46,'dosiin-flaans-day-chuyen-flaans-sharpstar-n-9458194581.jpg');
INSERT INTO dbo.ProductImg VALUES (47,'dosiin-flaans-nhan-flaans-bauli-r-124297124297.jpg');
INSERT INTO dbo.ProductImg VALUES (47,'dosiin-flaans-nhan-flaans-bauli-r-124298124298.jpg');
INSERT INTO dbo.ProductImg VALUES (48,'dosiin-flaans-nhan-flaans-vin-bold-r-126742126742.jpg');
INSERT INTO dbo.ProductImg VALUES (48,'dosiin-flaans-nhan-flaans-vin-bold-r-126743126743.jpg');
INSERT INTO dbo.ProductImg VALUES (49,'dosiin-flaans-day-chuyen-flaans-chainbz-n-124335124335.jpg');
INSERT INTO dbo.ProductImg VALUES (49,'dosiin-flaans-day-chuyen-flaans-chainbz-n-124336124336.jpg');
INSERT INTO dbo.ProductImg VALUES (50,'dosiin-flaans-day-chuyen-flaans-newmoon-n-9457494574.jpg');
INSERT INTO dbo.ProductImg VALUES (50,'dosiin-flaans-day-chuyen-flaans-newmoon-n-9457594575.jpg');
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Cart (
	UserID int,
	ProductID int,
	Amount int
	constraint userID_in_cart FOREIGN KEY(UserID) REFERENCES Users(UserID),
	constraint productID_in_cart FOREIGN KEY(ProductID) REFERENCES Product(ProductID),
) ON [PRIMARY]
GO
INSERT INTO Cart VALUES (4, 1, 1);
INSERT INTO Cart VALUES (4, 3, 1);
INSERT INTO Cart VALUES (5, 1, 1);
INSERT INTO Cart VALUES (5, 2, 1);
INSERT INTO Cart VALUES (6, 2, 2);
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[Order_Status](
	[ID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Name] [nvarchar](50) NOT NULL,
 ) ON [PRIMARY]
GO
INSERT [dbo].[Order_Status] ([Name]) VALUES (N'Waiting for Confirmation')
INSERT [dbo].[Order_Status] ([Name]) VALUES (N'Packaging')
INSERT [dbo].[Order_Status] ([Name]) VALUES (N'Delivering')
INSERT [dbo].[Order_Status] ([Name]) VALUES (N'Canceled')
INSERT [dbo].[Order_Status] ([Name]) VALUES (N'Completed')
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[Orders](
	[ID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[UserID] [int] NULL,
	[TotalPrice] [int] NULL,
	[Note] [nvarchar](2000) NULL,
	[Status] [int] NULL,
	[Date] [DATETIME] NULL ,
	constraint userID_in_order_status FOREIGN KEY(UserID) REFERENCES Users(UserID),
	constraint statusID_in_order_status FOREIGN KEY(Status) REFERENCES Order_Status(ID)
) ON [PRIMARY]
GO
INSERT INTO Orders VALUES (4, 270000, null, 3, '2021/06/06 04:17');
INSERT INTO Orders VALUES (5, 90000, null, 3, '2021/06/16 12:36');
INSERT INTO Orders VALUES (5, 1270000, null, 3, '2021/06/12 10:18');
INSERT INTO Orders VALUES (6, 1270000, null, 1, '2021/09/11 01:30');
INSERT INTO Orders VALUES (6, 143000, null, 5, '2021/09/11 01:30');
INSERT INTO Orders VALUES (7, 2580000, null, 1, '2021/05/14 02:30');
INSERT INTO Orders VALUES (8, 4560000, null, 1, '2021/05/18 04:30');
INSERT INTO Orders VALUES (9, 900000, null, 1, '2021/07/23 05:30');
INSERT INTO Orders VALUES (9, 1240000, null, 1, '2021/04/09 09:30');
INSERT INTO Orders VALUES (10, 1230000, null, 1, '2021/10/11 11:30');
INSERT INTO Orders VALUES (11,1470000, null, 1, '2021/09/11 03:30');
INSERT INTO Orders VALUES (12,1470000, null, 1, '2021/11/09 00:00');
INSERT INTO Orders VALUES (15,1470000, null, 1, '2021/10/09 00:00');
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[Order_Detail](
	ID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	[Order_ID] [int] NOT NULL ,
	[ProductID] [int] NOT NULL,
	[ProductName] [nvarchar](1000) NOT NULL,
	[ProductPrice] [int] NOT NULL,	
	[Quantity] [int] NOT NULL,
	constraint orderID_in_order_detail FOREIGN KEY(Order_ID) REFERENCES Orders(ID),
	constraint productID_in_order_detail FOREIGN KEY(ProductID) REFERENCES Product(ProductID)	
) ON [PRIMARY]


GO
INSERT [dbo].[Order_Detail] ( [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES ( 1, 1, N'Borsalino Bogart Fur Felt Fedora', 15, 1)
GO
INSERT [dbo].[Order_Detail] ( [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES ( 1, 2, N'Borsalino Seta Bicolore Fedora', 2, 3)
GO
INSERT [dbo].[Order_Detail] ( [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES ( 2, 3, N'Bailey Tate Braided Fedora', 5, 2)
GO
INSERT [dbo].[Order_Detail] ([Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES ( 3, 4, N'Bailey Archer Braid Fedora', 6, 3)
GO
INSERT [dbo].[Order_Detail] ( [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES ( 4, 5, N'Bailey Craig Braided Fedora', 150, 1)
GO
INSERT [dbo].[Order_Detail] ( [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES ( 5, 6, N'Mayser Calas Panama Straw Hat', 270000, 1)
GO
INSERT [dbo].[Order_Detail] ([Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES ( 6, 7, N'Mayser Piero Panama Straw Hat', 90000, 2)
GO
INSERT [dbo].[Order_Detail] ( [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES (7, 8, N'Mayser Nizza Panama Straw Hat', 1270000, 1)
GO
INSERT [dbo].[Order_Detail] ( [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES ( 8, 9, N'Bailey Rockett Endura Telescope Crown Hat', 163000, 2)
GO
INSERT [dbo].[Order_Detail] ([Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES ( 9, 10, N'Bailey Hanson Shantung Hat', 163000, 1)
GO

-- This month
INSERT [dbo].[Order_Detail] ( [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES ( 12, 11, N'Male T-Shirt I7TSH545I', 15, 5)
GO
INSERT [dbo].[Order_Detail] ( [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES ( 12, 50, N'FLAANS 925 NewMoon N', 2, 1)
GO
INSERT [dbo].[Order_Detail] ( [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES ( 12, 49, N'FLAANS ChainBZ_N', 5, 1)
GO
INSERT [dbo].[Order_Detail] ([Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES ( 12, 25, N'Black Gao Zipper Jean', 6, 3)
GO
INSERT [dbo].[Order_Detail] ( [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES ( 12, 35, N'Vans Sk8-Hi', 150, 1)
GO
INSERT [dbo].[Order_Detail] ( [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES ( 12, 15, N'Female T-Shirt I9TSH545I', 270000, 4)
GO
INSERT [dbo].[Order_Detail] ([Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES ( 12, 40, N'Female Sock I9SOK222E', 90000, 3)
GO
INSERT [dbo].[Order_Detail] ( [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES (12, 8, N'Mayser Nizza Panama Straw Hat', 1270000, 1)
GO
INSERT [dbo].[Order_Detail] ( [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES ( 12, 16, N'BLUE STRIPES SWEATER - WHITE', 163000, 2)
GO
INSERT [dbo].[Order_Detail] ([Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES ( 12, 10, N'Bailey Hanson Shantung Hat', 163000, 1)
GO
-- Last month
INSERT [dbo].[Order_Detail] ( [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES ( 13, 1, N'Borsalino Bogart Fur Felt Fedora', 15, 1)
GO
INSERT [dbo].[Order_Detail] ([Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES ( 13, 10, N'Bailey Hanson Shantung Hat', 163000, 1)
GO
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE ShipInfo (
	ID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	Order_ID int,
	CustomerName nvarchar(1000), --Real name of the Customer
	ShippingAddress nvarchar(1000), 
	ShipCityID int,
	PhoneNum varchar(20),
	Note nvarchar(2000),
	constraint order_id_in_ship_info FOREIGN KEY(Order_ID) REFERENCES Orders(ID),
	constraint ship_city_in_ship_info FOREIGN KEY(ShipCityID) REFERENCES Ship(id)
) ON [PRIMARY]
GO
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Notifications(
	
	ID int PRIMARY KEY identity (1,1),
	UserID int,
	OrderID int,
	Content nvarchar(1000),
	status int,
	time datetime,
	constraint UserID_in_Users FOREIGN KEY(UserID) REFERENCES Users(userId),
	constraint OrderID_in_Orders FOREIGN KEY(OrderID) REFERENCES Orders(ID)

);
GO
INSERT INTO Notifications VALUES (5,1,N'Test Checked',1,GETDATE())
INSERT INTO Notifications VALUES (5,1,N'Test Unchecked',0,GETDATE())
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Feedback (
	ID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	UserID int,
	ProductID int,
	OrderID int,
	Star int, --min 1- max 5
	FeedbackDetail nvarchar(2000),
	constraint userID_in_user_3 FOREIGN KEY(UserID) REFERENCES Users(UserID),
	constraint orderID_in_orders_6 FOREIGN KEY(OrderID) REFERENCES Orders(ID),
	constraint productID_in_feedback FOREIGN KEY(ProductID) REFERENCES Product(ProductID),
	constraint valid_star CHECK (Star < 6 AND Star > 0)
) ON [PRIMARY]
GO
INSERT INTO Feedback VALUES (4, 1, 1, 5, N'Very good');
INSERT INTO Feedback VALUES (5, 2, 2, 4, N'Good');
INSERT INTO Feedback VALUES (5, 1, 3,5, N'Sản phẩm rất tốt');
INSERT INTO Feedback VALUES (6, 1, 4,1, N'Gửi sai sản phẩm');
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Feedback_Replies (
	ID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	FeedbackID int,
	UserID int,
	RepliesText nvarchar(2000),
	constraint userID_in_user_4 FOREIGN KEY(UserID) REFERENCES Users(UserID),
	constraint feedbackID_in_feedback FOREIGN KEY(FeedbackID) REFERENCES Feedback(ID),
) ON [PRIMARY]
GO
INSERT INTO Feedback_Replies VALUES (1, 5, N'Xin Cám Ơn!');
INSERT INTO Feedback_Replies VALUES (2, 4, N'Xin Cám Ơn!');
INSERT INTO Feedback_Replies VALUES (3, 6, N'Xin Cám Ơn!');
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
Create TABLE Blog(
ID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
Author nvarchar(100),
Title nvarchar(2500),
Content nvarchar(2500),
imageLink nvarchar(1000),
)ON [PRIMARY]
GO
INSERT INTO dbo.Blog(Author,Title,Content,imageLink)VALUES(N'maintn',   N'Áo phông xám nữ, item mix đồ thời thượng',N'Áo phông xám là một item được nhiều bạn trẻ yêu thích. Khi xu hướng thời trang thế giới đang hướng đến những thứ đơn giản, tinh tế thì gam màu xám được đánh giá rất hiện đại, trẻ trung và là một trong những gam màu hot trend thời gian gần đây. 

Với áo phông xám, chị em có thể biến tấu linh hoạt trong cách phối đồ, lên đồ ấn tượng mà không lo nhạt nhòa, kém nổi bật. ',N'1.jpg')
INSERT INTO dbo.Blog(Author,Title,Content,imageLink)VALUES(N'ngoc12',   N'Áo thun oversize chuẩn phong cách, ấn tượng',N'Áo phông oversize đang là một hot item dẫn đầu xu hướng thời trang giới trẻ hiện nay. Ngày càng nhiều các bạn trẻ yêu thích, ưa chuộng và đánh giá cao kiểu áo này. 

Một item đầy mới mẻ, phá cách và tính ứng dụng thực tiễn cao như áo phông oversize quả thực sẽ thu hút sự quan tâm của rất nhiều bạn trẻ. ',N'2.jpg')
INSERT INTO dbo.Blog(Author,Title,Content,imageLink)VALUES(N'minh123',  N'Blazzer, xu thế thời trang 2021',N'Với sự thay đổi liên tục, xu hướng thời trang luôn được cập nhật mới mẻ hơn, độc đáo, hiện đại và thu hút hơn. Những phong cách mới, xu thế thời trang hot luôn được mọi người quan tâm, đặc biệt là giới trẻ. Không thể phủ nhận ngành công nghiệp thời trang đang phát triển rất mạnh mẽ. Không chỉ đơn giản là cách ăn mặc, cách mix&match đồ hay diện đồ theo phong cách yêu thích, thời trang còn là sự đổi mới, phá cách và tràn đầy sức sáng tạo ấn tượng. Vậy bạn đã có ý tưởng gì cho mình chưa? Cùng Shope khám phá ngay nhé.',N'3.jpg')
INSERT INTO dbo.Blog(Author,Title,Content,imageLink)VALUES(N'author_1',   N'Mix đồ cho nàng ngày hè',N'Bạn có thể chọn những gam màu sáng như trắng, cam, be,.. để tạo sự trẻ trung, tươi mới hoặc những gam màu trầm tối như đen, nâu, xanh rêu,... vừa đem đến sự tinh tế vừa phong cách, thời trang.',N'4.jpg')
INSERT INTO dbo.Blog(Author,Title,Content,imageLink)VALUES(N'author_2',  N'Áo sơ mi cho nàng cực trẻ trung và cá tính',N'Áo sơ mi vốn là một item must-have trong tủ đồ của phái nữ bởi sự đơn giản, tinh tế; dễ phối đồ và có thể mặc trong hầu hết mọi tình huống như đi học, đi làm,đi chơi, đi phỏng vấn,...Thông dụng - dễ phối - chưa bao giờ lỗi mốt là những từ có thể dùng để miêu tả về áo sơ mi trắng. Là một item quốc dân luôn có sẵn trong tủ đồ của tất cả mọi người, những chiếc áo sơ mi trắng luôn khiến người mặc ngây ngất bởi hiệu quả thời trang mà nó mang lại: sự trẻ trung, lịch thiệp và phong cách. ',N'5.jpg')
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
Create table PostCategory(
ID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
CategoryName nvarchar(1000)
)
ON [PRIMARY]
GO
SET IDENTITY_INSERT  PostCategory ON
INSERT [dbo].[PostCategory]([ID], [CategoryName]) VALUES(1,N'public')
INSERT [dbo].[PostCategory]([ID], [CategoryName]) VALUES(2,N'hide')
SET IDENTITY_INSERT PostCategory OFF
go
Create TABLE Post(
ID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
Description nvarchar(2500),
UserID int,
date nvarchar(2500),
CategoryID int,
PostImgURL varchar(255),
constraint userID_in_user_5 FOREIGN KEY(UserID) REFERENCES Users(UserID),
constraint CategoryID_in_PostCategory FOREIGN KEY(CategoryID) REFERENCES PostCategory(ID)
)ON [PRIMARY]
go
SET IDENTITY_INSERT Post ON
INSERT [dbo].[Post] ([ID], [Description], [UserID], [date], [CategoryID], [PostImgURL]) VALUES (1, N' QUẦN JEAN MỚI VỀ ĐẸP KHÔNG THỂ CƯỠNG LẠI ĐƯỢC!” Bạn sẽ có khả năng sở hữu mẫu quần jean siêu đẹp này chỉ với giá 1xxk/ hàng hóa. Chất liệu co dãn, thấm hút mồ hôi, tôn dáng, giúp người mặc trông thon gọn hơn.Đặc biệt khuyến mãi ưu đãi vào những dịp lễ lớn', 1, N'11/03/2021', 1, N'poster1.jpg')
INSERT [dbo].[Post] ([ID], [Description], [UserID], [date], [CategoryID], [PostImgURL]) VALUES (2, N' QUẦN JEAN MỚI VỀ ĐẸP KHÔNG THỂ CƯỠNG LẠI ĐƯỢC!” Bạn sẽ có khả năng sở hữu mẫu quần jean siêu đẹp này chỉ với giá 1xxk/ hàng hóa. Chất liệu co dãn, thấm hút mồ hôi, tôn dáng, giúp người mặc trông thon gọn hơn.Đặc biệt khuyến mãi ưu đãi vào những dịp lễ lớn', 1, N'11/03/2021', 1, N'poster2.jpg')
INSERT [dbo].[Post] ([ID], [Description], [UserID], [date], [CategoryID], [PostImgURL]) VALUES (3, N' QUẦN JEAN MỚI VỀ ĐẸP KHÔNG THỂ CƯỠNG LẠI ĐƯỢC!” Bạn sẽ có khả năng sở hữu mẫu quần jean siêu đẹp này chỉ với giá 1xxk/ hàng hóa. Chất liệu co dãn, thấm hút mồ hôi, tôn dáng, giúp người mặc trông thon gọn hơn.Đặc biệt khuyến mãi ưu đãi vào những dịp lễ lớn', 1, N'11/03/2021', 2, N'Poster3.jpg')
INSERT [dbo].[Post] ([ID], [Description], [UserID], [date], [CategoryID], [PostImgURL]) VALUES (4, N' QUẦN JEAN MỚI VỀ ĐẸP KHÔNG THỂ CƯỠNG LẠI ĐƯỢC!” Bạn sẽ có khả năng sở hữu mẫu quần jean siêu đẹp này chỉ với giá 1xxk/ hàng hóa. Chất liệu co dãn, thấm hút mồ hôi, tôn dáng, giúp người mặc trông thon gọn hơn.Đặc biệt khuyến mãi ưu đãi vào những dịp lễ lớn', 1, N'11/03/2021', 2, N'poster4.jpg')
INSERT [dbo].[Post] ([ID], [Description], [UserID], [date], [CategoryID], [PostImgURL]) VALUES (5, N' QUẦN JEAN MỚI VỀ ĐẸP KHÔNG THỂ CƯỠNG LẠI ĐƯỢC!” Bạn sẽ có khả năng sở hữu mẫu quần jean siêu đẹp này chỉ với giá 1xxk/ hàng hóa. Chất liệu co dãn, thấm hút mồ hôi, tôn dáng, giúp người mặc trông thon gọn hơn.Đặc biệt khuyến mãi ưu đãi vào những dịp lễ lớn', 1, N'11/03/2021', 1, N'poster5.jpg')
INSERT [dbo].[Post] ([ID], [Description], [UserID], [date], [CategoryID], [PostImgURL]) VALUES (6, N' QUẦN JEAN MỚI VỀ ĐẸP KHÔNG THỂ CƯỠNG LẠI ĐƯỢC!” Bạn sẽ có khả năng sở hữu mẫu quần jean siêu đẹp này chỉ với giá 1xxk/ hàng hóa. Chất liệu co dãn, thấm hút mồ hôi, tôn dáng, giúp người mặc trông thon gọn hơn.Đặc biệt khuyến mãi ưu đãi vào những dịp lễ lớn', 1, N'11/03/2021', 1, N'poster6.jpg')
INSERT [dbo].[Post] ([ID], [Description], [UserID], [date], [CategoryID], [PostImgURL]) VALUES (7, N' QUẦN JEAN MỚI VỀ ĐẸP KHÔNG THỂ CƯỠNG LẠI ĐƯỢC!” Bạn sẽ có khả năng sở hữu mẫu quần jean siêu đẹp này chỉ với giá 1xxk/ hàng hóa. Chất liệu co dãn, thấm hút mồ hôi, tôn dáng, giúp người mặc trông thon gọn hơn.Đặc biệt khuyến mãi ưu đãi vào những dịp lễ lớn', 1, N'11/03/2021', 1, N'poster7.jpg')
INSERT [dbo].[Post] ([ID], [Description], [UserID], [date], [CategoryID], [PostImgURL]) VALUES (8, N' QUẦN JEAN MỚI VỀ ĐẸP KHÔNG THỂ CƯỠNG LẠI ĐƯỢC!” Bạn sẽ có khả năng sở hữu mẫu quần jean siêu đẹp này chỉ với giá 1xxk/ hàng hóa. Chất liệu co dãn, thấm hút mồ hôi, tôn dáng, giúp người mặc trông thon gọn hơn.Đặc biệt khuyến mãi ưu đãi vào những dịp lễ lớn', 1, N'11/03/2021', 1, N'poster8.jpg')
INSERT [dbo].[Post] ([ID], [Description], [UserID], [date], [CategoryID], [PostImgURL]) VALUES (9, N' QUẦN JEAN MỚI VỀ ĐẸP KHÔNG THỂ CƯỠNG LẠI ĐƯỢC!” Bạn sẽ có khả năng sở hữu mẫu quần jean siêu đẹp này chỉ với giá 1xxk/ hàng hóa. Chất liệu co dãn, thấm hút mồ hôi, tôn dáng, giúp người mặc trông thon gọn hơn.Đặc biệt khuyến mãi ưu đãi vào những dịp lễ lớn', 1, N'11/03/2021', 1, N'poster9.jpg')
SET IDENTITY_INSERT Post OFF
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE CBanner
(
	ID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	Img VARCHAR(2500),
	Title NVARCHAR(2500),
	[desc] NVARCHAR(2500)
)
INSERT INTO dbo.CBanner(Img,Title,[desc])VALUES('nike.png',  N'NIKE',  N'Just Do It !'  )
INSERT INTO dbo.CBanner(Img,Title,[desc])VALUES('gucci.png',  N'GUCCI',  N'We go beyond just great !'  )
INSERT INTO dbo.CBanner(Img,Title,[desc])VALUES('chanel.jpg',  N'CHANEL',  N'I don’t do fashion. I am fashion'  )
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Banner
(
	ID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	Img VARCHAR(2500),
)
INSERT INTO dbo.Banner VALUES('banner10.png')
INSERT INTO dbo.Banner VALUES('banner35.png')
INSERT INTO dbo.Banner VALUES('banner40.png')
INSERT INTO dbo.Banner VALUES('banner60.png')
INSERT INTO dbo.Banner VALUES('banner80.png')
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE dbo.[ChatFriend](
	[uId] [int] NOT NULL,
	[friendId] [int] NOT NULL,
	FOREIGN KEY ([uId]) REFERENCES dbo.[Users](UserID),
	FOREIGN KEY (friendId) REFERENCES dbo.[Users](UserID),
)
go
INSERT [dbo].[ChatFriend] ([uId], [friendId]) VALUES (6, 1);
INSERT [dbo].[ChatFriend] ([uId], [friendId]) VALUES (6, 2);
INSERT [dbo].[ChatFriend] ([uId], [friendId]) VALUES (6, 3);
INSERT [dbo].[ChatFriend] ([uId], [friendId]) VALUES (1, 6);
INSERT [dbo].[ChatFriend] ([uId], [friendId]) VALUES (2, 6);
INSERT [dbo].[ChatFriend] ([uId], [friendId]) VALUES (3, 6);
---------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE dbo.[ChatMessage](
	[mId] [int] IDENTITY(1,1) NOT NULL,
	[fromId] [int] NOT NULL,
	[toId] [int] NOT NULL,
	[content] [nvarchar](200) NOT NULL,
	[dateCreated] [datetime] DEFAULT GETDATE() NOT NULL,
	[status] [int] DEFAULT 1 NULL,
	FOREIGN KEY ([fromId]) REFERENCES dbo.[Users](UserID),
	FOREIGN KEY ([toId]) REFERENCES dbo.[Users](UserID),
)
go
INSERT [dbo].[ChatMessage] ([fromId], [toId], [content], [dateCreated], [status]) VALUES (6, 1, N'Hi', CAST(N'2021-10-26 22:38:21.373' AS DateTime), 1);
INSERT [dbo].[ChatMessage] ([fromId], [toId], [content], [dateCreated], [status]) VALUES (6, 1, N'Nice to meet you', CAST(N'2021-10-26 22:38:30.103' AS DateTime), 1);
INSERT [dbo].[ChatMessage] ([fromId], [toId], [content], [dateCreated], [status]) VALUES (1, 6, N'Thanks', CAST(N'2021-10-26 22:38:36.727' AS DateTime), 1);
INSERT [dbo].[ChatMessage] ([fromId], [toId], [content], [dateCreated], [status]) VALUES (1, 6, N'Thanks', CAST(N'2021-10-26 22:38:43.073' AS DateTime), 1);
INSERT [dbo].[ChatMessage] ([fromId], [toId], [content], [dateCreated], [status]) VALUES (6, 2, N'Hello', CAST(N'2021-10-27 10:39:30.800' AS DateTime), 1);
INSERT [dbo].[ChatMessage] ([fromId], [toId], [content], [dateCreated], [status]) VALUES (6, 2, N'How do you do', CAST(N'2021-10-27 10:39:42.200' AS DateTime), 1);
INSERT [dbo].[ChatMessage] ([fromId], [toId], [content], [dateCreated], [status]) VALUES (2, 6, N'How do you do', CAST(N'2021-10-27 10:39:47.860' AS DateTime), 1);
INSERT [dbo].[ChatMessage] ([fromId], [toId], [content], [dateCreated], [status]) VALUES (2, 6, N'See you later', CAST(N'2021-10-27 10:39:56.893' AS DateTime), 1);
INSERT [dbo].[ChatMessage] ([fromId], [toId], [content], [dateCreated], [status]) VALUES (6, 1, N'how are you', CAST(N'2021-10-28 08:51:27.353' AS DateTime), 1);
INSERT [dbo].[ChatMessage] ([fromId], [toId], [content], [dateCreated], [status]) VALUES (6, 1, N'good, thanks', CAST(N'2021-10-29 13:48:07.780' AS DateTime), 1);
INSERT [dbo].[ChatMessage] ([fromId], [toId], [content], [dateCreated], [status]) VALUES (6, 1, N'great', CAST(N'2021-10-29 13:53:25.967' AS DateTime), 1);
INSERT [dbo].[ChatMessage] ([fromId], [toId], [content], [dateCreated], [status]) VALUES (6, 3, N'how are you', CAST(N'2021-10-29 14:00:21.740' AS DateTime), 1);
INSERT [dbo].[ChatMessage] ([fromId], [toId], [content], [dateCreated], [status]) VALUES (6, 3, N'fine, thanks', CAST(N'2021-10-29 14:00:36.213' AS DateTime), 1);
INSERT [dbo].[ChatMessage] ([fromId], [toId], [content], [dateCreated], [status]) VALUES (3, 6, N'Hello', CAST(N'2021-10-29 14:00:56.170' AS DateTime), 1);
INSERT [dbo].[ChatMessage] ([fromId], [toId], [content], [dateCreated], [status]) VALUES (3, 6, N'hi', CAST(N'2021-10-29 14:01:33.273' AS DateTime), 1);
INSERT [dbo].[ChatMessage] ([fromId], [toId], [content], [dateCreated], [status]) VALUES (6, 1, N'Hey', CAST(N'2021-10-29 14:15:11.593' AS DateTime), 1);
---------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE ShipStatus(
ID INT IDENTITY(1,1) NOT NULL,
[Name] NVARCHAR(100),
);
go
CREATE TABLE Delivery(
ID INT IDENTITY(1,1) NOT NULL,
ShipInfoID INT,
UserID INT,
[Status] INT,
FOREIGN KEY (ShipInfoID) REFERENCES dbo.ShipInfo(ID),
FOREIGN KEY (UserID) REFERENCES dbo.Users(UserID),
);
go