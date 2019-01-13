![CuseyHub](https://github.com/cusey/ImageForWiki/blob/master/Logos/CuseyHub_Banner_Small.jpg)

# ServerJsonExamples

## Built With
* Toad Data Modeler
* Toad for Oracle   
* server-json 
* Hortonworks


## Authors
* John Cusey - CuseyHub  

## License   
This project is licensed under the MIT License

# Setting JSON Server

Install JSON server
```
Cusey@DESKTOP-T4TERMR MINGW64 ~/Desktop/server/ServerJsonExamples
$ npm install -g json-server
C:\Users\john_\AppData\Roaming\npm\json-server -> C:\Users\john_\AppData\Roaming\npm\node_modules\json-server\lib\cli\bin.js+ json-server@0.14.2
updated 1 package in 14.278s
```

Create a db_bank.json file with some data
```
{
    "customer":[
        {
            "id":0,
            "nameFirst":"John",
            "nameLast":"Smith",
            "address":"503 Fire Monument Rd",
            "city":"Hinckley",
            "state":"MN",
            "zip":"55037",
            "phoneNumber":"(320) 384-7939",
            "birthMonth":"09",
            "birthDay":"15",
            "birthYear":"1987"

        },
        {
            "id":1,
            "nameFirst":"Kenny",
            "nameLast":"Johnson",
            "address":"25740 W Newberry Rd",
            "city":"Newberry",
            "state":"FL",
            "zip":"32669",
            "phoneNumber":"(352) 472-1300",
            "birthMonth":"04",
            "birthDay":"21",
            "birthYear":"1971"

        }
    ]
}
```

Start JSON Server
```
Cusey@DESKTOP-T4TERMR MINGW64 ~/Desktop/server/ServerJsonExamples (master)
$ json-server --watch db_bank.json

  \{^_^}/ hi!

  Loading db_bank.json
  Done

  Resources
  http://localhost:3000/customer

  Home
  http://localhost:3000

  Type s + enter at any time to create a snapshot of the database
  Watching...
```

