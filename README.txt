1) Tested on intalio-bpms-ee-7.5.1-tomcat-7.0.56 running with H2
2) Create a database connection profile to the H2 database
3) Run metrics/metrics.xvar.sql
4) Run databases/crmdb.sql
5) Set the connection info on databases/SelectClient.sql & databases/SelectContact.sql
6) Set the datasource info in reports/status_report.rptdesign
7) On your server create the folder [server]/webapps/intalio/forms
8) Unzip Dependencies/sampleForm/SalesOrderReview.tar.gz into [server]/webapps/intalio/forms
9) Use Dependencies/createMock/BPMSDEMO-soapui-project.xml with SoapUI (tested on 5.1.3). Start MockOfficeProvisioning and MockCreate
10) Update intalio.properties with the appropiate values. Use the endpoints of the running mocks for products_query_endpoint and office_service_endpoint
11) Edit forms/SalesOrderForm.gi/js/logic.js changing in line #2 the appropiate endpoint for your deployed process.
12) Configure EmailWS in your server
13) Deploy and enjoy

Source code of SalesOrderReview is https://github.com/esteban-felipe/SalesOrderReview. 