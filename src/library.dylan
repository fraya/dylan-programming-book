Module: dylan-user

define library time
  use common-dylan;
  use io;

  export time;  
end library time;

define module time
  use common-dylan;
  use format-out;
  use streams;

  export
      <time-of-day>
    , <time-offset>
    , total-seconds
    , encode-total-seconds
    , decode-total-seconds
    , past?
    ;

  export <position>;
  export
    <absolute-position>
    , latitude
    , longitude
    ;

  export
    <relative-position>
    , angle
    , distance
    ;

  export
    <directed-angle>
    , total-seconds
    , direction
    ;

  export
      <latitude>
    , <longitude>
    ;
  
end module time;
