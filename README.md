# Tomcat Dockerfile

- Dockerfile for a Tomcat Server with JPDA debug enabled

## Default Ports
On `http://localhost`:

| Port | Function                              |
| :--: | :-----------------------------------: |
| 8080 | Normal application running            |
| 8000 | Debug port (attach to it in your IDE) |

## Running

### Docker

```sh
docker build -t alpine-tomcat .

docker run \
-p 8080:8080 \
-p 8000:8000 \
-v /path/to/myProject.war:/usr/local/tomcat/webapps/myProject.war \
-v /path/to/mySecondProject.war:/usr/local/tomcat/webapps/mySecondProject.war \
alpine-tomcat
```


### Docker Compose
```yaml
services:
  my-tomcat-server:
    build:
      context: .
    ports:
      - "8080:8080"
      - "8000:8000"
    restart: unless-stopped
    volumes:
      - /path/to/myProject.war:/usr/local/tomcat/webapps/myProject.war
      - /path/to/mySecondProject.war:/usr/local/tomcat/webapps/mySecondProject.war
```
