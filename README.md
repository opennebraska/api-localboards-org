# Local Boards API

API Docs
------
### Description


### Base path
<tt>http://api.localboards.org</tt>


### GET jurisdictions

Get all states
<tt>/states</tt> 

Get all cities in a state
<tt>/states/:state_abbreviation</tt> 

Get all counties in a state
<tt>/states/:state_abbreviation/counties</tt> 


### GET boards

Get all boards in a specific state
<tt>/states/:state_abbreviation/boards</tt> 

Get all boards in a specific county
<tt>/states/:state_abbreviation/county/:code_id/boards</tt> 

Get all boards in a specific city
<tt>/states/:state_abbreviation/city/:city_id/boards</tt> 


### GET members

Get all members in a specific state
<tt>/states/:state_abbreviation/boards/:id/members</tt> 

Get all members in a specific county
<tt>/states/:state_abbreviation/county/:code_id/boards/:id/members</tt> 

Get all members in a specific city
<tt>/states/:state_abbreviation/city/:city_id/boards/:id/members</tt> 

###### Params

active = [true,false,all]
defaults to true


