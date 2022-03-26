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
    <sixty-unit>,
    total-seconds;
    
  export
    encode-total-seconds,
    decode-total-seconds;

  export
    <time>,
    <time-of-day>,
    <time-offset>,
    past?;

  export
    <angle>,
    <directed-angle>,
    direction,
    <relative-angle>,
    <latitude>,
    <longitude>;
   
   
  export
    <position>,
    <absolute-position>,
    latitude,
    longitude,
    <relative-position>,
    angle,
    distance;
  
end module time;
