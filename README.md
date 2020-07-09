# README

This is README for recruitment tasks before interview stage of recruitment process.
Read it carefully, this file contains description what should be done and what we expect from candidate.

## 1. Dockerize project
Just dockerize it - make it possible to run it with one docker compose command.
From our BE developers we expect that they not only can use docker, but also have knowledge to at least initially setup 
environment in docker
## 2. Implement new method to calculate special price for B2B customers
Imagine your first ticket in YND is to introduce new method to calculate special price for B2B customers. There is 
already working class of Calculator. Extend it in a way that you feel will be correct. There are already implemented
tests for you to check if your solution works properly.
From our BE developers we expect that they have knowledge about OOP paradigm and how to write clean, expandable,
maintainable code.
## 3. Introduce function to book slot from slot plan
Implement E2E function that will allow user to book slot from rendered delivery slot plan according to couple rules:
- There exists e-commerce store where you can buy products with home delivery
- Delivery of products is possible only for particular timeslot in incoming 7 days

 Date       | Hours       | Availability
------------|-------------|--------------
 2020-01-01 | 12:00-14:00 | Available
 2020-01-01 | 14:00-16:00 | Available
 2020-01-01 | 16:00-18:00 | Not available
 2020-01-02 | 10:00-12:00 | Available
 2020-01-02 | 12:00-14:00 | Available
 ...        | ...         | ...

- User can book only "Available" Delivery Slot
- Admin can define Delivery Slot will be available each week with following attributes:

Parameter       | Value
----------------|-----------
Start Hour      | 12:00
End Hour        | 14:00
Date            | 2020-01-01
Max deliveries  | 3

### Introduce tests for rendering and booking slot
### Endpoint for Admin to define slots is not required
### Customer and Admin models are not required
### Keep in mind to prevent overbooking (ensure that users in the same second will not book 3rd and 4th time in the same slot)
