# Architecture

## Class diagram

### <time>

```mermaid
classDiagram
  class time
  time : total_seconds
  time <|-- time_of_day
  time <|-- time_offset
```

```mermaid
graph TB;
      TimeOfDay-->Time;
      TimeOffset-->Time;
```

### <directed-angle>

```mermaid
classDiagram
"<directed-angle>" : total-seconds
"<directed-angle>" : direction
"<directed-angle>" <|-- "<latitude>"
"<directed-angle>" <|-- "<longitude>"
``` 

### <position>

```mermaid
classDiagram
"<position>" <|-- "<absolute-position>"
"<position>" <|-- "<relative-position>"
```
