sub import_deliver {

	set resp.http.Age = resp.http.Age;

	unset resp.http.Via;
	unset resp.http.Server;

	return (deliver);

}
