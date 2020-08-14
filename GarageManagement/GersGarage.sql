Create table Customer(
Id int identity(1,1),
Name varchar(100), 
Surname varchar(100), 
BirthDate Date,
ContactNumber varchar(10), 
UserId nvarchar(128),
primary key(Id)
)

Create table VehicleType(
Id int identity(1,1),
Name varchar(100),
primary key(Id) )

insert into VehicleType values ('Motorbike'), ('Car'), ('Small Van'),('Small Bus')

Create table Makes(
Id int identity(1,1),
VehicleTypeId int not null,
Name varchar(100),
primary key(Id),
FOREIGN KEY (VehicleTypeId) REFERENCES VehicleType(Id) )

insert into makes values
(1,'Ducati Diavel 1260 S')
,(1,'KTM 790 Adventure R')
,(1,'KTM 500 EXC-F')
,(1,'Kawasaki KX450')
,(1,'Kawasaki Z400')
,(1,'Triumph Street Triple R')
,(1,'KTM 1290 Super Duke GT')
,(1,'Triumph Scrambler 1200 XE')
,(1,'BMW R 1250 GS Adventure')
,(1,'Ducati V4 R')

insert into makes values
(2,'Toyota Corolla'),
(2,'Nissan Qashqai'),
(2,'Hyundai Tucson'),
(2,'Volkswagen Golf'),
(2,'Skoda Octavia'),
(2,'Volkswagen Tiguan'),
(2,'Hyundai Kona'),
(2,'Ford Focus'),
(2,'Toyota Yaris'),
(2,'Toyota C-HR'),
(2,'Ford Fiesta'),
(2,'Nissan Micra'),
(2,'Kia Sportage'),
(2,'Volkswagen Polo'),
(2,'Peugeot 3008'),
(2,'Ford Kuga'),
(2,'Volkswagen Passat'),
(2,'Renault Clio'),
(2,'Skoda Kodiaq'),
(2,'Dacia Duster'),
(2,'Renault Captur'),
(2,'Toyota Rav4'),
(2,'Volkswagen T-Roc'),
(2,'Renault Kadjar'),
(2,'Skoda Superb'),
(2,'Peugeot 5008'),
(2,'Renault Megane'),
(2,'Opel Corsa'),
(2,'Skoda Fabia'),
(2,'Dacia Sandero'),
(2,'Seat Arona'),
(2,'Nissan Leaf'),
(2,'BMW 5 Series'),
(2,'Kia Stonic'),
(2,'Skoda Karoq'),
(2,'Hyundai i30'),
(2,'Hyundai i20'),
(2,'Seat Ateca'),
(2,'Audi A6'),
(2,'Opel Astra'),
(2,'Hyundai i10'),
(2,'Seat Ibiza'),
(2,'Peugeot 2008'),
(2,'Audi A3'),
(2,'BMW 3 Series'),
(2,'Mercedes Benz E Class'),
(2,'Audi A4'),
(2,'Kia Ceed'),
(2,'Opel Grandland X'),
(2,'Mazda CX-5'),
(2,'Ford Mondeo'),
(2,'Honda Civic'),
(2,'Mercedes Benz A Class'),
(2,'Mercedes Benz C Class'),
(2,'Ford Ecosport'),
(2,'Nissan X-Trail'),
(2,'Suzuki Vitara'),
(2,'Opel Insignia'),
(2,'Kia  Picanto'),
(2,'Mini'),
(2,'Seat Leon'),
(2,'Kia Niro'),
(2,'Audi Q3'),
(2,'Opel Mokka X'),
(2,'Mercedes Benz CLA'),
(2,'Opel Crossland X'),
(2,'Peugeot 208'),
(2,'Mazda 3'),
(2,'Hyundai Santa Fe'),
(2,'BMW X5'),
(2,'Mitsubishi Outlander'),
(2,'Audi Q2'),
(2,'Kia Sorento'),
(2,'Volvo XC60'),
(2,'Audi Q5'),
(2,'BMW X3'),
(2,'BMW X1'),
(2,'Mazda 6'),
(2,'Mercedes Benz GLC'),
(2,'Seat Tarraco'),
(2,'Mitsubishi Eclipse Cross'),
(2,'Volvo XC90'),
(2,'Volvo XC40'),
(2,'Landrover Range Rover Sport'),
(2,'Toyota Aygo'),
(2,'BMW 1 Series'),
(2,'Audi A5'),
(2,'Kia Rio'),
(2,'Ford Ka'),
(2,'Renault Zoe'),
(2,'Hyundai i40'),
(2,'Skoda Citigo'),
(2,'Peugeot 508'),
(2,'Mazda 2'),
(2,'Volkswagen Up'),
(2,'Landrover Discovery Sport'),
(2,'Landrover Range Rover Evoque'),
(2,'Volkswagen Arteon'),
(2,'Honda Jazz'),
(2,'Peugeot 308'),
(2,'Audi A1'),
(2,'Honda CR-V'),
(2,'Kia Optima'),
(2,'Renault Grand Scenic'),
(2,'Dacia Logan'),
(2,'Honda HR-V'),
(2,'Seat Alhambra'),
(2,'Hyundai ix20'),
(2,'Suzuki Ignis'),
(2,'Citroen C3'),
(2,'Tesla Model 3'),
(2,'Jaguar E-Pace'),
(2,'Mazda CX-3'),
(2,'Suzuki Swift'),
(2,'Citroen Grand C4 Spacetourer'),
(2,'BMW 4 Series'),
(2,'Volkswagen Touran'),
(2,'Landrover Range Rover Velar'),
(2,'BMW 2 Series'),
(2,'Fiat 500'),
(2,'Mitsubishi ASX'),
(2,'Lexus NX'),
(2,'Jaguar F-Pace'),
(2,'Hyundai Ioniq'),
(2,'BMW i3'),
(2,'Landrover Discovery'),
(2,'Nissan Juke'),
(2,'Volvo V40'),
(2,'Volvo V60'),
(2,'Lexus ES'),
(2,'Nissan Pulsar'),
(2,'Fiat Tipo'),
(2,'Citroen C3 Aircross'),
(2,'Audi Q7'),
(2,'Citroen C4 Cactus'),
(2,'Mercedes Benz B Class'),
(2,'Volvo S90'),
(2,'Mercedes Benz CLS'),
(2,'Toyota Prius'),
(2,'Ford C-Max'),
(2,'Skoda Rapid'),
(2,'Renault Scenic'),
(2,'Ford Galaxy'),
(2,'Jeep Compass'),
(2,'Renault Koleos'),
(2,'Suzuki SX4'),
(2,'Seat Mii'),
(2,'BMW X2'),
(2,'Kia Pro_Ceed'),
(2,'Volkswagen Sharan'),
(2,'Volvo S60'),
(2,'Audi Q8'),
(2,'Suzuki Baleno'),
(2,'Kia Soul'),
(2,'Suzuki Celerio'),
(2,'Audi A7'),
(2,'Fiat 500X'),
(2,'Toyota Auris'),
(2,'Mercedes Benz GLE'),
(2,'Tesla Model S'),
(2,'Mitsubishi Spacestar'),
(2,'Lexus RX'),
(2,'Volvo V90'),
(2,'Mercedes Benz GLA'),
(2,'Opel Karl'),
(2,'Opel Adam'),
(2,'Lexus IS'),
(2,'Landrover Range Rover'),
(2,'Ford Grand C-Max'),
(2,'Audi e-tron'),
(2,'Kia Carens'),
(2,'BMW 8 Series'),
(2,'Jaguar I-Pace'),
(2,'Kia Stinger'),
(2,'Ssangyong Tivoli'),
(2,'Lexus CT'),
(2,'Jaguar XE'),
(2,'Mercedes Benz S Class'),
(2,'Jaguar XF'),
(2,'Peugeot 108'),
(2,'BMW X4'),
(2,'Tesla Model X'),
(2,'BMW 7 Series'),
(2,'Fiat Panda'),
(2,'Subaru XV'),
(2,'Porsche Panamera'),
(2,'Kia Venga'),
(2,'Mazda MX-5'),
(2,'Audi A8'),
(2,'Porsche Macan'),
(2,'Citroen DS3'),
(2,'Subaru Forester'),
(2,'Alfa Romeo Giulia'),
(2,'BMW 6 Series'),
(2,'Citroen C4'),
(2,'Jeep Renegade'),
(2,'Subaru Impreza'),
(2,'Citroen C1'),
(2,'Ford Mustang'),
(2,'Lexus RC'),
(2,'Audi TT'),
(2,'Lexus LS'),
(2,'Porsche Cayenne'),
(2,'Porsche 911'),
(2,'Volkswagen Beetle'),
(2,'Alfa Romeo Giulietta'),
(2,'Alfa Romeo Stelvio'),
(2,'BMW M4'),
(2,'BMW M2'),
(2,'Mitsubishi Lancer'),
(2,'BMW M5'),
(2,'Fiat 500L'),
(2,'Mercedes Benz EQC'),
(2,'Opel Zafira'),
(2,'Seat Toledo'),
(2,'Toyota Avensis'),
(2,'Ford Edge'),
(2,'Nissan Note'),
(2,'Volkswagen Jetta')

