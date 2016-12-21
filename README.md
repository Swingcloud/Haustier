Pets Project
=

this is the simple app to match pets and customers
at first you need to 

```
bundle install
cp /config/google_map.yml.example /config/google_map.yml
cp /config/database.yml.example /config/database.yml
cp /config/initializers/geocoder.rb.example /config/initializers/geocoder.rb
```
and change the parameters in it such as google api key and database setting.



#Simple API Display



###POST /api/v1/pets

you can post new pet!

parameters:
- name: pet's name
- age: about pet's age
- type: species of the pet
- breed: if speicies is the dog, then you need to add this parameter
- address: where the pet is located

### GET /api/v1/pets/{id}

find the pet you've just created

### GET /api/v1/pets/{id}/matches

Get an array of "matching" customers for the given pet

###POST /api/v1/customers

Add a new customer to the system

parameters:
- name: customer's name
- age: the pet's age they want to adopt
- species: the pet's species they want to adopt
- breed: if species is the dog, customer can pass this parameter

Together with their preferences for pets

###GET /api/v1/customers/{id}

Fetch the customer by ID

###GET /api/v1/customers/{id}/matches

Get an array of "matching" Pets for the given customer

###POST /api/v1/customers/{id}/adopt?pet_id={pet_id}

The Customer adopts the given Pet

The Pet and Customer should no longer appear in /matches queries

parameters:
- pet_id: the pet's id 


##Websocket

in /customers/{id}/matches, when you post the new pet, system will search the right condition to display.


##Geolocation

You can find your browser's location and pet's location on the google map in /pets

