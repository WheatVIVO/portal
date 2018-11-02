# WheatVIVO Portal
VIVO extension for the public display of WheatVIVO.
## Installation
WheatVIVO portal is a customization of VIVO 1.9.3.  Refer to the VIVO 1.9.x installation instructions here: <https://wiki.duraspace.org/display/VIVODOC19x/VIVO+1.9.x+Documentation> .  Additions to or changes of the standard installation instructions are noted below.
### Functional Overview
The WheatVIVO portal is designed to be used in conjunction with the WheatVIVO adminapp.  The two may be installed together or on separate servers as desired.  Only the WheatVIVO portal application is designed to be viewed publicly.
### System Requirements - Hardware Recommendations
Lack of RAM will significantly slow data loads and lead to apparent interface sluggishness as disk swap space is used especially during search index updates.  Allow a bare minimum of 4G of ram, with a practical minimum of 8G and a recommended value of 16G.  VIVO's suggested minimum storage space of 100G continues to hold.
### System Requirements - Software Requirements
- Java version 8 is required.
- WheatVIVO datasources <https://github.com/WheatVIVO/datasources> must be installed.  Clone the project from Github, change to the datasources directory, and run `mvn install`.
- MySQL is not required.  WheatVIVO portal is configured to use TDB, which will yield enormous speed improvements.
### Installing VIVO
- After cloning this project, change to the custom-vivo directory and skip to the section "Preparing the Installation Settings".  Then run `mvn install -s settings.xml` to effect the installation.
- Rejoin the VIVO documentation at the section "Completing the Installation." Ignore the section "Configure the Database Schema."
- At the section "Set URI encoding," add the UTF-8 setting as described, but immediately after it add also the following attribute to the Connector element: `maxPostSize="67108864"` (or a greater value).  This is necessary to permit data loading via the SPARQL UPDATE API to function properly.  Without it, data will fail to be transferred and the log will show 403 errors.  
