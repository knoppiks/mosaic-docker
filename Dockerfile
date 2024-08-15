FROM mosaicgreifswald/wildfly:32-20240722@sha256:07083112af012a06dc0278174dfb13ab89021a234d8bb00ad370a116d9bbfeae

ARG TOOL_NAME
ARG TOOL_NAME_UPPER

ADD ./tool/jboss       /entrypoint-wildfly-cli
ADD ./tool/deployments /entrypoint-wildfly-deployments

ENV WF_ADMIN_PASS=wildfly_password \
    WF_HEALTHCHECK_URLS="http://localhost:8080/${TOOL_NAME}-web http://localhost:8080/${TOOL_NAME}/statisticService?wsdl" \
    MYSQL_ROOT_PASSWORD=root \
    TTP_NOTI_DB_HOST=${TOOL_NAME}-db \
    TTP_GRAS_DB_HOST=${TOOL_NAME}-db \
    TTP_${TOOL_NAME_UPPER}_DB_HOST=${TOOL_NAME}-db \
    TTP_FHIR_${TOOL_NAME_UPPER}_TERMINOLOGY_FOLDER=${TOOL_NAME}/terminology
