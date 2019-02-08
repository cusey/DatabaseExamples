
# Starting server-json with npm
When you type the following command npm going to the package.json file. The this json file npm going in the scripts look see what commands to rn.
```
$ npm run json:server
```
# Setting up the name for table primary key
In the person table my primary key in person_id so I telling server-json this in the routes.json file
```
"/person/:person_id": "/person?person_id=:person_id"
```
