Module: position-tests
Author: Fernando Raya
License: See LICENSE

define test test-as-string-position ()
  let latitude
    = make(<latitude>,
	   total-seconds: 36610,
	   direction: "N");
  
  let longitude
    = make(<longitude>,
	   total-seconds: 1000,
	   direction: "E");
  
  let position
    = make(<absolute-position>,
	   latitude: latitude,
	   longitude: longitude);

  let expected = "10 degrees 10 minutes 10 seconds N latitude";
  
  assert-equal(expected, as(<string>, position))
end test;

define suite position-tests-suite ()
  test test-as-string-position;
end;

run-test-application();
