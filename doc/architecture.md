# Architecture

## Class diagram

### <time>

classDiagram
"<time>" : total-seconds
"<time>" <|-- "<time-of-day>"
"<time>" <|-- "<time-offset>"

### <directed-angle>

classDiagram
"<directed-angle>" : total-seconds
"<directed-angle>" : direction
"<directed-angle>" <|-- "<latitude>"
"<directed-angle>" <|-- "<longitude>"

### <position>

classDiagram
"<position>" <|-- "<absolute-position>"
"<position>" <|-- "<relative-position>"

