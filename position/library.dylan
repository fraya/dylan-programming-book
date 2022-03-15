Module: dylan-user

define library position
  use common-dylan;
  use io;

  use time;
  
  export position;  
end library position;

define module position
  use common-dylan;
  use format-out;
  use streams;

  use time,
    import: { decode-total-seconds };
  
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
  
end module position;
