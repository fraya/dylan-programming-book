# Architecture

## Class diagram

```mermaid
classDiagram
      class time
      time : total_seconds
      
      time <|-- time_of_day
      time <|-- time_offset

      class directed_angle
      directed_angle : total_seconds
      directed_angle : direction

      latitude  --|> directed_angle
      longitude --|> directed_angle

      class position
      position <|-- absolute_position

      absolute_position --> latitude : latitude
      absolute_position --> longitude : longitude

      position <|-- relative_position
      relative_position : distance
      relative_position : angle	
```

## Time

### `<time>`

- `decode-total-seconds(<object>) => (hh, mm, ss)`
- `as(<time>) => <string>`

### `<time-offset>`

- `past?(<time-offset>) => <boolean>`
- `+(<time-offset>, <time-offset>) => <time-offset>`
- `+(<time-offset>, <time-of-day>) => <time-of-day>`
- `+(<time-of-day>, <time-offset>) => <time-of-day>`