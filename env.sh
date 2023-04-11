#!/bin/sh
# - Set all _PORT vars to port numbers not used by your system.

export GO_TEST_TIME_FACTOR="1.0" # Increase if tests fail because of slow CPU.

# Lower-case variables are either used only by docker-compose.yml or
# provide reusable values for project's upper-case variables defined below.
export client_image_name="ghcr.io/blockop/client:latest"

# Variables required to run and test project.
# Should be kept in sorted order.
# Avoid referencing one variable from another if their order may change,
# use lower-case variables defined above for such a shared values.
# Naming convention:
#   <PROJECT>_<VAR>         - global vars, not specific for some embedded microservice (e.g. domain)
#   <PROJECT>_X_<SVC>_<VAR> - vars related to external services (e.g. databases)
#   <PROJECT>_<MS>_<VAR>    - vars related to embedded microservice (e.g. addr)
#   <PROJECT>__<MS>_<VAR>   - private vars for embedded microservice
export MONO_APP_HOST="localhost"
export MONO_APP_HOST_INT="127.0.0.1"
export MONO_APP_ADDR_HOST="localhost"     # Must match DNS/IP in $MONO__AUTH_TLS_CERT.
export MONO_APP_ADDR_HOST_INT="127.0.0.1" # Must match DNS/IP in $MONO__AUTH_TLS_CERT_INT.
export MONO_APP_ADDR_PORT="17003"
export MONO_APP_ADDR_PORT_INT="17004"
export MONO_APP_GRPCGW_ADDR_PORT="17006"
export MONO_APP_METRICS_ADDR_PORT="17005"
export MONO_MONO_ADDR_PORT="17000"

