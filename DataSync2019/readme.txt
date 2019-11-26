CData Data Sync (19.0.7157.0) Installation Instructions

CData Data Sync comes bundled with a web server, built on top of Jetty, which should be ideal for most scenarios. This web server 
is named cdata.datasync.jar and is located in the root of the installation directory. To start CData Data Sync from 
this web server, simply run this jar like so:
  
  java -jar cdata.datasync.jar

The configuration for this web server is contained within cdata.xml, which may be modified to suit your deployment. Some 
examples of modifications are provided in the contents of cdata.xml within the XML comments, but any valid jetty.xml 
configuration should be accepted. 

Additionally, CData Data Sync also provides a "service" script which may be used to set up a systemd or init.d service on unix systems. 

The application may also be hosted in any Java servlet container. The installation package 
includes a .war file, which can be deployed to the Java Web server. This document 
provides instructions for 5 of the most common Java servers (Tomcat, JBoss, WebSphere, 
WebLogic, and Jetty), but if you need assistance installing to a server not 
discussed here, email support@cdata.com and we will be happy to assist you.



*******************************
* Installing to Tomcat        *
*******************************

To deploy the .war to Tomcat, you can copy the .war file into the webapps 
folder, or you can deploy the .war from within the management console in Tomcat. The Tomcat 
documentation covers this method in more detail. 

After you deploy the .war, allow Tomcat users to access the application: Assign the "cdata_admin" role 
to the user you want to be the administrator of the application. If you are using the default 
user realm for Tomcat, you can add these roles by editing the tomcat-users.xml file located here:
$CATALINA_BASE/conf/tomcat-users.xml. In the following example, the admin user has been given the necessary 
roles for administrative access to the application:

<user name="admin" password="admin" roles="cdata_admin,admin-gui,manager-gui,
manager-status,manager-script,manager-jmx" />

Allow the user of the process running the Java servlet container read/write access to the data directory: 
  
Windows: C:\ProgramData\CData\datasync\ 
Unix or Mac OS X: ~/cdata/datasync/

Restart your Tomcat server for the changes to take effect. You can now log in to the application.


*******************************
* Installing to JBoss         *
*******************************

There are several ways that you can deploy a .war to JBoss. You can copy the .war into the 
JBOSS_HOME/standalone/deployments subfolder, or you can use the JBoss Administration Console
to install the .war.

To grant your JBoss user access to the application, assign the user the "cdata_admin"
role. If you are using the default user realm for JBoss, you can add this role by executing
the add-user.bat file that comes with the JBoss server.

Allow the user of the process running the Java servlet container read/write access to the data directory: 
  
Windows: C:\ProgramData\CData\datasync\ 
Unix or Mac OS X: ~/cdata/datasync/

Restart the server and log into the application.

*******************************
* Installing to WebSphere     *
*******************************

To deploy the application .war to WebSphere, you must first create a deployment plan. You can use the 
Plan Creator wizard in WebSphere to create a plan and then deploy the .war. You can initialize the
wizard from the WebSphere administration console. 

Assign the "cdata_admin" role to the user or group you will use to log into the 
application. The example plan below allows access to the system administrator.

<web-app xmlns="http://geronimo.apache.org/xml/ns/j2ee/web-2.0.1">
  <dep:environment xmlns:dep="http://geronimo.apache.org/xml/ns/deployment-1.2">
    <dep:moduleId>
      <dep:groupId>default</dep:groupId>
      <dep:artifactId>cdata</dep:artifactId>
      <dep:version>1371673558693</dep:version>
      <dep:type>war</dep:type>
    </dep:moduleId>
    <dep:dependencies/>
  </dep:environment>
  <context-root>cdata</context-root>
  <security-realm-name>geronimo-admin</security-realm-name>
  <app:security xsi:type="sec:securityType" 
   xmlns:sec="http://geronimo.apache.org/xml/ns/security-2.0" 
   xmlns:app="http://geronimo.apache.org/xml/ns/j2ee/application-2.0" 
   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <sec:role-mappings>
      <sec:role role-name="cdata_admin">
        <sec:principal name="system" 
        class="org.apache.geronimo.security.realm.providers.GeronimoUserPrincipal"/>
      </sec:role>
      <sec:role role-name="admin"/>
    </sec:role-mappings>
  </app:security></web-app>

Allow the user of the process running the Java servlet container read/write access to the data directory: 
  
Windows: C:\ProgramData\CData\datasync\ 
Unix or Mac OS X: ~/cdata/datasync/

Restart the server and log into the application.


*******************************
* Installing to WebLogic      *
*******************************

Follow the steps below to use the deployment wizard in Weblogic to deploy the .war.

1. Click Deployments and in the Deployments table click Install.
2. Enter the path to the .war and then select the .war from the list.
3. Select "Install this deployment as an application".
4. Select "Custom Roles: Use roles that are defined in the Administration Console; use policies that
   are defined in the deployment descriptor." Selecting this option will allow you to manage the roles
   and users in WebLogic's administration console, while WebLogic will load the roles and policies
   defined in the application.

After deploying, allow Weblogic users to access the 
application: 

1. In the WebLogic administration console, click Deployments. 
2. In the Deployments table, click the name for the application.
3. Click Security -> Application Scope -> Roles -> New.
4. Add the "cdata_admin" Web Application Scoped role and assign the role to a user or 
   group who will administer the application. For more information about roles, see the in-line help 
   documentation on security in the application administration console.

Allow the user of the process running the Java servlet container read/write access to the data directory: 
  
Windows: C:\ProgramData\CData\datasync\ 
Unix or Mac OS X: ~/cdata/datasync/


Restart the server and log into the application.


*******************************
* Installing to Jetty         *
*******************************

To install the application to Jetty, copy the .war into Jetty's webapps 
folder.

Before starting Jetty, allow Jetty users to access the application by assigning the 
"cdata_admin" role. For example, you can add this role to the admin user by opening the file 
%JETTY_HOME%/etc/realm.properties. The properties for the user are composed of the password, followed by 
the user's roles. For example:

admin: test,server-administrator,content-administrator,admin,user,cdata_admin

You must also configure a login service for the application with the name "CDataRealm". Below is a 
HashLoginService example:

<Call name="addBean">
  <Arg>
    <New class="org.eclipse.jetty.security.HashLoginService">
      <Set name="name">CDataRealm</Set>
      <Set name="config"><Property name="jetty.home" default="."/>/etc/realm.properties</Set>
      <Set name="refreshInterval">0</Set>
    </New>
  </Arg></Call>

Allow the user of the process running the Java servlet container read/write access to the data directory: 
  
Windows: C:\ProgramData\CData\datasync\ 
Unix or Mac OS X: ~/cdata/datasync/ 
 
Restart the server and log into the application.

Thank You!

If you have any further questions, check the in-line help files for additional 
information, or contact us at support@cdata.com. Your feedback is appreciated, and 
customer comments and suggestions are the most important drivers behind new features 
and improvements in our products.


CData Data Sync - Copyright (c) 2019 CData Software, Inc. - All rights reserved. For more 
information, visit our website at www.cdata.com.
