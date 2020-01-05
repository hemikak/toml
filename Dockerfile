FROM ballerina/ballerina:1.1.0

COPY libs/ libs/
COPY src/toml src/toml
COPY Ballerina.lock Ballerina.lock
COPY Ballerina.toml Ballerina.toml

RUN ballerina build -c toml
