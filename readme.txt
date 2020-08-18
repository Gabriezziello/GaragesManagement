Steps to run the solution 
AFTER
have installed MICROSOFT VISUAL STUDIO 2017, .NETFRAMEWORK 4.6 AND SQL SERVER 2016 (13.0.5102)
 
 - first you need to RUN the sql script located on github on the sql server 2016 instance 
      script - https://github.com/Gabriezziello/GaragesManagement/blob/master/GarageManagement/GersGarage.sql
	  
 - second - you gotta change the connection string on web config pointing it to your sql server instance
		line 12 and 13 from https://github.com/Gabriezziello/GaragesManagement/blob/master/GarageManagement/Web.config

 - open the solution on VISUAL STUDIO and click run