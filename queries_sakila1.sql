select * from city;
select * from customer;
select * from film;
select * from category;
select * from film_category;
select * from actor;
select * from film_actor;
select * from store;
select * from address;

/*Consulta 1: ¿Qué consulta ejecutarías para obtener todos los clientes dentro de city_id = 312?*/
select
	ci.city,
    cus.first_name as 'Nombre de Cliente',
    cus.last_name as 'Apellido del Cliente',
    cus.email as 'Correo electrónico',
    concat(ad.address, ',', ad.district) as 'address'
from city ci inner join address ad
on ci.city_id = ad.city_id inner join customer cus
on ad.address_id = cus.address_id
where ci.city_id = 312; 

/*Consulta 2: ¿Qué consulta harías para obtener todas las películas de comedia?*/
select
	film.title as 'Título de Película',
    film.description as 'Descripción',
    film.release_year as 'Año de Estreno',
    film.rating as 'Calificación',
    film.special_features as 'Caracterísitcas Especiales',
    category.name as 'Categoría'
from film inner join film_category
on film.film_id = film_category.film_id inner join category
on film_category.category_id = category.category_id
where category.name = 'Comedy'
order by film.rating desc;

/*Consulta 3: ¿Qué consulta harías para obtener todas las películas unidas por actor_id = 5? */
select
	actor.actor_id as 'Identificación',
    concat(actor.first_name, ' ', actor.last_name) as 'Nombre del actor',
    film.title as 'Título de Película',
    film.description as 'Descripción',
    film.release_year as 'Año de Estreno'
from actor inner join film_actor
on actor.actor_id = film_actor.actor_id inner join film
on film_actor.film_id = film.film_id
where actor.actor_id = 5;

/*Consulta 4: ¿Qué consulta ejecutaría para obtener todos los clientes en store_id = 1 y dentro de estas ciudades (1, 42, 312 y 459)?*/
select
	store.store_id as'store_id',
	city.city_id as 'city_id',    
	customer.first_name as 'Nombre cliente',
    customer.last_name as 'Apellido cliente',
    customer.email as 'Correo Electrónico',
    concat(address.address, ',', address.district) as 'Dirección'
from city inner join address
on city.city_id = address.city_id inner join customer 
on address.address_id = customer.address_id inner join store
where (store.store_id = 1) and ((city.city_id = 1) or (city.city_id = 42) or (city.city_id = 312) or (city.city_id = 459));

/*Consulta 5:  ¿Qué consulta realizarías para obtener todas las películas con una "calificación = G" y "característica especial = detrás de escena", unidas por actor_id = 15?*/
select
	actor.actor_id as 'Identificación',
	film.title as 'Título de Película',
    film.description as 'Descripción',
    film.release_year as 'Año de Estreno',
    film.rating as 'Calificación',
    film.special_features as 'Características especial'
from actor inner join film_actor
on actor.actor_id = film_actor.actor_id inner join film
on film_actor.film_id = film.film_id
where (actor.actor_id = 15) and (film.rating = 'G') and (film.special_features like '%behind%');

/*Consulta 6: ¿Qué consulta harías para obtener todos los actores que se unieron en el film_id = 369?*/
select
	film.film_id as 'Film_id',
	film.title as 'Título de Película',
	actor.actor_id as 'Identificación',
    concat(actor.first_name, ' ', actor.last_name) as 'Nombre del actor'
from actor inner join film_actor
on actor.actor_id = film_actor.actor_id inner join film
on film_actor.film_id = film.film_id
where (film_actor.film_id = 369);

/*Consulta 7: ¿Qué consulta harías para obtener todas las películas dramáticas con una tarifa de alquiler de 2.99? */
select
	film.film_id as 'Film_id',
	film.title as 'Título de Película',
    film.description as 'Descripción',
    film.release_year as 'Año de Estreno',
    film.rating as 'Calificación',
    film.special_features as 'Características especial',
    film.rental_rate as 'Tarifa',
    category.name as 'Categoría'
from film inner join film_category
on film.film_id = film_category.film_id inner join category
on film_category.category_id = category.category_id
where (category.name = 'Drama') and (rental_rate = 2.99);

/*Consulta 8: ¿Qué consulta harías para obtener todas las películas de acción a las que se une SANDRA KILMER?*/
select
	film.film_id as 'Film_id',
	film.title as 'Título de Película',
    film.description as 'Descripción',
    film.release_year as 'Año de Estreno',
    film.rating as 'Calificación',
    film.special_features as 'Características especial',
    category.name as 'Categoría',
    concat(actor.first_name, ' ', actor.last_name) as 'Nombre del actor'
from actor inner join film_actor
on actor.actor_id = film_actor.actor_id inner join film
on film_actor.film_id = film.film_id inner join film_category
on film.film_id = film_category.film_id inner join category
on film_category.category_id = category.category_id
where (category.name = 'Action') and (actor.first_name = 'Sandra') and (actor.last_name = 'Kilmer');
