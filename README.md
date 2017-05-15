# WaDE

The WaDE Chef cookbook sets up an Apache PHP server and deploys the WaDE website
onto it.

The cookbook uses an RPM for the WaDE website. The RPM is available from the CIDA
Artifactory repository located at (TODO).

Attributes:
- `default['wade']['web']['contact']` (String): The contact email address that Apache
uses. Default: you@your.org
- `default['wade']['web']['postgres_user']` (String): The username with which the
WaDE Apache server will use to connect to the backing Postgres database. Default: postgres
- `default['wade']['web']['postgres_addr']` (String): The IP or hostname that the
WaDE Apache server will use to connect to the backing Postgres database. Default: localhost
- `default['wade']['web']['postgres_db']` (String): The default Postgres database
that is used by the WaDE project. Default: WADE
- `default['wade']['web']['rpm']['url']` (String): The URL where the cookbook will
try to find the RPM from which to install the website. Default: file:///tmp/kitchen/data/wade-web.rpm
- `default['wade']['web']['ssl']['active']` (Boolean): Defines whether or not the
Apache web server will serve content over HTTPS. Default: true
- `default['wade']['web']['ssl']['cert']['location']` (String): Where the Apache
server can find the SSL certificate on the system. This attribute is only useful
when Apache will be serving content over SSL. Default: /tmp/kitchen/data/example.com.cert
- `default['wade']['web']['ssl']['key']['location']` (String): Where the Apache
server can find the SSL key on the system. This attribute is only useful
when Apache will be serving content over SSL. Default: /tmp/kitchen/data/example.com.key