insert into makes values
(3,'Vauxhall Combo')
,(3,'Ford Transit Courier')
,(3,'Volkswagen Caddy')
,(3,'Citroen Berlingo')
,(3,'Peugeot Partner')
,(3,'Mercedes Citan')
,(3,'Renault Kangoo Z.E')
,(3,'Fiat Doblo Cargo')
,(3,'Nissan NV200')
,(3,'Fiat Fiorino')

insert into makes values
(4,'Ford Transit')
,(4,'Fiat Ducato')
,(4,'Mercedes-Benz Vario')
,(4,'Mercedes-Benz Vito')
,(4,'Volkswagen Caravelle')
,(4,'Renault Master')
,(4,'Vauxhall Movano')
,(4,'Fiat Scudo')
,(4,'Vauxhall Vivaro')
,(4,'Renault Trafic')




Create table Staff(
Id int identity(1,1),
Name varchar(100), 
Surname varchar(100), 
BirthDate Date,
ContactNumber varchar(10), 
UserId nvarchar(128),
primary key(Id),
FOREIGN KEY (UserId) REFERENCES AspNetUsers(Id) )

insert into AspNetRoles (Id, Name) values (NEWID(), 'Staff'),
(NEWID(),'Admin'),(NEWID(),'Customer')

select * from BookingTypes
select * from AspNetUserRoles

