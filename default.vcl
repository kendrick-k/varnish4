	
	vcl 4.0;
	
	import std;

	# Servers authorized to purge

	include "import/acl.vcl";



	# Backend definitions

	include "import/backend.vcl";



	# imports

	include "import/init.vcl";
	include "import/hash.vcl";
	include "import/recv.vcl";
	include "import/deliver.vcl";
	include "import/backend_fetch.vcl";
	include "import/backend_response.vcl";



	sub vcl_init {

		call    import_init;

	}



	sub vcl_recv {

        call    import_recv;

	}



	sub vcl_hash {

		call    import_hash;

	}



	sub vcl_hit {
	}



	sub vcl_miss {
	}



	sub vcl_backend_fetch {

		call    import_backend_fetch;

	}



	sub vcl_backend_response {

	    call    import_backend_response;

	}



	sub vcl_deliver {

		call    import_deliver;

	}
