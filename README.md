# Local Boards API

API Docs
------
### Description

Track issues on [Waffle](https://waffle.io/noahkoch/api-localboards-org)
<br/>
A REST API for state, county, and city boards. Created at #HackOmaha 2013

[Looking for the UI?](https://github.com/trakaus/localboards-ui)

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

### POST boards

Post a board in a specific state
<tt>/states/:state_abbreviation/boards/:board_id</tt> 

Post a board in a specific county
<tt>/states/:state_abbreviation/county/:code_id/boards/:board_id</tt> 

Post a board in a specific city
<tt>/states/:state_abbreviation/city/:city_id/boards/:board_id</tt> 

Example Board Date
data: {
  board: {
    title: "Our awesome board",
    yada,
    yada,
    yada
  }
}

### GET members

Get all members in a specific state
<tt>/states/:state_abbreviation/boards/:id/members</tt> 

Get all members in a specific county
<tt>/states/:state_abbreviation/county/:code_id/boards/:id/members</tt> 

Get all members in a specific city
<tt>/states/:state_abbreviation/city/:city_id/boards/:id/members</tt> 

###### Params

active = [true,false,all]
<br/>
defaults to true

### GET seats

Get all seats in a specific state
<tt>/states/:state_abbreviation/boards/:id/seats</tt> 

Get all seats in a specific county
<tt>/states/:state_abbreviation/county/:code_id/boards/:id/seats</tt> 

Get all seats specific city
<tt>/states/:state_abbreviation/city/:city_id/boards/:id/seats</tt> 

### GET a specific board

in a specific state
<tt>/states/:state_abbreviation/boards/:id</tt> 

in a specific county
<tt>/states/:state_abbreviation/county/:code_id/boards/:id</tt> 

in a specific city
<tt>/states/:state_abbreviation/city/:city_id/boards/:id</tt> 