Create table BookingTypes(
Id int identity(1,1),
Name varchar(100),
primary key(Id) )

insert into BookingTypes (Name) values ('Annual Service'),
('Major Service'),(' Repair / Fault'),(' Major Repair')

Create table Status(
Id int identity(1,1),
Name varchar(100),
primary key(Id) )

insert into [Status] (Name) values ('Booked'),
('In Service'),('Fixed / Completed'),('Collected'),('Unrepairable / Scrapped')

Create table EngineType(
Id int identity(1,1),
Name varchar(100),
primary key(Id) )

insert into EngineType (Name) values ('Diesel'),
('Petrol'),('Hybrid'),('Electric')


Create table Bookings(
Id int identity(1,1),
Make varchar(100),
BookingTypeId int not null,
DueDate Date,
StatusId int not null default(1),
CustomerId int not null,
Observation  varchar(1000),
VRC varchar(100),
VLC varchar(100),
EngineTypeId int not null,
VehicleTypeId int not null,
StaffId int null,
Licence varchar(100),
primary key(Id),
FOREIGN KEY (BookingTypeId) REFERENCES BookingTypes(Id),
FOREIGN KEY (CustomerId) REFERENCES Customer(Id),
FOREIGN KEY (StatusId) REFERENCES Status(Id),
FOREIGN KEY (EngineTypeId) REFERENCES EngineType(Id),
FOREIGN KEY (VehicleTypeId) REFERENCES VehicleType(Id),
FOREIGN KEY (StaffId) REFERENCES Staff(Id)
)

insert into AspNetUsers (Id, Email, PasswordHash, SecurityStamp, UserName, LockoutEnabled, EmailConfirmed, PhoneNumberConfirmed, TwoFactorEnabled, AccessFailedCount)
values ( '04530ac5-da5c-48ab-8b5c-ff13ec1038a0', 'admin@admin.com', 'AO7bDCvTNwUTSOVTU3HGJQ8EYvd/x70SBnOxoECrBRsR2fy7kDrNvoFtmsPdU3EjHA==', '4efc7d5a-6655-4a2c-b5f4-2784ecffdc99', 'admin@admin.com', 1, 0, 0, 0, 0)

