FROM mosaicgreifswald/wildfly:32-20240722@sha256:07083112af012a06dc0278174dfb13ab89021a234d8bb00ad370a116d9bbfeae

ARG TOOL_NAME

ADD ./${TOOL_NAME}/jboss       /entrypoint-wildfly-cli
ADD ./${TOOL_NAME}/deployments /entrypoint-wildfly-deployments

ENV WF_ADMIN_PASS=wildfly_password \
    WF_HEALTHCHECK_URLS="http://localhost:8080/${TOOL_NAME}-web http://localhost:8080/${TOOL_NAME}/statisticService?wsdl" \
    TTP_FHIR_GICS_TERMINOLOGY_FOLDER=gics/terminology \
    MYSQL_ROOT_PASSWORD=root \
    TTP_NOTI_DB_HOST=${TOOL_NAME}-db \
    TTP_GRAS_DB_HOST=${TOOL_NAME}-db

RUN echo "TTP_${TOOL_NAME}_DB_HOST"=${TOOL_NAME}-db >/etc/environment
