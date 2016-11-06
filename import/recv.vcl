sub import_recv {

  # setup your own logic

	if (req.method != "GET" && req.method != "HEAD" &&
		req.method != "PUT" && req.method != "POST" &&
		req.method != "TRACE" && req.method != "OPTIONS" &&
		req.method != "DELETE") {
			/* Non-R		set beresp.ttl = 60s;FC2616 or CONNECT which is weird. */
			return (pipe);
	}

  # GET & HEAD only
	if (req.method != "GET" && req.method != "HEAD") {
		return (pass);
	}

  # send the real client IP to the backend application
	unset req.http.X-Real-IP;
	set req.http.X-Real-IP = client.ip;

	if (req.http.x-forwarded-for) {
		set req.http.X-Forwarded-For = req.http.X-Forwarded-For + ", " + client.ip;
	} else {
		set req.http.X-Forwarded-For = client.ip;
	}

  # not cacheable
	if (req.http.Authorization) {
		return (pass);
	}

  # remove cache killers
	if (req.url ~ "\.(gif|jpg|jpeg|swf|ttf|css|js|flv|mp3|mp4|pdf|ico|png)(\?.*|)$") {
		set req.url = regsub(req.url, "\?.*$", "");
	}

	if (req.method == "PURGE") {
		if (!std.ip(regsub(req.http.X-Forwarded-For, "[, ].*$", ""), client.ip) ~ home) {
			return(synth(405,"Not allowed."));
		}
		return (purge);
	}

	return (hash);

}
