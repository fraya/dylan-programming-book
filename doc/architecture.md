# Architecture

## Class diagram

```mermaid
classDiagram
      time <|-- time_of_day
      time <|-- time_offset
      directed_angle <|-- latitude
      directed_angle <|-- longitude
      position <|-- absolute_position
      position <|-- relative_position
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