insert into AspNetUserRoles values ('04530ac5-da5c-48ab-8b5c-ff13ec1038a0', (select Id from AspNetRoles where Name = 'Admin'))

Create table ServicesAndParts(
Id int identity(1,1),
Name varchar(100),
Price decimal(6,2),
primary key(Id) )



insert into ServicesAndParts values
('SHOCK ABSORBER', 0
),('REPLACEMENT OF WHEEL CRUSH', 30
),('EXCHANGE OF DOOR NUT', 33.33
),('HOMOCINETIC EXCHANGE', 45.0
),('CLUTCH EXCHANGE', 145.0
),('REPLACEMENT OF WHEEL BEARING', 0
),('STARTING MOTOR SERVICE', 65.0
),('TURNING VOLANTE', 65.0
),('RADIATOR SERVICE', 55.0
),('ASSEMBLING AND DISASSEMBLING RADIATOR', 85.0
),('CLEANING OF INJECTORS AND TEST', 245.0
),('LOAD OF GAS AND OIL', 135.0
),('ACD HIGH PRESSURE HOSE', 145.0
),('EXCHANGE FOR FALLS', 23.0
),('DUCATO TOOTH BELT EXCHANGE', 245.0
),('LEFT REAR BEARING REPLACEMENT', 95.0
),('REMOVE OIL LEAKAGE', 65.0
),('CLUTCH TUBE REPLACEMENT', 65.0
),('RETROVISOR PAINTING SERVICE', 30.0
),('WORKPLACE', 145.0
),('BUTTERFLY BODY KIT', 24.5
),('NOZZLE CLEANING AND TEST', 165.0
),('PETROL', 18.0
),('NO SERVICE', 0.0
),('BELT BEARING', 98.0
),('MATCHING', 30.0
),('BALANCE', 7.5
),('SPOD SPOD Adapter Harness for ARB Compressor', 18.99
),('VIAIR VIAIR 5-in-1 Inline Inflation/Deflation Coil Hose',	29.99
),('VIAIR VIAIR 5-in-1 Inline Inflation/Deflation Coil Hose', 39.99
),('VIAIR VIAIR Onboard Air Hookup Kit', 79.99
),('VIAIR VIAIR Air Source Relocation Kit', 19.99
),('VIAIR VIAIR Onboard Air Hookup Kit', 79.99
),('VIAIR VIAIR 5-in-1 Inline Inflation/Deflation Coil Hose', 39.99
),('VIAIR VIAIR Onboard Air Hookup Kit', 79.99
),('Smittybilt Smittybilt Compressor Storage Bag', 19.99
),('VIAIR VIAIR Direct Inlet Air Filter Assembly', 3.99
),('VIAIR VIAIR Metal Direct Inlet Air Filter Assembly', 6.99
),('VIAIR VIAIR Dual Stage Air Filter Element', 4.99
),('VIAIR VIAIR Direct Inlet Air Filter Assembly', 11.99
),('VIAIR VIAIR Remote Intake Air Filter Assembly', 5.99
),('VIAIR VIAIR Remote Intake Air Filter Assembly', 6.99
),('VIAIR VIAIR Direct Inlet Air Filter Assembly', 6.99
),('VIAIR VIAIR Dual Stage Air Filter Elements', 4.99
),('VIAIR VIAIR Metal Remote Inlet Air Filter Assembly', 9.99
),('VIAIR VIAIR Remote Intake Air Filter Assembly', 4.99
),('TeraFlex TeraFlex ARB Compressor Under Seat Mounting Kit ',84.99)

alter table bookings add BasicCost decimal(6,2)

Create table booking_cost(
Id int identity(1,1),
BookingId int not null,
ServicesAndPartsId int not null,
Price decimal(6,2),
Qtd int not null,
primary key(Id),
FOREIGN KEY (BookingId) REFERENCES bookings(Id),
FOREIGN KEY (ServicesAndPartsId) REFERENCES ServicesAndParts(Id)
)



