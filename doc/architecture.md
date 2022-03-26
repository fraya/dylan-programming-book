# Architecture

## Library

![Library diagram](/.library.svg)

## Deployment

![Deployment diagram] (/.deployment.svg)

## Class diagram

![Class diagram](./class-diagram.svg)

| Legend | Description  |
| :--    | :--          |
| a      | abstract     |
| c      | concrete     |
| i      | instantiable |
| o      | open         |
| s      | sealed       |

## Classes exported

- `<sixty-unit>` (ao): unit of measure with 60 base.                           
- `<time>` (ao): represent the pass of time or point in time             
- `<angle>` (ao): angle of the plane                                      
- `<time-of-day>` (co): an event happened at this point of the day              
- `<time-offset>` (co): an event happened some time ago
- `<position>` (ao)
- `<absolute-position>` (co)
- `<relative-position>` (co)
- `<directed-angle>` (co)
- `<latitude>`
- `<longitude>`

## Methods exported

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
