Module: time-tests
Author: Fernando Raya
License: See LICENSE

define constant $latitude
  = make(<latitude>,
	 total-seconds: 36610,
	 direction: "N");

define constant $longitude
  = make(<longitude>,
	 total-seconds: 1000,
	 direction: "E");

define constant $position
  = make(<absolute-position>,
	 latitude: $latitude,
	 longitude: $longitude);

define test test-as-string-position ()
  let expected-latitude = "10 degrees 10 minutes 10 seconds N latitude";
  let expected-longitude = "0 degrees 16 minutes 40 seconds E longitude";
  let expected = concatenate(expected-latitude, "\n", expected-longitude);
  assert-equal(expected, as(<string>, $position))
end test;

define suite position-tests-suite ()
  test test-as-string-position;
end;

