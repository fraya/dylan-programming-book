# Architecture

## Class diagram

```mermaid
classDiagram
      class time
      time : total_seconds
      time <|-- time_of_day
      time <|-- time_offset
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