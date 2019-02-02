![CuseyHub](https://github.com/cusey/ImageForWiki/blob/master/Logos/CuseyHub_Banner_Small.jpg)

# Database Examples

## Built With
* Toad Data Modeler
* Toad for Oracle   
* server-json 

## SQL Scripts Locations  

Run Order | Folders | File | Description   
-- | ----------| ----------| -------------------------------------------    
1 | MySql | createDB.sql | SQL scripts to generate Database.
2 | ToadDataModeler| Generate.sql | SQL script to generate TABLES, PRIMARY KEY, FOREIGN KEY, INDEX, and CONSTRAINT
3 | DataGrip/SQL| ```bank_*.sql``` | SQL scripts to generate TABLES data. Look at README file for order to run there scripts

## Database Documentation 
 Folders | File | Description   
----------| ----------| -------------------------------------------   
ToadDataModeler| JerseyNationalBank.jpeg |Entity Relationship Diagram (ERD)

# Setting JSON Server
Install JSON server
```
~/Desktop/server/ServerJsonExamples $ npm install -g json-server
```

Create a db_bank.json file with some data


Start JSON Server
```
~/Desktop/server/ServerJsonExamples$ json-server --watch db_bank.json
```
## Authors
* John Cusey - CuseyHub  

## License   
This project is licensed under the MIT License
