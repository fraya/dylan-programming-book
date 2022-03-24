# Architecture

## Class diagram

### <time>

```mermaid
classDiagram
"<time>" : total-seconds
"<time>" <|-- "<time-of-day>"
"<time>" <|-- "<time-offset>"
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
