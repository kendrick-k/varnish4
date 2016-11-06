sub import_backend_response {

  # add your own logic
  # but try to setup all the cache directives from the application, not into the VCL

	# remove Set-Cookie if content can be cached

	if (beresp.ttl > 0s && beresp.http.Set-Cookie) {
		unset beresp.http.Set-Cookie;
	}

	# error : deliver last content in cache

	if (beresp.status >= 500) {
		return (abandon);
	}

	if (bereq.url ~ "\.(gif|jpg|jpeg|swf|ttf|css|js|flv|mp3|mp4|pdf|ico|png)(\?.*|)$") {
		set beresp.ttl = 1d;
	}

	if (beresp.ttl <= 0s ||
		beresp.http.Set-Cookie ||
		beresp.http.Vary == "*") {

		# Mark as Hit-For-Pass for the next 2 minutes

		if (!beresp.http.age || beresp.http.age == "0") {

			set beresp.ttl = 120s;
			set beresp.uncacheable = true;

		}
	}

	return (deliver);

}
