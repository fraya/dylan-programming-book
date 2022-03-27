# Architecture

- [Library and modules](#Library and modules)
- [Deployment](#Deployment)
- [Classes)(#Class diagram)

Classes:

- [`<sixty-unit>`](#Sixty unit)
- [`<time>`](#Time)

## Library and modules

![Library diagram](./library.svg)

## Source files

![Deployment diagram](./deployment.svg)

## Classes

### Class diagram

![Class diagram](./class-diagram.svg)

You can see the class diagram defined in plantuml in the file
"../doc/class-diagram.plantuml".

### Classes exported

| Legend | Description  |
| :--    | :--          |
| a      | abstract     |
| c      | concrete     |
| i      | instantiable |
| o      | open         |
| s      | sealed       |

- [`<sixty-unit>`](#Sixty unit) (ao): unit of measure with 60 base.                           
- [`<time>`](#Time) (ao): represent the pass of time or point in time             
- `<angle>` (ao): angle of the plane                                      
- `<time-of-day>` (co): an event happened at this point of the day              
- `<time-offset>` (co): an event happened some time ago
- `<position>` (ao)
- `<absolute-position>` (co)
- `<relative-position>` (co)
- `<directed-angle>` (co)
- `<latitude>`
- `<longitude>`

### Sixty unit

`<sixty-unit>` is a class that can be converted either hours, minutes
and seconds, or to degrees, minutes and seconds. In the methods for
encoding and decoding total seconds, we use the name `max-unit` to
refer to the unit that is hours for time, and degrees for positions.

### Time

A specific time of day from 00:00 (midnight) to below 24:00
(tomorrow).

## Features

- `total-seconds(<sixty-unit>) => <integer>`
- `encode-total-seconds(<integer>,<integer>,<integer>) => <integer>`
- `decode-total-seconds(<integer>) => (<integer>,<integer>,<integer>)`
- `+(<time-offset>, <time-offset>) => <time-offset>`
- `+(<time-offset>, <time-of-day>) => <time-of-day>`
- `+(<time-of-day>, <time-offset>) => <time-of-day>`
- `+(<time-offset>, <time-of-day>) => <time-of-day>`
- `past?(<time-offset>) => <boolean>`
- `angle(<relative-position>) => <relative-angle>`
- `distance(<relative-position>) => <single-float>`
- `direction(<directed-angle>) => <string>`
- `as(<string>,<sixty-unit>) => <string>`
- `as(<string>,<time>) => <string>`
- `as(<string>,<time-offset>) => <string>`
- `as(<string>,<angle>) => <string>`